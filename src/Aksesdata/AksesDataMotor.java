/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Aksesdata;

import Database.KoneksiDatabase;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.swing.table.DefaultTableModel;
import Model.Motor_07046;

/**
 *
 * @author user
 */
public class AksesDataMotor implements InterfaceViewTabel {

    private final KoneksiDatabase koneksiDatabase;

    public AksesDataMotor() {
        this.koneksiDatabase = new KoneksiDatabase();
    }

    public int getSequenceKodeMotor() throws SQLException {
        String kodeSql = "SELECT last_number FROM user_sequences WHERE sequence_name LIKE 'KODE_MOTOR'";
        ResultSet hasilKodeSql = this.koneksiDatabase.getData(kodeSql);
        hasilKodeSql.next();
        return hasilKodeSql.getInt("last_number");
    }

//    public void setStatusKeTerjual(int kode_pembeli) throws SQLException{
//        String kodeSql = "SELECT kode_motor FROM Pembeli_07046 WHERE kode_pembeli = " + kode_pembeli;
//        ResultSet hasilKodeSql = this.koneksiDatabase.getData(kodeSql);
//        hasilKodeSql.next();
//        int idHewanDicari = hasilKodeSql.getInt("kode_motor");
//        String kodeSql2 = "UPDATFE motor_07046 SET status = 'Terjual' WHERE kode_motor = " + kode_motorDicari;
//        this.koneksiDatabase.manipulasiData(kodeSql2);
//    }
    public void insert(String type_motor, String warna, int harga_motor) {
        String kodeSql = "INSERT INTO motor_07046 (kode_motor, type_motor, harga_motor, warna) VALUES ("
                + "kode_motor.NEXTVAL, '" + type_motor + "', " + harga_motor + ", '" + warna + "')";
        this.koneksiDatabase.manipulasiData(kodeSql);
    }

    public DefaultTableModel viewTabel() throws SQLException {
        DefaultTableModel tabelModelmotor = new DefaultTableModel() {
            public boolean isCellEditable(int row, int column) {
                return false;
            }
        };
        tabelModelmotor.addColumn("Kode motor");
        tabelModelmotor.addColumn("Type_motor");
        tabelModelmotor.addColumn("Harga_motor");
        tabelModelmotor.addColumn("Warna");

        String kodeSql = "SELECT * FROM motor_07046 ORDER BY kode_motor ASC";
        ResultSet hasilKodeSql = this.koneksiDatabase.getData(kodeSql);
        while (hasilKodeSql.next()) {
            int kode_motor = hasilKodeSql.getInt("kode_motor");
            String type_motor = hasilKodeSql.getString("type_motor");
            int harga_motor = hasilKodeSql.getInt("harga_motor");
            String warna = hasilKodeSql.getString("warna");
            Motor_07046 motor_07046 = new Motor_07046();
            motor_07046.setKodeMotor(kode_motor);
            motor_07046.setTypeMotor(type_motor);
            motor_07046.setHargaMotor(harga_motor);
            motor_07046.setWarna(warna);
            Object[] temp = new Object[4];
            temp[0] = motor_07046.getKodeMotor();
            temp[1] = motor_07046.getTypeMotor();
            temp[2] = motor_07046.getHargaMotor();
            temp[3] = motor_07046.getWarna();
            tabelModelmotor.addRow(temp);
        }
        return tabelModelmotor;
    }

    public int cariHargaMotor(int kodeJual) throws SQLException {
        String kodeSql = "SELECT kode_motor FROM transaksijual_07046 WHERE kode_jual = " + kodeJual;
        ResultSet hasilKodeSql = this.koneksiDatabase.getData(kodeSql);
        hasilKodeSql.next();
        String kodeSql2 = "SELECT a.kode_jual, b.kode_motor, b.harga_motor "
                + "FROM transaksijual_07046 a "
                + "JOIN motor_07046 b ON a.kode_motor = b.kode_motor "
                + "WHERE b.kode_motor = " + hasilKodeSql.getInt("kode_motor");
        ResultSet hasilKodeSql2 = this.koneksiDatabase.getData(kodeSql2);
        hasilKodeSql2.next();
        return hasilKodeSql2.getInt("harga_motor");
    }

}
