var ServiceType = 0;
var CarSelection = 'car';

 $(document).ready(function(){
	$("#btnSave").click(function(e){
		$(this).prop( "disabled", true );
        e.preventDefault();
		Step3();
	})

 });
 
function GetValues(){
	var from = $('#start').val();
	var to = $('#end').val();
	$('#txtFrom').html('' + from.replace('Lima, Peru', '') + '');
	$('#txtTo').html('' + to.replace('Lima, Peru', '') + '');
	if($('#optSched').is(':checked')){
		$('#txtWhen').html('<b>' + $('#input_01').val()  + " - " + $('#input_from').val()  + '</b>');	
	}else{
		$('#txtWhen').html("Lo antes posible");
	}
	

}
function ResetCar(){
	
	document.getElementById("TotalFare").value = 0;
	$('#switch-me').val($(".carType").attr('carType')).change()
	$('#optCar').click();
	
}

function RecalculateFare(carType){
	CarSelection = carType;
	var fare = $("#TotalFare").val();

	if (fare < 1){
		document.getElementById("total").innerHTML = "<span style='color:red'>Lo sentimos</span>, error en la dirección, intente nuevamente o llámenos al: <br><b>275-2222</b>";
	}else{
			var dscto;
			if (ServiceType == 1){
				dscto = 5;
			}else{
				dscto = 2;
			}
			if (carType == "car"){

			}else{
				fare = parseInt(fare) + 100; 

			}
			var total = parseInt(fare) - parseInt(dscto);
			document.getElementById("total").innerHTML = "Tarifa = <b>S/." + fare  + "</b><br>Descuento = <b style='color:red'>-" + dscto + ".00</b><br><span style='color:black;font-size:16px;'><b>Total: S/." + total + "</b></span><br><span style='color:black;font-size:10px;'>*Tarifa Referencial</span>";
	}

}
function GetAirportValues(fare){
	var desct = fare - 5;
	document.getElementById("total").innerHTML = "Tarifa = <b>S/." + fare + "</b><br>Descuento = <b style='color:red'>-5.00</b><br><span style='color:black;font-size:16px;'><b>Total: S/." + desct + "</b></span>";
	$('#txtWhen').html('<b>' + $('#txtDateAirport').val()  + " - " + $('#txtHourAirport').val()  + '</b>');	
	if($('#optTo').is(':checked')){
		$('#txtFrom').html('El Aeropuerto');
		$('#txtTo').html('' + $('#ddlDistritos').val() + '');
	}else{
		$('#txtTo').html('El Aeropuerto');
		$('#txtFrom').html('' + $('#ddlDistritos').val() + '');
	}
	
}
function GetAirportRate(){
	var fare;
	
	switch ($("#ddlDistritos").val()) {
    case "Ate":
        fare = "80";
        break;
    case "Barranco":
        fare = "65";
        break;  
    case "Bellavista":
        fare = "50";
        break; 
    case "Breña":
        fare = "55";
        break;    
    case "Callao":
        fare = "55";
        break;    
    case "Carabayllo":
        fare = "70";
        break;    
    case "Carmen de la Legua":
        fare = "50";
        break; 
    case "Chaclacayo":
        fare = "185";
        break;            
    case "Chorrillos":
        fare = "65";
        break; 
    case "Chosica":
        fare = "160";
        break; 
    case "Cieneguilla":
        fare = "130";
        break;  
    case "Comas":
        fare = "65";
        break; 
	case "El Agustino":
        fare = "75";
        break; 
	case "Independencia":
        fare = "60";
        break;
 	case "Jesús María":
        fare = "60";
        break;
	case "La Molina":
        fare = "80";
        break;
	case "La Perla":
        fare = "55";
        break;   
	case "La Punta":
        fare = "55";
        break;  
	case "La Victoria":
        fare = "65";
        break; 
	case "Lima":
        fare = "60";
        break;    
	case "Lince":
        fare = "60";
        break;    
	case "Los Olivos":
        fare = "60";
        break;    
	case "Lurin":
        fare = "135";
        break;
	case "Lurin":
        fare = "135";
        break;
	case "Magdalena del Mar":
        fare = "55";
        break;    
	case "Miraflores":
        fare = "60";
        break;    
	case "Pueblo Libre":
        fare = "55";
        break;    
	case "Puente Piedra":
        fare = "100";
        break;   
	case "Rimac":
        fare = "60";
        break; 
	case "San Borja":
        fare = "65";
        break;    
	case "San Isidro":
        fare = "60";
        break;    
	case "San Juan de Lurigancho":
        fare = "95";
        break;    
	case "San Juan de Miraflores":
        fare = "75";
        break;   
	case "San Luis":
        fare = "65";
        break;   
	case "San Martín de Porres":
        fare = "55";
        break;  
	case "San Miguel":
        fare = "55";
        break;  
	case "Santa Anita":
        fare = "70";
        break;   
	case "Santiago de Surco":
        fare = "70";
        break;   
	case "Surquillo":
        fare = "65";
        break;    
	case "Ventanilla":
        fare = "85";
        break;    
	case "Villa María del Triunfo":
        fare = "90";
        break;  
	case "Villa el Salvador":
        fare = "80";
        break;                                   
	}
	document.getElementById("TotalFare").value = fare;
	return fare;
}
function ClearAirport(){
		$("#txtFullAddress").css("border-bottom-color", "#F1F1F3");	
		$("#ddlDistritos").css("border-bottom-color", "#F1F1F3");
		$("#txtDateAirport").css("border-bottom-color", "#F1F1F3");
		$("#txtHourAirport").css("border-bottom-color", "#F1F1F3");			
}
function CancelConfirm(ServiceType){
	
	if (ServiceType == 1){
		$('#pnlAirportDetails').show();
		$('#pnlConfirm').hide();
	}else{
		$('#pnlDetails').show();
		$('#pnlConfirm').hide();	
	}

	
}
function AirStep2(){

	// if ($('#txtFullAddress').val() != "" && $('#ddlDistritos').val() !="" && $('#input_01').val() != "" && $('#input_from').val() != ""){
	if ($('#txtFullAddress').val() != "" && $('#ddlDistritos').val() != "" && $('#txtDateAirport').val() != "" && $('#txtHourAirport').val() != ""){
		
		ClearAirport();
		var fare = GetAirportRate();
		if($('#optTo').is(':checked')){
			fare = parseInt(fare) + 5;
		}
		GetAirportValues(fare);
		
		$('#pnlAirportDetails').hide();
		$('#pnlConfirm').show();
	}else{
	
		if ($('#txtFullAddress').val() == "" ){
			$("#txtFullAddress").css("border-bottom-color", "red");	
		}else{
			$("#txtFullAddress").css("border-bottom-color", "#F1F1F3");	
		}
		if ($('#ddlDistritos').val() == "" ){
			$("#ddlDistritos").css("border-bottom-color", "red");	
		}else{
			$("#ddlDistritos").css("border-bottom-color", "#F1F1F3");	
		}		
		if ($('#txtDateAirport').val() == "" ){
			$("#txtDateAirport").css("border-bottom-color", "red");	
		}else{
			$("#txtDateAirport").css("border-bottom-color", "#F1F1F3");
		}		
		if ($('#txtHourAirport').val() == "" ){
			$("#txtHourAirport").css("border-bottom-color", "red");	
		}else{
			$("#txtHourAirport").css("border-bottom-color", "#F1F1F3");	
		}	
		// $('#txtError1').show();
	}
	
}
function Step2(){
	if ($('#start').val() != "" && $('#end').val() !=""){
		$('#txtError1').hide();
		$("#start").css("border-bottom-color", "#F1F1F3");
		$("#end").css("border-bottom-color", "#F1F1F3");

		if($('#optSched').is(':checked')){
			if ($('#input_01').val() == "" || $('#input_from').val() ==""){
				$('#txtError2').show();
			}else{
				goStep2();
			}
			
		}else{
			$('#input_01').val("");
			$('#input_from').val("");
			goStep2();
		}

		
	}else{
		$("#start").css("border-bottom-color", "red");
		$("#end").css("border-bottom-color", "red");
		$('#txtError1').show();
	}
	
}
function goStep2(){
	$('#txtError2').hide();
	calcRoute();
	GetValues();
	$('#pnlDetails').hide();
	$('#pnlConfirm').show();	
}
function Step3(){
	if ($('#txtPhone').val() != "" ){
		//go
		$('#txtError3').hide();				
		SaveServiceFromWeb();
	}else{
		//required phone value
		$('#txtError3').show();
	}
}
function SaveServiceFromWeb(){
  
  
  // $("#pnlSentMessage").hide()
  var strTime;
  var strHour;
  var strFrom;
  var strTo;
  var fare = $("#TotalFare").val();
  if (CarSelection == 'van'){
  	fare = parseInt(fare) + 100;
  }
	if (ServiceType == 1){
		document.getElementById("TotalFare").value = fare - 5
 		strTime = $("[name='date_submit']").val();
 		strHour = $("#txtHourAirport").val();
 		if($('#optTo').is(':checked')){
			strFrom = "El Aeropuerto";
			strTo = $('#txtFullAddress').val() + ", " + $('#ddlDistritos').val();
			
		}else{
			strTo = "El Aeropuerto";
			strFrom = $('#txtFullAddress').val() + ", " + $('#ddlDistritos').val();
		}
	}else{
		document.getElementById("TotalFare").value = fare - 2
 		strTime = $("[name='txtDate_submit']").val();
 		strHour = $("#input_from").val();
 		strFrom = $("#start").val();
 		strTo = $("#end").val();

	}
	
  $.ajax({
          type: "POST",
          url: 'ajaxSaveService.php',
          data: {		
          	UserID : $("#UserID").val(),	
			Source: '0',
			CouponCode: '0',
			FromAddress  : strFrom,
			EndAddress   : strTo,	
			CarType		: CarSelection,
			FirstName   : $("#FirstName").val(),			
			Observations : $("#txtAround").val(),
			KM           : $("#TotalKM").val(),
			Fare         : $("#TotalFare").val(),
			DatePickup   : strTime,
			HourPickup   : strHour,			
			Telephone    : $("#txtPhone").val()
          },
          success: function(data)
          {
          	
            $('#btnSave').prop( "disabled", false );        
            if (data === "0"){
            	$('#pnlDetails').hide();
				$('#pnlConfirm').hide();
              	$('#pnlSaved').show();

            }
          }
      });
	}

