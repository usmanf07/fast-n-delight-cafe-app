/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Users;

import FoodMenu.Item;
import Order.Order;
import Reservation.ReserveTable;
import Reservation.Table;
import static Users.User.OrdersList;
import static Users.User.con;
import static Users.User.preparedStatement;
import static Users.User.resultSet;
import static java.lang.System.out;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import sqlCon.ConnectionUtil;

/**
 *
 * @author usman
 */
public class Employee extends User{
    public static List<ReserveTable> reservationList;
    public static List<Table> tableList;
    
    public Employee(int userID, String name, String email, String password, String phoneNum)
    {
        super(userID, name, email, password, phoneNum);
    }

    public Employee() {
        super(); 
    }
    
    @Override
    public String Homepage(){
        return "EmployeeHomePage.jsp";
    }

    public static List<Table> getTableList() {
        return tableList;
    }
    
    public void getOrdersListFromDB() {
        if(con == null)
            con = ConnectionUtil.conDB();
         
       String ordersQuery = "select * from order_ WHERE DATE(orderdate) = curdate();";
       String orderItemsQuery = "select * from Item i join orderItem oi on i.itemid = oi.itemid where oi.orderid = ?;";   
       String orderBy = "select * from user u join order_ o on u.userid = o.customerid where orderid = ?;";
       
       try {
                preparedStatement = con.prepareStatement(ordersQuery);
                resultSet = preparedStatement.executeQuery();
                int i = 0;
                if(resultSet != null)
                {
                    if(OrdersList == null)
                        OrdersList = new ArrayList<>();
                    
                    while(resultSet.next()) {
                        Order order = new Order();
                        order.setOrders(resultSet.getInt("orderid"), resultSet.getString("orderdate"), resultSet.getString("ordertime"), resultSet.getString("orderstatus"), resultSet.getString("ordertype"), resultSet.getFloat("totalBill"));
                        OrdersList.add(i, order);
                        i++;
                    }
                    
                    try{
                        for(int j = 0; j < OrdersList.size(); j++)
                        {
                            preparedStatement = con.prepareStatement(orderItemsQuery);
                            preparedStatement.setInt(1, OrdersList.get(j).getOrderID());
                            resultSet = preparedStatement.executeQuery();
                            int k = 0;
                            if(resultSet != null)
                            {
                                if(OrdersList.get(j).orderItemList == null)
                                    OrdersList.get(j).orderItemList = new ArrayList<>();
                                
                                 while(resultSet.next())
                                 {
                                    Item item = new Item();
                                    item.setOrderItems(resultSet.getInt("itemid"), resultSet.getString("name_"), resultSet.getFloat("price"), resultSet.getInt("quantity"));
                                    OrdersList.get(j).orderItemList.add(k, item);
                                    k++;
                                }
                            } 
                        }
                        
                        for(int l = 0; l < OrdersList.size(); l++){
                            try{
                            preparedStatement = con.prepareStatement(orderBy);
                            preparedStatement.setInt(1, OrdersList.get(l).getOrderID());
                            resultSet = preparedStatement.executeQuery();
                            
                            OrdersList.get(l).customer = new Customer();
                            
                            if(resultSet.next())
                            {
                                OrdersList.get(l).setCustomer(resultSet.getString("name"), resultSet.getString("phoneNumber"), resultSet.getString("email"));
                            }
                            }catch (SQLException ex) {
                        out.println(ex.getMessage());
                    }
                        }
                    }  catch (SQLException ex) {
                        out.println(ex.getMessage());
                    }
                }
                else
                {
                    OrdersList = null;
                }
       }
       catch (SQLException ex) {
                out.println(ex.getMessage());
            }
    }

