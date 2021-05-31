<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Holiday - templatemo</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath }/template/css/styles.css">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
	<script type="text/javascript" src="${pageContext.request.contextPath }/template/js/jquery-1.11.2.min.js"></script>      		<!-- jQuery -->
  	<script type="text/javascript" src="${pageContext.request.contextPath }/template/js/moment.js"></script>							<!-- moment.js -->
	<script type="text/javascript" src="${pageContext.request.contextPath }/template/js/bootstrap.min.js"></script>					<!-- bootstrap js -->
	<script type="text/javascript" src="${pageContext.request.contextPath }/template/js/bootstrap-datetimepicker.min.js"></script>	<!-- bootstrap date time picker js, http://eonasdan.github.io/bootstrap-datetimepicker/ -->
	<script type="text/javascript" src="${pageContext.request.contextPath }/template/js/jquery.flexslider-min.js"></script>

   	<script type="text/javascript" src="${pageContext.request.contextPath }/template/js/templatemo-script.js"></script>      		<!-- Templatemo Script -->
	<script>
		// HTML document is loaded. DOM is ready.
		$(function() {

			$('#hotelCarTabs a').click(function (e) {
			  e.preventDefault()
			  $(this).tab('show')
			})

        	$('.date').datetimepicker({
            	format: 'MM/DD/YYYY'
            });
            $('.date-time').datetimepicker();

			// https://css-tricks.com/snippets/jquery/smooth-scrolling/
		  	$('a[href*=#]:not([href=#])').click(function() {
			    if (location.pathname.replace(/^\//,'') == this.pathname.replace(/^\//,'') && location.hostname == this.hostname) {
			      var target = $(this.hash);
			      target = target.length ? target : $('[name=' + this.hash.slice(1) +']');
			      if (target.length) {
			        $('html,body').animate({
			          scrollTop: target.offset().top
			        }, 1000);
			        return false;
			      }
			    }
		  	});
		});
		
		$(window).load(function() {	  		

		    $('.flexslider').flexslider({
			    controlNav: false
		    });


	  	});
	</script>

  <link href='http://fonts.googleapis.com/css?family=Open+Sans:400,300,400italic,600,700' rel='stylesheet' type='text/css'>
  <link href="${pageContext.request.contextPath }/template/css/font-awesome.min.css" rel="stylesheet">
  <link href="${pageContext.request.contextPath }/template/css/bootstrap.min.css" rel="stylesheet">
  <link href="${pageContext.request.contextPath }/template/css/bootstrap-datetimepicker.min.css" rel="stylesheet">  
  <link href="${pageContext.request.contextPath }/template/css/flexslider.css" rel="stylesheet">
  <link href="${pageContext.request.contextPath }/template/css/templatemo-style.css" rel="stylesheet">
  </head>
<body class="tm-gray-bg">
	<tiles:insertAttribute name="head"></tiles:insertAttribute>
	<tiles:insertAttribute name="banner"></tiles:insertAttribute>
	<tiles:insertAttribute name="home2"></tiles:insertAttribute>
	<tiles:insertAttribute name="foot"></tiles:insertAttribute>
</body>
</html>