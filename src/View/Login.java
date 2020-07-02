/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package View;

import Aksesdata.AksesDataAdmin;
import Aksesdata.AksesDataGlobal;
import Model.Admin_07046;
import java.awt.Font;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JOptionPane;
import javax.swing.JPasswordField;
import javax.swing.JTextField;

/**
 *
 * @author user
 */
public class Login extends JFrame {

    AksesDataAdmin aksesDataAdmin;

    public Login() {
        this.aksesDataAdmin = new AksesDataAdmin();
        JFrame frame3 = new JFrame();
        frame3.setTitle("Login Data Kasir");
        frame3.setSize(800, 600);
        frame3.setLocationRelativeTo(null);
        frame3.setLayout(null);
        frame3.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);

        JLabel nama = new JLabel("Nama");
        JLabel password_kasir = new JLabel("Passwd");
        JTextField text_nama = new JTextField();
        JPasswordField textPassword = new JPasswordField();
        JButton back = new JButton("Back");
        JButton login = new JButton("Login");

        nama.setBounds(10, 20, 60, 30);
        nama.setFont(new Font("Consolas", Font.BOLD, 14));
        frame3.add(nama);

        text_nama.setBounds(100, 20, 300, 30);
        text_nama.setFont(new Font("Arial", Font.BOLD, 14));
        frame3.add(text_nama);

        password_kasir.setBounds(10, 70, 60, 30);
        password_kasir.setFont(new Font("Consolas", Font.BOLD, 14));
        frame3.add(password_kasir);

        textPassword.setBounds(100, 70, 300, 30);
        textPassword.setFont(new Font("Arial", Font.BOLD, 14));
        frame3.add(textPassword);

        back.setBounds(20, 180, 90, 30);
        back.setFont(new Font("Arial", Font.BOLD, 14));
        back.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                new MenuAwal();
                frame3.dispose();
            }
        });
        frame3.add(back);

        login.setBounds(150, 180, 90, 30);
        login.setFont(new Font("Arial", Font.BOLD, 14));
        login.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                String nama = text_nama.getText();
                String pass = textPassword.getText();
                boolean loginValid = false;
                try {
                    loginValid = validasiDataLogin(nama, pass);
                } catch (SQLException ex) {
                    Logger.getLogger(Login.class.getName()).log(Level.SEVERE, null, ex);
                }
                if (loginValid == true) {
                    String namaAdmin = text_nama.getText();
                    try {
                        int kodeAdmin = aksesDataAdmin.cariKodeAdmin(namaAdmin);
                        AksesDataGlobal.kodeAdmin = kodeAdmin;
                    } catch (SQLException ex) {
                        Logger.getLogger(Login.class.getName()).log(Level.SEVERE, null, ex);
                    }

                    new MenuLogin();
                    frame3.dispose();
                } else {
                    JOptionPane.showMessageDialog(null, "Nama, Password anda Salah");
                }
            }
        });
        frame3.add(login);

        frame3.setVisible(true);

    }

    private boolean validasiDataLogin(String nama, String password) throws SQLException {
        boolean loginValid = false;
        ArrayList<Admin_07046> daftarDataAdmin = this.aksesDataAdmin.getSemuaDataAdmin();
        for (int i = 0; i < daftarDataAdmin.size(); i++) {
            if (nama.equals(daftarDataAdmin.get(i).getNama()) && password.equals(daftarDataAdmin.get(i).
                    getPassword())) {
                loginValid = true;
            }
        }
        return loginValid;
    }

}
