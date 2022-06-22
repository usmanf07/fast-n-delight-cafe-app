/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Users;

import Order.Order;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.RequestDispatcher;
import sqlCon.ConnectionUtil;

/**
 *
 * @author usman
 */
public abstract class User {
    public int userID;
    public int userType;
    public String name;
    public String email;
    protected String password;
    public String phoneNum;
    public static User currentUser;
    public static List <Order> OrdersList;
    
    static Connection con = null;
    static PreparedStatement preparedStatement = null;
    static ResultSet resultSet = null;
    
    public User(int userID, String name, String email, String password, String phoneNum) {
        this.userID = userID;
        this.name = name;
        this.email = email;
        this.password = password;
        this.phoneNum = phoneNum;
    }
    
    public static User initializeUser(int userType, int userID, String name, String email, String password, String phoneNum){
        if(userType == 1)
            return new Customer(userID, name, email, password, phoneNum);
        
        else if(userType == 2)
            return new Employee(userID, name, email, password, phoneNum);
       
        else if(userType == 3)
            return new Admin(userID, name, email, password, phoneNum);
        
        else if(userType == 4)
            return new DeliveryBoy(userID, name, email, password, phoneNum);
        
        return null;
    }
    
    public static void setCurrentUser(User currentUser) {
        User.currentUser = currentUser;
    }

    public static User getCurrentUser() {
        return currentUser;
    }    

    public User() {
        
    }
    
    public static String loginVerification(String email, String password) throws SQLException{
        String result = "success";
        
        if(con == null)
            con = ConnectionUtil.conDB();
        
        if(email.isEmpty() || password.isEmpty()) {
            return result = "Empty credentials";
        }
        
        else{
            String name, phoneNum; 
            int userID, userType;
            
            String query = "select * from User where email = ? and password = ?";
            try {
                preparedStatement = con.prepareStatement(query);
                preparedStatement.setString(1, email);
                preparedStatement.setString(2, password);
                resultSet = preparedStatement.executeQuery();
                
                if (resultSet.next()) {
                    userID = resultSet.getInt("userId");
                    userType = resultSet.getInt("userType");
                    name = resultSet.getString("name");
                    phoneNum = resultSet.getString("phoneNumber");
                    
                    currentUser = initializeUser(userType, userID, name, email, password, phoneNum);
                    currentUser.userType = userType;
                    con = null;
                    preparedStatement = null;
                    resultSet = null;
                }
                else{
                    return result = "Enter Correct Email/Password";
                }
            }
            catch (SQLException ex) {
                  return result = ex.getMessage();
            }
        }
        
        return result;
    }
    
    public static String signUpVerification(String email, String password, String confirmPassword, String phoneNum, String name, int userType) throws SQLException{
        String result = "success";
        
        if(con == null)
            con = ConnectionUtil.conDB();
        
            if(email.isEmpty() || password.isEmpty() || phoneNum.isEmpty() || name.isEmpty()) {
               return result = "You cannot leave any field empty!!";
            }
            
            if(!password.equals(confirmPassword))
                result = "The confirmation password is not same!";
            
            else {
            //query
            String sql = "Insert INTO User values(?, ?, ?, ?, ?, ?)";
            String getId = "SELECT Max(userid) AS max_id FROM User";
            
            try {
                preparedStatement = con.prepareStatement(getId);
                resultSet = preparedStatement.executeQuery();
                if (resultSet.next()) {
                    int userID = resultSet.getInt("max_id") + 1;
                    currentUser = User.initializeUser(userType, userID, name, email, password, phoneNum);
                    currentUser.userType = userType;
                    
                 try {
                    preparedStatement = con.prepareStatement(sql);
                    preparedStatement.setInt(1, User.currentUser.userID);
                    preparedStatement.setString(2, User.currentUser.name);
                    preparedStatement.setString(3, User.currentUser.phoneNum);
                    preparedStatement.setString(4, User.currentUser.email);
                    preparedStatement.setString(5, User.currentUser.password);
                    preparedStatement.setInt(6, User.currentUser.userType);
                    preparedStatement.execute();
                
            } catch (SQLException ex) {
                return result = ex.getMessage();
            }
            
                    if(userType == 1){
                        try {
                            sql = "insert into Customer values(?, false)";
                            preparedStatement = con.prepareStatement(sql);
                            preparedStatement.setInt(1, User.currentUser.userID);
                            preparedStatement.execute();
                        } catch (SQLException ex) {
                            result = ex.getMessage();
                        }

                        try {
                            sql = "insert into CreditCard values(?, NULL, NULL, NULL, NULL)";
                            preparedStatement = con.prepareStatement(sql);
                            preparedStatement.setInt(1, User.currentUser.userID);
                            preparedStatement.execute();
                        } catch (SQLException ex) {
                            return result = ex.getMessage();

                        }
                    }
                }
                 
            } catch (SQLException ex) {
                return result = ex.getMessage();
            }
            
            
        }
            return result;
    }
    
    public static List<Order> getOrdersList() {
        return OrdersList;
    }

    public abstract String Homepage();
    public abstract void getOrdersListFromDB();
    public abstract void getReservation();
    
    public String editProfile(String email, String password, String newPassword, String phoneNum, String name){
        String result = "success";
        if(con == null)
            con = ConnectionUtil.conDB();
        
        if(!password.equals(User.currentUser.password))
            return result = "Incorrect password entered!";
        
        else{
                if(!email.isEmpty())
                    User.currentUser.email = email;
                
                if(!newPassword.isEmpty()){
                    if(!newPassword.equals(User.currentUser.password))
                        User.currentUser.password = newPassword;
                    else
                         return result = "New password cannot be same as previous!";
                }
                
                if(!phoneNum.isEmpty())
                    User.currentUser.phoneNum = phoneNum;
                
                if(!name.isEmpty())
                    User.currentUser.name = name;
                
                String updateQuery = "update user set name=?, email=? , phoneNumber=? , password=?  where userId=?;";
                
                try{
                    preparedStatement = con.prepareStatement(updateQuery);  
                    preparedStatement.setString(1, User.currentUser.name);
                    preparedStatement.setString(2, User.currentUser.email);
                    preparedStatement.setString(3, User.currentUser.phoneNum);
                    preparedStatement.setString(4, User.currentUser.password);
                    preparedStatement.setInt(5, User.currentUser.userID);
                    preparedStatement.execute();
                    
                } catch (SQLException ex) {
                    return result = ex.getMessage();
                }
            }
        
        return result;
    }
};
