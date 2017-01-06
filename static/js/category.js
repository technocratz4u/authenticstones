$(document).ready(function() {
	
	/** changing state of UI elements according to the filter parameters from the request **/
	var filterCategoryArr = $("#filter_category").val().split(",");
	for(var i=0;i<filterCategoryArr.length;i++){
		//console.log("::::"+filterCategoryArr[i].replace(new RegExp("/","g"), "__"));
		$("#sbctgrchkbx_"+filterCategoryArr[i].replace(new RegExp("/","g"), "__")).prop("checked", true);
	}
	
	var filterShapeArr = $("#filter_shape").val().split(",");
	for(var i=0;i<filterShapeArr.length;i++){
		//console.log("::::"+"#shpchkbx_"+filterShapeArr[i].replace(new RegExp("/","g"), "__"));
		$("#shpchkbx_"+filterShapeArr[i].replace(new RegExp("/","g"), "__")).prop("checked", true);
	}
	
	var filterPriceArr = $("#filter_price_range").val().split(",");
	for(var i=0;i<filterPriceArr.length;i++){
		$("#prcchkbx_"+filterPriceArr[i]).prop("checked", true);
	}
	
	var filterOriginArr = $("#filter_origin").val().split(",");
	for(var i=0;i<filterOriginArr.length;i++){
		$("#orgchkbx_"+filterOriginArr[i].replace(new RegExp("/","g"), "__")).prop("checked", true);
	}
	
	$("#pageSizeCombo").val($("#filter_page_size").val());
	$("#sortByCombo").val($("#filter_sort_by").val());
	
	if(parseInt($("#filtered_product_count").val(), 10)>0){
		//alert(((parseInt($("#filter_page").val(),10)-1)*parseInt($("#filter_page_size").val(), 10))+1);
		//alert(((parseInt($("#filter_page").val(),10)-1)*parseInt($("#filter_page_size").val(), 10))+1+(parseInt($("#filter_page_size").val(), 10)));
		//alert($("#filtered_product_count").val());
		$("#show_filtered_start_index").html(((parseInt($("#filter_page").val(),10)-1)*parseInt($("#filter_page_size").val(), 10))+1);
		if(((parseInt($("#filter_page").val(),10)-1)*parseInt($("#filter_page_size").val(), 10))+1+(parseInt($("#filter_page_size").val(), 10))>parseInt($("#filtered_product_count").val(), 10)){
			$("#show_filtered_end_index").html(parseInt($("#filtered_product_count").val(), 10));
		}else{
			$("#show_filtered_end_index").html(parseInt($("#show_filtered_start_index").val(),10)+(parseInt($("#filter_page_size").val(), 10)));
		}
		$("#show_filtered_product_count").html($("#filtered_product_count").val());
		
		//console.log("pages:"+Math.ceil(parseFloat($("#filtered_product_count").val())/parseFloat($("#filter_page_size").val())));
		
		/** Bootstrap pagination plugin - bootpag **/
	    $("#pagination-controls").bootpag({
	        total: Math.ceil(parseFloat($("#filtered_product_count").val())/parseFloat($("#filter_page_size").val())),
	        page: parseInt($("#filter_page").val(),10),
	        maxVisible: 5,
	        leaps: true,
	        firstLastUse: true,
	        first: '←',
	        last: '→',
	        wrapClass: 'pagination',
	        activeClass: 'active',
	        disabledClass: 'disabled',
	        nextClass: 'next',
	        prevClass: 'prev',
	        lastClass: 'last',
	        firstClass: 'first'
	    }).on("page", function(event, num){
	        //console.log("Loagind content for page:"+num);
	    	$("#filter_page").val(num);
	    	applyFilters();
	    }); 
	    
	}else{
		$("#page-controls").hide();
		$(".pages").hide();
	}
	
	/** Applying the button listeners **/
	$("#clearShapeFilterBtn").click(function() {
		$('.shapeChkBx').each(function() {
			$(this).removeAttr("checked");
		});
	});
	
	$("#clearPriceFilterBtn").click(function() {
		$('.priceChkBx').each(function() {
			$(this).removeAttr("checked");
		});
	});
	
	$("#clearOriginFilterBtn").click(function() {
		$('.originChkBx').each(function() {
			$(this).removeAttr("checked");
		});
	});
	
	$("#clearCategoryFilterBtn").click(function() {
		$('.categoryChkBx').each(function() {
			$(this).removeAttr("checked");
		});
		$('.subCategoryChkBx').each(function() {
			$(this).removeAttr("checked");
		});
	});
	
	//console.log("count::::"+$('.categoryChkBx').length);
	$('.categoryChkBx').each(function() {
		//console.log("-----"+$(this).val());
		//console.log("count:"+$("."+$(this).val()+"ChkBx").length);
		$(this).click(function() {
			if($(this).is(":checked")){
				$("."+$(this).val()+"ChkBx").each(function() {
					//console.log("----------"+$(this).val());
					$(this).prop("checked", true);
				});
			}else{
				$("."+$(this).val()+"ChkBx").each(function() {
					//console.log("----------"+$(this).val());
					$(this).removeAttr("checked");
				});
			}
		});
	});
	
	$(".applyFilterBtn").click(function() {
		return applyFilters();
	});
	
	$("#pageSizeCombo").change(function() {
		return applyFilters();
	});
	
	$("#sortByCombo").change(function() {
		return applyFilters();
	});
	
});

