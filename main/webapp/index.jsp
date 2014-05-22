<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">

<title>Muse - The Radio App</title>

<!-- Bootstrap core CSS -->
<link href="css/bootstrap.css" rel="stylesheet">

<!-- Add custom CSS here -->
<link href="css/stylish-portfolio.css" rel="stylesheet">
<link href="font-awesome/css/font-awesome.min.css" rel="stylesheet">
<link type="text/css" href="/skin/jplayer.blue.monday.css"
	rel="stylesheet" />
<link rel="stylesheet" type="text/css" href="css/jquery.gritter.css" />
</head>

<body>

	<!-- Side Menu -->
	<a id="menu-toggle" href="#" class="btn btn-primary btn-lg toggle"><i
		class="fa fa-bars"></i></a>
	<div id="sidebar-wrapper">
		<ul class="sidebar-nav">
			<a id="menu-close" href="#"
				class="btn btn-default btn-lg pull-right toggle"><i
				class="fa fa-times"></i></a>
			<li class="sidebar-brand"><a href="/">Muse</a></li>
			<li><a href="#top">Home</a></li>
			<li><a href="#about">About</a></li>
			<li><a href="#services">Services</a></li>
			<li><a href="#stations">Stations</a></li>
			<li><a href="#github">Code</a></li>
			<li><a href='<%=request.getAttribute("authUrl")%>'>MyMuse</a></li>
			<li><br></li>
		</ul>
		<div style="padding-left: 30px; padding-top: 300px;">
			<div id="jquery_jplayer_1" class="jp-jplayer"></div>

			<div id="jp_container_1" class="jp-audio-stream">
				<div class="jp-type-single">
					<div class="jp-gui jp-interface">

						<ul class="jp-controls">
							<li><a href="javascript:;" class="jp-play" tabindex="1">play</a></li>
							<li><a href="javascript:;" class="jp-pause" tabindex="1">pause</a></li>
							<li><a href="javascript:;" class="jp-mute" tabindex="1"
								title="mute">mute</a></li>
							<li><a href="javascript:;" class="jp-unmute" tabindex="1"
								title="unmute">unmute</a></li>
						</ul>
						<div class="jp-volume-bar">
							<div class="jp-volume-bar-value"></div>
						</div>
					</div>
					<div class="jp-details">
						<ul>
							<li><span class="jp-title"></span></li>
						</ul>
					</div>
					<div class="jp-no-solution">
						<span>Update Required</span> To play the media you will need to
						either update your browser to a recent version or update your <a
							href="http://get.adobe.com/flashplayer/" target="_blank">Flash
							plugin</a>.
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- /Side Menu -->

	<!-- Full Page Image Header Area -->
	<div id="top" class="header">
		<div class="vert-text">
			<h1>Muse</h1>
			<h3>
				The <em>Only</em> App You Need For <em>Your</em> Music Needs
			</h3>
			<a href="#about" class="btn btn-default btn-lg">Find Out More</a>
		</div>
	</div>
	<!-- /Full Page Image Header Area -->

	<!-- Intro -->
	<div id="about" class="intro">
		<div class="container">
			<div class="row">
				<div class="col-md-6 col-md-offset-3 text-center">
					<h2>Muse is a radio app that streams music you like, wherever
						you are!</h2>
					<!-- 					<p class="lead"> -->
					<!-- 						This template really has it all. It's up to you to customize it to -->
					<!-- 						your liking! It features some fresh photography courtesy of <a -->
					<!-- 							target="_blank" href="http://join.deathtothestockphoto.com/">Death -->
					<!-- 							to the Stock Photo</a>. -->
					<!-- 					</p> -->
				</div>
			</div>
		</div>
	</div>
	<!-- /Intro -->

	<!-- Services -->
	<div id="services" class="services">
		<div class="container">
			<div class="row">
				<div class="col-md-4 col-md-offset-4 text-center">
					<h2>Features</h2>
					<hr>
				</div>
			</div>
			<div class="row">
				<div class="col-md-4 text-center">
					<div class="service-item">
						<i class="service-icon fa fa-music"></i>
						<h4>Huge Collection</h4>
						<p>Our music collection is phenomenal and we keep adding new
							stations every day</p>
					</div>
				</div>
				<div class="col-md-4 text-center">
					<div class="service-item">
						<i class="service-icon fa fa-meh-o"></i>
						<h4>Mood Detection</h4>
						<p>To lazy to search for radio station. Our MyMuse features
							automatically detects your mood, activity from your social
							profiles and chooses a radio station to your liking.</p>
					</div>
				</div>
				<div class="col-md-4 text-center">
					<div class="service-item">
						<i class="service-icon fa fa-twitter"></i>
						<h4>Twitter Integration</h4>
						<p>Muse has support for OAuth login. So you don't have to
							login time and again.</p>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- /Services -->

	<!-- Callout -->
	<div class="callout">
		<div class="vert-text">
			<h1>The perfect radio app</h1>
		</div>
	</div>
	<!-- /Callout -->

	<!-- Portfolio -->
	<div id="stations" class="portfolio">
		<div id="stations2" class="container">
			<div class="row">
				<div class="col-md-4 col-md-offset-4 text-center">
					<h2>
						<a href="#">Radio Stations</a>
					</h2>
					<hr>
				</div>
			</div>
		</div>
	</div>
	<!-- /Portfolio -->

	<!-- github -->
	<div id="github" class="call-to-action">
		<div class="container">
			<div class="row">
				<div class="col-md-6 col-md-offset-3 text-center">
					<h3>The code to this web app can be found at</h3>
					<a href="https://github.com/Walliee/Muse" target="_blank"
						class="btn btn-lg btn-primary"><i class="fa fa-github"></i>
						GitHub</a>
				</div>
			</div>
		</div>
	</div>
	<!-- /github -->



	<!-- Footer -->
	<footer>
		<div class="container">
			<div class="row">
				<div class="col-md-6 col-md-offset-3 text-center">
					<!-- 					<ul class="list-inline"> -->
					<!-- 						<li><i class="fa fa-facebook fa-3x"></i></li> -->
					<!-- 						<li><i class="fa fa-twitter fa-3x"></i></li> -->
					<!-- 						<li><i class="fa fa-dribbble fa-3x"></i></li> -->
					<!-- 					</ul> -->
					<div class="top-scroll">
						<a href="#top"><i class="fa fa-circle-arrow-up scroll fa-4x"></i></a>
					</div>
					<hr>
					<p>Copyright &copy; 2013</p>
				</div>
			</div>
		</div>
	</footer>
	<!-- /Footer -->

	<!-- JavaScript -->
	<script src="http://code.jquery.com/jquery-1.11.0.min.js"
		type="text/javascript"></script>
	<script src="js/bootstrap.js" type="text/javascript"></script>
	<script type="text/javascript" src="/js/jquery.jplayer.min.js"></script>
	<script type="text/javascript" src="js/jquery.gritter.min.js"></script>

	<script type="text/javascript">
		//<![CDATA[
		$(document)
				.ready(

						function() {

							$.getJSON('/list', function(data) {
												for (var i = 0; i < data.length; i++) {
													var str = "";
													if (i % 2 == 0) {
														str1 = str
																.concat('<div class="row">');
													}
													str = str
															.concat('<div class="col-lg-6">');
													str = str
															.concat('<div class="panel panel-default">');
													var station = data[i];
													str = str
															.concat('<div class="panel-heading">');
													str = str
															.concat('<h3 class="panel-title">'
																	+ station.propertyMap.name
																	+ '</h3>');
													str = str.concat('</div>');
													str = str
															.concat('<div class="panel-body"><img src=');
													str = str
															.concat(station.propertyMap.img);
													str = str.concat('><br>');
													str = str
															.concat(station.propertyMap.description);
													str = str
															.concat('<br><br>');
													var tagsString = station.propertyMap.tag;
													var tags = tagsString
															.split(" ");
													for (var j = 0; j < tags.length; j++) {
														str = str
																.concat('<span class="badge">');
														str = str
																.concat(tags[j]);
														str = str
																.concat('</span> ');
													}
													str = str
															.concat('<br><br><button type="button" class="btn btn-default btn-md playStation" value="');
													str = str
															.concat(station.propertyMap.url);
													str = str.concat('">');
													str = str
															.concat('<span class="glyphicon glyphicon-play"></span> Play');
													str = str
															.concat('</button>');
													str = str.concat('</div>');
													str = str.concat('</div>');
													str = str.concat('</div>');
													if (i % 2 == 0) {
														str = str
																.concat('</div>');
													}
													$('#stations2').append(str);
												}
											});

							var stream1 = {
								title : "100-HIT-radio",
								mp3 : "http://listen.radionomy.com/100-HIT-radio"
							}, ready1 = false;

							$("#jquery_jplayer_1")
									.jPlayer(
											{
												ready : function(event) {
													ready1 = true;
													$(this).jPlayer("setMedia",
															stream1);
													$(this).jPlayer('play');
													$.gritter
															.add({
																title : 'Welcome Guest',
																text : 'Now Playing 100-HIT-radio',
																sticky : false,
																time : 4000,
																class_name : 'my-class',
																position : 'top-left'

															});
												},
												pause : function() {
													$(this).jPlayer(
															"clearMedia");
													$(".btn-success")
															.html(
																	"<span class=\"glyphicon glyphicon-play\"></span> Play");
													$(".btn-success")
															.removeClass(
																	"btn-success")
															.addClass(
																	"btn-default");
												},
												error : function(event) {
													if (ready1
															&& event.jPlayer.error.type === $.jPlayer.error.URL_NOT_SET) {
														// Setup the media stream again and play it.
														$(this)
																.jPlayer(
																		"setMedia",
																		stream1)
																.jPlayer("play");
													}
												},
												swfPath : "../js",
												supplied : "mp3",
												preload : "none",
												wmode : "window",
												keyEnabled : true
											});

							$(document)
									.on(
											'click',
											'.playStation',
											function(e) {
												var station = $(this).closest(
														'.panel').children(
														'.panel-heading')
														.text();
												var url = $(this).attr("value");
												var stream = {
													title : station,
													mp3 : url
												}, ready1 = false;
												$("#jquery_jplayer_1").jPlayer(
														"setMedia", stream)
														.jPlayer("play");
												$(".btn-success")
														.html(
																"<span class=\"glyphicon glyphicon-play\"></span> Play");
												$(".btn-success")
														.removeClass(
																"btn-success")
														.addClass("btn-default");
												$(this)
														.removeClass(
																"btn-default")
														.addClass("btn-success");
												$(this)
														.html(
																"<span class=\"glyphicon glyphicon-play\"></span> Playing");
												$.gritter.add({
													title : 'Station Changed',
													text : 'Now Playing '
															+ station,
													sticky : false,
													time : 4000,
													class_name : 'my-class',
													position : 'top-left',

												});
											});
						});
		//]]>
	</script>




	<!-- Custom JavaScript for the Side Menu and Smooth Scrolling -->
	<script type="text/javascript">
		$("#menu-close").click(function(e) {
			e.preventDefault();
			$("#sidebar-wrapper").toggleClass("active");
		});
	</script>
	<script type="text/javascript">
		$("#menu-toggle").click(function(e) {
			e.preventDefault();
			$("#sidebar-wrapper").toggleClass("active");
		});
	</script>
	<script type="text/javascript">
		$(function() {
			$('a[href*=#]:not([href=#])')
					.click(
							function() {
								if (location.pathname.replace(/^\//, '') == this.pathname
										.replace(/^\//, '')
										|| location.hostname == this.hostname) {

									var target = $(this.hash);
									target = target.length ? target
											: $('[name=' + this.hash.slice(1)
													+ ']');
									if (target.length) {
										$('html,body').animate({
											scrollTop : target.offset().top
										}, 1000);
										return false;
									}
								}
							});
		});
	</script>

</body>

</html>
