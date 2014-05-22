<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ page import="com.google.appengine.api.blobstore.BlobstoreService" %>
<%@ page import="com.google.appengine.api.blobstore.BlobstoreServiceFactory" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Map" %>
<%@ page import="com.google.appengine.api.blobstore.BlobKey" %>
<%@ page import="com.google.appengine.api.datastore.DatastoreService" %>
<%@ page import="com.google.appengine.api.datastore.DatastoreServiceFactory" %>
<%@ page import="com.google.appengine.api.datastore.Query" %>
<%@ page import="com.google.appengine.api.datastore.FetchOptions" %>
<%@ page import="com.google.appengine.api.datastore.Entity" %>
<%@ page import="com.google.appengine.api.datastore.Query.FilterPredicate" %>
<%@ page import="com.google.appengine.api.blobstore.UploadOptions" %>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">

<title>Muse - The Radio App</title>

<!-- Bootstrap core CSS -->
<link href="css/bootstrap.css" rel="stylesheet">
<link type="text/css" href="/skin/jplayer.blue.monday.css" rel="stylesheet" />
<link href="css/stylish-portfolio.css" rel="stylesheet">
<link href="font-awesome/css/font-awesome.min.css" rel="stylesheet">
<script src="http://code.jquery.com/jquery-1.11.0.min.js" type="text/javascript"></script>
<script type="text/javascript" src="/js/jquery.jplayer.js"></script>
<script type="text/javascript" src="/js/jplayer.playlist.js"></script>
<script src="js/bootstrap.js" type="text/javascript"></script>
<link rel="stylesheet" type="text/css" href="css/jquery.gritter.css" />
<script type="text/javascript" src="js/jquery.gritter.min.js"></script>

</head>
<body>
	
	<% 
	DatastoreService datastore = DatastoreServiceFactory.getDatastoreService();
	Query query = new Query("Uploads");
	FilterPredicate filter = new FilterPredicate("userId", Query.FilterOperator.EQUAL, request.getSession().getAttribute("userId").toString());
	query.setFilter(filter);
	List<Entity> greetings = datastore.prepare(query).asList(FetchOptions.Builder.withLimit(100));
	BlobstoreService blobstoreService = BlobstoreServiceFactory.getBlobstoreService();
	%>
	
   <!-- Side Menu -->
	<a id="menu-toggle" href="#" class="btn btn-primary btn-lg toggle"><i
		class="fa fa-bars"></i></a>
	<div id="sidebar-wrapper">
		<div>
			<ul class="sidebar-nav">
				<a id="menu-close" href="#"
					class="btn btn-default btn-lg pull-right toggle"><i
					class="fa fa-times"></i></a>
				<li class="sidebar-brand"><a href="#">Muse</a></li>
				<li><a href="#top">Home</a></li>
				<li><a href="/home#about">About</a></li>
				<li><a href="/home#services">Services</a></li>
				<li><a href="/home#stations">Stations</a></li>
				<li><a href="/home#github">Code</a></li>
				<li><a href='/home'>MyMuse</a></li>
