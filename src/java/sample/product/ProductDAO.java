/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.product;

import java.util.ArrayList;
import java.util.List;
import java.sql.*;
import java.util.HashMap;
import java.util.Map;
import sample.utils.DBUtils;

/**
 *
 * @author Duy
 */
public class ProductDAO {

    public List<ProductDTO> getAllShoppingProduct() throws SQLException {
        List<ProductDTO> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            String sql = "select * FROM tblProduct WHERE statusID = 1";
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                String productID = rs.getString("productID");
                String productName = rs.getString("productName");
                String description = rs.getString("description");
                String categoryID = rs.getString("categoryID");
                int price = rs.getInt("price");
                int quantity = rs.getInt("quantity");
                int statusID = rs.getInt("statusID");
                String createDate = rs.getString("createDate");
                String image = rs.getString("image");
                if (statusID == 1) {
                    list.add(new ProductDTO(productID, productName, description, categoryID, price, quantity, statusID, createDate, image));
                }
            }
        } catch (Exception e) {

        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ps != null) {
                ps.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return list;
    }

    public Map<String, String> getListCategory() throws SQLException {
        Map<String, String> list = new HashMap<>();
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            String sql = "select * FROM tblCategory";
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                String categoryID = rs.getString("categoryID").trim();
                String categoryName = rs.getString("categoryName");

                list.put(categoryID, categoryName);
            }
        } catch (Exception e) {

        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ps != null) {
                ps.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return list;
    }

    public List<ProductDTO> getProductByName(String search) throws SQLException {
        List<ProductDTO> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            String sql = "select * from tblProduct WHERE dbo.ufn_removeMark(productName) like ? or productName like ?";
            ps = conn.prepareStatement(sql);
            ps.setString(1, "%" + search + "%");
            ps.setString(2, "%" + search + "%");
            rs = ps.executeQuery();
            while (rs.next()) {
                String productID = rs.getString("productID");
                String productName = rs.getString("productName");
                String description = rs.getString("description");
                String categoryID = rs.getString("categoryID");
                int price = rs.getInt("price");
                int quantity = rs.getInt("quantity");
                int statusID = rs.getInt("statusID");
                String createDate = rs.getString("createDate");
                String image = rs.getString("image");
                if (statusID == 1) {
                    list.add(new ProductDTO(productID, productName, description, categoryID, price, quantity, statusID, createDate, image));
                }
            }
        } catch (Exception e) {

        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ps != null) {
                ps.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return list;
    }

    public void updateProductQuantity(String productID, int newQuantity) throws SQLException {
        Connection conn = null;
        PreparedStatement ps = null;
        try {
            conn = DBUtils.getConnection();
            String sql = "update tblProduct SET quantity = ? WHERE productID = ?";
            ps = conn.prepareStatement(sql);
            ps.setInt(1, newQuantity);
            ps.setString(2, productID);
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

    public int getProductQuantity(String productID) throws SQLException {
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        ProductDTO product = null;
        int quantity = 0;
        try {
            conn = DBUtils.getConnection();
            String sql = "select quantity from tblProduct WHERE productID = ?";
            ps = conn.prepareStatement(sql);
            ps.setString(1, productID);
            rs = ps.executeQuery();
            if (rs.next()) {
                quantity = rs.getInt("quantity");
            }
        } catch (Exception e) {
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ps != null) {
                ps.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return quantity;

    }

    public boolean checkDulicateProductID(String productID) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "SELECT * FROM tblProduct WHERE productID = ?";
                ps = conn.prepareStatement(sql);
                ps.setString(1, productID);
                rs = ps.executeQuery();
                if (rs.next()) {
                    check = true;
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ps != null) {
                ps.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return check;
    }

    public boolean addNewProduct(ProductDTO book) throws SQLException, ClassNotFoundException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ps = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql
                        = "INSERT into tblProduct (productID, productName, [description], categoryID, price, quantity, statusID, createDate, [image]) VALUES (?,?,?,?,?,?,?,?,?)";
                ps = conn.prepareStatement(sql);
                ps.setString(1, book.getProductID());
                ps.setString(2, book.getProductName());
                ps.setString(3, book.getDescription());
                ps.setString(4, book.getCategoryID());
                ps.setInt(5, book.getPrice());
                ps.setInt(6, book.getQuantity());
                ps.setInt(7, book.getStatusID());
                ps.setString(8, book.getCreateDate());
                ps.setString(9, book.getImage());

                check = ps.executeUpdate() > 0;
            }

        } finally {
            if (ps != null) {
                ps.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return check;
    }

    public boolean updateUser(ProductDTO book) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ps = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "UPDATE tblProduct SET productName =?, [description] = ?, categoryID = ?, price = ?, quantity = ?, [image] = ?\n"
                        + "WHERE productID = ?";
                ps = conn.prepareStatement(sql);
                ps.setString(1, book.getProductName());
                ps.setString(2, book.getDescription());
                ps.setString(3, book.getCategoryID());
                ps.setInt(4, book.getPrice());
                ps.setInt(5, book.getQuantity());
                ps.setString(6, book.getImage());
                ps.setString(7, book.getProductID());

                check = ps.executeUpdate() > 0;

            }
        } catch (Exception e) {
        } finally {
            if (ps != null) {
                ps.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return check;
    }

    public boolean deleteProduct(String productID) throws SQLException {
        boolean result = false;
        Connection conn = null;
        PreparedStatement ps = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "UPDATE tblProduct set statusID = 0 WHERE productID = ?";
                ps = conn.prepareStatement(sql);
                ps.setString(1, productID);
                int value = ps.executeUpdate();
                result = (value > 0) ? true : false;
            }
        } catch (Exception e) {
        } finally {
            if (ps != null) {
                ps.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return result;
    }
}
