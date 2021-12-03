/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.user;

/**
 *
 * @author Duy
 */
public class UserDTO {

    private String userID;
    private String email;
    private String name;
    private String password;
    private String phone;
    private String address;
    private String createDate;
    private String roleID;
    private int statusID;

    public UserDTO(String userID, String email, String name, String password, String createDate, String roleID, int statusID) {
        this.userID = userID;
        this.email = email;
        this.name = name;
        this.password = password;
        this.createDate = createDate;
        this.roleID = roleID;
        this.statusID = statusID;
    }

    public UserDTO(String userID, String email, String name, String password, String roleID, int statusID) {
        this.userID = userID;
        this.email = email;
        this.name = name;
        this.password = password;
        this.roleID = roleID;
        this.statusID = statusID;
    }

    public UserDTO(String userID, String email, String name, String password, String phone, String address, String createDate, String roleID, int statusID) {
        this.userID = userID;
        this.email = email;
        this.name = name;
        this.password = password;
        this.phone = phone;
        this.address = address;
        this.createDate = createDate;
        this.roleID = roleID;
        this.statusID = statusID;
    }

    public UserDTO(String userID, String email, String name, String phone, String address, String roleID) {
        this.userID = userID;
        this.email = email;
        this.name = name;
        this.phone = phone;
        this.address = address;
        this.roleID = roleID;
    }

    public String getUserID() {
        return userID;
    }

    public void setUserID(String userID) {
        this.userID = userID;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getCreateDate() {
        return createDate;
    }

    public void setCreateDate(String createDate) {
        this.createDate = createDate;
    }

    public String getRoleID() {
        return roleID;
    }

    public void setRoleID(String roleID) {
        this.roleID = roleID;
    }

    public int getStatusID() {
        return statusID;
    }

    public void setStatusID(int statusID) {
        this.statusID = statusID;
    }

}
