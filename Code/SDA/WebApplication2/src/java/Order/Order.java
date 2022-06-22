/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Order;

import FoodMenu.Item;
import Users.Customer;
import Users.User;
import static java.lang.System.out;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;
import sqlCon.ConnectionUtil;

/**
 *
 * @author usman
 */
public class Order {
    private int orderID;
    private String orderDate;
    private String orderTime;
    private String orderStatus;
    private String orderType;
    private String orderLocation;
    private float orderBill;
    private int totalOrders;
    public List <Item> orderItemList;
    public static Order customerOrder;
    public static Customer customer;
    
    Connection con = null;
    PreparedStatement preparedStatement = null;
    ResultSet resultSet = null;
    public Order(){
        
    }

    public static String getCustomerName() {
        return customer.name;
    }
    
    public void setCustomer(String name, String phoneNum, String location){
        customer.name = name;
        customer.phoneNum = phoneNum;
    }

    public void setOrderStatus(String orderStatus) {
        this.orderStatus = orderStatus;
    }


    
    public String getOrderLocation() {
        return orderLocation;
    }

    public void setOrderLocation(String orderLocation) {
        this.orderLocation = orderLocation;
    }
    
    public void setOrders(int orderID, String orderDate, String orderTime, String orderStatus, String orderType, float totalBill) {
        this.orderID = orderID;
        this.orderDate = orderDate;
        this.orderTime = orderTime;
        this.orderStatus = orderStatus;
        this.orderType = orderType;
        this.orderBill = totalBill;
    }

    public int getOrderID() {
        return orderID;
    }

    public String getOrderDate() {
        return orderDate;
    }

    public String getOrderStatus() {
        return orderStatus;
    }

    public String getOrderType() {
        return orderType;
    }

    public float getOrderBill() {
        return orderBill;
    }

    public int getTotalOrders() {
        return totalOrders;
    }

    public String getOrderTime() {
        return orderTime;
    }

    public void setOrderID(int orderID) {
        this.orderID = orderID;
    }

    public void setOrderItemList(List<Item> orderItemList) {
        orderItemList = orderItemList;
    }
    
    public void setCustomerOrderType(String type){
        customerOrder.orderType = type;
    }
    
    public boolean createOrder(String paymentType){
        
        if(con == null)
            con = ConnectionUtil.conDB();
        
        DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd");  
        LocalDateTime now = LocalDateTime.now();
        String date = dtf.format(now);
        customerOrder.orderDate = date;
        
        dtf = DateTimeFormatter.ofPattern("HH:mm:ss");  
        now = LocalDateTime.now();
        String time = dtf.format(now);
        
        customerOrder.orderTime = time;
        customerOrder.orderStatus = "Confirmed";
        int userID = User.currentUser.userID;
        customerOrder.orderBill = Cart.totalBill;
        
       String getId = "SELECT Max(orderid) AS max_id FROM Order_";
       String orderInsert = "insert into Order_ values(?, ?, ?, ?, ?, ?, ?);";
       String itemInsert = "insert into orderItem values(?, ?, ?);";
       String orderLocation = "insert into orderLocation values (?, ?);";
       
        try {
            preparedStatement = con.prepareStatement(getId);
            resultSet = preparedStatement.executeQuery();
            if (resultSet.next()){
                int orderid = resultSet.getInt("max_id") + 1;
                try{
                customerOrder.orderID = orderid;
                preparedStatement = con.prepareStatement(orderInsert);
                preparedStatement.setInt(1, customerOrder.orderID);
                preparedStatement.setInt(2, userID);
                preparedStatement.setString(3, customerOrder.orderDate);
                preparedStatement.setString(4, customerOrder.orderTime);
                preparedStatement.setString(5, customerOrder.orderType);
                preparedStatement.setString(6, customerOrder.orderStatus);
                preparedStatement.setFloat(7, customerOrder.orderBill);
                preparedStatement.execute();
                
            for(int k = 0; k < Cart.cartItemList.size(); k++){
                Item cartItem = Cart.cartItemList.get(k);
                try{
                    preparedStatement = con.prepareStatement(itemInsert);
                    preparedStatement.setInt(1, orderid);
                    preparedStatement.setInt(2, cartItem.getItemID());
                    preparedStatement.setInt(3, cartItem.getQuantity());
                    preparedStatement.execute();
                
                } catch (SQLException ex) {
                out.println(ex.getMessage());
            }
                }
                   if(customerOrder.orderType.equals("Delivery")){
                        try{
                            preparedStatement = con.prepareStatement(orderLocation);
                            preparedStatement.setInt(1, Integer.valueOf(customerOrder.getOrderLocation()));
                            preparedStatement.setInt(2, orderid);
                            preparedStatement.execute();
                            } catch (SQLException ex) {
                            out.println(ex.getMessage());
                        }
                    }
                return true;
            } catch (SQLException ex) {
                out.println(ex.getMessage());
            }
            }
       }
       catch (SQLException ex) {
                out.println(ex.getMessage());
            }
        return false;
    }

}
