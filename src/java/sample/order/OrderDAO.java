/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.order;

import java.sql.*;
import sample.shopping.Book;
import sample.utils.DBUtils;

/**
 *
 * @author Duy
 */
public class OrderDAO {

    public void addNewOrder(Order order) throws SQLException {
        Connection conn = null;
        PreparedStatement ps = null;
        try {
            conn = DBUtils.getConnection();
            String sql = "insert into tblOrders (orderID, email, userID, name, address, phone, totalMoney, orderDate, statusID, paymentStatus)\n"
                    + "VALUES(?,?,?,?,?,?,?,?,?,?)";
            ps = conn.prepareStatement(sql);
            ps.setString(1, order.getOrderID());
            ps.setString(2, order.getEmail());
            ps.setString(3, order.getUserID());
            ps.setString(4, order.getName());
            ps.setString(5, order.getAddress());
            ps.setString(6, order.getPhone());
            ps.setInt(7, order.getTotalMoney());
            ps.setString(8, order.getOrderDate());
            ps.setInt(9, order.getStatusID());
            ps.setString(10, order.getPaymentStatus());

            ps.executeUpdate();
        } catch (Exception e) {
        } finally {
            if (ps != null) {
                ps.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
    }

    public void addNewOrderDetail(String orderID, Book book) throws SQLException {
        Connection conn = null;
        PreparedStatement ps = null;
        try {
            conn = DBUtils.getConnection();
            String sql = "insert into tblOrderDetail(orderID,productID,quantity,price,statusID) values(?,?,?,?,?)";

            ps = conn.prepareStatement(sql);
            ps.setString(1, orderID);
            ps.setString(2, book.getProductID());
            ps.setInt(3, book.getQuantity());
            ps.setInt(4, book.getPrice());
            ps.setInt(5, 1);

            ps.executeUpdate();
        } catch (Exception e) {
        } finally {
            if (ps != null) {
                ps.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
    }

}
