<html>
<head>
</head>
<body>
	<div class="sidenav">
		<label id="lblHome">Home</label>
		<hr>
		<label id="lblListing">User Listing</label> <label
			id="lblMaintenance">User Maintenance</label> <label
			id="lblInventory">Unit Inventory</label> <label id="lblAssignment">Unit
			Assignment</label> <label id="lblPeripherals">Peripherals</label>
			<label id="lblAssignee">Assignee Listing</label>
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
	
	$("lblPeripherals").observe("click", function() {
		goNav("peripherals");
	})
	
	$("lblAssignee").observe("click", function() {
		goNav("assignee");
	})

	function goNav(dest) {

		var path = "${pageContext.request.contextPath}";
		
		new Ajax.Request(path + "/main", {
			method : "post",
			parameters : {
				action : dest
			},
			onComplete : function(response) {
				$("mainContent").update(response.responseText);
			}
		}) 
	}
</script>
</html>