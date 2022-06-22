/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Reservation;

import Order.Order;
import Users.Customer;
import Users.User;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.text.*;
import java.util.Date;
import java.time.LocalDateTime;  
import java.time.format.DateTimeFormatter;

/**
 *
 * @author usman
 */
public class MakeReservation extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException, ParseException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {

           User.currentUser.getReservation();
           
           int numPeople = 0;
           numPeople = Integer.valueOf(request.getParameter("nopeople"));
           String date = request.getParameter("date");
           String time = request.getParameter("time");
           
           if(numPeople <= 0 || date.isEmpty() || time.isEmpty())
           {
               request.setAttribute("error", "You cannot leave empty fields");
                RequestDispatcher rd = request.getRequestDispatcher("ReserveTablePage.jsp");
                rd.forward(request, response);
           }
           
           else{
            DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd");  
            LocalDateTime now = LocalDateTime.now();
            String currentDate = dtf.format(now);

            SimpleDateFormat sdformat = new SimpleDateFormat("yyyy-MM-dd");
            Date d1 = sdformat.parse(currentDate);
            Date d2 = sdformat.parse(date);
            
            if(d1.compareTo(d2) > 0){
                request.setAttribute("error", "Invalid Date Entered");
                RequestDispatcher rd = request.getRequestDispatcher("ReserveTablePage.jsp");
                rd.forward(request, response);
            }
            else{
                String r = Customer.makeReservation(date, time, numPeople);
                if(r.equals("success")){
                     request.setAttribute("success", "Request Submitted Successfully, Please wait for approval!");
                     if(Order.customerOrder != null)
                     if(Order.customerOrder.getOrderType().equals("Dinein")){
                         RequestDispatcher rd = request.getRequestDispatcher("PaymentMethodPage.jsp");
                         rd.forward(request, response);
                     }
                    RequestDispatcher rd = request.getRequestDispatcher("ReserveTablePage.jsp");
                    rd.forward(request, response);
                }
                else{
                    request.setAttribute("error", r);
                    RequestDispatcher rd = request.getRequestDispatcher("ReserveTablePage.jsp");
                    rd.forward(request, response);
                }
            }
           }
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(MakeReservation.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ParseException ex) {
            Logger.getLogger(MakeReservation.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(MakeReservation.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ParseException ex) {
            Logger.getLogger(MakeReservation.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
