/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Aksesdata;

import Database.KoneksiDatabase;
import Model.TransaksiJual_07046;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.swing.table.DefaultTableModel;

/**
 *
 * @author user
 */
public class AksesDataTransaksiJual implements InterfaceViewTabel {

    private final KoneksiDatabase koneksiDatabase;

    public AksesDataTransaksiJual() {
        this.koneksiDatabase = new KoneksiDatabase();
    }

    public int getSequenceKodeTransaksiJual() throws SQLException {
        String kodeSql = "SELECT last_number FROM user_sequences WHERE sequence_name LIKE 'KODE_JUAL'";
        ResultSet hasilKodeSql = this.koneksiDatabase.getData(kodeSql);
        hasilKodeSql.next();
        return hasilKodeSql.getInt("last_number");
    }

    public void insert(int kodeJual, int kodeAdmin, int kodePembeli, int kodeMotor, String tanggalBeli) {
        String kodeSql = "INSERT INTO transaksijual_07046 (kode_jual, kode_admin, kode_pembeli, kode_motor, tanggal_beli) "
                + "VALUES (" + "kode_jual.NEXTVAL, '" + kodeAdmin + "', '" + kodePembeli + "', '" + kodeMotor
                + "', TO_DATE('" + tanggalBeli + "', 'dd/mm/yyyy'))";
        this.koneksiDatabase.manipulasiData(kodeSql);
    }

    public DefaultTableModel viewTabel() throws SQLException {
        DefaultTableModel tabelModelTransaksiJual = new DefaultTableModel() {
            public boolean isCellEditable(int row, int column) {
                return false;
            }
        };
        tabelModelTransaksiJual.addColumn("Kode Jual");
        tabelModelTransaksiJual.addColumn("Kode Admin");
        tabelModelTransaksiJual.addColumn("Kode Pembeli");
        tabelModelTransaksiJual.addColumn("Kode Motor");
        tabelModelTransaksiJual.addColumn("Tanggal Beli");

        String kodeSql = "SELECT * FROM transaksijual_07046";
        ResultSet hasilKodeSql = this.koneksiDatabase.getData(kodeSql);
        while (hasilKodeSql.next()) {
            int kodeJual = hasilKodeSql.getInt("kode_jual");
            int kodeAdmin = hasilKodeSql.getInt("kode_admin");
            int kodePembeli = hasilKodeSql.getInt("kode_pembeli");
            int kodeMotor = hasilKodeSql.getInt("kode_motor");
            Date tanggalBeli = hasilKodeSql.getDate("tanggal_beli");

            TransaksiJual_07046 transaksiJual_07046 = new TransaksiJual_07046();
            transaksiJual_07046.setKodeJual(kodeJual);
            transaksiJual_07046.setKodeAdmin(kodeAdmin);
            transaksiJual_07046.setKodePembeli(kodePembeli);
            transaksiJual_07046.setKodeMotor(kodeMotor);
            transaksiJual_07046.setTanggalBeli(tanggalBeli);

            Object[] temp = new Object[5];
            temp[0] = transaksiJual_07046.getKodeJual();
            temp[1] = transaksiJual_07046.getKodeAdmin();
            temp[2] = transaksiJual_07046.getKodePembeli();
            temp[3] = transaksiJual_07046.getKodeMotor();
            String tanggalBeliTerformat = new SimpleDateFormat("dd - MM - yyyy").format(tanggalBeli);
            temp[4] = tanggalBeliTerformat;

            tabelModelTransaksiJual.addRow(temp);
        }
        return tabelModelTransaksiJual;
    }
}
