
$(document).ready(function() {

	var time = 4; // time in seconds

	var $progressBar, $bar, $elem, isPause, tick, percentTime;

	// Init the carousel
	$("#homeCarousel").owlCarousel({
		slideSpeed : 500,
		paginationSpeed : 500,
		singleItem : true,
		afterInit : progressBar,
		afterMove : moved,
		startDragging : pauseOnDragging
	});

	// Init progressBar where elem is $("#homeCarousel")
	function progressBar(elem) {
		$elem = elem;
		// build progress bar elements
		buildProgressBar();
		// start counting
		start();
	}

	// create div#progressBar and div#bar then prepend to $("#homeCarousel")
	function buildProgressBar() {
		$progressBar = $("<div>", {
			id : "progressBar"
		});
		$bar = $("<div>", {
			id : "bar"
		});
		$progressBar.append($bar).prependTo($elem);
	}

	function start() {
		// reset timer
		percentTime = 0;
		isPause = false;
		// run interval every 0.01 second
		tick = setInterval(interval, 10);
	}
	;

	function interval() {
		if (isPause === false) {
			percentTime += 1 / time;
			$bar.css({
				width : percentTime + "%"
			});
			// if percentTime is equal or greater than 100
			if (percentTime >= 100) {
				// slide to next item
				$elem.trigger('owl.next')
			}
		}
	}

	// pause while dragging
	function pauseOnDragging() {
		isPause = true;
	}

	// moved callback
	function moved() {
		// clear interval
		clearTimeout(tick);
		// start again
		start();
	}

	// uncomment this to make pause on mouseover
	// $elem.on('mouseover',function(){
	// isPause = true;
	// })
	// $elem.on('mouseout',function(){
	// isPause = false;
	// })

	$("#hot-this-week-carousel").owlCarousel({

		items : 4, //5 items above 1000px browser width

		itemsDesktop : [ 1199, 4 ],
		itemsDesktopSmall : [ 979, 3 ],
		itemsTablet : [ 768, 2 ],
		itemsTabletSmall : false,
		itemsMobile : [ 479, 1 ],

		autoPlay : true,
		stopOnHover : true

	});

	$("#home-page-testimonial-carousel").owlCarousel({

		slideSpeed : 100,
		paginationSpeed : 400,
		singleItem : true,

		autoPlay : true,
		stopOnHover : true

	});

});
