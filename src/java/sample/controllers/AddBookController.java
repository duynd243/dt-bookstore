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
import sample.product.ProductDAO;
import sample.product.ProductDTO;

/**
 *
 * @author Duy
 */
public class AddBookController extends HttpServlet {
   
    private static final String URL = "admin-book.jsp";
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try {
            ProductDAO dao = new ProductDAO();
            ArrayList<ProductDTO> list = (ArrayList<ProductDTO>)dao.getProductByName("");
            request.setAttribute("LIST_SEARCHED_BOOKS", list);
            String productID = request.getParameter("productID");
            
            if(dao.checkDulicateProductID(productID)){
                request.setAttribute("ADD_ERROR", "This Book ID has been used!");
                return;
            }
            
            String productName = request.getParameter("productName");
            String description = request.getParameter("description");
            String categoryID = request.getParameter("categoryID");
            String image = request.getParameter("image");
            int price = Integer.parseInt(request.getParameter("price"));
            int quantity = Integer.parseInt(request.getParameter("quantity"));

            String createDate = DateTimeFormatter.ofPattern("yyyy-MM-dd").format(LocalDateTime.now());
            ProductDTO book = new ProductDTO(productID, productName,  description, categoryID, price, quantity, 1,  createDate, image);
            if(dao.addNewProduct(book)){
                list = (ArrayList<ProductDTO>)dao.getProductByName("");
                request.setAttribute("LIST_SEARCHED_BOOKS", list);
                request.setAttribute("ADD_SUCCESS", "Successfully added book!");
            }
            
            else{
                request.setAttribute("ADD_ERROR", "Unknown error!");
                return;
            }
        } catch (Exception e) {
            log("Error at AddBookController: "+ e.toString());
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
