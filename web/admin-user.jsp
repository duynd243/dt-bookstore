<%-- 
    Document   : admin-user
    Created on : Jul 11, 2021, 5:07:17 PM
    Author     : Duy
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> 

<%@page import="sample.user.UserDTO"%>
<%@page import="java.util.ArrayList"%>



<% String searchValue = request.getParameter("search");
    ArrayList<UserDTO> listUsers = (ArrayList) request.getAttribute("LIST_USER");

    String roleID = (String) session.getAttribute("LOGIN_USER_ROLE");
    if (session.getAttribute("LOGIN_USER") == null) {
        response.sendRedirect("login.jsp");
    } else {
        if ("US".equals(roleID))
            response.sendRedirect("ShoppingController");
        else if ("AD".equals(roleID)) {
%>
<!DOCTYPE html>
<html>

    <head>



        <script>
            function validate() {
                var userID = document.getElementById('userID').value;
                var name = document.getElementById('name').value;
                var email = document.getElementById('email').value;
                var password = document.getElementById('password').value;
                var address = document.getElementById('address').value;
                var phone = document.getElementById('phone').value;

                if (userID.length > 10) {
                    alert("Username must not exceed 10 characters!");
                    return false;
                }
                if (name.length > 50) {
                    alert("Name must not exceed 50 characters!");
                    return false;
                }
                if (email.length > 50) {
                    alert("Email must not exceed 10 characters!");
                    return false;
                }
                if (password.length > 50) {
                    alert("Password length must not exceed 10 characters!");
                    return false;
                }
                if (address.length > 50) {
                    alert("Address must not exceed 50 characters!");
                    return false;
                }
                if (isNaN(phone)) {
                    alert("Phone number must contains number only!");
                    return false;
                }
                if (phone.length > 15) {
                    alert("Phone number must not exceed 15 characters!");
                    return false;
                }
            }
        </script>
        <title>User Manager</title>
        <link rel="icon" href="img/logo3.png" type="image/x-icon"/>

        <link rel="stylesheet" href="css/admin-book-user.css">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="css/bootstrap.css">

    </head>
    <body>
        <nav class="mynavbar">
            <div class="left">

                <div class="logo" style="display: flex; align-items: center;">
                    <img style="width: 40px;" src="img/logo3.png" />
                    <div class="logotext">

                        <span style="font-weight:bold; color: rgb(47, 184, 214);">DT</span> BookStore | <span style="font-size: 20px">User Manager</span>

                    </div>

                </div>
                
                <!--TÌM KIẾM USER-->
                <form class="search" action="MainController">
                    <% if (searchValue == null) {%>
                    <input type="text" placeholder="Search users by their name ..." name="search" required=""/>
                    <% } else {%>
                    <input type="text" value="<%=searchValue%>" name="search" required=""/>
                    <% } %>
                    <button type="submit" name="action" value="searchUser">
                        <i class="fa fa-search" aria-hidden="true"></i>
                    </button>
                </form>

            </div>

            <div class="right">
                <form action="MainController">
                    <button class="signin" type="submit" name="action" value="Logout">Logout</button>
                </form>
            </div>
        </nav>
        <div class="message">
            <p style="margin-block-end: 0.5em;">
                Search for users you want to show or
            </p>
            
             <!--SHOW TẤT CẢ USER-->
            <form action ="MainController">
                <button class="showAll" type="submit" name="action" value="searchUser">Show all</button>
            </form>
            
            
        </div>

        <% if (request.getAttribute("DELETE_ERROR") != null) {%>
        <div style="display: flex; justify-content: center">
            <div  style="display: block; text-align: center; background-color: #eca7a7; color: black; border: 1px solid #f07d7d; border-radius: 5px; width: 700px; padding: 4px 0; font-size: 21px; font-family: 'Arial'; margin: 10px 0">
                <%=request.getAttribute("DELETE_ERROR")%>
            </div></div>
            <% } %>

        <% if (request.getAttribute("ADD_ERROR") != null) {%>
        <div style="display: flex; justify-content: center">
            <div  style="display: block; text-align: center; background-color: #eca7a7; color: black; border: 1px solid #f07d7d; border-radius: 5px; width: 700px; padding: 4px 0; font-size: 21px; font-family: 'Arial'; margin: 10px 0">
                <%=request.getAttribute("ADD_ERROR")%>
            </div></div>
            <% } %>

        <% if (request.getAttribute("ADD_SUCCESS") != null) {%>
        <div style="display: flex; justify-content: center">
            <div  style="display: block; text-align: center; background-color: #bfe9c7; color: black; border: 1px solid #57df70; border-radius: 5px; width: 700px; padding: 4px 0; font-size: 21px; font-family: 'Arial'; margin: 10px 0">
                <%=request.getAttribute("ADD_SUCCESS")%>
            </div></div>
            <% } %>


        <% if (request.getAttribute("UPDATE_ERROR") != null) {%>
        <div style="display: flex; justify-content: center">
            <div  style="display: block; text-align: center; background-color: #eca7a7; color: black; border: 1px solid #f07d7d; border-radius: 5px; width: 700px; padding: 4px 0; font-size: 21px; font-family: 'Arial'; margin: 10px 0">
                <%=request.getAttribute("UPDATE_ERROR")%>
            </div></div>
            <% } %>

        <% if (request.getAttribute("UPDATE_SUCCESS") != null) {%>
        <div style="display: flex; justify-content: center">
            <div  style="display: block; text-align: center; background-color: #bfe9c7; color: black; border: 1px solid #57df70; border-radius: 5px; width: 700px; padding: 4px 0; font-size: 21px; font-family: 'Arial'; margin: 10px 0">
                <%=request.getAttribute("UPDATE_SUCCESS")%>
            </div></div>
            <% } %>

        <!--CÁI BẢNG NÈ-->

        <!-- partial:index.partial.html -->
        <div class="container">
            <div class="table-wrapper" style="box-shadow: 0px 4px 38px rgb(0 0 0 / 30%), 4px 4px 11px 0px rgb(0 0 0 / 22%);"> 
                <div class="table-title">
                    <div class="row">
                        <div class="col-sm-6">
                            <h2>Manage <b>Users</b></h2>
                        </div>
                        <div class="col-sm-12">
                            <a href="#addEmployeeModal" class="btn btn-success" data-toggle="modal"><i class="material-icons">&#xE147;</i> <span>Add New User</span></a>

                        </div>
                    </div>
                </div>
                <table class="table table-striped table-hover">
                    <thead>
                        <tr>
                            <th>Username</th>
                            <th>Name</th>
                            <th>Email</th>
                            <th>Address</th>
                            <th>Phone</th>
                            <th>Role ID</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <% if (listUsers != null)
                                for (UserDTO u : listUsers) {%>
                        <tr>
                            <td><%= u.getUserID()%></td>
                            <td><%= u.getName()%></td>
                            <td><%= u.getEmail()%></td>
                            <td><%= u.getAddress()%></td>
                            <td><%= u.getPhone()%></td>
                            <td><%= u.getRoleID()%></td>
                            <td>
                                <a href="#editEmployeeModal-<%=u.getUserID()%>" class="edit" data-toggle="modal"><i class="material-icons" data-toggle="tooltip" title="Edit">&#xE254;</i></a>
                                <a href="#deleteEmployeeModal-<%=u.getUserID()%>" class="delete" data-toggle="modal"><i class="material-icons" data-toggle="tooltip" title="Delete">&#xE872;</i></a>
                            

                            </td>
                        </tr>
                        <% } %>
                    </tbody>
                </table>

            </div>

            <% if (listUsers != null)
                    for (UserDTO u : listUsers) {%>      
            <div id="editEmployeeModal-<%=u.getUserID().trim()%>" class="modal fade">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <form action="MainController" onclick="return validate()">

                            <input type="hidden" value="<%=u.getUserID().trim()%>" name="userID"/>
                            <input type="hidden" value="<%=u.getEmail().trim()%>" name="oldEmail"/>
                            <input type="hidden" value="<%=u.getRoleID().trim()%>" name="oldRoleID"/>
                            <div class="modal-header">
                                <h4 class="modal-title">Edit User</h4>
                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                            </div>
                            <div class="modal-body">
                                <div class="form-group">
                                    <label>Name</label>
                                    <input type="text" class="form-control" required value="<%=u.getName()%>" style="width: 305px" name="name" id="name">
                                </div>
                                <div class="form-group">
                                    <label>Email</label>
                                    <input type="email" class="form-control" required value="<%=u.getEmail()%>" style="width: 305px" name="email" id="email"> 
                                </div>
                                <div class="form-group">
                                    <label>Address</label>
                                    <textarea class="form-control" style="width: 305px; font-family: Arial" name="address" id="address"><%=(u.getAddress() != null) ? u.getAddress() : ""%></textarea>
                                </div>
                                <div class="form-group">
                                    <label>Phone</label>
                                    <input type="text" class="form-control" value="<%=(u.getPhone() != null) ? u.getPhone() : ""%>" style="width: 305px" name="phone" id="phone">
                                </div>
                                <div class="form-group">
                                    <label>Role</label></br>
                                    <select name="roleID" style="font-size: 16px;color: rgb(85, 85, 85)">
                                        <% if("AD".equals(u.getRoleID().trim())) {%>
                                        <option value="US">User</option>
                                        <option value="AD" selected="selected">Admin</option>
                                        <%} else if("US".equals(u.getRoleID().trim())) {%>
                                        <option value="US" selected="selected">User</option>
                                        <option value="AD">Admin</option>
                                        <%}%>
                                    </select>
                                </div>
                            </div>
                            <div class="modal-footer">
                                <input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">
                                <button type="submit" class="btn btn-info" name="action" value="updateUser">Save</button>

                            </div>
                        </form>
                    </div>
                </div>
            </div>
            <% } %>

            <!-- Edit Modal HTML -->
            <div id="addEmployeeModal" class="modal fade">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <form action="MainController" onsubmit="return validate()">
                            <div class="modal-header">
                                <h4 class="modal-title">Add User</h4>
                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                            </div>
                            <div class="modal-body">
                                <div class="form-group">
                                    <label>Username</label>
                                    <input type="text" class="form-control" required name="userID" id="userID" style="width: 305px">
                                </div>
                                <div class="form-group">
                                    <label>Name</label>
                                    <input type="text" class="form-control" required name="name" id="name" style="width: 305px">
                                </div>
                                <div class="form-group">
                                    <label>Email</label>
                                    <input type="email" class="form-control" required name="email" id="email" style="width: 305px">
                                </div>
                                <div class="form-group">
                                    <label>Password</label>
                                    <input type="password" class="form-control" required name="password" id="password" style="width: 305px">
                                </div>
                                <div class="form-group">
                                    <label>Address</label>
                                    <textarea class="form-control" required name="address" id="address" style="width: 305px"></textarea>
                                </div>
                                <div class="form-group">
                                    <label>Phone</label>
                                    <input type="text" class="form-control" required name="phone" id="phone" style="width: 305px">
                                </div>

                            </div>
                            <div class="modal-footer">
                                <input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">
                                <button type="submit" class="btn btn-success" name="action" value="addUser">Add</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
            
            <% if (listUsers != null)
                    for (UserDTO u : listUsers) {%>      
                    <div id="deleteEmployeeModal-<%=u.getUserID().trim()%>" class="modal fade">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <form action="MainController">
                            <input type="hidden" value="<%=u.getUserID().trim()%>" name="userID"/>
                            <input type="hidden" value="<%=u.getRoleID().trim()%>" name="roleID"/>
                            <div class="modal-header">
                                <h4 class="modal-title">Delete User</h4>
                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                            </div>
                            <div class="modal-body">
                                <p>Are you sure you want to delete this user?</p>
                                <p class="text-warning"><small>This action cannot be undone.</small></p>
                            </div>
                            <div class="modal-footer">
                                <input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">
                                
                                <button type="submit" class="btn btn-danger" name="action" value="deleteUser">Delete</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
            <% } %>
            
            <!-- partial -->
            <script src='https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js'></script>
            <script src='https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js'></script><script  src="js/admin-book-user.js"></script>
    </body>

    <% }
        }%>