function applyFilters(){
	var appliedSubCategories = "";
	$(".subCategoryChkBx").each(function() {
		if($(this).is(":checked")){
			if(appliedSubCategories.length>0){
				appliedSubCategories+=",";
			}
			appliedSubCategories+=$(this).val();
		}
	});
	
	var appliedShapes = "";
	$(".shapeChkBx").each(function() {
		if($(this).is(":checked")){
			if(appliedShapes.length>0){
				appliedShapes+=",";
			}
			appliedShapes+=$(this).val();
		}
	});
	
	var appliedPrices = "";
	$(".priceChkBx").each(function() {
		if($(this).is(":checked")){
			if(appliedPrices.length>0){
				appliedPrices+=",";
			}
			appliedPrices+=$(this).val();
		}
	});
	
	var appliedOrigins = "";
	$(".originChkBx").each(function() {
		if($(this).is(":checked")){
			if(appliedOrigins.length>0){
				appliedOrigins+=",";
			}
			appliedOrigins+=$(this).val();
		}
	});
	
	/*var filterUrl = "";
	if(appliedSubCategories.length>0){
		filterUrl+="category="+appliedSubCategories;
	}
	
	if(appliedShapes.length>0){
		if(filterUrl.length>0){
			filterUrl+="&";
		}
		filterUrl+="shape="+appliedShapes;
	}
	
	if(appliedPrices.length>0){
		if(filterUrl.length>0){
			filterUrl+="&";
		}
		filterUrl+="price="+appliedPrices;
	}
	
	if(appliedOrigins.length>0){
		if(filterUrl.length>0){
			filterUrl+="&";
		}
		filterUrl+="origin="+appliedOrigins;
	}
	if(filterUrl.length>0){
		filterUrl+="&";
	}
	
	filterUrl+="pagesize="+$("#pageSize").val();
	filterUrl+="&";
	filterUrl+="sortby="+$("#sortBy").val();
	
	filterUrl =$("#cntxtPathUrl").val()+"/category/search?"+filterUrl;*/
	
	if(appliedSubCategories.length>0){
		$("#applyFilterForm").append("<input type=\"hidden\" name=\"category\" value=\""+appliedSubCategories+"\"/>");
	}
	
	if(appliedShapes.length>0){
		$("#applyFilterForm").append("<input type=\"hidden\" name=\"shape\" value=\""+appliedShapes+"\"/>");
	}
	
	if(appliedPrices.length>0){
		$("#applyFilterForm").append("<input type=\"hidden\" name=\"price\" value=\""+appliedPrices+"\"/>");
	}
	
	if(appliedOrigins.length>0){
		$("#applyFilterForm").append("<input type=\"hidden\" name=\"origin\" value=\""+appliedOrigins+"\"/>");
	}
	
	$("#applyFilterForm").append("<input type=\"hidden\" name=\"page\" value=\""+$("#filter_page").val()+"\"/>");
	$("#applyFilterForm").append("<input type=\"hidden\" name=\"pagesize\" value=\""+$("#pageSizeCombo").val()+"\"/>");
	$("#applyFilterForm").append("<input type=\"hidden\" name=\"sortby\" value=\""+$("#sortByCombo").val()+"\"/>");
	
	//$("#applyFilterForm").attr("action", filterUrl);
	//alert($("#applyFilterForm").attr("action"));
	//window.location.href = filterUrl;
	$("#applyFilterForm").submit();
	
	return false;
	
}