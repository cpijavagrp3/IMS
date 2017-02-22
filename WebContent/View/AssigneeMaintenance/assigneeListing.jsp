<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<html>
<head>
<script src="${pageContext.request.contextPath}/JS/prototype.js"></script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/Css/style.css">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Assignee Listing</title>
</head>
<body>
<div id="mainContent">
	<input type="text" id="txtSearch" value="Enter keyword to search..."/>
	<input type="button" id="btnAddAssignee" value="+ Add Assignee"/>
	<div id="AssigneeListTable">
			<div name="rowName" class="tableRow">
				<label class="tableColumn">NO.</label> 
				<label class="tableColumn">ASSIGNEE NAME</label>
				<label class="tableColumn">DEPARTMENT</label>
				<label class="tableColumn">LOCATION</label>
				<label class="tableColumn">ENTRY DATE</label>
				<label class="tableColumn">ACTIVE TAG</label>
				<label class="tableColumn">ACTIONS</label>
		</div>
	</div>
</div>
</body>
<script>
onLoad();
function onLoad() {
	new Ajax.Request("${pageContext.request.contextPath}"+"/AssigneeMaintenanceController",
			{
		method : "get",
		parameters : {
			action : "onLoad"
		}
	}); 
	
	
}

</script>
</html>