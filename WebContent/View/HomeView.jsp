<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<div class="sidenav">
		<label id="lblHome">Home</label>
		<hr>
		<label id="lblListing">User Listing</label> <label id="lblMaintenance">User
			Maintenance</label> <label id="lblInventory">Unit Inventory</label> <label
			id="lblAssignment">Unit Assignment</label> <label id="lblPeripherals">Peripherals</label>
	</div>

	<div id="mainContent"></div>
</body>
<script>
	$("lblHome").observe("click", function() {
		goNav("home");
	})

	$("lblListing").observe("click", function() {
		goNav("listing");
	})

	$("lblMaintenance").observe("click", function() {
		goNav("maintenance");
	})

	$("lblInventory").observe("click", function() {
		goNav("inventory");
	})

	$("lblAssignment").observe("click", function() {
		goNav("assignment");
	})

	function goNav(dest) {
		
		var path = "${pageContext.request.contextPath}";
		
		
		
	}
</script>
</html>