/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package sample.controllers;

import java.io.IOException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
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
public class AddUserController extends HttpServlet {
    private static final String URL = "admin-user.jsp";
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try {
            UserDAO dao = new UserDAO();
            ArrayList<UserDTO> list = (ArrayList<UserDTO>)dao.getUserByName("");
            request.setAttribute("LIST_USER", list);
            String userID = request.getParameter("userID");
            
            if(dao.checkDulicateUserID(userID)){
                request.setAttribute("ADD_ERROR", "This username has been used!");
                return;
            }
            String email = request.getParameter("email");
            if(dao.checkDulicateEmail(email)){
                request.setAttribute("ADD_ERROR", "This email has been used!");
                return;
            }
            String name = request.getParameter("name");
            String address = request.getParameter("address");
            String phone = request.getParameter("phone");
            String password = request.getParameter("password");

            String createDate = DateTimeFormatter.ofPattern("yyyy-MM-dd").format(LocalDateTime.now());
            UserDTO user = new UserDTO(userID,email,name,password,phone, address, createDate,"US", 1);
            if(dao.addNewUser(user)){
                list = (ArrayList<UserDTO>)dao.getUserByName("");
                request.setAttribute("LIST_USER", list);
                request.setAttribute("ADD_SUCCESS", "Successfully added user!");
            }
            
            else{
                request.setAttribute("ADD_ERROR", "Unknown error!");
                return;
            }
        } catch (Exception e) {
            log("Error at AddUserController: "+ e.toString());
        } finally {
            request.getRequestDispatcher(URL).forward(request, response);
        }
    } 

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
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
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
