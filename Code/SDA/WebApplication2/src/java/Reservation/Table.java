/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Reservation;

/**
 *
 * @author usman
 */
public class Table {
    private int tableID;
    private int capacity;
    private boolean reservedStatus;
    
    
    public int getTableID() {
        return tableID;
    }

    public void setTableID(int tableID) {
        this.tableID = tableID;
    }

    public int getCapacity() {
        return capacity;
    }

    public void setCapacity(int capacity) {
        this.capacity = capacity;
    }

    public boolean isReservedStatus() {
        return reservedStatus;
    }

    public void setTable(int tableID, int capacity, boolean reservedStatus) {
        this.tableID = tableID;
        this.capacity = capacity;
        this.reservedStatus = reservedStatus;
    }

    public void setReservedStatus(boolean reservedStatus) {
        this.reservedStatus = reservedStatus;
    }
}
