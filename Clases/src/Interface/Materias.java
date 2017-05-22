package Interface;

import Alumno.Alumno;
import java.awt.BorderLayout;
import java.awt.Color;
import java.awt.Dimension;
import java.awt.Font;
import java.awt.GridLayout;
import java.awt.event.ActionListener;
import java.awt.event.ActionEvent;
import java.awt.event.MouseAdapter;
import javax.swing.JFrame;
import java.awt.event.MouseEvent;
import java.io.File;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import javax.swing.ImageIcon;
import javax.swing.JButton;
import javax.swing.JFileChooser;
import javax.swing.JOptionPane;
import javax.swing.JPanel;
import javax.swing.JScrollPane;
import javax.swing.JTable;
import javax.swing.table.DefaultTableModel;
import javax.swing.table.TableColumnModel;

public class Materias extends JFrame implements ActionListener {

    private JScrollPane materias1S, materiasAgregadasS;
    private JPanel panelMaterias;
    private Connection conexion;
    private PreparedStatement statement;
    private ResultSet vistas, consultas;
    private JButton cancelar, finalizar;
    private DefaultTableModel guia, guiaD;
    private ArrayList<String> agregar;
    private ArrayList<String> nombresMaterias;
    private ArrayList<String> diasYhora;
    static JTable tablaG;
    static JTable tablaGD;
    private final String[] columnas = {"C.Curso", "Materia", "Profesor", "Lunes", "Martes", "Miercoles", "Jueves",
        "Viernes", "Semestre", ""};
    private final String[] columnasD = {"C.Curso", "Materia", "Profesor", "Lunes", "Martes", "Miercoles", "Jueves",
        "Viernes", "Semestre", ""};
    private Object[] datos, horario, agregarObject;
    private Alumno alumno;

    public Materias(Alumno alumno, Connection conexion) {
        JFramePropiedades();
        this.conexion=conexion;
        listas();
        tablas();
        this.alumno = alumno;
        materiasPosibles(alumno.getSemestre());
        botones();
    }

    public void JFramePropiedades() {
        setSize(900, 500);
        setLayout(new BorderLayout(5, 5));
        setDefaultCloseOperation(EXIT_ON_CLOSE);
        setMinimumSize(new Dimension(900, 500));
        setLocationRelativeTo(null);
        setTitle("Materias");
        setVisible(true);
        getContentPane().setBackground(Color.white);
    }

    public void listas() {
        agregar = new ArrayList<String>();
        nombresMaterias = new ArrayList<String>();
        diasYhora = new ArrayList<String>();
    }

