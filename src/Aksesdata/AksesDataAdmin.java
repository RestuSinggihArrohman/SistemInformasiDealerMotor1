/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Aksesdata;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import javax.swing.table.DefaultTableModel;
import Model.Admin_07046;
import Database.KoneksiDatabase;

public class AksesDataAdmin implements InterfaceViewTabel {
    
    private final KoneksiDatabase koneksiDatabase;
    
    public AksesDataAdmin() {
        this.koneksiDatabase = new KoneksiDatabase();
    }
    
    public int getSequenceKode_admin() throws SQLException {
        String kodeSql = "SELECT last_number FROM user_sequences WHERE sequence_name LIKE 'KODE_ADMIN'";
        ResultSet hasilKodeSql = this.koneksiDatabase.getData(kodeSql);
        hasilKodeSql.next();
        return hasilKodeSql.getInt("last_number");
    }
    
    public void insert(String Nama, String Password, String No_hp) {
        String kodeSql = "INSERT INTO Admin_07046 (Kode_admin, Nama, Password, No_hp) "
                + "VALUES (" + "Kode_admin.NEXTVAL, '" + Nama + "', '" + Password + "', '" + No_hp + "')";
        this.koneksiDatabase.manipulasiData(kodeSql);
    }
    
    public void update(int Kode_admin, String nama, String Password, String No_hp) {
        String kodeSql = "UPDATE Admin_07046 SET Nama = '" + nama + "', Password = '" + Password
                + "', No_hp = '" + No_hp + "' WHERE Kode_admin = " + Kode_admin;
        this.koneksiDatabase.manipulasiData(kodeSql);
    }
    
    public void delete(int Kode_admin) {
        String kodeSql = "DELETE FROM Admin_07046 WHERE Kode_admin = " + Kode_admin;
        this.koneksiDatabase.manipulasiData(kodeSql);
    }
    
    public DefaultTableModel viewTabel() throws SQLException {
        DefaultTableModel tabelAdmin_07046 = new DefaultTableModel() {
            public boolean isCellEditable(int row, int column) {
                return false;
            }
        };
        tabelAdmin_07046.addColumn("Kode Admin");
        tabelAdmin_07046.addColumn("Nama Admin");
        tabelAdmin_07046.addColumn("Password");
        tabelAdmin_07046.addColumn("No_hp Admin");
        
        String kodeSql = "SELECT * FROM admin_07046";
        ResultSet hasilKodeSql = this.koneksiDatabase.getData(kodeSql);
        while (hasilKodeSql.next()) {
            int Kode_admin = hasilKodeSql.getInt("kode_admin");
            String nama = hasilKodeSql.getString("nama");
            String password = hasilKodeSql.getString("password");
            String noHp = hasilKodeSql.getString("no_hp");
            Admin_07046 admin_07046 = new Admin_07046();
            admin_07046.setKodeAdmin(Kode_admin);
            admin_07046.setNama(nama);
            admin_07046.setPassword(password);
            admin_07046.setNoHp(noHp);
            Object[] temp = new Object[4];
            temp[0] = admin_07046.getKodeAdmin();
            temp[1] = admin_07046.getNama();
            temp[2] = admin_07046.getPassword();
            temp[3] = admin_07046.getNoHp();
            tabelAdmin_07046.addRow(temp);
        }
        return tabelAdmin_07046;
    }
    
    public ArrayList<Admin_07046> getSemuaDataAdmin() throws SQLException {
        ArrayList<Admin_07046> daftarDataAdmin = new ArrayList<>();
        
        String kodeSql = "SELECT * FROM admin_07046";
        ResultSet hasilKodeSql = this.koneksiDatabase.getData(kodeSql);
        while (hasilKodeSql.next()) {
            int Kode_admin = hasilKodeSql.getInt("kode_admin");
            String Nama = hasilKodeSql.getString("nama");
            String Password = hasilKodeSql.getString("password");
            String No_hp = hasilKodeSql.getString("no_hp");
            Admin_07046 admin_07046 = new Admin_07046();
            admin_07046.setKodeAdmin(Kode_admin);
            admin_07046.setNama(Nama);
            admin_07046.setPassword(Password);
            admin_07046.setNoHp(No_hp);
            daftarDataAdmin.add(admin_07046);
        }
        return daftarDataAdmin;
    }
    
    public boolean cekDataAdminMasihKosong() throws SQLException {
        String kodeSql = "SELECT * FROM Admin_07046";
        ResultSet hasilKodeSql = this.koneksiDatabase.getData(kodeSql);
        return !hasilKodeSql.next();
    }
    
    public int cariKodeAdmin(String namaAdmin) throws SQLException {
        String kodeSql = "SELECT kode_admin FROM admin_07046 WHERE nama LIKE '" + namaAdmin + "'";
        ResultSet hasilKodeSql = this.koneksiDatabase.getData(kodeSql);
        hasilKodeSql.next();
        return hasilKodeSql.getInt("kode_admin");
    }
    
    public Admin_07046 cariDataAdmin(int Kode_admin) throws SQLException {
        Admin_07046 admin_07046 = null;
        String kodeSql = "SELECT * FROM Admin_07046 WHERE Kode_admin = " + Kode_admin;
        ResultSet hasilKodeSql = this.koneksiDatabase.getData(kodeSql);
        if (hasilKodeSql.next()) {
            String nama = hasilKodeSql.getString("nama");
            String password = hasilKodeSql.getString("password");
            String no_hp = hasilKodeSql.getString("no_hp");
            admin_07046 = new Admin_07046();
            admin_07046.setKodeAdmin(Kode_admin);
            admin_07046.setNama(nama);
            admin_07046.setPassword(password);
            admin_07046.setNoHp(no_hp);
        }
        return admin_07046;
    }
    
}
