/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.controllers;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Duy
 */
public class MainController extends HttpServlet {

    private static final String LOGIN = "LoginController";
    private static final String CREATE = "CreateController"; // Đăng ký user mới
    private static final String LOGOUT = "LogoutController";
    private static final String SEARCH_BOOK = "SearchProductController";
    private static final String DELETE_USER = "DeleteUserController";
    private static final String UPDATE_USER = "UpdateUserController";
    private static final String UPDATE_CART = "UpdateCartController";
    private static final String DELETE_CART = "DeleteCartController";
    private static final String SEARCH_USER = "SearchUserController";
    private static final String ADD_TO_CART = "AddToCartController";
    private static final String UPDATE_BOOK = "UpdateBookController";
    private static final String ADD_BOOK = "AddBookController";
    private static final String DELETE_BOOK = "DeleteBookController";
    private static final String PLACE_ORDER = "PlaceOrderController";
    private static final String ERROR = "error.jsp";
    private static final String ADD_USER = "AddUserController"; // Admin thêm user mới

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String url = ERROR;
        try {
            String action = request.getParameter("action");
            if ("Sign In".equals(action)) {
                url = LOGIN;
            } else if ("Sign Up".equals(action)) {
                url = CREATE;
            } else if ("searchBook".equals(action)) {
                url = SEARCH_BOOK;
            } else if ("Logout".equals(action)) {
                url = LOGOUT;
            } else if ("searchUser".equals(action)) {
                url = SEARCH_USER;
            } else if ("updateUser".equals(action)) {
                url = UPDATE_USER;
            } else if ("deleteUser".equals(action)) {
                url = DELETE_USER;
            } else if ("updateCart".equals(action)) {
                url = UPDATE_CART;
            } else if ("deleteCart".equals(action)) {
                url = DELETE_CART;
            } else if ("addUser".equals(action)) {
                url = ADD_USER;
            } else if ("updateBook".equals(action)) {
                url = UPDATE_BOOK;
            } else if ("deleteBook".equals(action)) {
                url = DELETE_BOOK;
            } else if ("addBook".equals(action)) {
                url = ADD_BOOK;
            } else if ("placeOrder".equals(action)) {
                url = PLACE_ORDER;
            } else if ("addToCart".equals(action)) {
                url = ADD_TO_CART;
            } else {
                HttpSession session = request.getSession();
                session.setAttribute("ERROR_MESSAGE", "Function is not avaiable");
            }
        } catch (Exception e) {
            log("Error at MainController:" + e.toString());
        } finally {
            request.getRequestDispatcher(url).forward(request, response);
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
