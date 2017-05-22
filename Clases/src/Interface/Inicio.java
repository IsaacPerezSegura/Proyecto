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
import javax.swing.JTextField;

public class Inicio extends JFrame implements ActionListener{

    private JPanel centerP,datosP,botones;
    private JLabel logoI,decoracionV,decoracionH,userI;
    private JButton buscar, horario,siguiente,anterior;
    private JTextField nombreT,maYseT;
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
        siguiente=new JButton(">");
        anterior=new JButton("<");
        siguiente.setBackground(new Color(211,211,211));
        anterior.setBackground(new Color(211,211,211));
        siguiente.addActionListener(this);
        anterior.addActionListener(this);
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
          iconoP.add(anterior);
          iconoP.add(userI);
          iconoP.add(siguiente);
          datosP.add(iconoP);
        }catch(Exception e){System.out.println("error al cargar imagen");}
        nombreT = new JTextField(20);
        nombreT.setFont(new Font("Arial",Font.BOLD,18));
        JPanel camposP=new JPanel(new BorderLayout());
        camposP.setBackground(Color.white);
        maYseT=new JTextField(15);
        maYseT.setFont(new Font("Arial",Font.BOLD,18));
        nombreT.setEditable(false);
        maYseT.setEditable(false);
        camposP.add(nombreT,BorderLayout.NORTH);
        datosP.add(camposP);
        camposP.add(maYseT,BorderLayout.SOUTH);
        datosP.add(camposP);
        centerP.add(datosP);
        botones=new JPanel(new FlowLayout());
        botones.setBackground(Color.white);
        buscar = new JButton("Buscar");
        botones.add(buscar);
        buscar.addActionListener(this);
       
        /*add(anterior,BorderLayout.WEST);
        add(siguiente,BorderLayout.EAST);*/
        horario = new JButton("Crear Horario");
        horario.addActionListener(this);
        botones.add(horario);
        add(centerP,BorderLayout.CENTER);
        add(botones,BorderLayout.SOUTH);
        nombres=new ArrayList<String>();
        apeP=new ArrayList<String>();
        apeM=new ArrayList<String>();
        matri=new ArrayList<String>();
        seme=new ArrayList<String>();
        validate();
    }
    public void revisaRegistros(){
        ResultSet vistas;
        alumno=new Alumno();
        alumno.setNombreCompleto(nombres.get(indice)+" "+apeP.get(indice)+" "+apeM.get(indice));
        alumno.setMatricula(matri.get(indice));
        alumno.setSemestre(Integer.parseInt(seme.get(indice)));
        /*
        Validando si el alumno no ha creado con anterioridad un horario
        */
        try{
       busqueda=baseAlumnos.prepareStatement("Select Count(alumno) No from cursoalumno "
               + "where Alumno=?");
       busqueda.setString(1,alumno.getMatricula());
       vistas=busqueda.executeQuery();
       vistas.next();
       int existeHorario=Integer.parseInt(vistas.getString("No"));
       if(existeHorario==0){
            materias=new Materias(alumno,baseAlumnos);
            this.dispose();
       }else{
        int r=JOptionPane.showConfirmDialog(this, "Lo sentimos ya cuentas con\n un horario, ¿Deseas crear uno nuevo?");
        if(r==0){
          busqueda=baseAlumnos.prepareStatement("Delete from CursoAlumno where Alumno=?");
          busqueda.setString(1,alumno.getMatricula()); 
          busqueda.executeUpdate();
          revisaRegistros();
        }
       }
      }catch(Exception e){
      }
    }
        @Override
        public void actionPerformed(ActionEvent ev) {
            if(ev.getSource()==buscar){
            try {
                baseAlumnos = DriverManager.getConnection("jdbc:mysql://localhost:3306/escuela", "root", "root");  //Crear conexión
                busqueda = baseAlumnos.prepareStatement("SELECT * FROM alumno");
                ResultSet result = busqueda.executeQuery();
                    while(result.next()){
                    nombres.add(result.getString("Nombre"));
                    apeP.add(result.getString("ApellidoPaterno"));
                    apeM.add(result.getString("ApellidoMaterno"));
                    matri.add(result.getString("Matricula"));
                    seme.add(result.getString("Semestre"));
                    }
                indice+=1;
                nombreT.setText(nombres.get(indice)+" "+apeP.get(indice)+" "+apeM.get(indice));
                maYseT.setText("Matricula: "+matri.get(indice)+" - Semestre: "+seme.get(indice));
            } catch (Exception e) {
              JOptionPane.showMessageDialog(null,"Imposible conectar");
            }
            }else if(ev.getSource()==anterior && indice>0){
                indice-=1;
                nombreT.setText(nombres.get(indice)+" "+apeP.get(indice)+" "+apeM.get(indice));
                maYseT.setText("Matricula: "+matri.get(indice)+" - Semestre: "+seme.get(indice));
            }else if(ev.getSource()==siguiente && indice>=0 && (indice<nombres.size()-1)){
                indice+=1;
                nombreT.setText(nombres.get(indice)+" "+apeP.get(indice)+" "+apeM.get(indice));
                maYseT.setText("Matricula: "+matri.get(indice)+" - Semestre: "+seme.get(indice));
            }else if(ev.getSource()==horario && indice>=0){
                revisaRegistros();
            }
        }
}
