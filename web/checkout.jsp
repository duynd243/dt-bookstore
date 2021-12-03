<%-- 
    Document   : checkout
    Created on : Jul 13, 2021, 1:50:52 AM
    Author     : Duy
--%>

<%@page import="sample.shopping.Book"%>
<%@page import="sample.shopping.Cart"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<% int amount = 0;
    if (session.getAttribute("CART") != null)
        amount = ((Cart) session.getAttribute("CART")).getCartAmountProduct();
%>

<% String roleID = (String) session.getAttribute("LOGIN_USER_ROLE");
    if ("AD".equals(roleID))
        response.sendRedirect("admin.jsp");
    else if(session.getAttribute("LOGIN_USER")==null){
        request.setAttribute("CHECKOUT", true);
        request.getRequestDispatcher("login.jsp").forward(request, response);
    }    
    else if("US".equals(roleID) && amount==0)
        response.sendRedirect("view-cart.jsp");
    else{
%>

<% Cart cart = (Cart)session.getAttribute("CART"); %>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Checkout Page</title>
        <link rel="icon" href="img/logo3.png" type="image/x-icon"/>
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link rel="stylesheet" href="css/checkout.css" />
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css">
        <title>JSP Page</title>
    </head>
    <body>
        <nav class="mynavbar">
            <div class="left">

                <div class="logo" style="display: flex; align-items: center;">
                    <img style="width: 40px;" src="img/logo3.png" />
                    <div class="logotext">

                        <span style="font-weight:bold; color: rgb(47, 184, 214);">DT</span> BookStore | <span style="font-size: 20px">Checkout</span>

                    </div>

                </div>
            </div>

            <div class="right">
                <form action="MainController">
                    <button class="signin" type="submit" name="action" value="Logout">Logout</button>
                </form>
            </div>
        </nav>
        
        
        <div style="display: flex; justify-content: space-around;">
       
            <div class="col-md-4 container bg-default" class="leftPane">
			
                <h4 class="my-4" style="color: #1a3452; border-left: 10px solid #1a3452; border-bottom: 1px solid #1a3452;border-top: 1px solid #1a3452; padding: 18px; border-top-right-radius: 10px; font-weight: bolder">
                        SHIPPING ADDRESS
                </h4>
                
                <form action="MainController">
                    <div class="form-row">
                        <div class="col-md-6 form-group">
                            <label for="firstname">First Name</label>
                            <input type="text" class="form-control" id="firstname" name="firstname" placeholder="First Name">
                            <div class="invalid-feedback">
                                Valid first name is required.
                            </div>
                        </div>
    
                        <div class="col-md-6 form-group">
                            <label for="lastname">Last Name</label>
                            <input type="text" class="form-control" id="lastname" name="lastname" placeholder="Last Name">
                            <div class="invalid-feedback">
                                Valid last name is required.
                            </div>
                        </div>
                    </div>
    
                    
    
                    <div class="form-group">
                            <label for="email">Email</label>
                            <input type="email" class="form-control" id="email" name="email" placeholder="you@example.com" required>
                    </div>
    
                    <div class="form-group">
                        <label for="adress">Address</label>
                        <input type="text" class="form-control" id="adress" name="address" placeholder="Detail address" required>
                        <div class="invalid-feedback">
                            Please enter your shipping address.
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="adress">Phone Number</label>
                        <input type="text" class="form-control" id="adress" name="phone" placeholder="Phone number" required>
                        
                    </div>
    
                    
    
                   
    
                    <hr>
    
                    <h4 class="mb-4">Payment</h4>
                  
                        <hr class="mb-4">
                        
                        <button class="placeOrder" type="submit" name="action" value="placeOrder" style="display: flex; justify-content: center;border: none" >
                            <div style="display: flex; align-items: center">
                                <i class="material-icons" style="margin-right: 20px">&#xe877;</i>PLACE YOUR ORDER
                            </div>
                        </button>
                </form>
            </div>
       
        <div class="rightPane">

            <div class='minicart'>
                <div class='minicart--item-container'>
                    You have
                    <span class='minicart--item-count' style='font-weight: 600'><%=cart.getCartAmountProduct()%> items</span>
                    in your cart!
                </div>
                
                <ul>
                    <% for(Book book: cart.getCart().values()) { %>
                    <li class='minicart--item'>

                        <img src="<%=book.getImage()%>"
                            width="100px" height="120px">

                        <h1 class='title'><%=book.getProductName()%></h1>

                        <p class='price'><%= String.format("%,d", book.getPrice())%> ₫ (x<%=book.getQuantity()%>)</p>
                        <p class='remove'>

                        </p>
                    </li>
                    
                    <%}%>
                    
                </ul>
               
                <div class='minicart--subtotal'>
                    <p class='minicart--subtotal-title'>Subtotal</p>
                    <p class='minicart--subtotal-amount'><%=String.format("%,d",cart.getCartTotalPrice())%> ₫</p>
                </div>
                <form action="view-cart.jsp">
                <input type='submit' value='View Cart Details'>
                </form>
            </div>

        </div>
    </div>
                
              
    </body>
</html>
<%}%>