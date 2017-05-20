package Interface;

import java.awt.Color;
import java.awt.Component;
import javax.swing.JButton;
import javax.swing.JLabel;
import javax.swing.JTable;
import javax.swing.table.DefaultTableCellRenderer;

public class TablaRender extends DefaultTableCellRenderer{
    @Override
    public Component getTableCellRendererComponent(JTable table,Object value,boolean isSelected
    ,boolean hasFocus,int row,int column){
        if(value instanceof JButton){
            JButton boton=new JButton();
            if(((JButton) value).getText().equals("Añadir")){
            boton.setText(((JButton) value).getText());
            boton.setBackground(new Color(135,220,154));
            }else if(((JButton) value).getText().equals("Eliminar")){
                    boton.setText(((JButton) value).getText());
                    boton.setBackground(new Color(255,168,168));
            }
            return boton;
        }else if(value instanceof String){
            JLabel texto=new JLabel();
            texto.setText(value.toString());
            return texto;
        }
        return null;
    }
}
