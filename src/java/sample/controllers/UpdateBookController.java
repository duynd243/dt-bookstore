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
import sample.product.ProductDAO;
import sample.product.ProductDTO;

/**
 *
 * @author Duy
 */
public class UpdateBookController extends HttpServlet {
   
     private static final String URL = "admin-book.jsp";
     
     
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try {
            
            ProductDAO dao = new ProductDAO();
            
            ArrayList<ProductDTO> list = (ArrayList<ProductDTO>)dao.getProductByName("");
            request.setAttribute("LIST_SEARCHED_BOOKS", list);
            
            String productID = request.getParameter("productID");
            String productName = request.getParameter("productName");
        
            String description = request.getParameter("description");
            
            String categoryID = request.getParameter("categoryID");
            String image = request.getParameter("image");
            int price = Integer.parseInt(request.getParameter("price"));
            int quantity = Integer.parseInt(request.getParameter("quantity"));
            

            ProductDTO book = new ProductDTO(productID, productName,  description, categoryID, price, quantity,  image);
            if (dao.updateUser(book)) {
                list = (ArrayList<ProductDTO>) dao.getProductByName("");
                request.setAttribute("LIST_SEARCHED_BOOKS", list);
                request.setAttribute("UPDATE_SUCCESS", "Successfully updated book information!");
            } else {
                request.setAttribute("UPDATE_ERROR", "Unknown error!");
                return;
            }
        } catch (Exception e) {
            log("ERROR at UpdateBookController: " + e.toString());
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