<!-- 				<li><a href='/music.jsp'>Music</a></li> -->
				<li><br></li>
			</ul>
		</div>
		<div style="padding-left: 10px; padding-top: 350px;"
			class="text-center">
			<img src='<%=request.getSession().getAttribute("profileImage") %>'
				width="75" alt="">
			<p style="color: white">
				Hi
				<%=request.getSession().getAttribute("user") %>,
			</p>
		</div>
	</div>
	<!-- /Side Menu -->
	<div id="top" class="header">
	<div class="container">
	
		<div class="row">
			<div class="col-xs-4 col-xs-offset-4">
				<div id="jplayer">
					<div id="jquery_jplayer_1" class="jp-jplayer"></div>
				
					<div id="jp_container_1" class="jp-audio">
						<div class="jp-type-playlist">
							<div class="jp-gui jp-interface">
								<ul class="jp-controls">
									<li><a href="javascript:;" class="jp-previous" tabindex="1">previous</a></li>
									<li><a href="javascript:;" class="jp-play" tabindex="1">play</a></li>
									<li><a href="javascript:;" class="jp-pause" tabindex="1">pause</a></li>
									<li><a href="javascript:;" class="jp-next" tabindex="1">next</a></li>
									<li><a href="javascript:;" class="jp-stop" tabindex="1">stop</a></li>
									<li><a href="javascript:;" class="jp-mute" tabindex="1" title="mute">mute</a></li>
									<li><a href="javascript:;" class="jp-unmute" tabindex="1" title="unmute">unmute</a></li>
									<li><a href="javascript:;" class="jp-volume-max" tabindex="1" title="max volume">max volume</a></li>
								</ul>
								<div class="jp-progress">
									<div class="jp-seek-bar">
										<div class="jp-play-bar"></div>
				
									</div>
								</div>
								<div class="jp-volume-bar">
									<div class="jp-volume-bar-value"></div>
								</div>
								<div class="jp-current-time"></div>
								<div class="jp-duration"></div>
								<ul class="jp-toggles">
									<li><a href="javascript:;" class="jp-shuffle" tabindex="1" title="shuffle">shuffle</a></li>
									<li><a href="javascript:;" class="jp-shuffle-off" tabindex="1" title="shuffle off">shuffle off</a></li>
									<li><a href="javascript:;" class="jp-repeat" tabindex="1" title="repeat">repeat</a></li>
									<li><a href="javascript:;" class="jp-repeat-off" tabindex="1" title="repeat off">repeat off</a></li>
									<li><a href="javascript:;" id="play" tabindex=1 title="playlist">Playlist</a></li>
								</ul>
							</div>
							<div id="playlist" class="jp-playlist">
								<ul>
									<li></li>
								</ul>
							</div>
							<div class="jp-no-solution">
								<span>Update Required</span>
								To play the media you will need to either update your browser to a recent version or update your <a href="http://get.adobe.com/flashplayer/" target="_blank">Flash plugin</a>.
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="col-xs-4 col-xs-offset-4">
				<form id="uplodform" class="form-inline" enctype="multipart/form-data" method="post" action="<%= BlobstoreServiceFactory.getBlobstoreService().createUploadUrl("/upload", UploadOptions.Builder.withGoogleStorageBucketName("muse")) %>">
					<div class="form-group">
				   		<div class="col-xs-10">
							<input class="btn btn-default" type="file" name="<%=request.getSession().getAttribute("userId") %>" size="30" />
						</div>
						<div class="col-xs-2">
							<input id="upload" class="btn btn-primary" type="submit" />
						</div>
					</div>
				</form>
			</div>
			<div class="col-xs-4 col-xs-offset-4">
				<a data-toggle="modal" href="#myModal" class="btn btn-primary"><i class="fa fa-twitter"></i> Share</a>
			</div>
		</div>
		
		<div id="stations2" class="container">
			<div class="row">
				<div class="col-md-4 col-md-offset-4 text-center">
					<h2>
						<a href="#">Songs</a>
					</h2>
					<hr>
				</div>
			</div>
	<% int i=0; %>		
	<% for (Entity greeting : greetings) { %> 
	<%if (i % 3 == 0) {
		out.println("<div class=\"row\">");
		} %>
	<% out.println("<div class=\"col-lg-4\">"); %>
	<% out.println("<div class=\"panel panel-default\" data-id=" + i + ">"); %>
	<% out.println("<div class=\"panel-heading\">"); %>
	<% out.println("<h3 class=\"panel-title\"><i class=\"fa fa-music\"></i>  " + greeting.getProperty("filename").toString() + "</h3></div></div></div>" );%>	
	<%if (i % 3 == 2) {
		out.println("</div>");
		} %> 
	<% i++; } %>
		</div>
	</div>
		
	
	</div>

	<div class="modal fade" id="myModal">
		<div class="modal-dialog">
	      <div class="modal-content">
	        <div class="modal-header">
	          <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
	          <h4 class="modal-title">Tweet your song</h4>
	        </div>
	        <div class="modal-body">
	          <form class="form-horizontal">
				<fieldset>
				  <div class="col-md-12">                     
				    <textarea id="tweettext" class="form-control" id="textarea" name="textarea">Now Playing</textarea>
				  </div>
				</fieldset>
				</form>
	        </div>
	        <div class="modal-footer">
	          <button id="cancel" name="cancel" class="btn btn-default" data-dismiss="modal" aria-hidden="true">Cancel</button>
	           <button id="tweet" name="tweet" class="btn btn-primary">Tweet</button>
	        </div>
	      </div>
	    </div>
	</div>



	<script type="text/javascript">
		//<![CDATA[
		           var myPlaylist;
		$(document).ready(function(){
		
		myPlaylist = new jPlayerPlaylist({
				jPlayer: "#jquery_jplayer_1",
				cssSelectorAncestor: "#jp_container_1"
			}, [
	
	<% for (Entity greeting : greetings) { %> 
	<% out.print("{ title:\"" + greeting.getProperty("filename").toString() +"\", mp3: \"/serve?blob-key=" + greeting.getProperty("blobKey").toString() + "\"},");%> 
	<% } %>
	], {
				swfPath: "../js",
				supplied: "mp3",
				wmode: "window",
				smoothPlayBar: true,
				keyEnabled: true
			});
		$("#playlist").hide();
		});
		//]]>
		
		$("#play").click(function(){
			$("#playlist").toggle();
		});
		
		$("#upload").click(function(){
			$("#uploadform").submit(function() {
				var url = "<%= BlobstoreServiceFactory.getBlobstoreService().createUploadUrl("/upload", UploadOptions.Builder.withGoogleStorageBucketName("muse")) %>";
				
				$.ajax({
					type: "POST",
					url: url,
					data: $("#uploadform").serialize(),
					success: function(data) {
						myPlayList.add(data);
					}
				});
			});
		});

		jQuery("#jquery_jplayer_1").bind(jQuery.jPlayer.event.pause, function (event) {
			$(".panel-success").removeClass("panel-success").addClass("panel-default");
		});
		
		var nowPlaying;
		jQuery("#jquery_jplayer_1").bind(jQuery.jPlayer.event.play, function (event)
			 	   {   
			        var current         = myPlaylist.current,
			        playlist        = myPlaylist.playlist;
			        jQuery.each(playlist, function (index, obj){
			            if (index == current){
			                    nowPlaying = obj.title;
			                    $("#tweettext").val('');
			                    $("#tweettext").val('Now Playing ' + nowPlaying + ' #Muse #NowPlaying');
			                    $.gritter
								.add({
									title : 'Now Playing',
									text : nowPlaying,
									sticky : false,
									time : 4000,
									class_name : 'my-class',
									position : 'top-left'

								});

			            } // if condition end
			        });
			    });
		
		$(".panel").click(function() {
			var id = this.getAttribute('data-id');
			$(".panel-success").removeClass("panel-success").addClass("panel-default");
			$(this).removeClass("panel-default").addClass("panel-success");
			myPlaylist.play(id);
		});
		
		$("#tweet").click(function(){
			var tweettext2 = $("#tweettext").val();
			
			$.ajax({
				  type: "POST",
				  url: "/tweet",
				  data: { tweet: tweettext2},
				  beforeSend: function(){
					  $('#myModal').modal('hide');
					   },
				success: function() {
					$.gritter
					.add({
						title : 'Tweet posted',
						text : tweettext2,
						sticky : false,
						time : 4000,
						class_name : 'my-class',
						position : 'top-left'

					});
				  }
				}); 
		});

		$("#menu-close").click(function(e) {
			e.preventDefault();
			$("#sidebar-wrapper").toggleClass("active");
		});

		$("#menu-toggle").click(function(e) {
			e.preventDefault();
			$("#sidebar-wrapper").toggleClass("active");
		});

	
		</script>

</body>
</html>
