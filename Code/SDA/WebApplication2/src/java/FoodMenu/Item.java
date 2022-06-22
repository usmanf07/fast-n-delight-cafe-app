/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package FoodMenu;

/**
 *
 * @author usman
 */
public class Item {
    private int itemID;
    private String name;
    private String desc;
    private String itemType;
    private String imageUrl;
    private int quantity;
    private float price;
    private int stock;
    private boolean availabilityStatus;
    public Item(){
        
    }
    public void setItem(int itemID, String name, String desc, String itemType, String imageUrl, float price, int stock, boolean availabilityStatus) {
        this.itemID = itemID;
        this.name = name;
        this.desc = desc;
        this.itemType = itemType;
        this.imageUrl = imageUrl;
        this.price = price;
        this.stock = stock;
        this.availabilityStatus = availabilityStatus;
    }

    public void setOrderItems(int itemID, String name, float price, int quantity) {
        this.itemID = itemID;
        this.name = name;
        this.price = price;
        this.quantity = quantity;
    }
    
    public String getName() {
        return name;
    }

    public String getDesc() {
        return desc;
    }

    public String getImageUrl() {
        return imageUrl;
    }

    public float getPrice() {
        return price;
    }

    public void setDesc(String desc) {
        this.desc = desc;
    }

    public void setItemType(String itemType) {
        this.itemType = itemType;
    }

    public void setImageUrl(String imageUrl) {
        this.imageUrl = imageUrl;
    }

    public void setAvailabilityStatus(boolean availabilityStatus) {
        this.availabilityStatus = availabilityStatus;
    }

    public boolean isAvailabile() {
        return availabilityStatus;
    }

    public void setItemID(int itemID) {
        this.itemID = itemID;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public int getItemID() {
        return itemID;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setPrice(float price) {
        this.price = price;
    }

    public int getStock() {
        return stock;
    }

    public void setStock(int stock) {
        this.stock = stock;
    }
    
    
    
}
