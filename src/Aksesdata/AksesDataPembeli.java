/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Aksesdata;

import Database.KoneksiDatabase;
import Model.Pembeli_07046;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import javax.swing.table.DefaultTableModel;

/**
 *
 * @author user
 */
public class AksesDataPembeli implements InterfaceViewTabel {

    private final KoneksiDatabase koneksiDatabase;

    public AksesDataPembeli() {
        this.koneksiDatabase = new KoneksiDatabase();
    }

    public int getSequenceKodePembeli() throws SQLException {
        String kodeSql = "SELECT last_number FROM user_sequences WHERE sequence_name LIKE 'KODE_PEMBELI'";
        ResultSet hasilKodeSql = this.koneksiDatabase.getData(kodeSql);
        hasilKodeSql.next();
        return hasilKodeSql.getInt("last_number");
    }

    public void insert(String No_hp, String Nama_pembeli, String Alamat) {
        String kodeSql = "INSERT INTO Pembeli_07046 (Kode_pembeli, No_hp, Nama_pembeli, Alamat) "
                + "VALUES (" + "Kode_pembeli.NEXTVAL, '" + No_hp + "', '" + Nama_pembeli + "', '" + Alamat + "')";
        this.koneksiDatabase.manipulasiData(kodeSql);
    }

    public void update(int Kode_pembeli, String No_hp, String Nama_pembeli, String Alamat) {
        String kodeSql = "UPDATE Pembeli_07046 SET Nama = '" + Nama_pembeli + "', No_hp = '" + No_hp
                + "', Nama_pembeli = '" + Nama_pembeli + "' WHERE Kode_pembeli = " + Kode_pembeli;
        this.koneksiDatabase.manipulasiData(kodeSql);
    }

    public void delete(int Kode_pembeli) {
        String kodeSql = "DELETE FROM Pembeli_07046 WHERE Kode_pembeli = " + Kode_pembeli;
        this.koneksiDatabase.manipulasiData(kodeSql);
    }

    public DefaultTableModel viewTabel() throws SQLException {
        DefaultTableModel tabelPembeli_07046 = new DefaultTableModel() {
            public boolean isCellEditable(int row, int column) {
                return false;
            }
        };
        tabelPembeli_07046.addColumn("Kode pembeli");
        tabelPembeli_07046.addColumn("No_hp pembeli");
        tabelPembeli_07046.addColumn("Nama pembeli");
        tabelPembeli_07046.addColumn("Alamat pembeli");

        String kodeSql = "SELECT * FROM pembeli_07046";
        ResultSet hasilKodeSql = this.koneksiDatabase.getData(kodeSql);
        while (hasilKodeSql.next()) {
            int Kode_pembeli = hasilKodeSql.getInt("kode_pembeli");
            String no_hp = hasilKodeSql.getString("no_hp");
            String nama_pembeli = hasilKodeSql.getString("nama_pembeli");
            String alamat = hasilKodeSql.getString("alamat");
            Pembeli_07046 pembeli_07046 = new Pembeli_07046();
            pembeli_07046.setKodePembeli(Kode_pembeli);
            pembeli_07046.setNamaPembeli(nama_pembeli);
            pembeli_07046.setAlamat(alamat);
            pembeli_07046.setNoHp(no_hp);
            Object[] temp = new Object[4];
            temp[0] = pembeli_07046.getKodePembeli();
            temp[1] = pembeli_07046.getNoHp();
            temp[2] = pembeli_07046.getNamaPembeli();
            temp[3] = pembeli_07046.getAlamat();
            tabelPembeli_07046.addRow(temp);
        }
        return tabelPembeli_07046;
    }

    public ArrayList<Pembeli_07046> getSemuaDataPembeli() throws SQLException {
        ArrayList<Pembeli_07046> daftarDataPembeli = new ArrayList<>();

        String kodeSql = "SELECT * FROM pembeli_07046";
        ResultSet hasilKodeSql = this.koneksiDatabase.getData(kodeSql);
        while (hasilKodeSql.next()) {
            int Kode_pembeli = hasilKodeSql.getInt("kode_pembeli");
            String No_hp = hasilKodeSql.getString("no_hp");
            String Nama_pembeli = hasilKodeSql.getString("nama_pembeli");
            String Alamat = hasilKodeSql.getString("alamat");
            Pembeli_07046 pembeli_07046 = new Pembeli_07046();
            pembeli_07046.setKodePembeli(Kode_pembeli);
            pembeli_07046.setNamaPembeli(Nama_pembeli);
            pembeli_07046.setAlamat(Alamat);
            pembeli_07046.setNoHp(No_hp);
            daftarDataPembeli.add(pembeli_07046);
        }
        return daftarDataPembeli;
    }

    public boolean cekDataPembeliMasihKosong() throws SQLException {
        String kodeSql = "SELECT * FROM Pembeli_07046";
        ResultSet hasilKodeSql = this.koneksiDatabase.getData(kodeSql);
        return !hasilKodeSql.next();
    }

    public int cariKodePembeli(String namaPembeli) throws SQLException {
        String kodeSql = "SELECT Kode_pembeli FROM Pembeli_07046 WHERE nama_pembeli LIKE '" + namaPembeli + "'";
        ResultSet hasilKodeSql = this.koneksiDatabase.getData(kodeSql);
        hasilKodeSql.next();
        return hasilKodeSql.getInt("Kode_pembeli");
    }

    public Pembeli_07046 cariDataPembeli(int Kode_pembeli) throws SQLException {
        Pembeli_07046 pembeli_07046 = null;
        String kodeSql = "SELECT * FROM Pembeli_07046 WHERE Kode_pembeli = " + Kode_pembeli;
        ResultSet hasilKodeSql = this.koneksiDatabase.getData(kodeSql);
        if (hasilKodeSql.next()) {
            String no_hp = hasilKodeSql.getString("no_hp");
            String nama_pembeli = hasilKodeSql.getString("nama_pembeli");
            String alamat = hasilKodeSql.getString("alamat");
            pembeli_07046 = new Pembeli_07046();
            pembeli_07046.setKodePembeli(Kode_pembeli);
            pembeli_07046.setNamaPembeli(nama_pembeli);
            pembeli_07046.setAlamat(alamat);
            pembeli_07046.setNoHp(no_hp);
        }
        return pembeli_07046;
    }

}
