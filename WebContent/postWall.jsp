<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<script type="text/javascript" src="js/jquery-1.4.2.min.js"></script>
	<script type="text/javascript">
			var auto = setInterval(	function ()
			{
				$('#polling').load('postWall_logic.jsp').slideDown("slow");
			}, 1000); // refresh in milliseconds ()
	</script>	
</head>

<body>
<br><br>
<div id="polling"></div>

</body>

</html>