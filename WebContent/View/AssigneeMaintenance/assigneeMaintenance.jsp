<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<html>
<head>
<script src="${pageContext.request.contextPath}/JS/prototype.js"></script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/Css/style.css">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Assignee Maintenance</title>
</head>
<body>
<div id="mainContent">
	<input type="button" id="btnBack" value="BACK"/>
	<label class="header">ASSIGNEE MAINTENANCE</label>
	<table>
	<tr>
		<td>ASSIGNEE NO</td>
		<td><input type="text" id="txtAssigneeNumber"/></td>
	</tr>
	<tr>
		<td>ASSIGNEE NAME</td>
		<td><input type="text" id="txtAssigneeName"/></td>
	</tr>
		<tr>
		<td>DEPARTMENT</td>
		<td><input type="text" id="txtDepartment"/></td>
	</tr>
	<tr>
		<td>LOCATION</td>
		<td><input type="text" id="txtLocation"/></td>
	</tr>
	<tr>
		<td>EMAIL</td>
		<td><input type="text" id="txtEmail"/></td>
	</tr>
	<tr>
		<td>STATUS</td>
		<td><input type="radio" name="status" id="rdoActive" value="Y" checked="checked">Active
 	 		<input type="radio" name="status" id="rdoInActive" value="N">Inactive<br>
 	 	</td>
	</tr>
	<tr>
		<td>ENTRY DATE</td>
		<td><input type="text" id="txtEntryDate"/></td>
	</tr>
	<tr>
		<td>REMARKS</td>
		<td><input type="text" id="txtRemarks"/></td>
	</tr>
	<tr>
		<td>USER ID</td>
		<td><input type="text" id="txtUserId"/></td>
	</tr>
	<tr>
		<td>LAST UPDATE</td>
		<td><input type="text" id="txtLastUpdate"/></td>
	</tr>
	<tr>
		<td></td>
		<td><input type="button" id="btnSave" value="Save"/>
			<input type="button" id="btnCancel" value="Cancel"/>
		</td>
	</tr>
	</table>


</div>
</body>
<script>
$("btnBack").observe("click", function() {
	backToAssigneeListing();
});

$("btnSave").observe("click", function() {
	saveRecord();
});

function saveRecord() {
	new Ajax.Request("${pageContext.request.contextPath}"+"/welcome",
			{
		method : "post",
		parameters : {
			action : (('${maintainAction}' =='add') ? 'insert' : 'update'),
			//action : "insert",
			assigneeName : $F("txtAssigneeName"),
			department : $F("txtDepartment"),
			location : $F("txtLocation"),
			email : $F("txtEmail"),
			activeTag :	(($("rdoActive").checked) ? $("rdoActive").value : $("rdoInActive").value),
			remarks : $F("txtRemarks"),	
		}
	}); 
}

function backToAssigneeListing() {
	new Ajax.Request("${pageContext.request.contextPath}"+"/welcome",
			{
		method : "post",
		parameters : {
			action : "backToAssigneeListing"
		}, 	onComplete : function(response) {
			$("mainContent").update(response.responseText)
		}
	});
}

if('${maintainAction}' =='add') {
	$("txtAssigneeNumber").setAttribute("disabled","disabled");
	$("txtEntryDate").setAttribute("disabled","disabled");
	$("txtUserId").setAttribute("disabled","disabled");
	$("txtLastUpdate").setAttribute("disabled","disabled");
}
</script>
</html>