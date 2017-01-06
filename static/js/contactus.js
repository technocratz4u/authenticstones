$(document).ready(function() {
    function initialize() {
        var mapOptions = {
            zoom: 15,
            center: new google.maps.LatLng(13.726240, 100.526799),
            mapTypeId: google.maps.MapTypeId.ROAD,
            scrollwheel: false
        }
        var map = new google.maps.Map(document.getElementById('map'),
            mapOptions);

        var myLatLng = new google.maps.LatLng(13.726240, 100.526799);
        var marker = new google.maps.Marker({
            position: myLatLng,
            map: map,
            title:"388 Sita Building, 4th Fl., Suite 401, Mahaseak Rd., Suriyawongse, Bangrak, Bangkok 10500, Thailand"

        });
    }

    google.maps.event.addDomListener(window, 'load', initialize);
		
});
