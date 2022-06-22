/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Users;

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
public class EditProfile extends HttpServlet {

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
            /* TODO output your page here. You may use following sample code. */
            if (request.getParameter("logout") != null) {
                    User.currentUser.OrdersList = null;
                    User.currentUser = null;
                    Employee.reservationList = null;
                  
                    RequestDispatcher rd = request.getRequestDispatcher("HomePage.jsp");
                    rd.include(request, response);
                }
            else if(request.getParameter("save") != null){
                String email, password, newPassword, phoneNum, name;
                
                email = request.getParameter("email");
                password = request.getParameter("password");
                newPassword = request.getParameter("newpassword");
                phoneNum = request.getParameter("phone");
                name = request.getParameter("name");

                String r = User.currentUser.editProfile(email, password, newPassword, phoneNum, name);
                
                if(r.equals("success")){
                    request.setAttribute("success", "Your profile has been updated successfully!");
                    RequestDispatcher rd = request.getRequestDispatcher("EditProfilePage.jsp");
                    rd.include(request, response);
                }
                else{
                    request.setAttribute("error", r);
                    RequestDispatcher rd = request.getRequestDispatcher("EditProfilePage.jsp");
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
