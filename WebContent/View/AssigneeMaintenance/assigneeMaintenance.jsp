<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<html>
<body>
	<input type="button" class="form-control btn-primary" id="btnBack" value="BACK"/>
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
		<td><input type="button" class="form-control btn-primary" id="btnSave" value="Save"/>
			<input type="button" class="form-control btn-primary" id="btnCancel" value="Cancel"/>
		</td>
	</tr>
	</table>
</body>
<script>
$("btnBack").observe("click", function() {
	backToAssigneeListing();
});

$("btnSave").observe("click", function() {
	if('${maintainAction}' == 'add') {
		saveRecord("insert");
	} else {
		updateRecord("update");	
	}	
});

function updateRecord(action) {
	new Ajax.Request("${pageContext.request.contextPath}"+"/AssigneeMaintenanceController",
			{
		method : "post",
		parameters : {
			action : action,
			assigneeName : $F("txtAssigneeName"),
			email : $F("txtEmail"),
			activeTag :	(($("rdoActive").checked) ? $("rdoActive").value : $("rdoInActive").value),
			remarks : $F("txtRemarks"),	
			assigneeNumber : $F("txtAssigneeNumber")
		}
	}); 
}

function saveRecord(action) {
	new Ajax.Request("${pageContext.request.contextPath}"+"/AssigneeMaintenanceController",
			{
		method : "post",
		parameters : {
			action : action,
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
	new Ajax.Request("${pageContext.request.contextPath}"+"/AssigneeMaintenanceController",
			{
		method : "post",
		parameters : {
			action : "backToAssigneeListing"
		}, 	onComplete : function(response) {
			$("assigneeContent").update(response.responseText)
		}
	});
}

if('${maintainAction}'=='add') {
	$("txtAssigneeNumber").setAttribute("disabled","disabled");
	$("txtEntryDate").setAttribute("disabled","disabled");
	$("txtUserId").setAttribute("disabled","disabled");
	$("txtLastUpdate").setAttribute("disabled","disabled");
}

if('${fromUpdateButton}'=='Y') {
	$("txtAssigneeNumber").setAttribute("disabled","disabled");
	$("txtEntryDate").setAttribute("disabled","disabled");
	$("txtUserId").setAttribute("disabled","disabled");
	$("txtLastUpdate").setAttribute("disabled","disabled");
	$("txtLocation").setAttribute("disabled","disabled");
	$("txtDepartment").setAttribute("disabled","disabled");
	getAssigneeValue();
}

function getAssigneeValue() {
	$("txtAssigneeNumber").value = '${assigneeNumber}';
	$("txtAssigneeName").value = '${assigneeName}';
	$("txtDepartment").value = '${assigneeDepartment}';
	$("txtLocation").value = '${assigneeLocation}';
	$("txtEmail").value = '${assigneeEmail}';
	$("txtEntryDate").value = '${assigneeEntryDate}';
	$("txtRemarks").value = '${assigneeRemarks}';
	$("txtUserId").value = '${assigneeUserId}';
	$("txtLastUpdate").value = '${assigneeLastUpdate}';
	
	if('${assigneeActiveTag}' == "Y") {
		$("rdoInActive").checked = false;
		$("rdoActive").checked = true;
		
	} else {
		$("rdoActive").checked = false;
		$("rdoInActive").checked = true;
		
	}
	//$("txtAssigneeNumber").value = assigneeNumber;
}
</script>
</html>