    public void tablas() {
        guia = new DefaultTableModel();
        guiaD = new DefaultTableModel();
        for (int i = 0; i < columnas.length; i++) {
            guia.addColumn(columnas[i]);
            guiaD.addColumn(columnas[i]);
        }
        tablaG = new JTable() {
            public boolean isCellEditable(int row, int column) {
                return false;
            }
        };
        tablaG.setModel(guia);
        tablaG.addMouseListener(new MouseAdapter() {
            @Override
            public void mouseClicked(MouseEvent e) {
                if (tablaG.getSelectedColumn() == 9) {
                    if (!getExisteMateria(nombresMaterias, tablaG.getSelectedRow(), 1)) {
                        if (!getExisteHorario(tablaG.getSelectedRow())) {
                            agregarObject = new Object[10];
                            for (int i = tablaG.getSelectedRow() * 9; i < ((tablaG.getSelectedRow() * 9) + 9); i++) {
                                agregarObject[i - (tablaG.getSelectedRow() * 9)] = agregar.get(i);
                            }
                            nombresMaterias.add(agregarObject[1].toString());
                            agregarObject[9] = new JButton("Eliminar");
                            guiaD.addRow(agregarObject);
                        } else {
                            JOptionPane.showMessageDialog(null, "El horario de la materia que deseas añadir se empalma");
                        }

                    } else {
                        JOptionPane.showMessageDialog(null, "La materia ya ha sido añadida");
                    }
                }
            }
        });
        tablaG.setEnabled(true);
        tablaG.setRowHeight(30);
        TableColumnModel columnaModelo = tablaG.getColumnModel();
        for (int i = 0; i < columnaModelo.getColumnCount(); i++) {
            columnaModelo.getColumn(i).setPreferredWidth(200);
        }
        tablaG.setColumnModel(columnaModelo);
        tablaG.setDefaultRenderer(Object.class, new TablaRender());
        tablaG.setBackground(Color.white);
        tablaG.setFont(new Font("Arial", Font.BOLD, 12));
        tablaGD = new JTable() {
            public boolean isCellEditable(int row, int column) {
                return false;
            }
        };
        tablaGD.setModel(guiaD);
        tablaGD.addMouseListener(new MouseAdapter() {
            @Override
            public void mouseClicked(MouseEvent e) {
                if (tablaGD.getSelectedColumn() == 9) {
                    nombresMaterias.remove(tablaGD.getSelectedRow());
                    guiaD.removeRow(tablaGD.getSelectedRow());
                }
            }
        });
        tablaGD.setRowHeight(30);
        tablaGD.setColumnModel(columnaModelo);
        tablaGD.setDefaultRenderer(Object.class, new TablaRender());
        tablaGD.setEnabled(true);
        tablaGD.setBackground(new Color(188, 232, 245));
        tablaGD.setFont(new Font("Arial", Font.BOLD, 12));
        panelMaterias = new JPanel(new GridLayout(2, 1));
        materias1S = new JScrollPane(tablaG, JScrollPane.VERTICAL_SCROLLBAR_ALWAYS, JScrollPane.HORIZONTAL_SCROLLBAR_ALWAYS);
        materiasAgregadasS = new JScrollPane(tablaGD, JScrollPane.VERTICAL_SCROLLBAR_ALWAYS, JScrollPane.HORIZONTAL_SCROLLBAR_ALWAYS);
        panelMaterias.add(materias1S);
        panelMaterias.add(materiasAgregadasS);
        add(panelMaterias, BorderLayout.CENTER);
    }

    public void botones() {
        JPanel botonesP = new JPanel();
        botonesP.setBackground(getContentPane().getBackground());
        cancelar = new JButton(new ImageIcon(getClass().getResource("/Icons/cancel.png")));
        cancelar.addActionListener(this);
        cancelar.setBackground(getContentPane().getBackground());
        botonesP.add(cancelar);
        finalizar = new JButton(new ImageIcon(getClass().getResource("/Icons/ok.png")));
        finalizar.addActionListener(this);
        finalizar.setBackground(getContentPane().getBackground());
        botonesP.add(finalizar);
        add(botonesP, BorderLayout.PAGE_END);
    }

