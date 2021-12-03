<%-- 
    Document   : order-success
    Created on : Jul 13, 2021, 2:54:52 PM
    Author     : Duy
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>


<% if(request.getAttribute("ORDER_SUCCESS") == null)
    response.sendRedirect("ShoppingController");
    else if((boolean)request.getAttribute("ORDER_SUCCESS")){
    %>
<!DOCTYPE html>
<html>
    <head>
        <title>Order Success</title>
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link rel="icon" href="img/logo3.png" type="image/x-icon"/>
        <link rel="stylesheet" href="css/order-success.css" />
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

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
        <div class="success-container">  
            <div class="outer-circle">
                <svg xmlns="http://www.w3.org/2000/svg" class="svg-success" viewBox="0 0 24 24">

                <g stroke-linecap="round" stroke-linejoin="round" stroke-miterlimit="10">
                <circle class="success-circle-outline" cx="12" cy="12" r="11.5"/>

                <polyline class="success-tick" points="17,8.5 9.5,15.5 7,13"/>
                </g>
                </svg>
            </div>
        </div>
    </body>

    <div style="display: flex; font-family: Arial; justify-content: center; font-size: 35px">

        <span> Your order has been placed successfully.</span>
    </div>
    
    <div class="message" style="margin-top: 30px">
            <form action ="ShoppingController">
                <button class="shopping" type="submit"><i class="material-icons">&#xe8cc;</i>Continue Shopping</button>
            </form>
    </div>
</html>

<%}%>
