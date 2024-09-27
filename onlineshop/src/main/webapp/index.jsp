<%@page import="com.revonlineshop.utility.DatabaseConnection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <!-- Importing all ui libs -->
    <link href="assets/css/font-awesome.css" rel="stylesheet" />
    <link href="assets/css/style.css" rel="stylesheet" />
    <link href="css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
    <link href="css/pignose.layerslider.css" rel="stylesheet" type="text/css" media="all" />
    <link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
    <script type="text/javascript" src="js/jquery-2.1.4.min.js"></script>
    <script src="js/simpleCart.min.js"></script>
    <script type="text/javascript" src="js/bootstrap-3.1.1.min.js"></script>
    <link href='http://fonts.googleapis.com/css?family=Montserrat:400,700' rel='stylesheet' type='text/css'>
    <link href='http://fonts.googleapis.com/css?family=Lato:400,100,100italic,300,300italic,400italic,700,900,900italic,700italic' rel='stylesheet' type='text/css'>
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
    <script src="js/jquery.easing.min.js"></script>
   <!--  <script src='../../../../../../ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js'></script>
    <script src="../../../../../../m.servedby-buysellads.com/monetization.js" type="text/javascript"></script>
 --></head>
<body>
<body>
    <div class="ban-top">
        <div class="container">
            <div class="top_nav_left">
                <nav class="navbar navbar-default">
                    <div class="container-fluid">
                        <div class="navbar-header">
                            <button type="button" class="navbar-toggle collapsed"
                                    data-toggle="collapse"
                                    data-target="#bs-example-navbar-collapse-1"
                                    aria-expanded="false">
                                <span class="sr-only">Toggle navigation</span> <span class="icon-bar"></span> <span class="icon-bar"></span> <span class="icon-bar"></span>
                            </button>
                        </div>
                        <jsp:include page="header.jsp"></jsp:include>
                        </div>
                    </nav>
                </div>
                <div class="top_nav_right">
                    <div class="cart box_1">
                        <a href="checkout.jsp"> 
                        <%
                            //Getting all cart details of the customer
                            ResultSet resultCount = DatabaseConnection.getResultFromSqlQuery("select count(*) from tblcart where customer_id='" + session.getAttribute("id") + "'");
                            resultCount.next();
                            int count = resultCount.getInt(1);
                        %>
                        <h3>
                            <div class="total">
                                <i class="glyphicon glyphicon-shopping-cart" aria-hidden="true"></i>
                                (
                                <%=count%>
                                items )
                            </div>
                        </h3>
                    </a>
                    <p>
                        <a href="javascript:;" class="simpleCart_empty">My Cart</a>
                    </p>
                </div>
            </div>
            <div class="clearfix"></div>
        </div>
    </div>
    <div class="banner-grid">
        <div id="visual">
            <div class="slide-visual">
                <ul class="slide-group">
                    <li><img class="img-responsive" src="https://cdn.shopify.com/s/files/1/0752/6435/products/IMG_0023_0e8599ba-0e46-4683-9b73-6e094ea35812_800x.jpg?v=1721455378" alt="Dummy Image" /></li>
                    <li><img class="img-responsive" src="https://cdn.shopify.com/s/files/1/0752/6435/files/Growr-green-0192Hero_800x.jpg?v=1698904797" alt="Dummy Image" /></li>
                    <li><img class="img-responsive" src="https://cdn.shopify.com/s/files/1/0752/6435/files/NOTAG_CCFORFLOWERINCHAMPAGNE_-42929_b621a17a-6637-41f2-b4aa-d2257d8b4f51_800x.jpg?v=1724308594" alt="Dummy Image" /></li>
                    <li><img class="img-responsive" src="https://cdn.shopify.com/s/files/1/0752/6435/files/ALWICK-DARK-GREEN1523HERO_800x.jpg?v=1697537357" alt="Dummy Image" /></li>
                    <li><img class="img-responsive" src="https://cdn.shopify.com/s/files/1/0752/6435/files/MANNICA-OLIVE--42556_800x.jpg?v=1722853029" alt="Dummy Image" /></li>
                    <li><img class="img-responsive" src="https://cdn.shopify.com/s/files/1/0752/6435/files/IMG_0062_9724c41b-4999-43ea-beb8-bf7626350fba_800x.jpg?v=1722848352" alt="Dummy Image" /></li>
                    <li><img class="img-responsive" src="https://cdn.shopify.com/s/files/1/0752/6435/files/CHSAM-BLUE5136_800x.jpg?v=1722848679" alt="Dummy Image" /></li>
                    <li><img class="img-responsive" src="https://www.aristobrat.in/cdn/shop/files/LDS_Tropical_1.jpg?v=1712310469&width=600" alt="Dummy Image" /></li>
                </ul>
                <div class="clearfix"></div>
            </div>
            <div class="clearfix"></div>
        </div>
        <script type="text/javascript" src="js/pignose.layerslider.js"></script>
        <script type="text/javascript">
            $(window).load(function () {
                $('#visual').pignoseLayerSlider({
                    play: '.btn-play',
                    pause: '.btn-pause',
                    next: '.btn-next',
                    prev: '.btn-prev'
                });
            });
        </script>
    </div>
    <br/>
    <div class="product-easy">
        <div class="container">
            <div class="container">
                <h2>
                    <span><center>Our Products</center></span>
                </h2>
            </div>
            <%
                ResultSet retriveProduct = DatabaseConnection.getResultFromSqlQuery("select * from tblproduct");
                while (retriveProduct.next()) {
            %>
            <form action="AddToCart" method="post">
                <div class="single-pro" >
                    <div class="col-md-3 product-men">
                        <div class="men-pro-item simpleCart_shelfItem" style="margin:15px">
                            <div class="men-thumb-item">
                                <input type="hidden" name="productId"
                                       value="<%=retriveProduct.getInt("id")%>"> <img
                                       src="uploads/<%=retriveProduct.getString("image_name")%>"
                                       alt="" class="pro-image-front" height="220px" > <img
                                       src="uploads/<%=retriveProduct.getString("image_name")%>"
                                       alt="" class="pro-image-back" height="220px"> <span
                                       class="product-new-top">New</span>
                            </div>
                            <div class="item-info-product ">
                                <h4 id="pname">
                                    <a href=""><%=retriveProduct.getString("name")%></a>
                                </h4>
                                <h5>
                                    Category: <%=retriveProduct.getString("product_category")%>
                                </h5>
                                <div class="info-product-price">
                                    <input type="hidden" name="price"
                                           value="<%=retriveProduct.getString("price")%>"> <input
                                           type="hidden" name="mrp_price"
                                           value="<%=retriveProduct.getString("mrp_price")%>"> <span
                                           class="item_price"><%=retriveProduct.getString("price")%> Rs.</span>
                                    <del><%=retriveProduct.getString("mrp_price")%> Rs.</del>
                                </div>
                                <input type="submit" value="Add to cart" class="btn btn-warning" onclick="return confirm('Are you sure Do you want to add this item in cart?');">
                            </div>
                        </div>
                    </div>
                </div>
            </form>
            <style>
		.item-info-product h4 {
   			 height: 48px; 
   			 overflow: hidden;
   			 text-overflow: ellipsis;
  			 white-space: nowrap;
   			 line-height: 24px; 
		}

		.item-info-product h4 a {
   			 display: block;
  			 overflow: hidden;
		     text-overflow: ellipsis;
		     white-space: nowrap;
    		 max-width: 100%; 
}
            </style>
            <%
                }
            %>
        </div>
    </div>
    <jsp:include page="footer.jsp"></jsp:include>
</body>
</html>