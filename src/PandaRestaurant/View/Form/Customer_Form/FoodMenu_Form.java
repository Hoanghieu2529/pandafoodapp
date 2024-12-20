package PandaRestaurant.View.Form.Customer_Form;

import PandaRestaurant.Controller.Service.ServiceCustomer;
import PandaRestaurant.Model.ModelMonAn;
import PandaRestaurant.Model.ModelKhachHang;
import PandaRestaurant.Model.ModelHoaDon;
import PandaRestaurant.Model.ModelNguoiDung;
import PandaRestaurant.View.Component.Customer_Component.CardMonAn;
import PandaRestaurant.View.Dialog.MS_PayBill;
import PandaRestaurant.View.Dialog.MS_Warning;
import PandaRestaurant.View.Main_Frame.Main_Customer_Frame;
import PandaRestaurant.View.Swing.CustomScrollBar.ScrollBarCustom;
import PandaRestaurant.View.Swing.WrapLayout;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.swing.ImageIcon;

public class FoodMenu_Form extends javax.swing.JPanel {

    private final String type;
    private final ServiceCustomer service;
    private ArrayList<ModelMonAn> list;
    private final ModelNguoiDung user;
    private ModelKhachHang customer;
    private ModelHoaDon HoaDon;
    private final MS_Warning warning;
    private MS_PayBill obj;

    public FoodMenu_Form(String type, ModelNguoiDung user) {
        this.type = type;
        this.user = user;
        service = new ServiceCustomer();
        warning = new MS_Warning(Main_Customer_Frame.getFrames()[0], true);
        obj = new MS_PayBill(Main_Customer_Frame.getFrames()[0], true);
        initComponents();    
        init();
        //Kiểm tra Khách hàng đã đặt bàn trước khi gọi món hay chưa
        if (HoaDon == null) {
            warning.WarningBook();
        } else {
            txtTableName.setText(HoaDon.getIdBan() + "");
        }
        
    }

