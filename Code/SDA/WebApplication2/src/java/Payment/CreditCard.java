/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Payment;

import Users.User;
import static java.lang.System.out;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import sqlCon.ConnectionUtil;

/**
 *
 * @author usman
 */
public class CreditCard {
    private String ccNum;
    private int expMonth;
    private int expYear;
    private int cvv;
    private static CreditCard userCard;

    Connection con = null;
    PreparedStatement preparedStatement = null;
    ResultSet resultSet = null;
    
    public static void setCreditCard(String ccNum, int expMonth, int expYear, int cvv) {
        if(userCard == null)
            userCard = new CreditCard();
        userCard.ccNum = ccNum;
        userCard.expMonth = expMonth;
        userCard.expYear = expYear;
        userCard.cvv = cvv;
    }

    public static CreditCard getUserCard() {
        return userCard;
    }
    
    public boolean validateCard(){
         int userID = User.currentUser.userID   ;
         String sql = "select * from CreditCard where creditid = ?;";
         con = ConnectionUtil.conDB();
          try {
                preparedStatement = con.prepareStatement(sql);
                preparedStatement.setInt(1, userID);
                resultSet = preparedStatement.executeQuery();
                if(resultSet.next())
                {
                    String ccn = resultSet.getString("ccNum");
                    int ccexp = resultSet.getInt("expMonth");
                    int ccyear = resultSet.getInt("expYear");
                    int cvv = resultSet.getInt("cvv");
                    
                    if(userCard.ccNum.equals(ccn) && userCard.expMonth == ccexp && userCard.expYear == ccyear && userCard.cvv == cvv)
                        return true;
                    
                    else
                        return false;
                }
          } catch (SQLException ex) {
                out.println(ex.getMessage());
            }
          return false;
    }
}

