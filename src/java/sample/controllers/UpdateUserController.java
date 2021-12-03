/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.controllers;

import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import sample.user.UserDAO;
import sample.user.UserDTO;

/**
 *
 * @author Duy
 */
public class UpdateUserController extends HttpServlet {

    private static final String URL = "admin-user.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
        try {
            request.setCharacterEncoding("UTF-8");
            UserDAO dao = new UserDAO();

            ArrayList<UserDTO> list = (ArrayList<UserDTO>) dao.getUserByName("");
            request.setAttribute("LIST_USER", list);
            String email = request.getParameter("email");
            String oldEmail = request.getParameter("oldEmail");
            String roleID = request.getParameter("roleID");
            String oldRoleID = request.getParameter("oldRoleID");
            
            if("AD".equals(oldRoleID) && "US".equals(roleID)){
                request.setAttribute("UPDATE_ERROR", "Can not change role of administrator!");
                return;
            }
            if (dao.checkDulicateEmail(email) && (!email.equals(oldEmail))) {
                request.setAttribute("UPDATE_ERROR", "This email has been used!");
                return;
            }
            String userID = request.getParameter("userID");
            String name = request.getParameter("name");

            String address = request.getParameter("address");
            String phone = request.getParameter("phone");
            

            UserDTO user = new UserDTO(userID, email, name, phone, address, roleID);
            if (dao.updateUser(user)) {
                list = (ArrayList<UserDTO>) dao.getUserByName("");
                request.setAttribute("LIST_USER", list);
                request.setAttribute("UPDATE_SUCCESS", "Successfully updated user information!");
            } else {
                request.setAttribute("UPDATE_ERROR", "Unknown error!");
                return;
            }
        } catch (Exception e) {
            log("ERROR at UpdateUserController: " + e.toString());
        } finally {
            request.getRequestDispatcher(URL).forward(request, response);
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