    public void materiasPosibles(int seme) {
        try {
            statement = conexion.prepareStatement("Select * from InformacionCursos "
                    + "where Semestre=? Or Semestre=?");
            statement.setString(1, String.valueOf(seme + 1));
            statement.setString(2, String.valueOf(seme + 2));
            vistas = statement.executeQuery();
            String[] c = {"Clave", "Materia", "Nombre", "ApellidoPaterno", "ApellidoMaterno", "Dias",
                "Hora", "Semestre"};
            String clave = "";
            datos = new Object[10];
            datos[1] = "";
            while (vistas.next()) {
                horario = new Object[5];
                if (!vistas.getString("Clave").equals(clave)) {
                    datos[0] = vistas.getString("Clave");
                    datos[8] = vistas.getString("Semestre");
                    for (int i = 1; i < 3; i++) {
                        datos[i] = "";
                        if (i == 2) {
                            for (int y = i; y < 5; y++) {
                                datos[i] += vistas.getString(c[y]) + " ";
                            }
                        } else {
                            datos[i] = vistas.getString(c[i]);
                        }
                    }
                    statement = conexion.prepareStatement("Select COUNT(Clave) Contador from InformacionCursos "
                            + "Where Clave=?"
                            + "Group by Clave");
                    statement.setString(1, vistas.getString("Clave"));
                    consultas = statement.executeQuery();
                    consultas.next();
                    int contador = Integer.parseInt(consultas.getString("Contador"));
                    for (int i = 0; i < contador; i++) {
                        if (vistas.getString("Dias").equals("Lunes")) {
                            horario[0] = vistas.getString("Hora");
                        } else if (vistas.getString("Dias").equals("Martes")) {
                            horario[1] = vistas.getString("Hora");
                        } else if (vistas.getString("Dias").equals("Miercoles")) {
                            horario[2] = vistas.getString("Hora");
                        } else if (vistas.getString("Dias").equals("Jueves")) {
                            horario[3] = vistas.getString("Hora");
                        } else if (vistas.getString("Dias").equals("Viernes")) {
                            horario[4] = vistas.getString("Hora");
                        }
                        vistas.next();
                    }
                    for (int i = 3; i < 8; i++) {
                        datos[i] = horario[i - 3];
                    }
                    for (int i = 0; i < 9; i++) {
                        if (datos[i] != null) {
                            agregar.add(datos[i].toString());
                        } else {
                            agregar.add("-");
                        }
                    }
                    datos[9] = new JButton("Añadir");
                    guia.addRow(datos);
                }
                vistas.previous();
                clave = vistas.getString("Clave");
            }
        } catch (Exception e) {
            JOptionPane.showMessageDialog(null, "Error en consulta " + e);
        }
    }

    public boolean getExisteMateria(ArrayList<String> materias, int row, int column) {
        boolean resultado = false;
        if (materias != null) {
            for (int i = 0; i < materias.size(); i++) {
                if (materias.get(i).equals(guia.getValueAt(row, column))) {
                    resultado = true;
                }
            }
        }
        return resultado;
    }

    public boolean getExisteHorario(int row) {
        boolean resultado = false;
        if (guiaD.getRowCount() > 0) {
            for (int i = 0; i < guiaD.getRowCount(); i++) {//desplaza renglon
                for (int u = 3; u < (guia.getColumnCount() - 2); u++) {//desplaza columna
                    if ((guia.getValueAt(row, u) != null && guiaD.getValueAt(i, u) != null)) {
                        if (guia.getValueAt(row, u).equals(guiaD.getValueAt(i, u))) {
                            resultado = true;
                        }
                    }
                }
            }
        }
        return resultado;
    }

    public void registraCursos() {
        try {
                for (int i = 0; i < guiaD.getRowCount(); i++) {
                    statement = conexion.prepareStatement("Insert into CursoAlumno(Alumno,Curso)"
                            + "Values(?,?)");
                    statement.setString(1, alumno.getMatricula());
                    statement.setString(2, guiaD.getValueAt(i, 0).toString());
                    statement.executeUpdate();
                }
        } catch (Exception e) {
            JOptionPane.showMessageDialog(null, "Error al registrar horario");
        }
    }

    public void regresarInicio() {
        Inicio marco = new Inicio();
        this.dispose();
    }

    @Override
    public void actionPerformed(ActionEvent e) {
        if (e.getSource() == cancelar) {
            regresarInicio();
        } else if (e.getSource() == finalizar) {
            PDF p = new PDF(conexion);
            JFileChooser jF1 = new JFileChooser();
            String ruta = "";
                if (e.getSource() == finalizar) {
                   if (guiaD.getRowCount() > 0) {
                    try {
                        if (jF1.showSaveDialog(null) == jF1.APPROVE_OPTION) {
                            registraCursos();
                            ruta = jF1.getSelectedFile().getAbsolutePath();
                            p.createPDF(new File(ruta+".pdf"), alumno);
                            JOptionPane.showMessageDialog(null, "Horario creado");
                            regresarInicio();
                        }
                    } catch (Exception ex) {
                        ex.printStackTrace();
                    }
                }else {
                JOptionPane.showMessageDialog(null, "No haz realizado ninguna seleccion");
            }
          }
        }
    }
}
