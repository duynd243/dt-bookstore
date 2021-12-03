/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.product;

/**
 *
 * @author Duy
 */
public class ProductDTO {

    private String productID;
    private String productName;
    private String description;
    private String categoryID;
    private int price;
    private int quantity;
    private int statusID;
    private String createDate;
    private String image;

    public ProductDTO(String productID, String productName, String description, String categoryID, int price, int quantity, int statusID, String createDate, String image) {
        this.productID = productID;
        this.productName = productName;
        this.description = description;
        this.categoryID = categoryID;
        this.price = price;
        this.quantity = quantity;
        this.statusID = statusID;
        this.createDate = createDate;
        this.image = image;
    }

    public ProductDTO(String productID, String productName, String description, String categoryID, int price, int quantity, String image) {
        this.productID = productID;
        this.productName = productName;
        this.description = description;
        this.categoryID = categoryID;
        this.price = price;
        this.quantity = quantity;
        this.image = image;
    }

    public String getProductID() {
        return productID.trim();
    }

    public void setProductID(String productID) {
        this.productID = productID.trim();
    }

    public String getProductName() {
        return productName.trim();
    }

    public void setProductName(String productName) {
        this.productName = productName.trim();
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description.trim();
    }

    public String getCategoryID() {
        return categoryID.trim();
    }

    public void setCategoryID(String categoryID) {
        this.categoryID = categoryID;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public int getStatusID() {
        return statusID;
    }

    public void setStatusID(int statusID) {
        this.statusID = statusID;
    }

    public String getCreateDate() {
        return createDate.trim();
    }

    public void setCreateDate(String createDate) {
        this.createDate = createDate.trim();
    }

    public String getImage() {
        return image.trim();
    }

    public void setImage(String image) {
        this.image = image.trim();
    }

}
