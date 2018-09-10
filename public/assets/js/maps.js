	$(document).ready(function() {
	var mapLocation = new google.maps.LatLng(-12.1586563,-76.9801875,17);

		var $mapis = $('#map');

		if ($mapis.length > 0) {

			map = new GMaps({
				streetViewControl : true,
				overviewMapControl: true,
				mapTypeControl: false,
				zoomControl : false,
				panControl : false,
				scrollwheel: false,
				center: mapLocation,
				el: '#map',
				zoom: 16,
				styles: [{"featureType":"all","elementType":"labels.text.fill","stylers":[{"saturation":36},{"color":"#000000"},{"lightness":40}]},{"featureType":"all","elementType":"labels.text.stroke","stylers":[{"visibility":"on"},{"color":"#000000"},{"lightness":16}]},{"featureType":"all","elementType":"labels.icon","stylers":[{"visibility":"off"}]},{"featureType":"administrative","elementType":"geometry.fill","stylers":[{"color":"#000000"},{"lightness":20}]},{"featureType":"administrative","elementType":"geometry.stroke","stylers":[{"color":"#000000"},{"lightness":17},{"weight":1.2}]},{"featureType":"landscape","elementType":"geometry","stylers":[{"color":"#000000"},{"lightness":20}]},{"featureType":"poi","elementType":"geometry","stylers":[{"color":"#000000"},{"lightness":21}]},{"featureType":"road.highway","elementType":"geometry.fill","stylers":[{"color":"#000000"},{"lightness":17}]},{"featureType":"road.highway","elementType":"geometry.stroke","stylers":[{"color":"#000000"},{"lightness":29},{"weight":0.2}]},{"featureType":"road.arterial","elementType":"geometry","stylers":[{"color":"#000000"},{"lightness":18}]},{"featureType":"road.local","elementType":"geometry","stylers":[{"color":"#000000"},{"lightness":16}]},{"featureType":"transit","elementType":"geometry","stylers":[{"color":"#000000"},{"lightness":19}]},{"featureType":"water","elementType":"geometry","stylers":[{"color":"#000000"},{"lightness":17}]}]
			});

			var image = new google.maps.MarkerImage('assets/images/map-icon.png',
				new google.maps.Size(59, 65),
				new google.maps.Point(0, 0),
				new google.maps.Point(24, 42)
			);

			map.addMarker({
				position: mapLocation,
				icon: image,
				title: 'Rival',
				infoWindow: {
					content: '<p><strong>Tata Taxis</strong><br/>Av Pedro Miotta 955, San Juan de Miraflores <br/>T: (+51) 275-2222<br/>Lima, Perú</p>'
				}
			});

		


		}
	});