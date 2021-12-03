<%-- 
    Document   : view-cart
    Created on : Jul 12, 2021, 2:40:10 PM
    Author     : Duy
--%>

<%@page import="sample.product.ProductDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="sample.shopping.Book"%>
<%@page import="sample.shopping.Cart"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<% String roleID = (String) session.getAttribute("LOGIN_USER_ROLE");
    if ("AD".equals(roleID))
        response.sendRedirect("admin.jsp");
%>

<% ArrayList<ProductDTO> listBooks = (ArrayList) session.getAttribute("LIST_BOOKS"); %>

<% Cart cart = (Cart) session.getAttribute("CART"); %>
<% int amount = 0;
    if (session.getAttribute("CART") != null)
        amount = ((Cart) session.getAttribute("CART")).getCartAmountProduct();
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View Cart</title>
        <link rel="icon" href="img/logo3.png" type="image/x-icon"/>
        <link rel="stylesheet" href="css/view-cart.css">
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

                        <span style="font-weight:bold; color: rgb(47, 184, 214);">DT</span> BookStore | <span style="font-size: 20px">Cart Management</span>

                    </div>

                </div>
                <form class="search" action="MainController">

                    <input type="text" placeholder="Search a book ..." name="search" required=""/>

                    <button type="submit" name="action" value="searchBook">
                        <i class="fa fa-search" aria-hidden="true"></i>
                    </button>
                </form>

            </div>

            <div class="right">
                <!-- Hiển thị nút Login hay Logout-->
                <% if (session.getAttribute("LOGIN_USER") == null) { %>
                <form action="login.jsp">
                    <button class="signin" type="submit" style="color: aliceblue;background-color: rgb(17, 66, 165);border: none;font-size: 18px;
                            font-weight: 500;
                            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
                            border-radius: 50px;
                            padding: 10px 25px;
                            cursor: pointer;">Login</button>
                </form>
                <% } else { %>
                <form action="MainController">
                    <button class="logout" type="submit" name="action" value="Logout" style="color: aliceblue;background-color: rgb(17, 66, 165);border: none;font-size: 18px;
                            font-weight: 500;
                            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
                            border-radius: 50px;
                            padding: 10px 25px;
                            cursor: pointer;">Logout</button>
                </form>
                <% }%>
            </div>
        </nav>
        <% if (cart == null || amount == 0) { %>
        <div class="message" style="margin-top: 200px">
            <p style="margin-block-end: 0.5em;">
                Your cart is empty now!
            </p>
            <form action ="ShoppingController">
                <button class="shopping" type="submit"><i class="material-icons">&#xe8cc;</i> Go back to Shopping</button>
            </form>
        </div>
        <%} else { %>
        <div class="message" style="margin-top: 30px">
            <form action ="ShoppingController">
                <button class="shopping" type="submit"><i class="material-icons">&#xe8cc;</i>Continue Shopping</button>
            </form>
        </div>
        <div class="container">
            <div class="table-wrapper" style="box-shadow: 0px 4px 38px rgb(0 0 0 / 30%), 4px 4px 11px 0px rgb(0 0 0 / 22%);">
                <div class="table-title">
                    <div class="row">
                        <div class="col-sm-6">
                            <h2>Manage <b>Cart</b></h2>
                        </div>

                    </div>
                </div>
                <table class="table table-striped table-hover">
                    <thead>
                        <tr>
                            <th></th>
                            <th style="padding-left: 20px">Name</th>
                            <th>Price</th>
                            <th>Quantity</th>
                            <th>Total</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody>


                        <% for (Book book : cart.getCart().values()) {%>

                        <% int maxQuantity = 0;
                            for (ProductDTO p : listBooks) {
                                if (book.getProductID().equals(p.getProductID())) {
                                    maxQuantity = p.getQuantity();
                                    break;
                                }
                            }%>

                        <tr>
                            <td>
                                <img src="<%=book.getImage()%>" height="180px" width="130pxpx" style="    box-shadow: 0px 4px 38px rgb(0 0 0 / 30%), 4px 4px 2px 0px rgb(0 0 0 / 22%);">
                            </td>
                    <form action="MainController" style="display: inline-block">
                        <td style="vertical-align: middle; font-size: 18px; padding-left: 20px"><%=book.getProductName()%></td>
                        <td style="vertical-align: middle; font-size: 18px"><%=String.format("%,d", book.getPrice())%> ₫</td>
                        <td style="vertical-align: middle;"><input type="number" value="<%=book.getQuantity()%>" min="1" max="<%=maxQuantity%>" style="width: 50px; height: 30px; font-size: 15px; text-align: center" name="quantity"></td>
                        <td style="vertical-align: middle; font-size: 18px"><%=String.format("%,d", book.getPrice() * book.getQuantity())%> ₫</td>
                        <td style="vertical-align: middle;">

                            <input type="hidden" value="<%=book.getProductID()%>" name="productID">
                            <button type="submit" name="action" value="updateCart" style="border: none; background: none"><i class="material-icons" style="color: green" data-toggle="tooltip" title="Update changes">&#xe5d5;</i></button>
                    </form>
                    <a href="#deleteEmployeeModal-<%=book.getProductID()%>" class="delete" data-toggle="modal"><i class="material-icons" data-toggle="tooltip" title="Delete">&#xE872;</i></a>
                    </td>
                    </tr>
                    <% }%>




                    </tbody>
                </table>
                <div style="display: flex; justify-content: flex-end">

                    <h4>Number of books: <%= amount%></h4>
                </div>
                <div style="display: flex; justify-content: flex-end">

                    <h3 style="font-weight: bold">Subtotal: <%=String.format("%,d", cart.getCartTotalPrice())%> ₫</h3>
                </div>
            </div>

            <% for (Book book : cart.getCart().values()) {%>
            <!-- Delete Modal HTML -->
            <div id="deleteEmployeeModal-<%=book.getProductID()%>" class="modal fade">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <form action="MainController">
                            <input type="hidden" name="productID" value="<%=book.getProductID()%>" />
                            <div class="modal-header">
                                <h4 class="modal-title">Confirm Delete</h4>
                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                            </div>
                            <div class="modal-body">
                                <p>Are you sure you want to delete these books?</p>
                                <p class="text-warning"><small>This action cannot be undone.</small></p>
                            </div>
                            <div class="modal-footer">
                                <input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">
                                <button type="submit" class="btn btn-danger" name="action" value="deleteCart">Delete</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
            <%}%>
            <form action="checkout.jsp">
            <button class="checkout" type="submit" style="display: flex; justify-content: center; border: none" >
                <div style="display: flex; align-items: center">
                    <i class="material-icons" style="margin-right: 20px">&#xe877;</i>CHECK OUT  
                </div>
            </button>
            <form>
            <%}%>
            <!-- partial -->
            <script src='https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js'></script>
            <script src='https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js'></script><script  src="js/admin-book-user.js"></script>
    </body>
</html>
