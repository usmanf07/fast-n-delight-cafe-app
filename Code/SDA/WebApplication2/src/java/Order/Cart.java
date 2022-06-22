/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Order;

import FoodMenu.Item;
import java.util.List;

/**
 *
 * @author usman
 */
public class Cart {
    public static List <Item> cartItemList;
    public static int totalItems;
    public static float totalBill;
    public static boolean voucherUsed;
    
    public Cart(){
        totalItems = 0;
    }
    
    public void removeItemFromCart(int itemID)
    {
       for(int i = 0; i < cartItemList.size(); i++)
        {
            Item item = cartItemList.get(i);
            if(item.getItemID() == itemID)
            {
                int quantity = item.getQuantity();
                quantity--;
                item.setQuantity(quantity);

                if(quantity == 0)
                {
                    cartItemList.remove(i);
                }
                else
                {
                    cartItemList.get(i).setQuantity(quantity);
                }
                totalBill -= item.getPrice();
            }
        }
    }
    
    public static void addItemToCart(Item item)
    {
        boolean flag = false;
        int quantity = 0;
        
        for(int i = 0; i < cartItemList.size(); i++)
        {
            Item oldItem = cartItemList.get(i);
            if(item.getName().equals(oldItem.getName()))
            {
                flag = true;
                quantity = item.getQuantity();
                quantity += oldItem.getQuantity();
                oldItem.setQuantity(quantity);
            }
        }
        
        if(!flag)
        {
            cartItemList.add(totalItems, item);
            totalItems++;
        }
        
    }

    public static List<Item> getCartItemList() {
        if(cartItemList != null)
            return cartItemList;
       return null;
    }
    
    public void calculateBill(Item item){

            totalBill += item.getPrice() * item.getQuantity();
            if(totalBill < 0)
                totalBill = 0;
    }
    
    public void applyVoucher(float disc){
        totalBill -= disc;
        if(totalBill < 0)
                totalBill = 0;
    }
    
    public float getTotalBill() {
        return totalBill;
    }
   
    public static void resetCart(){
        Cart.cartItemList.clear();
        Cart.totalBill= 0;
        Cart.voucherUsed = false;
        Cart.totalItems = 0;
    }
}