    public void init() {
        try {
            panel.setLayout(new WrapLayout(WrapLayout.LEADING, 20, 20));
            txtSearch.setHint("Tìm kiếm món ăn . . .");
            jScrollPane1.setVerticalScrollBar(new ScrollBarCustom());
            customer = service.getCustomer(user.getUserID());
            
            //Tìm thông tin Hóa Đơn mà Khách Hàng vừa tạo
            HoaDon = service.FindHoaDon(customer);
            
            //Thêm data cho Menu
            initMenuFood();
            
            
            //Set Data cho Tiêu đề Menu
            switch (type) {
                case "Lamb" -> {
                    lbTitle.setText("Menu/" + type + " - Cuu");
                    lbTitle.setIcon(new ImageIcon(getClass().getResource("/Icons/MenuBar/Lamb.png")));
                }
                case "Beef Wagyu" -> {
                    lbTitle.setText("Menu/" + type + " - Bo Wagyu");
                    lbTitle.setIcon(new ImageIcon(getClass().getResource("/Icons/MenuBar/Beef.png")));
                }
                case "Combo" -> {
                    lbTitle.setText("Menu/" + type + " - Ưu đãi");
                    lbTitle.setIcon(new ImageIcon(getClass().getResource("/Icons/MenuBar/combo.png")));
                }
                case "KingCarb" -> {
                    lbTitle.setText("Menu/" + type + " - Cua Hoàng Đế");
                    lbTitle.setIcon(new ImageIcon(getClass().getResource("/Icons/MenuBar/KingCarb.png")));
                }
                case "KoreanFood" -> {
                    lbTitle.setText("Menu/" + type + " - Món Hàn");
                    lbTitle.setIcon(new ImageIcon(getClass().getResource("/Icons/MenuBar/Korean Food.png")));
                }
                case "Dessert" -> {
                    lbTitle.setText("Menu/" + type + " - Tráng Miệng");
                    lbTitle.setIcon(new ImageIcon(getClass().getResource("/Icons/MenuBar/Dessert.png")));
                }
                case "Salad" -> {
                    lbTitle.setText("Menu/" + type + " - Rau");
                    lbTitle.setIcon(new ImageIcon(getClass().getResource("/Icons/MenuBar/Salad.png")));
                }
                case "Rice" -> {
                    lbTitle.setText("Menu/" + type + " - Cơm");
                    lbTitle.setIcon(new ImageIcon(getClass().getResource("/Icons/MenuBar/Rice.png")));
                }
                case "Pork" -> {
                    lbTitle.setText("Menu/" + type + " - Heo");
                    lbTitle.setIcon(new ImageIcon(getClass().getResource("/Icons/MenuBar/Pork.png")));
                }
                case "Chevon" -> {
                    lbTitle.setText("Menu/" + type + " - Dê");
                    lbTitle.setIcon(new ImageIcon(getClass().getResource("/Icons/MenuBar/Chevon.png")));
                }
                case "Drink" -> {
                    lbTitle.setText("Menu/" + type + " - Nước Giải Khát");
                    lbTitle.setIcon(new ImageIcon(getClass().getResource("/Icons/MenuBar/Drink.png")));
                }
                case "Sushi" -> {
                    lbTitle.setText("Menu/" + type + " - Sushi");
                    lbTitle.setIcon(new ImageIcon(getClass().getResource("/Icons/MenuBar/sushi.png")));
                }
                default -> {
                }
            }
            
            
        } catch (SQLException ex) {
            Logger.getLogger(FoodMenu_Form.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void initMenuFood() {
        try {
            list = service.MenuFood(type);
            for (ModelMonAn data : list) {
                panel.add(new CardMonAn(data, HoaDon));
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }

    public void searchFood(String txt) {
        panel.removeAll();
        for (ModelMonAn data : list) {
            if (data.getTitle().toLowerCase().contains(txt.toLowerCase())) {
                panel.add(new CardMonAn(data, HoaDon));
            }
        }
        panel.repaint();
        panel.revalidate();
    }

    public void initMenuFoodOrderby(String txt) {
        try {
            list = service.MenuFoodOrder(type, txt);
            panel.removeAll();
            for (ModelMonAn data : list) {
                panel.add(new CardMonAn(data, HoaDon));
            }

        } catch (SQLException ex) {
            Logger.getLogger(FoodMenu_Form.class.getName()).log(Level.SEVERE, null, ex);
        }
        panel.repaint();
        panel.revalidate();
    }

    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        jScrollPane1 = new javax.swing.JScrollPane();
        panel = new javax.swing.JPanel();
        lbTitle = new javax.swing.JLabel();
        txtSearch = new PandaRestaurant.View.Swing.MyTextField();
        orderby = new javax.swing.JComboBox<>();
        jLabel1 = new javax.swing.JLabel();
        cmdShowBill = new PandaRestaurant.View.Swing.Button();
        lbTable = new javax.swing.JLabel();
        txtTableName = new PandaRestaurant.View.Swing.MyTextField();
        jSeparator2 = new javax.swing.JSeparator();

        setBackground(new java.awt.Color(247, 247, 247));

        jScrollPane1.setBorder(null);
        jScrollPane1.setHorizontalScrollBarPolicy(javax.swing.ScrollPaneConstants.HORIZONTAL_SCROLLBAR_NEVER);

        panel.setBackground(new java.awt.Color(215, 221, 232));

        javax.swing.GroupLayout panelLayout = new javax.swing.GroupLayout(panel);
        panel.setLayout(panelLayout);
        panelLayout.setHorizontalGroup(
            panelLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGap(0, 963, Short.MAX_VALUE)
        );
        panelLayout.setVerticalGroup(
            panelLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGap(0, 542, Short.MAX_VALUE)
        );

        jScrollPane1.setViewportView(panel);

        lbTitle.setFont(new java.awt.Font("Segoe UI", 1, 14)); // NOI18N
        lbTitle.setForeground(new java.awt.Color(147, 5, 13));
        lbTitle.setIcon(new javax.swing.ImageIcon(getClass().getResource("/Icons/MenuBar/Lamb.png"))); // NOI18N
        lbTitle.setText("Menu/Lamb");
        lbTitle.setIconTextGap(10);
        lbTitle.setInheritsPopupMenu(false);

        txtSearch.setPrefixIcon(new javax.swing.ImageIcon(getClass().getResource("/Icons/loupe (1).png"))); // NOI18N
        txtSearch.addMouseListener(new java.awt.event.MouseAdapter() {
            public void mouseEntered(java.awt.event.MouseEvent evt) {
                txtSearchMouseEntered(evt);
            }
        });
        txtSearch.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                txtSearchActionPerformed(evt);
            }
        });

        orderby.setEditable(true);
        orderby.setFont(new java.awt.Font("Segoe UI", 0, 14)); // NOI18N
        orderby.setForeground(new java.awt.Color(108, 91, 123));
        orderby.setModel(new javax.swing.DefaultComboBoxModel<>(new String[] { "Tên A->Z", "Giá tăng dần", "Giá giảm dần" }));
        orderby.setSelectedIndex(-1);
        orderby.setToolTipText("Sắp xếp");
        orderby.setBorder(javax.swing.BorderFactory.createLineBorder(new java.awt.Color(164, 145, 145), 2));
        orderby.setFocusable(false);
        orderby.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                orderbyActionPerformed(evt);
            }
        });

        jLabel1.setFont(new java.awt.Font("Segoe UI", 0, 14)); // NOI18N
        jLabel1.setForeground(new java.awt.Color(147, 5, 13));
        jLabel1.setText("Sắp xếp theo");

        cmdShowBill.setBackground(new java.awt.Color(147, 5, 13));
        cmdShowBill.setForeground(new java.awt.Color(255, 255, 255));
        cmdShowBill.setIcon(new javax.swing.ImageIcon(getClass().getResource("/Icons/clipboard.png"))); // NOI18N
        cmdShowBill.setText("XEM HÓA ĐƠN");
        cmdShowBill.setFocusable(false);
        cmdShowBill.setFont(new java.awt.Font("Segoe UI", 0, 14)); // NOI18N
        cmdShowBill.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                cmdShowBillActionPerformed(evt);
            }
        });

        lbTable.setFont(new java.awt.Font("Segoe UI", 1, 18)); // NOI18N
        lbTable.setForeground(new java.awt.Color(89, 89, 89));
        lbTable.setText("MÃ BÀN CỦA BẠN");

        txtTableName.setEditable(false);
        txtTableName.setHorizontalAlignment(javax.swing.JTextField.CENTER);
        txtTableName.setText("Chưa đặt bàn");
        txtTableName.setFont(new java.awt.Font("sansserif", 0, 18)); // NOI18N
        txtTableName.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                txtTableNameActionPerformed(evt);
            }
        });

        jSeparator2.setBackground(new java.awt.Color(76, 76, 76));

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(this);
        this.setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addGap(6, 6, 6)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(jSeparator2)
                    .addGroup(layout.createSequentialGroup()
                        .addGap(6, 6, 6)
                        .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addGroup(layout.createSequentialGroup()
                                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                                    .addGroup(layout.createSequentialGroup()
                                        .addGap(0, 0, Short.MAX_VALUE)
                                        .addComponent(jLabel1)
                                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED))
                                    .addGroup(layout.createSequentialGroup()
                                        .addComponent(lbTitle)
                                        .addGap(559, 559, 559)))
                                .addComponent(orderby, javax.swing.GroupLayout.PREFERRED_SIZE, 128, javax.swing.GroupLayout.PREFERRED_SIZE))
                            .addGroup(layout.createSequentialGroup()
                                .addComponent(lbTable)
                                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                                .addComponent(txtTableName, javax.swing.GroupLayout.PREFERRED_SIZE, 200, javax.swing.GroupLayout.PREFERRED_SIZE)
                                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                                .addComponent(cmdShowBill, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))))
                    .addGroup(layout.createSequentialGroup()
                        .addComponent(txtSearch, javax.swing.GroupLayout.PREFERRED_SIZE, 400, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addGap(0, 0, Short.MAX_VALUE))
                    .addComponent(jScrollPane1))
                .addContainerGap())
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addContainerGap()
                .addComponent(lbTitle)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(cmdShowBill, javax.swing.GroupLayout.PREFERRED_SIZE, 38, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                        .addComponent(txtTableName, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addComponent(lbTable, javax.swing.GroupLayout.PREFERRED_SIZE, 41, javax.swing.GroupLayout.PREFERRED_SIZE)))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addComponent(jSeparator2, javax.swing.GroupLayout.PREFERRED_SIZE, 1, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING, false)
                        .addComponent(jLabel1, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                        .addComponent(orderby, javax.swing.GroupLayout.DEFAULT_SIZE, 38, Short.MAX_VALUE))
                    .addComponent(txtSearch, javax.swing.GroupLayout.Alignment.TRAILING, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addGap(18, 18, 18)
                .addComponent(jScrollPane1, javax.swing.GroupLayout.PREFERRED_SIZE, 533, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addContainerGap(15, Short.MAX_VALUE))
        );
    }// </editor-fold>//GEN-END:initComponents

    private void txtSearchMouseEntered(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_txtSearchMouseEntered
        searchFood(txtSearch.getText().trim());
    }//GEN-LAST:event_txtSearchMouseEntered

    private void txtSearchActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_txtSearchActionPerformed
        searchFood(txtSearch.getText().trim());
    }//GEN-LAST:event_txtSearchActionPerformed

    private void orderbyActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_orderbyActionPerformed
        initMenuFoodOrderby((String) orderby.getSelectedItem());
    }//GEN-LAST:event_orderbyActionPerformed

    private void cmdShowBillActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_cmdShowBillActionPerformed
        try {
            HoaDon=service.FindHoaDon(customer);
            obj.showBill(HoaDon);
        } catch (SQLException ex) {
            Logger.getLogger(FoodMenu_Form.class.getName()).log(Level.SEVERE, null, ex);
        }
    }//GEN-LAST:event_cmdShowBillActionPerformed

    private void txtTableNameActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_txtTableNameActionPerformed
        // TODO add your handling code here:
    }//GEN-LAST:event_txtTableNameActionPerformed


    // Variables declaration - do not modify//GEN-BEGIN:variables
    private PandaRestaurant.View.Swing.Button cmdShowBill;
    private javax.swing.JLabel jLabel1;
    private javax.swing.JScrollPane jScrollPane1;
    private javax.swing.JSeparator jSeparator2;
    private javax.swing.JLabel lbTable;
    private javax.swing.JLabel lbTitle;
    private javax.swing.JComboBox<String> orderby;
    private javax.swing.JPanel panel;
    private PandaRestaurant.View.Swing.MyTextField txtSearch;
    private PandaRestaurant.View.Swing.MyTextField txtTableName;
    // End of variables declaration//GEN-END:variables
}
