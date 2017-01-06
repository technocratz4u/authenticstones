$(document).ready(function() {

	$( "#intervalList li a" ).each(function( index ) {	
		if($(this).data("value") == $("#intervalPeriod").val()){
			$("#orderPeriod").text($(this).text());
		}
	});
	
	$("#intervalList li a").click(function() {
		$("#orderPeriod").text($(this).text());
		$(this).attr('href',$("#cntxtPathUrl").val()+"/order/view/"+$(this).data("value"));
		
	});

});

function showOrderDetails(orderIndex){
	$("#orderDetailsSection_"+orderIndex).show();
	$("#ordrDetails_"+orderIndex).hide();	
}

