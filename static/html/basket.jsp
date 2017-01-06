<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<title>Authentic Stones Shopping Cart</title>

<%@ include file="header_includes.jsp"%>
<link href="<%=request.getContextPath()%>/static/css/checkout.css" rel="stylesheet" />
</head>

<body>

	<%@ include file="header.jsp"%>

	<!-- Home page content start -->

	<div id="page-content">
		<div class="container">
		   <div class="row">
		          <div class="col-md-12">
                    <ul class="breadcrumb">
                        <li><a href="#">Home</a>
                        </li>
                        <li>Shopping cart</li>
                    </ul>
                </div>
             </div>
			<div class="row">
				<div class="col-md-9" id="basket">

					<div class="page-box">

						<form method="post" action="checkout.jsp">

							<h1>Shopping cart</h1>
							<p class="text-muted">You currently have 3 item(s) in your
								cart.</p>
							<div class="table-responsive">
								<table class="table">
									<thead>
										<tr>
											<th colspan="2">Product</th>
											<th>Quantity</th>
											<th>Unit price</th>
											<th>Discount</th>
											<th colspan="2">Total</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td><a href="#"> <img
													class="img-responsive cart-image-width"
													src="<%=request.getContextPath()%>/static/img/diamond-3d.jpg"
													alt="Diamond">

											</a></td>
											<td><a href="#">Diamond Cut</a></td>
											<td><input type="number" value="2" class="form-control">
											</td>
											<td>$123.00</td>
											<td>$0.00</td>
											<td>$246.00</td>
											<td><a href="#"><i class="fa fa-trash-o"></i></a></td>
										</tr>
										<tr>
											<td><a href="#"> <img
													class="img-responsive cart-image-width"
													src="<%=request.getContextPath()%>/static/img/ruby-3d.jpg"
													alt="Ruby">
											</a></td>
											<td><a href="#">Ruby Cut</a></td>
											<td><input type="number" value="1" class="form-control">
											</td>
											<td>$200.00</td>
											<td>$0.00</td>
											<td>$200.00</td>
											<td><a href="#"><i class="fa fa-trash-o"></i></a></td>
										</tr>
									</tbody>
									<tfoot>
										<tr>
											<th colspan="5">Total</th>
											<th colspan="2">$446.00</th>
										</tr>
									</tfoot>
								</table>

							</div>
							<div>

								<div class="row">
									<div class="col-xs-6 col-sm-4 col-md-3">
										<p>
											Have an coupon-code ? <span class="light_gray">(Optional)</span>
										</p>

									</div>
									<div class="col-xs-6 col-sm-4 col-md-3">
										<form>
											<div class="input-group">
												<input type="text" class="form-control"> <span
													class="input-group-btn">
													<button class="btn btn-dark" type="button">
														<i class="fa fa-gift"></i>Apply
													</button>
												</span>
											</div>

										</form>
									</div>
									<div class="col-md-6 hidden-xs hidden-sm"></div>
								</div>

							</div>

							<!-- /.table-responsive -->

							<div class="page-box-footer">
								<div class="pull-left">
									<a href="category.html" class="btn btn-default"><i
										class="fa fa-chevron-left"></i> Continue shopping</a>
								</div>

								<div class="pull-right">
									<button class="btn btn-default">
										<i class="fa fa-refresh"></i> Update basket
									</button>
									<button type="submit" class="btn btn-dark" onclick="location.href = '<%=request.getContextPath()%>/static/html/checkout.jsp';">
										Proceed to checkout <i class="fa fa-chevron-right"></i>
									</button>
								</div>
								<div class="clearfix"></div>
							</div>

						</form>

					</div>
					<!-- /.box -->


				</div>
				<!-- /.col-md-9 -->

				<div class="col-md-3">
					<div class="panel panel-default" id="order-summary">

						<div class="panel-heading">
							<h3 class="panel-title">Order summary</h3>
						</div>
						<div class="panel-body">
							<p class="text-muted">Shipping and additional costs are
								calculated based on the values you have entered.</p>

							<div class="table-responsive">
								<table class="table">
									<tbody>
										<tr>
											<td>Order subtotal</td>
											<th>$446.00</th>
										</tr>
										<tr>
											<td>Shipping and handling</td>
											<th>$10.00</th>
										</tr>
										<tr>
											<td>Tax</td>
											<th>$0.00</th>
										</tr>
										<tr>
											<td>Discount</td>
											<th>$5.00</th>
										</tr>
										<tr class="total">
											<td>Total</td>
											<th>$456.00</th>
										</tr>
									</tbody>
								</table>
							</div>
						</div>

					</div>

				</div>

			</div>

		</div>
		<!-- /.container -->
	</div>

	<!-- Home page content end -->

	<%@ include file="footer.jsp"%>

	<%@ include file="footer_includes.jsp"%>

	<script src="<%=request.getContextPath()%>/static/js/home.js"></script>

</body>
</html>
