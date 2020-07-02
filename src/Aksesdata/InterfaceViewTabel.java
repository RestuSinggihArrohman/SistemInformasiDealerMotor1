package Aksesdata;

import java.sql.SQLException;
import javax.swing.table.DefaultTableModel;

public interface InterfaceViewTabel {
    public DefaultTableModel viewTabel() throws SQLException;
}
