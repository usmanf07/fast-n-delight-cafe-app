/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Order;

import CustomerExtras.Voucher;
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
public class CartServlet extends HttpServlet {

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
            Cart c = new Cart();
           if (request.getParameter("cartRemove") != null) {
                int id = Integer.parseInt(request.getParameter("id"));
                c.removeItemFromCart(id);
                RequestDispatcher rd = request.getRequestDispatcher("CartPage.jsp");
                rd.forward(request, response);
            } else if (request.getParameter("voucher") != null) {
                 String voucherCode = request.getParameter("vouchercode");
                 Voucher voucher = new Voucher();
                 float disc = voucher.availVoucher(voucherCode);
                 if(disc == 0)
                 {
                     request.setAttribute("error", "Invalid Voucher Code!");
                 }

                 else{
                     if(!Cart.voucherUsed)
                        c.applyVoucher(disc);
                     Cart.voucherUsed = true;
                     request.setAttribute("success", "Voucher Applied Successfuly!");
                     request.setAttribute("discount", "You got a discount of " + disc + "RS!"); 
                 }
                RequestDispatcher rd = request.getRequestDispatcher("CartPage.jsp");
                rd.forward(request, response);
            } else if (request.getParameter("checkout") != null) {
                 RequestDispatcher rd = request.getRequestDispatcher("FoodMethodPage.jsp");
                rd.forward(request, response);
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
