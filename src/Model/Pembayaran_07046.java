/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import java.util.Date;

/**
 *
 * @author user
 */
public class Pembayaran_07046 {

    private Integer kodePembayaran;
    private Integer kodeJual;
    private Integer hargaBayar;
    private Date tanggalPembayaran;
    private Integer kembalian;

    public Integer getKodePembayaran() {
        return kodePembayaran;
    }

    public void setKodePembayaran(Integer kodePembayaran) {
        this.kodePembayaran = kodePembayaran;
    }

    public Integer getKodeJual() {
        return kodeJual;
    }

    public void setKodeJual(Integer kodeJual) {
        this.kodeJual = kodeJual;
    }

    public Integer getHargaBayar() {
        return hargaBayar;
    }

    public void setHargaBayar(Integer hargaBayar) {
        this.hargaBayar = hargaBayar;
    }

    public Date getTanggalPembayaran() {
        return tanggalPembayaran;
    }

    public void setTanggalPembayaran(Date tanggalPembayaran) {
        this.tanggalPembayaran = tanggalPembayaran;
    }

    public Integer getKembalian() {
        return kembalian;
    }

    public void setKembalian(Integer kembalian) {
        this.kembalian = kembalian;
    }

}
