/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Users;

import FoodMenu.Item;
import FoodMenu.Menu;
import static Users.User.con;
import static java.lang.System.out;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.RequestDispatcher;
import sqlCon.ConnectionUtil;

/**
 *
 * @author usman
 */
public class Admin extends User{
    
    public static int indexNum;
    public static List <User> usersList;
    
    public Admin(int userID, String name, String email, String password, String phoneNum)
    {
        super(userID, name, email, password, phoneNum);
    }

    public Admin() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }
    
    @Override
    public String Homepage(){
        return "AdminHomePage.jsp";
    }

    @Override
    public void getOrdersListFromDB() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void getReservation() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }
    
    public void getFrequentCustomersfromDB(){
        String query = "select userid from User as U join Customer C on U.userId=c.customerId  where frequentCustomer=true";
         if(con == null) 
            con = ConnectionUtil.conDB();
         
         try{
                preparedStatement = con.prepareStatement(query);
                resultSet = preparedStatement.executeQuery();
                int i = 0;
                if(resultSet != null)
                {
                    while(resultSet.next()) {
                         int id = resultSet.getInt("userid");
                         if(usersList.get(i) instanceof Customer){
                                Customer c = (Customer) usersList.get(i);
                                c.setFrequentCustomer(true);
                                usersList.set(i, c);
                         }
                         i++;
                    }
                }
       }
       catch (SQLException ex) {
                out.println(ex.getMessage());
            } 
    }
    
    public static void getUsersfromDB()
    {
        String query = "select * from user where usertype = 1 or usertype = 2 or usertype = 4";  
            
       if(con == null) 
            con = ConnectionUtil.conDB();
       
       try {
            if(usersList == null)
                usersList = new ArrayList<>();
                preparedStatement = con.prepareStatement(query);
                resultSet = preparedStatement.executeQuery();
                int i = 0;
                if(resultSet != null)
                {
                    while(resultSet.next()) {

                        User user = initializeUser(resultSet.getInt("userType"), resultSet.getInt("userId"), resultSet.getString("name"), resultSet.getString("email"), resultSet.getString("password"), resultSet.getString("phoneNumber"));
                        user.userType = resultSet.getInt("userType");
                        
                        usersList.add(i, user);
                        i++;
                    }
                }
       }
       catch (SQLException ex) {
                out.println(ex.getMessage());
            }
    }
    
    public static String editItem(String name, String price, String url, String desc, String stock, String avail){
        String result = "success";
        if(con == null)
            con = ConnectionUtil.conDB();
        
        Item item = Menu.itemList.get(indexNum);
        
        if(!name.isEmpty())
            item.setName(name);
        
        if(!price.isEmpty())
           item.setPrice(Float.valueOf(price));

        if(!url.isEmpty())
           item.setImageUrl(url);
        
        if(!desc.isEmpty())
           item.setDesc(desc);
        
        if(!stock.isEmpty())
           item.setStock(Integer.valueOf(stock));
        
        if(!avail.isEmpty()){
            if(avail.equals("no"))
                item.setAvailabilityStatus(false);
            else if(avail.equals("yes"))
                item.setAvailabilityStatus(true);
        }
        
        Menu.itemList.set(indexNum, item);
        
        String query = "update Item set name_ = ?, description_ = ?, price =?, stock=?, imagePath=?, availabilityStatus = ? where itemid = ?;";
        
        try{
            preparedStatement = con.prepareStatement(query);
            
            preparedStatement.setString(1, item.getName());
            preparedStatement.setString(2, item.getDesc());
            preparedStatement.setFloat(3, item.getPrice());
            preparedStatement.setInt(4, item.getStock());
            preparedStatement.setString(5, item.getImageUrl());
            preparedStatement.setBoolean(6, item.isAvailabile());
            preparedStatement.setInt(7, item.getItemID());
            preparedStatement.execute();
            
        }   catch (SQLException ex) {
                result = ex.getMessage();
             }
        
        return result;
    }
    
    public static String addItem(String name, String price, String url, String desc, String stock, String avail){
        String result = "success";
        
        if(name.isEmpty() || price.isEmpty() || url.isEmpty() || desc.isEmpty()|| stock.isEmpty())
            return result = "You cannot leave any field empty!";
        
        if(con == null)
            con = ConnectionUtil.conDB();
        
         String insertQuery = "Insert INTO Item values(?, ?, ?, \"1\", ?, ?, ?, ?)";
         String getItemID = "SELECT Max(itemid) AS max_id FROM Item";
         String menuQuery = "insert into Menu values(1, ?);";
         
            try {
                preparedStatement = con.prepareStatement(getItemID);
                resultSet = preparedStatement.executeQuery();
                if (resultSet.next()) {
                    int itemID = resultSet.getInt("max_id") + 1;
                    Item item = new Item();
                    item.setItem(itemID, name, desc, "1", url, Float.valueOf(price), Integer.valueOf(stock), true);
                    if(avail.equals("no"))
                        item.setAvailabilityStatus(false);
                    else if(avail.equals("yes"))
                        item.setAvailabilityStatus(true);
                    try{
                        preparedStatement = con.prepareStatement(insertQuery);

                        preparedStatement.setInt(1, item.getItemID());
                        preparedStatement.setString(2, item.getName());
                        preparedStatement.setString(3, item.getDesc());
                        preparedStatement.setFloat(4, item.getPrice());
                        preparedStatement.setInt(5, item.getStock());
                        preparedStatement.setString(6, item.getImageUrl());
                        preparedStatement.setBoolean(7, item.isAvailabile());
                        preparedStatement.execute();

                        try{
                        preparedStatement = con.prepareStatement(menuQuery);

                        preparedStatement.setInt(1, item.getItemID());
                        preparedStatement.execute();

                        Menu.itemList.add(Menu.itemList.size(), item);
                        
                    }   catch (SQLException ex) {
                            result = ex.getMessage();
                        }
                    }   catch (SQLException ex) {
                            result = ex.getMessage();
                        }
                }
                
            }   catch (SQLException ex) {
                result = ex.getMessage();
             }

        return result;
    }
    
    public static String removeUser(int index){
        String result = "success";
        String sql="delete from User where userId=?";
        if(con == null)
            con = ConnectionUtil.conDB();
        
            try{
                preparedStatement = con.prepareStatement(sql);       
                preparedStatement.setInt(1, usersList.get(index).userID);
                preparedStatement.execute();
                usersList.remove(index);
                   
            }catch (SQLException ex) {
                return result = ex.getMessage(); 
            }
        return result;
    }
    
    public static int getTodaysSale(){
        int result = -99;
        
        String sql="SELECT sum(totalBill) as sales FROM order_ WHERE DATE(orderdate) = curdate() AND orderstatus = \"completed\" or orderstatus = \"delivered\";";
        if(con == null)
            con = ConnectionUtil.conDB();
        
            try{
                preparedStatement = con.prepareStatement(sql);       
                resultSet = preparedStatement.executeQuery();
                if(resultSet.next())
                    result = resultSet.getInt("sales");
                   
            }catch (SQLException ex) {
                out.println(ex.getMessage()); 
            }
        return result;
    }
    
    public static int getTodaysOrder(){
        int result = -99;
        
        String sql="select count(orderid) as totalorders FROM order_ WHERE DATE(orderdate) = curdate() AND orderstatus = \"completed\" or orderstatus = \"delivered\";";
        if(con == null)
            con = ConnectionUtil.conDB();
        
            try{
                preparedStatement = con.prepareStatement(sql);       
                resultSet = preparedStatement.executeQuery();
                if(resultSet.next())
                    result = resultSet.getInt("totalorders");
                   
            }catch (SQLException ex) {
                out.println(ex.getMessage()); 
            }
        return result;
    }
    
    public static int getAllTimeSale(){
        int result = -99;
        
        String sql="SELECT sum(totalBill) as sales FROM order_";
        if(con == null)
            con = ConnectionUtil.conDB();
        
            try{
                preparedStatement = con.prepareStatement(sql);       
                resultSet = preparedStatement.executeQuery();
                if(resultSet.next())
                    result = resultSet.getInt("sales");
                   
            }catch (SQLException ex) {
                out.println(ex.getMessage()); 
            }
        return result;
    }
    
    
}
