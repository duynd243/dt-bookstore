/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.controllers;

import java.io.IOException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
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
public class CreateController extends HttpServlet {

    private static final String URL = "login.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        try {
            UserDAO dao = new UserDAO();
            
            String userID = request.getParameter("userID");
            if(dao.checkDulicateUserID(userID)){
                request.setAttribute("ERROR_SIGNUP", "This username has been used!");
                return;
            }
            String email = request.getParameter("email");
            if(dao.checkDulicateEmail(email)){
                request.setAttribute("ERROR_SIGNUP", "This email has been used!");
                return;
            }
            String name = request.getParameter("name");
            
            String password = request.getParameter("password");
            String createDate = DateTimeFormatter.ofPattern("yyyy-MM-dd").format(LocalDateTime.now());
            UserDTO user = new UserDTO(userID, email, name, password, createDate, "US", 1);
            if(dao.signUpNewUser(user))
            request.setAttribute("SUCCESS_SIGNUP", "Successfully created your account!");
            else{
                request.setAttribute("ERROR_SIGNUP", "Unknown error!");
                return;
            }
        } catch (Exception e) {
             log("ERROR at CreateController: " + e.toString());
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
