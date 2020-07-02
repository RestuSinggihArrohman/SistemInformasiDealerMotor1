package Aksesdata;

import Database.KoneksiDatabase;
import Model.Pembayaran_07046;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.swing.table.DefaultTableModel;

public class AksesDataPembayaran implements InterfaceViewTabel {

    private final KoneksiDatabase koneksiDatabase;

    public AksesDataPembayaran() {
        this.koneksiDatabase = new KoneksiDatabase();
    }

    public int getSequenceKodePembayaran() throws SQLException {
        String kodeSql = "SELECT last_number FROM user_sequences WHERE sequence_name LIKE 'KODE_PEMBAYARAN'";
        ResultSet hasilKodeSql = this.koneksiDatabase.getData(kodeSql);
        hasilKodeSql.next();
        return hasilKodeSql.getInt("last_number");
    }

    public void insert(int kodeJual, int hargaBayar, String tanggalPembayaran, int kembalian) {
        String kodeSql = "INSERT INTO pembayaran_07046 (kode_pembayaran, kode_jual, harga_bayar, tanggal_pembayaran, "
                + "kembalian) VALUES (" + "kode_pembayaran.NEXTVAL, '" + kodeJual + "', '" + hargaBayar + "', TO_DATE('" 
                + tanggalPembayaran + "', 'dd/mm/yyyy'), '" + kembalian + "')";
        this.koneksiDatabase.manipulasiData(kodeSql);
    }
    
    public DefaultTableModel viewTabel() throws SQLException {
        DefaultTableModel tabelModelPembayaran = new DefaultTableModel() {
            public boolean isCellEditable(int row, int column) {
                return false;
            }
        };
        tabelModelPembayaran.addColumn("Kode Pembayaran");
        tabelModelPembayaran.addColumn("Kode Jual");
        tabelModelPembayaran.addColumn("Harga Bayar");
        tabelModelPembayaran.addColumn("Tanggal Pembayaran");
        tabelModelPembayaran.addColumn("Kembalian");

        String kodeSql = "SELECT * FROM pembayaran_07046";
        ResultSet hasilKodeSql = this.koneksiDatabase.getData(kodeSql);
        while (hasilKodeSql.next()) {
            int kodePembayaran = hasilKodeSql.getInt("kode_pembayaran");
            int kodeJual = hasilKodeSql.getInt("kode_jual");
            int hargaBayar = hasilKodeSql.getInt("harga_bayar");
            Date tanggalPembayaran = hasilKodeSql.getDate("tanggal_pembayaran");
            int kembalian = hasilKodeSql.getInt("kembalian");
            Pembayaran_07046 pembayaran_07046 = new Pembayaran_07046();
            pembayaran_07046.setKodePembayaran(kodePembayaran);
            pembayaran_07046.setKodeJual(kodeJual);
            pembayaran_07046.setHargaBayar(hargaBayar);
            pembayaran_07046.setTanggalPembayaran(tanggalPembayaran);
            pembayaran_07046.setKembalian(kembalian);
            
            Object[] temp = new Object[5];
            temp[0] = pembayaran_07046.getKodePembayaran();
            temp[1] = pembayaran_07046.getKodeJual();
            temp[2] = pembayaran_07046.getHargaBayar();
            String tanggalPembayaranTerformat = new SimpleDateFormat("dd - MM - yyyy").format(tanggalPembayaran);
            temp[3] = tanggalPembayaranTerformat;
            temp[4] = pembayaran_07046.getKembalian();
            tabelModelPembayaran.addRow(temp);
        }
        return tabelModelPembayaran;
    }
}
