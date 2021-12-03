
<%@page import="sample.shopping.Cart"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.ArrayList"%>
<%@page import="sample.product.ProductDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<% int amount = 0;
    if (session.getAttribute("CART") != null)
        amount = ((Cart) session.getAttribute("CART")).getCartAmountProduct();
%>

<% ArrayList<ProductDTO> listBooks = (ArrayList) session.getAttribute("LIST_BOOKS"); %>
<% HashMap<String, String> listCategories = (HashMap) session.getAttribute("LIST_CATEGORIES"); %>
<% ArrayList<ProductDTO> listSearchedBooks = (ArrayList) request.getAttribute("LIST_SEARCHED_BOOKS"); %>

<% String roleID = (String) session.getAttribute("LOGIN_USER_ROLE");
    if ("AD".equals(roleID))
        response.sendRedirect("admin.jsp");
%>


<html>

    <head>
        <meta charset="UTF-8">
        <title>DT BookStore</title>
        <link rel="icon" href="img/logo3.png" type="image/x-icon"/>

        <link rel="stylesheet" href="css/mystyle.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <style>
            @import url('https://fonts.googleapis.com/css2?family=Roboto:wght@300&display=swap');
        </style>
        <!-- Font awesome -->
        <link href="css/font-awesome.css" rel="stylesheet">
        <!-- Bootstrap -->
        <link href="css/bootstrap.css" rel="stylesheet">   
        <!-- SmartMenus jQuery Bootstrap Addon CSS -->
        <link href="css/jquery.smartmenus.bootstrap.css" rel="stylesheet">
        <!-- Product view slider -->
        <link rel="stylesheet" type="text/css" href="css/jquery.simpleLens.css">    
        <!-- slick slider -->
        <link rel="stylesheet" type="text/css" href="css/slick.css">
        <!-- price picker slider -->
        <link rel="stylesheet" type="text/css" href="css/nouislider.css">
        <!-- Theme color -->
        <link id="switcher" href="css/theme-color/default-theme.css" rel="stylesheet">
        <!-- <link id="switcher" href="css/theme-color/bridge-theme.css" rel="stylesheet"> -->
        <!-- Top Slider CSS -->
        <link href="css/sequence-theme.modern-slide-in.css" rel="stylesheet" media="all">

        <!-- Main style sheet -->
        <link href="css/style.css" rel="stylesheet">    

        <!-- Google Font -->
        <link href='https://fonts.googleapis.com/css?family=Lato' rel='stylesheet' type='text/css'>
        <link href='https://fonts.googleapis.com/css?family=Raleway' rel='stylesheet' type='text/css'>




        <!-- jQuery library -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
        <!-- Include all compiled plugins (below), or include individual files as needed -->
        <script src="js/bootstrap.js"></script>  
        <!-- SmartMenus jQuery plugin -->
        <script type="text/javascript" src="js/jquery.smartmenus.js"></script>
        <!-- SmartMenus jQuery Bootstrap Addon -->
        <script type="text/javascript" src="js/jquery.smartmenus.bootstrap.js"></script>  
        <!-- To Slider JS -->
        <script src="js/sequence.js"></script>
        <script src="js/sequence-theme.modern-slide-in.js"></script>  
        <!-- Product view slider -->
        <script type="text/javascript" src="js/jquery.simpleGallery.js"></script>
        <script type="text/javascript" src="js/jquery.simpleLens.js"></script>
        <!-- slick slider -->
        <script type="text/javascript" src="js/slick.js"></script>
        <!-- Price picker slider -->
        <script type="text/javascript" src="js/nouislider.js"></script>
        <!-- Custom js -->
        <script src="js/custom.js"></script> 

        <link rel="stylesheet" href="style.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    </head>

    <body>
        <nav class="mynavbar">
            <div class="left">

                <div class="logo" style="display: flex; align-items: center;">
                    <img style="width: 40px;" src="img/logo3.png"/>
                    <div class="logotext">

                        <span style="font-weight:bold; color: rgb(47, 184, 214);">DT</span> BookStore

                    </div>

                </div>
                <form class="search" action="MainController">
                    <% if (request.getParameter("search") != null) {%>
                    <input type="text" value="<%=request.getParameter("search")%>" name="search" required=""/>
                    <% } else {%>
                    <input type="text" placeholder="Search a book ..." name="search" required=""/>
                    <% }%>
                    <button type="submit" name="action" value="searchBook">
                        <i class="fa fa-search" aria-hidden="true"></i>
                    </button>
                </form>

            </div>

            <div class="right">

                
                <i class="fa fa-lg fa-shopping-bag" aria-hidden="true" style="cursor: pointer" onclick="window.location='view-cart.jsp'"></i>

                <span class="cartCount"><%=amount%></span>

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

        <div class="menubar">

        </div>



        <% if(request.getAttribute("SHOPPING_MESSAGE")!=null) { %>
         <div style="display: flex; justify-content: center">
             <div class="testthoi" style="display: block; text-align: center; background-color: #bfe9c7; border: 1px solid #57df70; border-radius: 5px; width: 1230px; padding: 4px 0; font-size: 21px; font-family: 'Arial'; margin: 10px 0">
                 <%= request.getAttribute("SHOPPING_MESSAGE") %>
             </div>   
         </div> 
        <%}%>     
        
        <% if(request.getAttribute("SOLDOUT_MESSAGE")!=null) { %>
         <div style="display: flex; justify-content: center">
             <div class="testthoi" style="display: block; text-align: center; background-color: #eca7a7; border: 1px solid #f07d7d;; border-radius: 5px; width: 1230px; padding: 4px 0; font-size: 21px; font-family: 'Arial'; margin: 10px 0">
                 <%= request.getAttribute("SOLDOUT_MESSAGE") %>
             </div>   
         </div> 
        <%}%>   
             
        <%  if (listSearchedBooks != null) {
                if (listSearchedBooks.size() > 0) {%>
        <div style="display: flex; justify-content: center">
            <div class="testthoi" style="display: block; text-align: center; background-color: #bfe9c7; border: 1px solid #57df70; border-radius: 5px; width: 1230px; padding: 4px 0; font-size: 21px; font-family: 'Arial'; margin: 10px 0">
                Tìm thấy <%= listSearchedBooks.size()%> kết quả phù hợp cho từ khoá '<%= request.getParameter("search")%>'
            </div>
        </div>
        <section id="aa-product">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <div class="row">
                            <ul class="aa-product-catg">
                                <% for (ProductDTO book : listSearchedBooks) {%>
                                <li>
                                    <figure>
                                        <a class="aa-product-img" onclick="return false" href=""><img style="width: 250px; height: 300px; box-shadow: 0px 4px 38px rgb(0 0 0 / 30%), 0 4px 12px rgb(0 0 0 / 22%);" src="<%= book.getImage()%>" alt=""></a>
                                            <% if (book.getQuantity() == 0) { %>

                                        <a class="aa-add-card-btn" href="MainController?action=addToCart&productID=<%=book.getProductID()%>&productName=<%=book.getProductName()%>&price=<%=book.getPrice()%>&quantity=0&image=<%=book.getImage()%>" style="font-family: 'Roboto';"><span class="fa fa-shopping-cart"></span>Add To Cart</a>

                                        <% } else {%>
                                        
                                            
                                        <a class="aa-add-card-btn" href="MainController?action=addToCart&productID=<%=book.getProductID()%>&productName=<%=book.getProductName()%>&price=<%=book.getPrice()%>&quantity=1&image=<%=book.getImage()%>" style="font-family: 'Roboto'; cursor: pointer"><span class="fa fa-shopping-cart"></span>Add To Cart</a>
                                        
                                        <% }%>
                                        <figcaption>
                                            <h4 class="aa-product-title" onclick="return false" style="font-size: 19px; font-family: 'Segoe UI', sans-serif;"><a href=""><%=book.getProductName()%></a></h4>
                                            <span class="aa-product-price" onclick="return false" style="font-size: 21px; font-family: 'Roboto', sans-serif; color: rgb(196,32,39);"><%= String.format("%,d", book.getPrice())%> ₫</span>
                                        </figcaption>
                                    </figure>                         

                                    <!-- product badge -->
                                    <% if (book.getQuantity() == 0) { %>
                                    <span class="aa-badge aa-sold-out" href="" onclick="return false" style="font-family: 'Arial'">SOLD OUT!</span>
                                    <% } %>
                                </li>  
                                <% }%>

                            </ul></div></div></div></div></section>    
                            <% } else {%>
        <div style="display: flex; justify-content: center">
            <div class="testthoi" style="display: block; text-align: center; background-color: #eca7a7; border: 1px solid #f07d7d; border-radius: 5px; width: 1230px; padding: 4px 0; font-size: 21px; font-family: 'Arial'; margin: 10px 0">
                Không tìm thấy kết quả phù hợp cho từ khoá '<%= request.getParameter("search")%>'
            </div>
        </div>
        <% }
            }%>


        <!-- Products section -->
        <section id="aa-product">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <div class="row">
                            <div class="aa-product-area">
                                <div class="aa-product-inner">
                                    <!-- start prduct navigation -->
                                    <!-- Tab panes -->
                                    <ul class="nav nav-tabs aa-products-tab" style="background-color: rgb(230, 224, 224);">
                                        <li class="active"><a href="#allbooks" data-toggle="tab" style="font-family: 'Roboto'; font-weight: bold; font-size: 17px">TẤT CẢ</a></li>
                                            <% for (String cateID : listCategories.keySet()) {%>
                                        <li><a href="#<%= cateID%>" data-toggle="tab" style="font-family: 'Roboto'; font-weight: bold; font-size: 17px"><%= listCategories.get(cateID)%></a></li>
                                            <% }%>

                                    </ul>
                                    <div class="tab-content">

                                        <!-- Start ALLBOOKS product category -->
                                        <div class="tab-pane fade in active" id="allbooks">
                                            <ul class="aa-product-catg">
                                                <% for (ProductDTO book : listBooks) {%>
                                                <li>
                                                    <figure>
                                                        <a class="aa-product-img" onclick="return false" href=""><img style="width: 250px; height: 300px; box-shadow: 0px 4px 38px rgb(0 0 0 / 30%), 0 4px 12px rgb(0 0 0 / 22%);" src="<%= book.getImage()%>" alt=""></a>
                                                            <% if (book.getQuantity() == 0) { %>

                                                        <a class="aa-add-card-btn" href="MainController?action=addToCart&productID=<%=book.getProductID()%>&productName=<%=book.getProductName()%>&price=<%=book.getPrice()%>&quantity=0&image=<%=book.getImage()%>" style="font-family: 'Roboto';"><span class="fa fa-shopping-cart"></span>Add To Cart</a>

                                                        <% } else {%>
                                                        <a class="aa-add-card-btn" href="MainController?action=addToCart&productID=<%=book.getProductID()%>&productName=<%=book.getProductName()%>&price=<%=book.getPrice()%>&quantity=1&image=<%=book.getImage()%>" style="font-family: 'Roboto';"><span class="fa fa-shopping-cart"></span>Add To Cart</a>
                                                        <% }%>
                                                        <figcaption>
                                                            <h4 class="aa-product-title" onclick="return false" style="font-size: 19px; font-family: 'Segoe UI', sans-serif;"><a href=""><%= book.getProductName()%></a></h4>
                                                            <span class="aa-product-price" onclick="return false" style="font-size: 21px; font-family: 'Roboto', sans-serif; color: rgb(196,32,39);"><%= String.format("%,d", book.getPrice())%> ₫</span>
                                                        </figcaption>
                                                    </figure>                         

                                                    <!-- product badge -->
                                                    <% if (book.getQuantity() == 0) { %>
                                                    <span class="aa-badge aa-sold-out" href="" onclick="return false" style="font-family: 'Arial'">SOLD OUT!</span>
                                                    <% } %>
                                                </li>  
                                                <% }%>
                                            </ul>

                                        </div>
                                        <!-- / ALLBOOKS product category -->


                                        <!-- Start OTHERS product category -->

                                        <% for (String cateID : listCategories.keySet()) {%>
                                        <div class="tab-pane fade" id="<%=cateID.trim()%>">
                                            <ul class="aa-product-catg">
                                                <% for (ProductDTO book : listBooks) {
                                                        if (book.getCategoryID().equals(cateID.trim())) {
                                                %>
                                                <li>
                                                    <figure>
                                                        <a class="aa-product-img" onclick="return false" href=""><img style="width: 250px; height: 300px; box-shadow: 0px 4px 38px rgb(0 0 0 / 30%), 0 4px 12px rgb(0 0 0 / 22%);" src="<%= book.getImage()%>" alt=""></a>
                                                            <% if (book.getQuantity() == 0) { %>

                                                        <a class="aa-add-card-btn" href="MainController?action=addToCart&productID=<%=book.getProductID()%>&productName=<%=book.getProductName()%>&price=<%=book.getPrice()%>&quantity=0&image=<%=book.getImage()%>" style="font-family: 'Roboto';"><span class="fa fa-shopping-cart"></span>Add To Cart</a>

                                                        <% } else {%>
                                                        <a class="aa-add-card-btn" href="MainController?action=addToCart&productID=<%=book.getProductID()%>&productName=<%=book.getProductName()%>&price=<%=book.getPrice()%>&quantity=1&image=<%=book.getImage()%>" style="font-family: 'Roboto';"><span class="fa fa-shopping-cart"></span>Add To Cart</a>
                                                        <% }%>
                                                        <figcaption>
                                                            <h4 class="aa-product-title" onclick="return false" style="font-size: 19px; font-family: 'Segoe UI', sans-serif;"><a href=""><%= book.getProductName()%></a></h4>
                                                            <span class="aa-product-price" onclick="return false" style="font-size: 21px; font-family: 'Roboto', sans-serif; color: rgb(196,32,39);"><%= String.format("%,d", book.getPrice())%> ₫</span>
                                                        </figcaption>
                                                    </figure>                         

                                                    <!-- product badge -->
                                                    <% if (book.getQuantity() == 0) { %>
                                                    <span class="aa-badge aa-sold-out" href="" onclick="return false">SOLD OUT!</span>
                                                    <% } %>
                                                </li>  
                                                <% }
                                                    }%>
                                            </ul>

                                        </div>
                                        <% }%>
                                        <!-- / OTHERS product category -->



                                    </div>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    


    </body>

</html>