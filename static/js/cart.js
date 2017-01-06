$(document).ready(function() {
	//console.log(localStorage);
	refreshItemsInCart();

});

$(window).unload(function() {
	// on unload of the window
	syncCart("save");
});

function syncCart(actionType){
	var cartData = "";
	
	if (typeof (localStorage["myCart"]) != "undefined") {
		cartData = localStorage["myCart"];
	}
	var targetUrl = $("#cntxtPathUrl").val() + "/basket/"+actionType;
	
	$.ajax({
		// processData : false,
		// scriptCharset : "utf-8",
		// contentType : "application/json;charset=utf-8",
		dataType : 'json',
		async : true,
		cache : false,
		beforeSend : function(xhr) {
			xhr.setRequestHeader("Accept", "application/json");
		},
		type : "POST",
		url : targetUrl,
		data : {"cart":cartData},
		success : function(data, status, xhr) {
			//console.log(data);
			if (typeof (localStorage) != "undefined") {
				localStorage["myCart"] = JSON.stringify(data);
			}
			refreshItemsInCart();
		},
		error : function(xhr, textStatus, errorThrown) {
			//console.log("error");
		}

	});
		
}

// Populate items in Shopping Cart
function refreshItemsInCart() {
	$(".itemsInCart").html(getTotalCount());

	if ($("#cartDisplay").length > 0) {
		loadCartItems();
		calculateCartPrice();
	}

}

// Retrieve items from cart and displays in table
function loadCartItems() {
	var itemsInCart = {};
	var row = "";
	var col = "";
	var table = "";
	
	if (typeof (localStorage["myCart"]) != "undefined" && (localStorage["myCart"]).length > 0) {
		itemsInCart = JSON.parse(localStorage["myCart"]);

		$.each(itemsInCart, function(itemId, itemDetail) {
			itemCurrency = itemDetail.currency;
	
			row = "<tr>";
			col = "<td><a href=\"" + $("#cntxtPathUrl").val() + "/product/view/"
					+ itemDetail.item_name + "/" + itemId
					+ "\"> <img class=\"img-responsive cart-image-width\" src=\""
					+ itemDetail["images"]["thumb_url"]["front"] + "\" ></a>";
			col += "<td colspan=\"4\">";
			col += "<b><a href=\"" + $("#cntxtPathUrl").val() + "/product/view/"
					+itemDetail.item_name + "/" + itemId + "\">";
			col += itemDetail.item_code + " | " + itemDetail.carat_weight + " ct. " + itemDetail.item_name + " ("
					+ itemDetail.origin_name + ") " + itemDetail.shape + " - "
					+ itemDetail.dimensions;
			col += "</b></a><br>";
			col += "Qty: " + itemDetail.quantity;
			col += " | Product Price: " + itemDetail.currency + " "
					+ toCurrency(itemDetail.item_price) + "</td>";
			col += "<td class=\"totalItemPrice\">"
					+ itemDetail.currency
					+ " "
					+ toCurrency(toNumber(itemDetail.quantity)
							* toNumber(itemDetail.item_price)) + "</td>";
			col += "<td><h5><a href='javascript:removeFromCart("
					+ JSON.stringify(itemDetail)
					+ ")'><i class='fa fa-trash-o'></i></a></h5></td>";
	
			row += col;
			row += "</tr>";
			table += row;
		});
	}
	
	if (table.length > 0) {
		$("#cartDisplay tbody").html(table);
	} else {
		$("#cartDisplay tbody")
				.html(
						"<tr><td colspan=\"7\"><p class=\"text-center text-muted\" style=\"font-weight:bold;\">No Items to display</p></td></tr>");
		$(".checkoutBtn").attr("href", "javascript:void(0);");
		$(".checkoutBtn").addClass("disabled");
	}
}

// Calculate Total Cart Price
function calculateCartPrice() {
	var sum = 0;
	var priceValue = 0;
	var itemCurrency = "";
	var itemsInCart = {};

	if (typeof (localStorage["myCart"]) != "undefined" && (localStorage["myCart"]).length > 0) {
		itemsInCart = JSON.parse(localStorage["myCart"]);

		$.each(itemsInCart, function(itemId, itemDetail) {
			itemCurrency = itemDetail.currency;
			priceValue = toNumber(itemDetail.quantity)
					* toNumber(itemDetail.item_price);
			sum += priceValue;
		});
	}

	$(".orderTotal").html(itemCurrency + " " + toCurrency(sum));

}

// add an item to the cart
function addToCart(newItem) {
	var found = false;
	var quantity = 0;
	var itemsInCart = {};

	if (newItem != null) {
		quantity = toNumber($("#product-quantity").val());
		newItem.quantity = quantity;
	}

	if (quantity > 0) {

		if (typeof (localStorage["myCart"]) != "undefined" && (localStorage["myCart"]).length > 0) {

			itemsInCart = JSON.parse(localStorage["myCart"]);

			// update quantity for existing item
			if (typeof (itemsInCart) != "undefined" && !jQuery.isEmptyObject(itemsInCart) && typeof (itemsInCart[newItem.item_id]) != "undefined") {
				quantity += toNumber(itemsInCart[newItem.item_id]["quantity"]);
				itemsInCart[newItem.item_id]["quantity"] = quantity;

				localStorage["myCart"] = JSON.stringify(itemsInCart);

				found = true;
			}
		}

		// new item, add now
		if (!found) {
			if(jQuery.isEmptyObject(itemsInCart))
				itemsInCart = {};
				
			itemsInCart[newItem.item_id] = newItem;
			localStorage["myCart"] = JSON.stringify(itemsInCart);
		}

	}

	refreshItemsInCart();
}

// removes an item from the cart
function removeFromCart(thisItem) {
	var itemsInCart = {};

	if (typeof (localStorage["myCart"]) != "undefined" && (localStorage["myCart"]).length > 0) {
		itemsInCart = JSON.parse(localStorage["myCart"]);
		delete itemsInCart[thisItem.item_id];
		localStorage["myCart"] = JSON.stringify(itemsInCart);
	}
	refreshItemsInCart();

}

// get the total count for all items currently in the cart
function getTotalCount() {
	var count = 0;

	if (typeof (localStorage["myCart"]) != "undefined" && (localStorage["myCart"]).length > 0) {
		var itemsInCart = JSON.parse(localStorage["myCart"]);

		$.each(itemsInCart, function(itemId, ItemObject) {
			count += toNumber(ItemObject["quantity"]);
		});

		return count;
	}

	return count;
}

// clear the Cart
function clearCart() {
	localStorage["myCart"] = "";
}

