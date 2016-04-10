<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%@ taglib uri="/struts-bootstrap-tags" prefix="sb" %>

<footer class="container-fluid">
	<nav class="navbar navbar-default navbar-fixed-bottom">
		<div class="span12 text-center">
			SocialMe &copy; 2016
		</div>
	</nav>
</footer>

<!-- 
It's recommended to add JQuery to the bottom of a page, which is why it's in the Footer.

See the answer from awvidmer - they had the same problem as I do so this is the solution:
http://stackoverflow.com/questions/11533542/twitter-bootstrap-add-active-class-to-li
 -->
 
 <script type="text/javascript">
$(document).ready(function() {
	  var rawhref = window.location.href;	  
	  var newpage = ((window.location.href.match(/([^\/]*)\/?$/)[1]));
	  
	  if ((rawhref.indexOf('showProfile') != -1) || (rawhref.indexOf('showFriend') != -1) || (rawhref.indexOf('showEdit') != -1)) {
		newpage = "Profile"
	  }
	  else if (rawhref.indexOf('showFeed') != -1){
		newpage = "Feed"
	  }
	  else if (rawhref.indexOf('showDirectory') != -1 || (rawhref.indexOf('iterateDirectory') != -1)){
		newpage = "Directory"
	  }
	  else if (rawhref.indexOf('showSearch') != -1 || (rawhref.indexOf('search') != -1)){
		newpage = "Search"
	  }
	  
	  $(".nav li a:contains('" + newpage + "')").parent().addClass('active');
	});	
</script>
