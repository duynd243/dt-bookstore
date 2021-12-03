<%-- 
    Document   : login
    Created on : Jul 8, 2021, 10:56:30 PM
    Author     : Duy
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>

<% if (session.getAttribute("LOGIN_USER") != null) {
        String roleID = (String) session.getAttribute("LOGIN_USER_ROLE");

        if ("AD".equals(roleID.trim())) {
            response.sendRedirect("admin.jsp");
        } else if ("US".equals(roleID.trim())) {
            response.sendRedirect("ShoppingController");
        }

    } else { %>



<html>
    <head>
        <meta charset="utf-8">
        <link rel="icon" href="img/logo3.png" type="image/x-icon"/>

        <link rel="stylesheet" href="css/loginstyle.css">
        <script src="https://kit.fontawesome.com/871003a428.js" crossorigin="anonymous"></script>

        <script>
            function validateSignUp() {
                var userID = document.getElementById('userID').value;
                var name = document.getElementById('name').value;
                var email = document.getElementById('email').value;
                var pw1 = document.getElementById('pw1').value;
                var pw2 = document.getElementById('pw2').value;

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
                if (pw1.length > 50) {
                    alert("Password length must not exceed 10 characters!");
                    return false;
                }
                if (pw1 !== pw2) {
                    alert("Two password must be the same!");
                    return false;
                }

            }
        </script>
        <title>Login</title>
    </head>
    <body>



        <div class="container" id="container">
            <div class="form-container sign-up-container">
                <form action="MainController" onsubmit="return validateSignUp()">
                    <h1>Create Account</h1>
                    <div class="social-container">

                        <a href="#" class="social"><i class="fab fa-google-plus-g"></i></a>
                        <a href="#" class="social"><i class="fab fa-linkedin-in"></i></a>
                    </div>

                    <input type="text" placeholder="Username" name="userID" id="userID" required=""/>
                    <input type="text" placeholder="Name" name="name" id="name" required=""/>
                    <input type="email" placeholder="Email" name="email" id="email" required=""/>
                    <input type="password" placeholder="Password" name="password" id="pw1" required=""/>
                    <input type="password" placeholder="Retype password" id="pw2" required=""/>

                    <button type="submit" name="action" value="Sign Up">Sign Up</button>
                </form>
            </div>
            <div class="form-container sign-in-container">
                <form action="MainController" method="POST">
                    <h1>Sign in</h1>
                    <div class="social-container">
                        <a href="#" class="social"><i class="fab fa-facebook-f"></i></a>
                        <a href="#" class="social"><i class="fab fa-google-plus-g"></i></a>

                    </div>

                    <% if (request.getAttribute("ERROR_LOGIN") != null) {%>

                    <div class="login-alert" style="background-image: linear-gradient(to right, rgb(220, 58, 58) , rgb(225, 44, 44)); border-radius: 20px; color: white; padding: 1.4px 6px; display: flex;align-items: center;">
                        <i class="fa fa-exclamation-circle " aria-hidden="true" style="color: white; margin-right: 4px;"></i>
                        <%= request.getAttribute("ERROR_LOGIN")%>
                    </div>
                    <% } %>

                    <% if (request.getAttribute("ERROR_SIGNUP") != null) {%>

                    <div class="login-alert" style="background-image: linear-gradient(to right, rgb(220, 58, 58) , rgb(225, 44, 44)); border-radius: 20px; color: white; padding: 1.4px 6px; display: flex;align-items: center;">
                        <i class="fa fa-exclamation-circle " aria-hidden="true" style="color: white; margin-right: 4px;"></i>
                        <%= request.getAttribute("ERROR_SIGNUP")%>
                    </div>
                    <% } %>

                    <% if (request.getAttribute("SUCCESS_SIGNUP") != null) {%>

                    <div class="login-alert" style="background-image: linear-gradient(to right, rgba(82, 206, 75, 0.762) , rgb(84, 184, 79)); border-radius: 20px; color: white; padding: 1.4px 6px; display: flex;align-items: center;">
                        <i class="fa fa-check-circle " aria-hidden="true" style="color: white; margin-right: 4px;"></i>
                        <%= request.getAttribute("SUCCESS_SIGNUP")%>
                    </div>
                    <% } %>
                    
                    
                        
                    <% if(request.getAttribute("CHECKOUT")!=null){ %>
                    <input type="hidden" name="checkOut" value="true"/>
                    <%} else {%>
                    <input type="hidden" name="checkOut" value="false"/>
                     <%}%>
                     
                     
                    <input type="text" placeholder="Email / Username" name="userID" required=""/>

                    <input type="password" placeholder="Password" name="password" required=""/>
                    <a href="#">Forgot your password?</a>
                    <button type="submit" name="action" value="Sign In">Sign In</button>
                </form>
            </div>
            <div class="overlay-container">
                <div class="overlay">
                    <div class="overlay-panel overlay-left">
                        <h1>Welcome Back!</h1>
                        <p>To keep connected with us please login with your personal info</p>
                        <button class="ghost" id="signIn">Sign In</button>
                    </div>
                    <div class="overlay-panel overlay-right">
                        <h1>Hello, Friend!</h1>
                        <p>Enter your personal details and start journey with us</p>
                        <button class="ghost" id="signUp">Sign Up</button>
                    </div>
                </div>
            </div>
        </div>
        <script>
            const signUpButton = document.getElementById('signUp');
            const signInButton = document.getElementById('signIn');
            const container = document.getElementById('container');

            signUpButton.addEventListener('click', () => {
                container.classList.add("right-panel-active");
            });

            signInButton.addEventListener('click', () => {
                container.classList.remove("right-panel-active");
            });


        </script>


    </body>
</html>
<% }%>