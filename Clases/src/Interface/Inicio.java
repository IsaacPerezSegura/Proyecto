package Interface;
import Alumno.Alumno;
import java.awt.BorderLayout;
import java.awt.Color;
import java.awt.Dimension;
import java.awt.FlowLayout;
import java.awt.Font;
import java.awt.GridLayout;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import javax.swing.ImageIcon;
import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JOptionPane;
import javax.swing.JPanel;
import javax.swing.JPasswordField;
import javax.swing.JTextField;

public class Inicio extends JFrame implements ActionListener{

    private JPanel centerP,datosP,botones;
    private JLabel logoI,userI,matriculaL,passL;
    private JButton entrar;
    private JTextField matriculaT;
    private JPasswordField pass;
    private ArrayList<String>nombres;
    private ArrayList<String>apeP;
    private ArrayList<String>apeM;
    private ArrayList<String>matri;
    private ArrayList<String>seme;
    private ImageIcon icono;
    private int indice=-1;
    private Materias materias;
    private Alumno alumno;
    private Connection baseAlumnos;
    private PreparedStatement busqueda;
    public Inicio() {
        setVisible(true);
        setDefaultCloseOperation(EXIT_ON_CLOSE);
        setMinimumSize(new Dimension(750,450));
        setTitle("Inicio");
        setSize(750,450);
        setLocationRelativeTo(null);
        getContentPane().setBackground(Color.white);
        setLayout(new BorderLayout());
        centerP = new JPanel(new FlowLayout());
        centerP.setBackground(Color.white);
        datosP = new JPanel(new GridLayout(2,1));
        datosP.setBackground(Color.white);
         try{
          icono=new ImageIcon(getClass().getResource("/Icons/head.jpg"));
          logoI=new JLabel(icono);
          JPanel logoP=new JPanel(new FlowLayout());
          logoP.setBackground(Color.white);
          logoP.add(logoI);
          add(logoP,BorderLayout.NORTH);
          JPanel iconoP=new JPanel(new FlowLayout());
          iconoP.setBackground(Color.white);
          icono=new ImageIcon(getClass().getResource("/Icons/character.png"));
          userI=new JLabel(icono);
          iconoP.add(userI);
          datosP.add(iconoP);
        }catch(Exception e){System.out.println("error al cargar imagen");}
        matriculaT = new JTextField(20);
        matriculaT.setFont(new Font("Arial",Font.BOLD,14));
        matriculaL=new JLabel("Matricula");
        matriculaL.setFont(new Font("Arial",Font.BOLD,16));
        //JPanel camposP=new JPanel(new BorderLayout());
        JPanel camposP=new JPanel(new GridLayout(4,1));
        camposP.setBackground(Color.white);
        pass=new JPasswordField(15);
        passL=new JLabel("Contraseña");
        passL.setFont(new Font("Arial",Font.BOLD,16));
        camposP.add(matriculaL);
        camposP.add(matriculaT);
        camposP.add(passL);
        camposP.add(pass);
        datosP.add(camposP);
        centerP.add(datosP);
        botones=new JPanel(new FlowLayout());
        botones.setBackground(Color.white);
        entrar = new JButton("Entrar");
        botones.add(entrar);
        entrar.addActionListener(this);
        add(centerP,BorderLayout.CENTER);
        add(botones,BorderLayout.SOUTH);
        
        validate();
    }
    public void revisaRegistros(ResultSet re){
        ResultSet vistas;
        /*
        Validando si el alumno no ha creado con anterioridad un horario
        */
        try{
       busqueda=baseAlumnos.prepareStatement("Select Count(alumno) No from cursoalumno "
               + "where Alumno=?");
       busqueda.setString(1,re.getString("matricula"));
       vistas=busqueda.executeQuery();
       vistas.next();
       int existeHorario=Integer.parseInt(vistas.getString("No"));
       if(existeHorario==0){
            alumno=new Alumno();
            alumno.setNombreCompleto(re.getString("Nombre")+" "+re.getString("ApellidoPaterno")
                    +" "+re.getString("ApellidoMaterno"));
            alumno.setMatricula(re.getString("Matricula"));
            alumno.setSemestre(Integer.parseInt(re.getString("Semestre")));
            materias=new Materias(alumno,baseAlumnos);
            this.dispose();
       }else{
           Object [] mensajes={"Nuevo","Modificar","Cancelar"};
        int r=JOptionPane.showOptionDialog(this, "Lo sentimos ya cuentas con\n un horario ¿Deseas crear uno nuevo?"
        ," ",JOptionPane.YES_NO_CANCEL_OPTION,JOptionPane.QUESTION_MESSAGE,null,mensajes,"Cancelar");
        if(r==0){
          busqueda=baseAlumnos.prepareStatement("Delete from CursoAlumno where Alumno=?");
          busqueda.setString(1,re.getString("Matricula")); 
          busqueda.executeUpdate();
          revisaRegistros(re);
        }else if(r==1){
            alumno=new Alumno();
            alumno.setNombreCompleto(re.getString("Nombre")+" "+re.getString("ApellidoPaterno")
                    +" "+re.getString("ApellidoMaterno"));
            alumno.setMatricula(re.getString("Matricula"));
            alumno.setSemestre(Integer.parseInt(re.getString("Semestre")));
            materias=new Materias(alumno,baseAlumnos,re);
            this.dispose();
        }
       }
      }catch(Exception e){
      }
    }
        @Override
        public void actionPerformed(ActionEvent ev) {
            if(ev.getSource()==entrar){
            try {
                    baseAlumnos = DriverManager.getConnection("jdbc:mysql://localhost:3306/escuela", "root", "root");  //Crear conexión
                    busqueda = baseAlumnos.prepareStatement("SELECT * FROM alumno"
                            + " Where matricula=? AND contraseña=?");
                    busqueda.setString(1,matriculaT.getText());
                    busqueda.setString(2,pass.getText());
                    ResultSet result = busqueda.executeQuery();
                    if(result.next()){
                        revisaRegistros(result);
                    }else{
                       JOptionPane.showMessageDialog(null,"Usuario o contraseña incorrecta"); 
                    }
            } catch (Exception e) {
              JOptionPane.showMessageDialog(null,"Imposible conectar");
            }
            }
        }
}
