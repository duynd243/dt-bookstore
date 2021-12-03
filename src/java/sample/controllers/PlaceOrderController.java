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
import javax.servlet.http.HttpSession;
import sample.order.Order;
import sample.order.OrderDAO;
import sample.product.ProductDAO;
import sample.shopping.Book;
import sample.shopping.Cart;
import sample.user.UserDTO;

/**
 *
 * @author Duy
 */
public class PlaceOrderController extends HttpServlet {
    
    private static final String URL = "order-success.jsp";
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        try {
            HttpSession session = request.getSession();
            Cart cart = (Cart) session.getAttribute("CART");
            UserDTO user = (UserDTO) session.getAttribute("LOGIN_USER");
            String userID = user.getUserID();
            String orderDate = DateTimeFormatter.ofPattern("yyyy-MM-dd").format(LocalDateTime.now());
            String orderID = userID + "-" + DateTimeFormatter.ofPattern("yyyyMMddHHmmss").format(LocalDateTime.now());
            String email = request.getParameter("email");
            String name = request.getParameter("firstname") + " " + request.getParameter("lastname");
            String address = request.getParameter("address");
            String phone = request.getParameter("phone");
            int totalMoney = cart.getCartTotalPrice();
            int statusID = 1;
            String paymentStatus = "COD";
            Order order = new Order(orderID, email, userID, name, address, phone, totalMoney, orderDate, statusID, paymentStatus);
            OrderDAO orderDAO = new OrderDAO();
            orderDAO.addNewOrder(order);

            // Add to order detail and Update product quantity
            for (Book book : cart.getCart().values()) {
                
                String productID = book.getProductID();
                ProductDAO pDAO = new ProductDAO();
                int newQuantity = pDAO.getProductQuantity(productID) - book.getQuantity();
                pDAO.updateProductQuantity(productID, newQuantity);
                orderDAO.addNewOrderDetail(orderID, book);
            }
            request.setAttribute("ORDER_SUCCESS", true);
            session.removeAttribute("CART");
            
        } catch (Exception e) {
            log("Error at PlaceOrderController: "+ e.toString());
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