(function($){
	$('[data-toggle="tooltip"]').tooltip();
	/* ---------------------------------------------- /*
	 * Preloader
	/* ---------------------------------------------- */

	$(window).load(function() {
		$('.loader').fadeOut();
		$('.page-loader').delay(350).fadeOut('slow');
	});

	$(document).ready(function() {



		/* ---------------------------------------------- /*
		 * Initialization General Scripts for all pages
		/* ---------------------------------------------- */

		var moduleHero = $('.module-hero'),
			module     = $('.module-hero, .module, .module-small'),
			navbar     = $('.navbar-custom'),
			navHeight  = navbar.height(),
			worksgrid  = $('#works-grid'),
			width      = Math.max($(window).width(), window.innerWidth),
			mobileTest;

		if(/Android|webOS|iPhone|iPad|iPod|BlackBerry|IEMobile|Opera Mini/i.test(navigator.userAgent)) {
			mobileTest = true;
		}

		buildModuleHero(moduleHero);
		navbarCheck(navbar);
		navbarAnimation(navbar, moduleHero, navHeight);
		navbarSubmenu(width);
		hoverDropdown(width, mobileTest);

		$(window).resize(function() {
			var width = Math.max($(window).width(), window.innerWidth);
			buildModuleHero(moduleHero);
			hoverDropdown(width);
		});

		$(window).scroll(function() {
			effectsModuleHero(moduleHero, this);
			navbarAnimation(navbar, moduleHero, navHeight);
		});

		/* ---------------------------------------------- /*
		 * Set module backgrounds
		/* ---------------------------------------------- */

		module.each(function(i) {
			if ($(this).attr('data-background')) {
				$(this).css('background-image', 'url(' + $(this).attr('data-background') + ')');
			}
		});

		/* ---------------------------------------------- /*
		 * Full height module
		/* ---------------------------------------------- */

		function buildModuleHero(moduleHero) {
			if (moduleHero.length > 0) {
				if (moduleHero.hasClass('module-full-height')) {
					moduleHero.height($(window).height());
				} else {
					moduleHero.height($(window).height() * 0.85);
				}
			}
		};

		/* ---------------------------------------------- /*
		 * Hero module parallax, fade
		/* ---------------------------------------------- */

		function effectsModuleHero(moduleHero, scrollTopp) {
			if (moduleHero.length > 0) {
				var homeSHeight = moduleHero.height();
				var topScroll = $(document).scrollTop();
				if ((moduleHero.hasClass('module-parallax')) && ($(scrollTopp).scrollTop() <= homeSHeight)) {
					moduleHero.css('top', (topScroll * 0.55));
				}
				if (moduleHero.hasClass('module-fade') && ($(scrollTopp).scrollTop() <= homeSHeight)) {
					moduleHero.css('opacity', (1 - topScroll/moduleHero.height() * 1));
				}
			}
		};

		/* ---------------------------------------------- /*
		 * Hero slider setup
		/* ---------------------------------------------- */

		if(mobileTest != true) {
			directionNav = true;
		} else {
			directionNav = false;
		}

		if ($('.hero-slider').length > 0) {
			$('.hero-slider').flexslider({
				animation: 'fade',
				animationSpeed: 1000,
				animationLoop: true,
				directionNav: directionNav,
				prevText: '',
				nextText: '',
				start: function(slider) {
					heroSliderLight();
				},
				before: function(slider) {
					if(mobileTest != true) {
						$('.hs-caption').fadeOut().animate({top:'-80px'},{queue:false, easing: 'swing', duration: 700});
						slider.slides.eq(slider.currentSlide).delay(500);
						slider.slides.eq(slider.animatingTo).delay(500);
					}
				},
				after: function(slider) {
					heroSliderLight();
					if(mobileTest != true) {
						$('.hs-caption').fadeIn().animate({top:'0'},{queue:false, easing: 'swing', duration: 700});
					}
				},
				useCSS: true
			});
		};

		/* ---------------------------------------------- /*
		 * Change color on light slide
		/* ---------------------------------------------- */

		function heroSliderLight() {
			if ($('li.bg-light').hasClass('flex-active-slide')) {
				navbar.addClass('nabar-dark');
				$('.hero-slider').addClass('hero-slider-dark');
			} else {
				navbar.removeClass('nabar-dark');
				$('.hero-slider').removeClass('hero-slider-dark');
			}
		}

		/* ---------------------------------------------- /*
		 * Hero slider pause on scroll
		/* ---------------------------------------------- */

		if ($('.hero-slider').length > 0) {
			$(window).scroll(function() {
				var st = $(window).scrollTop();
				if (st > 0) {
					$('.hero-slider').flexslider('pause');
				}
			});
		}

		/* ---------------------------------------------- /*
		 * Transparent navbar animation
		/* ---------------------------------------------- */

		function navbarCheck() {
			if (navbar.length > 0 && navbar.hasClass('navbar-transparent')) {
				navbatTrans = true;
			} else {
				navbatTrans = false;
			}
		}

		function navbarAnimation(navbar, moduleHero, navHeight) {
			var topScroll = $(window).scrollTop();
			if (navbar.length > 0 && navbatTrans != false) {
				if (topScroll >= navHeight) {
					navbar.removeClass('navbar-transparent');
					$('#imgLogo-w').hide();
					$('#imgLogo').show();
				} else {
					navbar.addClass('navbar-transparent');
					$('#imgLogo').hide();	
					$('#imgLogo-w').show();
				}
			}
		};

		/* ---------------------------------------------- /*
		 * Navbar collapse on click
		/* ---------------------------------------------- */

		$(document).on('click','.navbar-collapse.in',function(e) {
			if ($(e.target).is('a') && $(e.target).attr('class') != 'dropdown-toggle') {
				$(this).collapse('hide');
			}
		});

		/* ---------------------------------------------- /*
		 * Navbar submenu
		/* ---------------------------------------------- */

		function navbarSubmenu(width) {
			if (width > 767) {
				$('.navbar-custom .navbar-nav > li.dropdown').hover(function() {
					var MenuLeftOffset  = $('.dropdown-menu', $(this)).offset().left;
					var Menu1LevelWidth = $('.dropdown-menu', $(this)).width();
					if (width - MenuLeftOffset < Menu1LevelWidth * 2) {
						$(this).children('.dropdown-menu').addClass('leftauto');
					} else {
						$(this).children('.dropdown-menu').removeClass('leftauto');
					}
					if ($('.dropdown', $(this)).length > 0) {
						var Menu2LevelWidth = $('.dropdown-menu', $(this)).width();
						if (width - MenuLeftOffset - Menu1LevelWidth < Menu2LevelWidth) {
							$(this).children('.dropdown-menu').addClass('left-side');
						} else {
							$(this).children('.dropdown-menu').removeClass('left-side');
						}
					}
				});
			}
		};

		/* ---------------------------------------------- /*
		 * Navbar hover dropdown on desktop
		/* ---------------------------------------------- */

		function hoverDropdown(width, mobileTest) {
			if ((width > 767) && (mobileTest != true)) {
				$('.navbar-custom .navbar-nav > li.dropdown, .navbar-custom li.dropdown > ul > li.dropdown').removeClass('open');
				var delay = 0;
				var setTimeoutConst;
				$('.navbar-custom .navbar-nav > li.dropdown, .navbar-custom li.dropdown > ul > li.dropdown').hover(function() {
					var $this = $(this);
					setTimeoutConst = setTimeout(function() {
						$this.addClass('open');
						$this.find('.dropdown-toggle').addClass('disabled');
					}, delay);
				},
				function() {
					clearTimeout(setTimeoutConst);
					$(this).removeClass('open');
					$(this).find('.dropdown-toggle').removeClass('disabled');
				});
			} else {
				$('.navbar-custom .navbar-nav > li.dropdown, .navbar-custom li.dropdown > ul > li.dropdown').unbind('mouseenter mouseleave');
				$('.navbar-custom [data-toggle=dropdown]').not('.binded').addClass('binded').on('click', function(event) {
					event.preventDefault();
					event.stopPropagation();
					$(this).parent().siblings().removeClass('open');
					$(this).parent().siblings().find('[data-toggle=dropdown]').parent().removeClass('open');
					$(this).parent().toggleClass('open');
				});
			}
		};

		

	

		/* ---------------------------------------------- /*
		 * Post slider
		/* ---------------------------------------------- */

		// $('.post-images-slider').flexslider( {
		// 	animation: 'slide',
		// 	smoothHeight: true,
		// });

		/* ---------------------------------------------- /*
		 * Google Map
		/* ---------------------------------------------- */

	


		/* ---------------------------------------------- /*
		 * Progress bars, counters animations
		/* ---------------------------------------------- */

		$('.progress-bar').each(function(i) {
			$(this).appear(function() {
				var percent = $(this).attr('aria-valuenow');
				$(this).animate({'width' : percent + '%'});
				$(this).find('span').animate({'opacity' : 1}, 900);
				$(this).find('span').countTo({from: 0, to: percent, speed: 900, refreshInterval: 30});
			});
		});

		$('.counter-item').each(function(i) {
			$(this).appear(function() {
				var number = $(this).find('.counter-number').data('number');
				$(this).find('.counter-number span').countTo({from: 0, to: number, speed: 1200, refreshInterval: 30});
			});
		});

		/* ---------------------------------------------- /*
		 * WOW Animation When You Scroll
		/* ---------------------------------------------- */

		// wow = new WOW({
		// 	mobile: false
		// });
		// wow.init();

		/* ---------------------------------------------- /*
		 * Popup images
		/* ---------------------------------------------- */

		// $('a.popup').magnificPopup({
		// 	type: 'image',
		// 	gallery: {
		// 		enabled: true,
		// 		navigateByImgClick: true,
		// 		preload: [0,1]
		// 	},
		// 	image: {
		// 		titleSrc: 'title',
		// 		tError: 'The image could not be loaded.',
		// 	}
		// });

	

		/* ---------------------------------------------- /*
		 * A jQuery plugin for fluid width video embeds
		/* ---------------------------------------------- */

		// $('body').fitVids();

		/* ---------------------------------------------- /*
		 * Scroll Animation
		/* ---------------------------------------------- */

		$('.section-scroll').bind('click', function(e) {
			var anchor = $(this);
			$('html, body').stop().animate({
				scrollTop: $(anchor.attr('href')).offset().top
			}, 1000);
			e.preventDefault();
		});

		/* ---------------------------------------------- /*
		 * Scroll top
		/* ---------------------------------------------- */

		$(window).scroll(function() {
			if ($(this).scrollTop() > 100) {
				$('.scroll-up').fadeIn();
			} else {
				$('.scroll-up').fadeOut();
			}
		});

		$('a[href="#totop"]').click(function() {
			$('html, body').animate({ scrollTop: 0 }, 'slow');
			return false;
		});

	});

})(jQuery);