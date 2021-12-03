<%-- 
    Document   : admin
    Created on : Jul 9, 2021, 4:45:13 PM
    Author     : Duy
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<% String roleID = (String) session.getAttribute("LOGIN_USER_ROLE");
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
        <title>Admin Page</title>
        <link rel="icon" href="img/logo3.png" type="image/x-icon"/>

        <link rel="stylesheet" href="css/admin.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    </head>

    <body>
        <nav class="mynavbar">
            <div class="left">

                <div class="logo" style="display: flex; align-items: center;">
                    <img style="width: 40px;" src="img/logo3.png" />
                    <div class="logotext">

                        <span style="font-weight:bold; color: rgb(47, 184, 214);">DT</span> BookStore

                    </div>

                </div>


            </div>

            <div class="right">




                <form action="MainController">
                    <button class="signin" type="submit" name="action" value="Logout">Logout</button>
                </form>
            </div>
        </nav>
        <h1>Choose the section you want to manage</h1>

        <main class="flex-center" style="margin-top: 90px;">
            
            <div class="box1" style="border-radius:10px;" onclick="window.location='admin-book.jsp'">
                
                <p style="color: rgb(232 232 232); display: flex; align-items: center; justify-content: center;">
                    <i class="fa fa-users" aria-hidden="true"></i>

                </p>
                
            </div>


            <div class="box2" style="border-radius:10px;" onclick="window.location='admin-user.jsp'">
                
                <p style="color: rgb(241 200 213); display: flex; align-items: center; justify-content: center;">
                    
                    <i class="fa fa-book" aria-hidden="true"></i>

                </p>
                
            </div>
            <br>
        </main>

        <main class="flex-center">
            <p class='row2'>
                Books
            </p>
            <p class='row2'>
                Users
            </p>

            <br>
        </main>

    </body>

</html>

<% }
    }%>