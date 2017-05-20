package Interface;

import Alumno.Alumno;
import static Interface.Materias.*;
import com.itextpdf.text.BadElementException;
import com.itextpdf.text.BaseColor;
import com.itextpdf.text.Document;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.Font;
import com.itextpdf.text.Image;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Calendar;
import javax.swing.JTable;

public class PDF {

    Font f = new Font(Font.FontFamily.COURIER, 7, Font.ITALIC);
    Font f2 = new Font(Font.FontFamily.HELVETICA, 8, Font.ITALIC);
    Font f3 = new Font(Font.FontFamily.UNDEFINED, 12, Font.UNDEFINED);
    Font f4 = new Font(Font.FontFamily.COURIER, 14, Font.BOLD);
    private Alumno alumno;
    String espacio ="              ";
    Image image;

    private Calendar c = Calendar.getInstance();
    private static final String imagen = "src/Icons/logo.png";

    int dia = c.get(Calendar.DATE);
    int mes = c.get(Calendar.MONTH);
    int año = c.get(Calendar.YEAR);

    private ResultSet noSalon;
    private ResultSet creditos;
    private Connection conexion;
    private PreparedStatement statement;
    public PDF(){
        try{
       conexion=DriverManager.getConnection("jdbc:mysql://localhost:3306/Escuela", "root", "root");
        }catch(Exception e){}
    }
    public void createPDF(File file, Alumno a) {
        alumno = a;
        try {
            Document d = new Document();
            try {
                PdfWriter.getInstance(d, new FileOutputStream(file));
            } catch (FileNotFoundException fileNotFoundException) {
                System.out.println("error al encontrar el archivo" + fileNotFoundException);
            }
            d.open();
            d.addTitle("INSITUTO TECNOLOGICO DE LEON");
            d.addSubject("Horario estudiantil");
            d.addKeywords("Java, PDF, iText");
            d.addAuthor("Isaac,Fernanda,Mauricio");
            d.addCreator("Isaac,Fernanda,Mauricio");

            d.add(new Paragraph(espacio+"  INSITUTO TECNOLOGICO DE LEON",f4));
            d.add(new Paragraph(espacio+espacio+espacio+espacio+
                    "Horario del Alumno",f3));
            d.add(new Paragraph(espacio));
            d.add(new Paragraph("Fecha:" + dia +"/" + mes + "/" + año));
            d.add(new Paragraph("Alumno: " + a.getNombreCompleto(), f2));
            d.add(new Paragraph("No.Control: " + a.getMatricula(), f2));
            d.add(new Paragraph("Semestre: " + (a.getSemestre()+1), f2));
            d.add(new Paragraph(espacio));
            try {
                image = Image.getInstance(imagen);
                image.scaleToFit(50, 50);
                image.setAbsolutePosition(475, 750);
                d.add(image);
            } catch (BadElementException ex) {
                System.out.println("Image BadElementException" + ex);
            } catch (IOException ex) {
                System.out.println("Image IOException " + ex);
            }

            PdfPTable table = new PdfPTable(10);
            float[] medidaCeldas = {3.5f, 2f, 3.5f, 2f, 2f, 2f, 2f, 2f, 2f, 0.8f};
            table.setWidths(medidaCeldas);

            PdfPCell c1 = new PdfPCell(new Paragraph("CURSO", f));
            c1.setBackgroundColor(BaseColor.CYAN);
            PdfPCell c2 = new PdfPCell(new Paragraph("SALON", f));
            c2.setBackgroundColor(BaseColor.CYAN);
            PdfPCell c3 = new PdfPCell(new Paragraph("MATERIA", f));
            c3.setBackgroundColor(BaseColor.CYAN);
            PdfPCell c4 = new PdfPCell(new Paragraph("PROFESOR", f));
            c4.setBackgroundColor(BaseColor.CYAN);
            PdfPCell c5 = new PdfPCell(new Paragraph("LUNES", f));
            c5.setBackgroundColor(BaseColor.CYAN);
            PdfPCell c6 = new PdfPCell(new Paragraph("MARTES", f));
            c6.setBackgroundColor(BaseColor.CYAN);
            PdfPCell c7 = new PdfPCell(new Paragraph("MIERCOLES", f));
            c7.setBackgroundColor(BaseColor.CYAN);
            PdfPCell c8 = new PdfPCell(new Paragraph("JUEVES", f));
            c8.setBackgroundColor(BaseColor.CYAN);
            PdfPCell c9 = new PdfPCell(new Paragraph("VIERNES", f));
            c9.setBackgroundColor(BaseColor.CYAN);
            PdfPCell c10 = new PdfPCell(new Paragraph("CR", f));
            c10.setBackgroundColor(BaseColor.CYAN);

            table.addCell(c1);
            table.addCell(c2);
            table.addCell(c3);
            table.addCell(c4);
            table.addCell(c5);
            table.addCell(c6);
            table.addCell(c7);
            table.addCell(c8);
            table.addCell(c9);
            table.addCell(c10);
            int count = tablaGD.getRowCount();
            String salon="";
            String creditos="";
            for (int i = 0; i < count; i++) {
                try{
                statement=conexion.prepareStatement("Select NoSalon From NoSalonV Where Clave=?");
                statement.setString(1,tablaGD.getValueAt(i,0).toString());
                noSalon=statement.executeQuery();
                noSalon.next();
                salon=noSalon.getString("NoSalon");
                statement=conexion.prepareStatement("Select Creditos From Creditos Where Clave=?");
                statement.setString(1,tablaGD.getValueAt(i,0).toString());
                noSalon=statement.executeQuery();
                noSalon.next();
                creditos=noSalon.getString("Creditos");
                }catch(Exception e){System.out.println(e);}
                Object obj1 = GetData(tablaGD, i, 0);
                Object obj2 =(salon);
                Object obj3 = GetData(tablaGD, i, 1);
                Object obj4 = GetData(tablaGD, i, 2);
                Object obj5 = GetData(tablaGD, i, 3);
                Object obj6 = GetData(tablaGD, i, 4);
                Object obj7 = GetData(tablaGD, i, 5);
                Object obj8 = GetData(tablaGD, i, 6);
                Object obj9 = GetData(tablaGD, i, 7);
                Object obj10 = creditos;
                
                String value1 = obj1.toString();
                String value2 = obj2.toString();
                String value3 = obj3.toString();
                String value4 = obj4.toString();
                String value5 = obj5.toString();
                String value6 = obj6.toString();
                String value7 = obj7.toString();
                String value8 = obj8.toString();
                String value9 = obj9.toString();
                String value10 = obj10.toString();
                
                table.addCell(value1);
                table.addCell(value2);
                table.addCell(value3);
                table.addCell(value4);
                table.addCell(value5);
                table.addCell(value6);
                table.addCell(value7);
                table.addCell(value8);
                table.addCell(value9);
                table.addCell(value10);
            }
            d.add(new Paragraph("             **********************************"
                    + "************************************************************"));
            d.add(table);
            d.add(new Paragraph("             **********************************"
                    + "************************************************************"));
            d.close();

        } catch (DocumentException documentException) {
            System.out.println(documentException);
        }
    }

    public Object GetData(JTable table, int row_index, int col_index) {
        return table.getModel().getValueAt(row_index, col_index);
    }
}
