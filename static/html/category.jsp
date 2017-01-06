<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Authentic Stones category page</title>

    <%@ include file="header_includes.jsp" %>
    
    <link href="<%=request.getContextPath()%>/static/css/sidebar.css" rel="stylesheet" />
    <link href="<%=request.getContextPath()%>/static/css/category.css" rel="stylesheet" />
    
  </head>

  <body>
	
	<%@ include file="header.jsp" %>

	<!-- Home page content start -->
	
        <div id="page-content">
            <div class="container">

                <div class="col-md-12">
                    <ul class="breadcrumb">
                        <li><a href="#">Home</a>
                        </li>
                        <li>Loose Gemstones</li>
                    </ul>
                </div>

                <div class="col-md-3">
                    <!-- *** MENUS AND FILTERS ***
 _________________________________________________________ -->
                    <div class="panel panel-default sidebar-menu">

                        <div class="panel-heading">
                            <h3 class="panel-title">Categories</h3>
                        </div>

                        <div class="panel-body">
                            <ul class="nav nav-pills nav-stacked category-menu">
                                <li>
                                    <a href="#">Loose stones </a>
                                    <ul>
                                        <li class="active"><a href="#">Ruby</a>
                                        </li>
                                        <li><a href="#">Emerald</a>
                                        </li>
                                        <li><a href="#">Sapphire</a>
                                        </li>
                                        <li><a href="#">Diamond</a>
                                        </li>
                                    </ul>
                                </li>
                                <li>
                                    <a href="#">Beads</a>
                                    <ul>
                                        <li><a href="#">Peridot</a>
                                        </li>
                                        <li><a href="#">Coral</a>
                                        </li>
                                        <li><a href="#">Appetite</a>
                                        </li>
                                        <li><a href="#">Kynite</a>
                                        </li>
                                    </ul>
                                </li>
                                <li>
                                    <a href="#">Carvings</a>
                                    <ul>
                                        <li><a href="#">Ruby</a>
                                        </li>
                                        <li><a href="#">Emerald</a>
                                        </li>
                                        <li><a href="#">Aquamarine</a>
                                        </li>
                                        <li><a href="#">Rose quartz</a>
                                        </li>
                                    </ul>
                                </li>

                            </ul>

                        </div>
                    </div>

                    <div class="panel panel-default sidebar-menu">

                        <div class="panel-heading">
                            <h3 class="panel-title">Shape <button type="button" class="btn btn-default btn-xs pull-right"><i class="fa fa-times-circle fa-fw"></i> Clear</button></h3>
                        </div>

                        <div class="panel-body">

                            <form>
                                <div class="form-group">
                                    <div class="checkbox">
                                        <label>
                                            <input type="checkbox">Cube (10)
                                        </label>
                                    </div>
                                    <div class="checkbox">
                                        <label>
                                            <input type="checkbox">Drop (12)
                                        </label>
                                    </div>
                                    <div class="checkbox">
                                        <label>
                                            <input type="checkbox">Drum (15)
                                        </label>
                                    </div>
                                    <div class="checkbox">
                                        <label>
                                            <input type="checkbox">Briolette (14)
                                        </label>
                                    </div>
                                </div>

                                <button class="btn btn-default btn-sm btn-dark"><i class="fa fa-pencil"></i> Apply</button>

                            </form>

                        </div>
                    </div>

                    <div class="panel panel-default sidebar-menu">

                        <div class="panel-heading">
                            <h3 class="panel-title">Price Range <button type="button" class="btn btn-default btn-xs pull-right"><i class="fa fa-times-circle fa-fw"></i> Clear</button></h3>
                        </div>

                        <div class="panel-body">

                            <form>
                                <div class="form-group">
                                    <div class="checkbox">
                                        <label>
                                            <input type="checkbox"> below 100$ (13)
                                        </label>
                                    </div>
                                    <div class="checkbox">
                                        <label>
                                            <input type="checkbox"> greater than 100$ & less than 500$ (43)
                                        </label>
                                    </div>
                                    <div class="checkbox">
                                        <label>
                                            <input type="checkbox"> greater than 500$ & less than 1000$ (34)
                                        </label>
                                    </div>
                                    <div class="checkbox">
                                        <label>
                                            <input type="checkbox"> greater than 1500$ & less than 2000$ (14)
                                        </label>
                                    </div>
                                    <div class="checkbox">
                                        <label>
                                            <input type="checkbox"> greater than 2000$ (24)
                                        </label>
                                    </div>
                                </div>

                                <button class="btn btn-default btn-sm btn-dark"><i class="fa fa-pencil"></i> Apply</button>

                            </form>

                        </div>
                    </div>
                    <div class="panel panel-default sidebar-menu">

                        <div class="panel-heading">
                            <h3 class="panel-title">Country of Origin <button type="button" class="btn btn-default btn-xs pull-right"><i class="fa fa-times-circle fa-fw"></i> Clear</button></h3>
                        </div>

                        <div class="panel-body">

                            <form>
                                <div class="form-group">
                                    <div class="checkbox">
                                        <label>
                                            <input type="checkbox"> Thailand (13)
                                        </label>
                                    </div>
                                    <div class="checkbox">
                                        <label>
                                            <input type="checkbox"> Columbia (43)
                                        </label>
                                    </div>
                                    <div class="checkbox">
                                        <label>
                                            <input type="checkbox"> India (34)
                                        </label>
                                    </div>
                                    <div class="checkbox">
                                        <label>
                                            <input type="checkbox"> Mouzambique (14)
                                        </label>
                                    </div>
                                    <div class="checkbox">
                                        <label>
                                            <input type="checkbox"> African (24)
                                        </label>
                                    </div>
                                </div>

                                <button class="btn btn-default btn-sm btn-dark"><i class="fa fa-pencil"></i> Apply</button>

                            </form>

                        </div>
                    </div>

                </div>

                <div class="col-md-9">
                    <div class="page-box">
                        <h1>Loose Gemstones</h1>
                        <p>Buy wholesale loose gemstones including sapphires, emeralds, rubies and semi-precious gemstones or choose gemstone jewelry from our exquisite handcrafted collections.</p>
                    </div>

                    <div class="page-box info-bar">
                        <div class="row">
                            <div class="col-sm-12 col-md-4 products-showing">
                                Showing <strong>12</strong> of <strong>25</strong> products
                            </div>

                            <div class="col-sm-12 col-md-8  products-number-sort">
                                <div class="row">
                                    <form class="form-inline">
                                        <div class="col-md-6 col-sm-6">
                                            <div class="products-number">
                                                <strong>Show</strong>  <a href="#" class="btn btn-default btn-sm btn-dark">12</a>  <a href="#" class="btn btn-default btn-sm">24</a>  <a href="#" class="btn btn-default btn-sm">All</a> products
                                            </div>
                                        </div>
                                        <div class="col-md-6 col-sm-6">
                                            <div class="products-sort-by">
                                                <strong>Sort by</strong>
                                                <select name="sort-by" class="form-control">
                                                    <option>Price</option>
                                                    <option>Name</option>
                                                </select>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="row products">

                        <div class="col-md-4 col-sm-6">
                            <div class="product">
                         
                                <a href="#">
                                    <img src="<%=request.getContextPath()%>/static/img/diamond-3d.jpg" alt="" class="img-responsive">
                                </a>
                                <div class="text">
                                    <h3><a href="#">Diamond Cut </a> Add Description here</h3>
                                    <p class="price">$143.00</p>
                                    <p class="buttons">
                                        <a href="#" class="btn btn-default">View detail</a>
                                        <a href="#" class="btn btn-dark"><i class="fa fa-shopping-cart"></i> Add to cart</a>
                                    </p>
                                </div>
                                <!-- /.text -->
                            </div>
                            <!-- /.product -->
                        </div>

                        <div class="col-md-4 col-sm-6">
                            <div class="product">
                             <a href="#">
                                    <img src="<%=request.getContextPath()%>/static/img/ruby-3d.jpg" alt="" class="img-responsive">
                                </a>
                                <div class="text">
                                    <h3><a href="#">Ruby Cut</a></h3>
                                    <p class="price">$113.00</p>
                                    <p class="buttons">
                                        <a href="#" class="btn btn-default">View detail</a>
                                        <a href="#" class="btn btn-dark"><i class="fa fa-shopping-cart"></i> Add to cart</a>
                                    </p>
                                </div>

                                <!-- /.text -->

                                <div class="ribbon sale">
                                    <div class="theribbon">SALE</div>
                                    <div class="ribbon-background"></div>
                                </div>
                                <!-- /.ribbon -->

                                <div class="ribbon new">
                                    <div class="theribbon">NEW</div>
                                    <div class="ribbon-background"></div>
                                </div>
                                <!-- /.ribbon -->

                                <div class="ribbon gift">
                                    <div class="theribbon">GIFT</div>
                                    <div class="ribbon-background"></div>
                                </div>
                                <!-- /.ribbon -->
                            </div>
                            <!-- /.product -->
                        </div>

                        <div class="col-md-4 col-sm-6">
                            <div class="product">
                                <a href="#">
                                    <img src="<%=request.getContextPath()%>/static/img/emrald-3d.jpg" alt="" class="img-responsive">
                                </a>
                                <div class="text">
                                    <h3><a href="#">Emerald Cut</a></h3>
                                    <p class="price">$143.00</p>
                                    <p class="buttons">
                                        <a href="#" class="btn btn-default">View detail</a>
                                        <a href="#" class="btn btn-dark"><i class="fa fa-shopping-cart"></i> Add to cart</a>
                                    </p>
                                </div>
                                
                            </div>
                            <!-- /.product -->
                        </div>

                        <div class="col-md-4 col-sm-6">
                            <div class="product">
                                <a href="#">
                                    <img src="<%=request.getContextPath()%>/static/img/sapphire-3d.jpg" alt="" class="img-responsive">
                                </a>
                                <div class="text">
                                    <h3><a href="#">Sapphire Cut</a></h3>
                                    <p class="price">$143.00</p>
                                    <p class="buttons">
                                        <a href="#" class="btn btn-default">View detail</a>
                                        <a href="#" class="btn btn-dark"><i class="fa fa-shopping-cart"></i> Add to cart</a>
                                    </p>
                                </div>
                                
                            </div>
                            <!-- /.product -->
                        </div>

                        <div class="col-md-4 col-sm-6">
                            <div class="product">
                             <a href="#">
                                    <img src="<%=request.getContextPath()%>/static/img/ruby-3d.jpg" alt="" class="img-responsive">
                                </a>
                                <div class="text">
                                    <h3><a href="#">Ruby Cut</a></h3>
                                    <p class="price">$113.00</p>
                                    <p class="buttons">
                                        <a href="#" class="btn btn-default">View detail</a>
                                        <a href="#" class="btn btn-dark"><i class="fa fa-shopping-cart"></i> Add to cart</a>
                                    </p>
                                </div>

                                <!-- /.text -->

                                <div class="ribbon sale">
                                    <div class="theribbon">SALE</div>
                                    <div class="ribbon-background"></div>
                                </div>
                                <!-- /.ribbon -->

                                <div class="ribbon new">
                                    <div class="theribbon">NEW</div>
                                    <div class="ribbon-background"></div>
                                </div>
                                <!-- /.ribbon -->

                                <div class="ribbon gift">
                                    <div class="theribbon">GIFT</div>
                                    <div class="ribbon-background"></div>
                                </div>
                                <!-- /.ribbon -->
                            </div>
                        </div>

                        <div class="col-md-4 col-sm-6">
							 <div class="product">
                                <a href="#">
                                    <img src="<%=request.getContextPath()%>/static/img/sapphire-3d.jpg" alt="" class="img-responsive">
                                </a>
                                <div class="text">
                                    <h3><a href="#">Sapphire Cut</a></h3>
                                    <p class="price">$143.00</p>
                                    <p class="buttons">
                                        <a href="#" class="btn btn-default">View detail</a>
                                        <a href="#" class="btn btn-dark"><i class="fa fa-shopping-cart"></i> Add to cart</a>
                                    </p>
                                </div>
                                
                            </div>
                            <!-- /.product -->
                        </div>
                        <!-- /.col-md-4 -->
                    </div>
                    <!-- /.products -->

                    <div class="pages">

                        <p class="loadMore">
                            <a href="#" class="btn btn-dark btn-lg"><i class="fa fa-chevron-down"></i> Load more</a>
                        </p>

                        <ul class="pagination">
                            <li><a href="#">&laquo;</a>
                            </li>
                            <li class="active"><a href="#">1</a>
                            </li>
                            <li><a href="#">2</a>
                            </li>
                            <li><a href="#">3</a>
                            </li>
                            <li><a href="#">4</a>
                            </li>
                            <li><a href="#">5</a>
                            </li>
                            <li><a href="#">&raquo;</a>
                            </li>
                        </ul>
                    </div>


                </div>
                <!-- /.col-md-9 -->
            </div>
            <!-- /.container -->
        </div>

	<!-- Home page content end -->
	
	<%@ include file="footer.jsp" %>
	
	<%@ include file="footer_includes.jsp" %>
    
    <script src="<%=request.getContextPath()%>/static/js/home.js"></script>
    
  </body>
</html>
