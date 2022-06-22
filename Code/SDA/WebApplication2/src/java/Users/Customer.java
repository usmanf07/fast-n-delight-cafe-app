/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Users;

import FoodMenu.Item;
import Order.Order;
import Reservation.ReserveTable;
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
public class Customer extends User{
    
    public static ReserveTable reservation;
    public static String orderLocation;
    boolean frequentCustomer;

    public boolean isFrequentCustomer() {
        return frequentCustomer;
    }

    public void setFrequentCustomer(boolean frequentCustomer) {
        this.frequentCustomer = frequentCustomer;
    }

    public Customer(int userID, String name, String email, String password, String phoneNum)
    {
        super(userID, name, email, password, phoneNum);
    }
    
    public Customer() {
        super();
    }
    @Override
    public String Homepage(){
        return "CustomerHome.jsp";
    }

    @Override
    public void getOrdersListFromDB() {
         if(con == null)
            con = ConnectionUtil.conDB();
         
       String ordersQuery = "select * from Order_ where customerId = ?;";
       String orderItemsQuery = "select * from Item i join orderItem oi on i.itemid = oi.itemid where oi.orderid = ?;";   
       
       try {
                preparedStatement = con.prepareStatement(ordersQuery);
                preparedStatement.setInt(1, userID);
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
    
    public void getReservation(){
        if(con == null)
            con = ConnectionUtil.conDB();
        int userID = User.currentUser.userID;
        String sql = "select * from ReserveTable where reservationID = (select max(reservationid) from reservetable where reservedby = ?)";
         con = ConnectionUtil.conDB();
          try {
                preparedStatement = con.prepareStatement(sql);
                preparedStatement.setInt(1, userID);
                resultSet = preparedStatement.executeQuery();
                if(resultSet.next())
                {
                    reservation = new ReserveTable();
                    reservation.setReserveTable(resultSet.getInt("reservationID"), resultSet.getString("reservationDate"), resultSet.getString("reservationTime"), resultSet.getBoolean("reservationApproved"));
                }
                else
                    reservation = null;
                
          } catch (SQLException ex) {
                out.println(ex.getMessage());
            }
    }
    
    public static String makeReservation(String date, String time, int numPeople) throws SQLException{
        String result = "success";
        
        if(con == null)
            con = ConnectionUtil.conDB();
        
        int userID = User.currentUser.userID;
        String query = "insert into ReserveTable values(?, ?, ?, ?, ?, ?);";
        String getId = "SELECT Max(reservationID) AS max_id FROM ReserveTable";
        
        try {
            preparedStatement = con.prepareStatement(getId);
            resultSet = preparedStatement.executeQuery();
            if (resultSet.next()){
                reservation = new ReserveTable();
                boolean status = false;
                reservation.setNumPeople(numPeople);
                reservation.setReserveTable(userID, date, time, status);
                int resid = resultSet.getInt("max_id") + 1;
                try{
                    preparedStatement = con.prepareStatement(query);
                    preparedStatement.setInt(1, resid);
                    preparedStatement.setInt(2, 0);
                    preparedStatement.setString(3, date);
                    preparedStatement.setString(4, time);
                    preparedStatement.setBoolean(5, false);
                    preparedStatement.setInt(6, userID);
                    preparedStatement.execute();
                }catch (SQLException ex) {
                    result = ex.getMessage();
                }
            }
        } catch (SQLException ex) {
                result = ex.getMessage();
            }
        return result;
    }

}
