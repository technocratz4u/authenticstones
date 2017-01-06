$(function() {
	productDetailGallery(4000);
});

/* product detail gallery */

function productDetailGallery(confDetailSwitch) {
	$('.thumb:first').addClass('active');
	timer = setInterval(autoSwitch, confDetailSwitch);
	$(".thumb").click(function(e) {

		switchImage($(this));
		clearInterval(timer);
		timer = setInterval(autoSwitch, confDetailSwitch);
		e.preventDefault();
	});
	$('#mainImage').hover(function() {
		clearInterval(timer);
	}, function() {
		timer = setInterval(autoSwitch, confDetailSwitch);
	});

	function autoSwitch() {
		var nextThumb = $('.thumb.active').closest('div').next('div').find(
				'.thumb');
		if (nextThumb.length == 0) {
			nextThumb = $('.thumb:first');
		}
		switchImage(nextThumb);
	}

	function switchImage(thumb) {

		$('.thumb').removeClass('active');
		var bigUrl = thumb.attr('href');
		thumb.addClass('active');
		$('#mainImage img').attr('src', bigUrl);
	}
}
