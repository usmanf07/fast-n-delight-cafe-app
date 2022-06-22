/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package CustomerExtras;

import Users.User;
import static java.lang.System.out;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import sqlCon.ConnectionUtil;

/**
 *
 * @author usman
 */
public class Voucher {
    int voucherID;
    float discountAmount;
    String expiryDate;
    String voucherCode;
    boolean isRedeemed;
    public static List<Voucher> voucherList;
    
    Connection con = null;
    PreparedStatement preparedStatement = null;
    ResultSet resultSet = null;
    
    public void setVoucher(int voucherID, float discountAmount, String expiryDate, String voucherCode, boolean isRedeemed){
        this.voucherID = voucherID;
        this.discountAmount = discountAmount;
        this.expiryDate = expiryDate;
        this.voucherCode = voucherCode;
        this.isRedeemed = isRedeemed;
    }
       
    public void getVoucherFromDB(){
        int userID = User.currentUser.userID;
        String sql = "select * from Voucher where customerID = ?;";
        con = ConnectionUtil.conDB();
        voucherList = new ArrayList<>();
       
        try {  
                preparedStatement = con.prepareStatement(sql);
                preparedStatement.setInt(1, userID);
                resultSet = preparedStatement.executeQuery();
                int i = 0;
                if(resultSet != null)
                {
                    
                    while(resultSet.next()) {
                        Voucher custVoucher = new Voucher();
                        custVoucher.setVoucher(resultSet.getInt("voucherid"), resultSet.getFloat("discount"), resultSet.getString("expiryDate"), resultSet.getString("voucherCode"), resultSet.getBoolean("redemptionStatus"));
                        voucherList.add(i, custVoucher);
                        i++;
                    }
                }
       }
       catch (SQLException ex) {
                out.println("<p>" + ex.getMessage()+ "</p>");
            }
    }

    public float availVoucher(String code){
        
        if(voucherList == null)
        {
            getVoucherFromDB();
        }
        
        for(int i = 0; i < voucherList.size(); i++)
        {
            Voucher voucher = voucherList.get(i);
            if(voucher.voucherCode.equals(code) && !voucher.isRedeemed)
            {
                return voucher.discountAmount;
            }
        }
        
        return 0;
    }
    
    public float getDiscountAmount() {
        return discountAmount;
    }

    public String getExpiryDate() {
        return expiryDate;
    }

    public String getVoucherCode() {
        return voucherCode;
    }

    public boolean isIsRedeemed() {
        return isRedeemed;
    }
}