    @Override
    public void getReservation() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }
    
    public static String updateOrderStatusDB(String status, int orderID){
        String result = "success";
        
        if(con == null)
            con = ConnectionUtil.conDB();
         
       String ordersQuery = "update order_ set orderStatus = ? where orderid = ?;";
       
       try {
                preparedStatement = con.prepareStatement(ordersQuery);
                preparedStatement.setString(1, status);
                preparedStatement.setInt(2, orderID);
                preparedStatement.execute();
       }    catch (SQLException ex) {
                result = ex.getMessage();
            }
        return result;
    }
    
    public static String updateOrderStatus(int index, String status){
        String result = "success";
        
        OrdersList.get(index).setOrderStatus(status);
        int orderID = OrdersList.get(index).getOrderID();
        result = updateOrderStatusDB(status, orderID);
        
        return result;
    }
    
    public static String assignTable(int tableID, int index){
        String result = "success";
        String query = "update reservetable set tableid = ?, reservationApproved = true where reservationid = ?";
        String tableRes = "update table_ set reservedStatus = true where tableid =?";
        
        if(con == null)
            con = ConnectionUtil.conDB();
         
         try {
                
                preparedStatement = con.prepareStatement(query);
                preparedStatement.setInt(1, tableID);
                preparedStatement.setInt(2, reservationList.get(index).getReservationID());
                preparedStatement.execute();
                
                try{
                    preparedStatement = con.prepareStatement(tableRes);
                    preparedStatement.setInt(1, tableID);
                    preparedStatement.execute();
                    reservationList.remove(index);
                } catch (SQLException ex) {
                result = ex.getMessage();
            }
         }catch (SQLException ex) {
                result = ex.getMessage();
            }
        
        return result;
    }
    
    public static void getTablesFromDB(){
        String query = "select * from table_ where reservedstatus = false;";
         if(con == null)
            con = ConnectionUtil.conDB();
         
         try {
                preparedStatement = con.prepareStatement(query);
                 resultSet = preparedStatement.executeQuery();
                int i = 0;
                if(resultSet != null)
                {
                    if(tableList == null)
                        tableList = new ArrayList<>();
                    resultSet.next();
                    while(resultSet.next()) {
                        Table table = new Table();
                        table.setTable(resultSet.getInt("tableid"), resultSet.getInt("capacity"), resultSet.getBoolean("reservedStatus"));
                        tableList.add(i, table);
                        i++;
                    }
                   
                }
        }catch (SQLException ex) {
                out.println(ex.getMessage());
            }
    }
    
    public static String getReservationFromDB(){
        String result = "success";
        String query = "select * from reserveTable where reservationApproved = false;";
        String reservedBy = "select * from user u join ReserveTable r on u.userid = r.reservedBy where reservationID = ?;";
        if(con == null)
            con = ConnectionUtil.conDB();
        
        try {
                preparedStatement = con.prepareStatement(query);
                 resultSet = preparedStatement.executeQuery();
                int i = 0;
                if(resultSet != null)
                {
                    if(reservationList == null)
                        reservationList = new ArrayList<>();
                    
                    while(resultSet.next()) {
                        ReserveTable reservation = new ReserveTable();
                        reservation.setReserveTable(resultSet.getInt("reservationID"), resultSet.getString("reservationDate"), resultSet.getString("reservationTime"), resultSet.getBoolean("reservationApproved"));
                        reservationList.add(i, reservation);
                        i++;
                    }
                    
                    for(int l = 0; l < reservationList.size(); l++)
                    {
                        try{
                            preparedStatement = con.prepareStatement(reservedBy);
                            preparedStatement.setInt(1, reservationList.get(l).getReservationID());
                            resultSet = preparedStatement.executeQuery();
                            
                            reservationList.get(l).customer = new Customer();
                            
                            if(resultSet.next())
                            {
                                reservationList.get(l).setCustomer(resultSet.getString("name"), resultSet.getString("phoneNumber"), resultSet.getString("email"));
                            }
                        }catch (SQLException ex) {
                            result = ex.getMessage();
                        }
                    }   
                }
        }catch (SQLException ex) {
                result = ex.getMessage();
            }
        return result;
    }
    
    public static String declineTableRequest(int index){
        String result = "success";
        
        String query = "delete from reserveTable where reservationID = ?;";
        int resID = reservationList.get(index).getReservationID();
        
        try{
            preparedStatement = con.prepareStatement(query);
            preparedStatement.setInt(1, resID);
            preparedStatement.execute();
            
            reservationList.remove(index);
        }catch (SQLException ex) {
                result = ex.getMessage();
            }
        return result;
    }
    
    public static List<ReserveTable> getReservationList() {
        return reservationList;
    }
    
}
