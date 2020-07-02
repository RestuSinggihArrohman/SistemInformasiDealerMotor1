package praktikummodul5;

import View.MenuAwal;
import java.sql.SQLException;
import java.text.ParseException;

public class Praktikummodul5 {

    public static void main(String args[]) {
        /* Set the Nimbus look and feel */
        //<editor-fold defaultstate="collapsed" desc=" Look and feel setting code (optional) ">
        /* If Nimbus (introduced in Java SE 6) is not available, stay with the default look and feel.
         * For details see http://download.oracle.com/javase/tutorial/uiswing/lookandfeel/plaf.html 
         */
        try {
            for (javax.swing.UIManager.LookAndFeelInfo info : javax.swing.UIManager.getInstalledLookAndFeels()) {
                if ("Nimbus".equals(info.getName())) {
                    javax.swing.UIManager.setLookAndFeel(info.getClassName());
                    break;
                }
            }
        } catch (ClassNotFoundException ex) {
            java.util.logging.Logger.getLogger(MenuAwal.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (InstantiationException ex) {
            java.util.logging.Logger.getLogger(MenuAwal.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (IllegalAccessException ex) {
            java.util.logging.Logger.getLogger(MenuAwal.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (javax.swing.UnsupportedLookAndFeelException ex) {
            java.util.logging.Logger.getLogger(MenuAwal.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        }
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>

        /* Create and display the form */
        java.awt.EventQueue.invokeLater(new Runnable() {
            public void run() {
                new MenuAwal();
            }
        });
        
        int kodeJual = 1;
        int kodeAdmin = 2;
        int kodePembeli = 3;
        int kodeMotor = 3;
        String tanggalBeli = "22/02/2022";
        String sql = "INSERT INTO transaksijual_07046 (kode_jual, kode_admin, kode_pembeli, kode_motor, tanggal_beli) "
                + "VALUES (" + "kode_jual.NEXTVAL, '" + kodeAdmin + "', '" + kodePembeli + "', '" + kodeMotor 
                + "', TO_DATE('" + tanggalBeli + "', 'dd/mm/yyyy'))";
        System.out.println(sql);
    }

}
