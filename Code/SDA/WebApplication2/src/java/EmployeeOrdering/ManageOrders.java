/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package EmployeeOrdering;

import Users.Employee;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author usman
 */
public class ManageOrders extends HttpServlet {

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
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            int orderIndex = Integer.valueOf(request.getParameter("index"));
            RequestDispatcher rd;
            if(request.getParameter("ready") != null){
                String r = Employee.updateOrderStatus(orderIndex, "Ready");
                if(r.equals("success")){
                    request.setAttribute("accepted", "Order is Ready for Pick Up!");
                    rd = request.getRequestDispatcher("ManageOrdersPage.jsp");
                    rd.include(request, response);
                }
                
                else{
                    request.setAttribute("decline", r);
                    rd = request.getRequestDispatcher("ManageOrdersPage.jsp");
                    rd.include(request, response);
                }
            }
            
            else if(request.getParameter("delivered") != null){
                String r = Employee.updateOrderStatus(orderIndex, "Delivered");
                if(r.equals("success")){
                    request.setAttribute("accepted", "Order Has been Delivered Successfully");
                    rd = request.getRequestDispatcher("ManageOrdersPage.jsp");
                    rd.include(request, response);
                }
                
                else{
                    request.setAttribute("decline", r);
                    rd = request.getRequestDispatcher("ManageOrdersPage.jsp");
                    rd.include(request, response);
                }
            }
            
            else if(request.getParameter("completed") != null){
                String r = Employee.updateOrderStatus(orderIndex, "Completed");
                if(r.equals("success")){
                    request.setAttribute("accepted", "Order Has been Completed Successfully");
                    rd = request.getRequestDispatcher("ManageOrdersPage.jsp");
                    rd.include(request, response);
                }
                
                else{
                    request.setAttribute("decline", r);
                    rd = request.getRequestDispatcher("ManageOrdersPage.jsp");
                    rd.include(request, response);
                }
            }
            
            else if(request.getParameter("cancel") != null){
                String r = Employee.updateOrderStatus(orderIndex, "Cancelled");
                if(r.equals("success")){
                    request.setAttribute("accepted", "Order Has been Cancelled Successfully");
                    rd = request.getRequestDispatcher("ManageOrdersPage.jsp");
                    rd.include(request, response);
                }
                
                else{
                    request.setAttribute("decline", r);
                    rd = request.getRequestDispatcher("ManageOrdersPage.jsp");
                    rd.include(request, response);
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
        processRequest(request, response);
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
        processRequest(request, response);
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
