/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package FoodMenu;

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
public class Menu {
    public static List <Item> itemList;
    private int totalItems;
    Connection con = null;
    PreparedStatement preparedStatement = null;
    ResultSet resultSet = null;
    
    public void getItemsFromDB(){
         String sql = "select * from Menu m join Item i on m.itemId = i.itemId;";
         con = ConnectionUtil.conDB();
         itemList = new ArrayList<>();
         
         try {
                preparedStatement = con.prepareStatement(sql);
                resultSet = preparedStatement.executeQuery();
                int i = 0;
                if(resultSet != null)
                {
                    while(resultSet.next())
                    {         
                        Item item = new Item();
                        item.setItem(resultSet.getInt("itemid"), resultSet.getString("name_"), resultSet.getString("description_"), resultSet.getString("type_"),resultSet.getString("imagePath"),
                                     resultSet.getFloat("price"), resultSet.getInt("stock"), resultSet.getBoolean("availabilityStatus"));
                        itemList.add(i, item);
                        i++;
                    }
                   totalItems = itemList.size();
                }
                else
                {
                    totalItems = 0;
                }
       }
         
       catch (SQLException ex) {
                out.println(ex.getMessage());
            }
     }

    public int getTotalItems() {
        return totalItems;
    }

    public static List<Item> getItemList() {
        return itemList;
    }
}
