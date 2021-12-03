<%-- 
    Document   : admin-book
    Created on : Jul 11, 2021, 4:55:58 PM
    Author     : Duy
--%>

<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="sample.product.ProductDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%  HashMap<String, String> listCategories = (HashMap) session.getAttribute("LIST_CATEGORIES"); %>
<%  String searchValue = request.getParameter("search");
    ArrayList<ProductDTO> listBooks = (ArrayList) request.getAttribute("LIST_SEARCHED_BOOKS");

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
                var productID = document.getElementById('productID').value;
                var productName = document.getElementById('productName').value;
                var description = document.getElementById('description').value;
                var image = document.getElementById('image').value;
          

                if (productID.length > 10) {
                    alert("Book ID must not exceed 10 characters!");
                    return false;
                }
                if (productName.length > 50) {
                    alert("Name must not exceed 50 characters!");
                    return false;
                }
                if (description.length > 100) {
                    alert("Description must not exceed 100 characters!");
                    return false;
                }
                if (image.length > 50) {
                    alert("Image URL length must not exceed 10 characters!");
                    return false;
                }
            }
        </script>
        
        
        <title>Book Manager</title>
        <link rel="icon" href="img/logo3.png" type="image/x-icon"/>


        <link rel="stylesheet" href="css/admin-book-user.css">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="css/bootstrap.css">
    </head>

    <body>

    <body>
        <nav class="mynavbar">
            <div class="left">

                <div class="logo" style="display: flex; align-items: center;">
                    <img style="width: 40px;" src="img/logo3.png" />
                    <div class="logotext">

                        <span style="font-weight:bold; color: rgb(47, 184, 214);">DT</span> BookStore | <span style="font-size: 20px">Book Manager</span>

                    </div>

                </div>


                <form class="search" action="MainController">
                    <% if (searchValue == null) {%>
                    <input type="text" placeholder="Search a book ..." name="search" required=""/>
                    <% } else {%>
                    <input type="text" value="<%=searchValue%>" name="search" required=""/>
                    <% } %>
                    <button type="submit" name="action" value="searchBook">
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
                Search for books you want to show or
            </p>

            <form action ="MainController">
                <button class="showAll" type="submit" name="action" value="searchBook">Show all</button>
            </form>
        </div>
                    

        <% if (request.getAttribute("ADD_ERROR") != null) {%>
        <div style="display: flex; justify-content: center">
            <div  style="display: block; text-align: center; background-color: #eca7a7; color: black; border: 1px solid #f07d7d; border-radius: 5px; width: 700px; padding: 4px 0; font-size: 21px; font-family: 'Arial'; margin: 10px 0">
                <%=request.getAttribute("ADD_ERROR")%>
            </div></div>>
            <% } %>

        <% if (request.getAttribute("ADD_SUCCESS") != null) {%>
        <div style="display: flex; justify-content: center">
            <div  style="display: block; text-align: center; background-color: #bfe9c7; color: black; border: 1px solid #57df70; border-radius: 5px; width: 700px; padding: 4px 0; font-size: 21px; font-family: 'Arial'; margin: 10px 0">
                <%=request.getAttribute("ADD_SUCCESS")%>
            </div></div>>
            <% } %>


        <% if (request.getAttribute("UPDATE_ERROR") != null) {%>
        <div style="display: flex; justify-content: center">
            <div  style="display: block; text-align: center; background-color: #eca7a7; color: black; border: 1px solid #f07d7d; border-radius: 5px; width: 700px; padding: 4px 0; font-size: 21px; font-family: 'Arial'; margin: 10px 0">
                <%=request.getAttribute("UPDATE_ERROR")%>
            </div></div>>
            <% } %>

        <% if (request.getAttribute("UPDATE_SUCCESS") != null) {%>
        <div style="display: flex; justify-content: center">
            <div  style="display: block; text-align: center; background-color: #bfe9c7; color: black; border: 1px solid #57df70; border-radius: 5px; width: 700px; padding: 4px 0; font-size: 21px; font-family: 'Arial'; margin: 10px 0">
                <%=request.getAttribute("UPDATE_SUCCESS")%>
            </div></div>>
            <% } %>

        <!-- CÁI BẢNG NÈ -->
        <div class="container">
            <div class="table-wrapper" style="box-shadow: 0px 4px 38px rgb(0 0 0 / 30%), 4px 4px 11px 0px rgb(0 0 0 / 22%);"> 
                <div class="table-title">
                    <div class="row">
                        <div class="col-sm-6">
                            <h2>Manage <b>Books</b></h2>
                        </div>
                        <div class="col-sm-12">
                            <a href="#addEmployeeModal" class="btn btn-success" data-toggle="modal"><i class="material-icons">&#xE147;</i> <span>Add New Book</span></a>

                        </div>
                    </div>
                </div>
                <table class="table table-striped table-hover">
                    <thead>
                        <tr>
                            <th></th>
                            <th style="padding-left: 20px; width: 370px">Name</th>
                            <th>Description</th>
                            <th>Category</th>
                            <th>Price</th>
                            <th>Quantity</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <% if (listBooks != null)
                                for (ProductDTO book : listBooks) {%>
                        <tr>
                            <td><img src="<%=book.getImage()%>" height="150px" width="105px" style="box-shadow: 0px 4px 38px rgb(0 0 0 / 30%), 4px 4px 2px 0px rgb(0 0 0 / 22%);"></td>
                            <td style="vertical-align: middle; font-size: 18px; padding-left: 20px"><%= book.getProductName()%></td>
                            <td style="vertical-align: middle; font-size: 18px"><%= book.getDescription()%></td>

                            <td style="vertical-align: middle; font-size: 18px"><%=listCategories.get(book.getCategoryID())%></td>

                            <td style="vertical-align: middle; font-size: 18px"><%=String.format("%,d", book.getPrice())%> ₫</td>
                            <td style="vertical-align: middle; font-size: 18px; text-align: center"><%= book.getQuantity()%></td>
                            <td style="vertical-align: middle; font-size: 18px">
                                <a href="#editEmployeeModal-<%=book.getProductID()%>" class="edit" data-toggle="modal"><i class="material-icons" data-toggle="tooltip" title="Edit">&#xE254;</i></a>
                                <a href="#deleteEmployeeModal-<%=book.getProductID()%>" class="delete" data-toggle="modal"><i class="material-icons" data-toggle="tooltip" title="Delete">&#xE872;</i></a>
                            </td>
                        </tr>
                        <% } %>
                    </tbody>
                </table>

            </div>

            <% if (listBooks != null)
                    for (ProductDTO book : listBooks) {%>      
            <div id="editEmployeeModal-<%=book.getProductID().trim()%>" class="modal fade">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <form action="MainController" onclick="return validate()">

                            <input type="hidden" value="<%=book.getProductID().trim()%>" name="productID"/>

                            <div class="modal-header">
                                <h4 class="modal-title">Edit User</h4>
                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                            </div>
                            <div class="modal-body">
                                <div class="form-group">
                                    <label>Name</label>
                                    <input type="text" class="form-control" required value="<%=book.getProductName()%>" style="width: 305px" name="productName" id="productName">
                                </div>

                                <div class="form-group">
                                    <label>Description</label>
                                    <input class="form-control" value="<%=(book.getDescription() != null) ? book.getDescription() : ""%>" style="width: 305px" name="description" id="description"></input>
                                </div>

                                <div class="form-group">
                                    <label>Category</label></br>
                                    <select name="categoryID" style="font-size: 16px;color: rgb(85, 85, 85)">
                                        <%String categoryID = book.getCategoryID();%>
                                        <option value="<%=categoryID%>" selected=""><%=listCategories.get(categoryID)%></option>
                                        <%for (String cateID : listCategories.keySet()) {
                                                if (!cateID.equals(categoryID)) {%>

                                        <option value="<%=cateID.trim()%>"><%=listCategories.get(cateID)%></option>
                                        <%}
                                            }%>

                                    </select>
                                </div>
                                <div class="form-group">
                                    <label>Price</label>
                                    <input type="number" class="form-control" required value="<%=book.getPrice()%>" min="0" style="width: 305px" name="price" id="price">
                                </div>
                                <div class="form-group">
                                    <label>Quantity</label>
                                    <input type="number" class="form-control" required value="<%=book.getQuantity()%>" style="width: 305px" name="quantity" id="quantity">
                                </div>
                                
                                <div class="form-group">
                                    <label>Image</label>
                                    <input type="text" class="form-control" required value="<%=book.getImage()%>" style="width: 305px" name="image" id="image">
                                </div>
                            </div>


                 
                    <div class="modal-footer">
                        <input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">
                        <button type="submit" class="btn btn-info" name="action" value="updateBook">Save</button>

                    </div>
                    </form>
                </div>
            </div>
        </div>
        <%}%>

        <!-- Edit Modal HTML -->
        <div id="addEmployeeModal" class="modal fade">
            <div class="modal-dialog">
                <div class="modal-content">
                    <form action="MainController" onsubmit="return validate()">
                        <div class="modal-header">
                            <h4 class="modal-title">Add Book</h4>
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        </div>
                        <div class="modal-body">
                            <div class="form-group">
                                <label>Book ID</label>
                                <input type="text" class="form-control" required name="productID" id="productID" style="width: 305px">
                            </div>
                            <div class="form-group">
                                <label>Name</label>
                                <input type="text" class="form-control" required name="productName" id="productName" style="width: 305px">
                            </div>
                            <div class="form-group">
                                <label>Description</label>
                                <input type="text" class="form-control" name="description" id="description" style="width: 305px">
                            </div>
                            <div class="form-group">
                                <label>Category</label>
                                <br>
                                <select name="categoryID" style="font-size: 16px;color: rgb(85, 85, 85)">
                                    <%for (String cateID : listCategories.keySet()) {%>
                                               

                                        <option value="<%=cateID.trim()%>"><%=listCategories.get(cateID)%></option>
                                    <%}%>
                                </select>
                            </div>
                            <div class="form-group">
                                <label>Price</label>
                                <input type="number" min="1" class="form-control" required name="price" id="price" style="width: 305px">
                            </div>
                            <div class="form-group">
                                <label>Quantity</label>
                                <input type="number" class="form-control" required name="quantity" id="quantity" style="width: 305px">
                            </div>
                                
                            <div class="form-group">
                                <label>Image URL</label>
                                <input type="text" class="form-control" required name="image" id="image" style="width: 305px">
                            </div>

                        </div>
                        <div class="modal-footer">
                            <input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">
                            <button type="submit" class="btn btn-success" name="action" value="addBook">Add</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
                                
                                
                                
        <% if (listBooks != null)
                    for (ProductDTO book : listBooks) {%>      
                    <div id="deleteEmployeeModal-<%=book.getProductID().trim()%>" class="modal fade">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <form action="MainController">
                            <input type="hidden" value="<%=book.getProductID().trim()%>" name="productID"/>
                         
                            <div class="modal-header">
                                <h4 class="modal-title">Delete Book</h4>
                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                            </div>
                            <div class="modal-body">
                                <p>Are you sure you want to delete this book?</p>
                                <p class="text-warning"><small>This action cannot be undone.</small></p>
                            </div>
                            <div class="modal-footer">
                                <input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">
                                
                                <button type="submit" class="btn btn-danger" name="action" value="deleteBook">Delete</button>
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