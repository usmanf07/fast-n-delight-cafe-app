/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Reservation;

import static Order.Order.customer;
import Users.Customer;
import Users.User;
import static java.lang.System.out;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import sqlCon.ConnectionUtil;

/**
 *
 * @author usman
 */
public class ReserveTable {
    private int reservationID;
    public static Table reservedTable;
    private String reservationDate;
    private String reservationTime;
    private boolean reservationApproved;
    private int numPeople;
    public static Customer customer;
    public static List<ReserveTable> reservationList;
    Connection con = null;
    PreparedStatement preparedStatement = null;
    ResultSet resultSet = null;

    public static String getCustomerName() {
        return customer.name;
    }
    
    public void setCustomer(String name, String phoneNum, String location){
        customer.name = name;
        customer.phoneNum = phoneNum;
    }
    
    public int getReservationID() {
        return reservationID;
    }

    public String getReservationDate() {
        return reservationDate;
    }
    
    public String getReservationTime() {
        return reservationTime;
    }

    public boolean isReservationApproved() {
        return reservationApproved;
    }

     public void setNumPeople(int numPeople) {
        this.numPeople = numPeople;
    }
     
    public int getNumPeople() {
        return numPeople;
    }

    public void setReserveTable(int reservationID, String reservationDate, String reservationTime, boolean reservationApproved) {
        this.reservationID = reservationID;
        this.reservationDate = reservationDate;
        this.reservationTime = reservationTime;
        this.reservationApproved = reservationApproved;
    }
}
