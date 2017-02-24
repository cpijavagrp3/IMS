<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Update User</title>
	</head>
	
	<body>
		<center>
		<div class="alert alert-warning" role="alert" id = "errorField"><strong>Warning!</strong> Please Fill all the Fields...</div>
		<div id = "formHolder" class = "float_center">
			<div id = "labelHolder">
				<button class = "btn btn-success" style = "float:left;margin-top:6px;margin-left:10px;" id = "btnBack"><span class = "glyphicon glyphicon-arrow-left"></span> </button>
				<h4 class = "labelControl" style = "margin-left:-60px;">User Maintenance</h4>	
			</div><br>
		
			<label>User ID</label>
			<input type = "text" id = "txtUserId" 			class = "form-control txtbox" 	value = "${userId}" 	maxlength = "15" disabled/><br>
			
			<label>Full Name</label><br>
			<input type = "text" id = "txtFirstName" 		class = "form-control" 			value = "${firstName}" 		maxlength = "250"/>
			<input type = "text" id = "txtLastName" 		class = "form-control" 			value = "${lastName}" 		maxlength = "250"/>
			<input type = "text" id = "txtMiddleInitial" 	class = "form-control txtboxMi" value = "${middleInitial}" 	maxLength = "3"/><br>
			
			<label>Email</label><br>
			<input type = "text" id = "txtEmail" 			class = "form-control txtbox" 	value = "${email}"/><br>
			
			<label>Status</label><br>
			<div id = "rdoHolder">
				<input type = "radio" id = "rdoActive" 		name = "rdoName" value = "Y" />Active &nbsp;&nbsp;&nbsp;&nbsp;
				<input type = "radio" id = "rdoInactive" 	name = "rdoName" value = "N" />Inactive
			</div><br>
			
			<label>Remarks</label><br>
			<textarea id = "txtRemarks"	rows = "1" cols = "1" 		class = "form-control txtbox" >${remarks}</textarea><br>

			<label>User Access</label> 		<label style = "margin-left:170px;">Entry Date</label> <br>
			<select id = "selectUserAccess" class = "form-control txtboxDisable" disabled><option>ADMIN</option> <option>USER</option></select>
			
			<input type = "text" id = "txtEntryDate"	 	class = "form-control txtboxDisable" 	value = "${entryDate}"  	disabled/>
			<label>Last Updated By</label> 	<label style = "margin-left:143px;">Last Update</label> <br>
			<input type = "text" id = "txtLastUpdatedBy" 	class = "form-control txtboxDisable" 	value = "${lastUpdatedBy}" 	disabled/>
			<input type = "text" id = "txtLastUpdate"		class = "form-control txtboxDisable" 	value = "${lastUpdate}"		disabled/><br><br>
			
			<div id = "btnHolder">
				<button id = "btnSave" 			class = "btn btn-primary btnControls"><span class = "glyphicon glyphicon-floppy-disk"></span>&nbsp; Save</button>
				<button id = "btnChangePass"	class = "btn btn-success btnControls"><span class = "glyphicon glyphicon-pencil"></span>&nbsp; Change Password</button>	
			</div>
		</div>
		</center>
	</body>
	
	<script type="text/javascript">
		$('errorField').hide();
		var contextPath = "${pageContext.request.contextPath}";
		
		var status = '${status}';
		
		if(status == "Y"){
			$('rdoActive').writeAttribute("checked", true);
			$('rdoInactive').writeAttribute("checked", false);
		}else{
			$('rdoActive').writeAttribute("checked", false);
			$('rdoInactive').writeAttribute("checked", true);
		}
		
		$('btnBack').observe("click", function(){
			backToUserMaintenance();
		});
		
		$('btnSave').observe("click", function(){
			checkValues();
		});
		
		function backToUserMaintenance(){
			new Ajax.Request(contextPath + "/UserMaintenanceController",{
				method: "get",
				parameters: { action: "backToUserMaintenance" },
				onComplete: function (response){
					$("contents").update(response.responseText);
				}
				
			});
		}
		
		function checkValues(){
			var userId = 		$F("txtUserId");
			var firstName = 	$F("txtFirstName").toUpperCase();
			var middleInitial = $F("txtMiddleInitial").toUpperCase();
			var lastName = 		$F("txtLastName").toUpperCase();
			var email = 		$F("txtEmail");
			
			if(userId == "" || firstName == "" || lastName == "" || middleInitial == "" || email == ""){
				$('errorField').show();
			}else if(userId == null || firstName == null || lastName == null || middleInitial == null){
				$('errorField').show();
			}else if(!isNaN(firstName) || !isNaN(lastName) || !isNaN(middleInitial)){
				$('errorField').innerHTML = "<strong>Warning!</strong> Names should be letters only...";
				$('errorField').show();
			}else if(email != "" && !email.includes("@")){
				$('errorField').innerHTML = "<strong>Warning!</strong> Invalid email address...";
				$('errorField').show();
			}else{
				updateUser();
			}
		}
		
		function updateUser(){
			new Ajax.Request(contextPath + "/UserMaintenanceController",{
				method: "post",
				parameters: { action: "updateUser",
							  userId : $F('txtUserId'),
							  firstName : $F("txtFirstName").toUpperCase(),
							  middleInitial : $F("txtMiddleInitial").toUpperCase(),
							  lastName : $F("txtLastName").toUpperCase(),
							  email : $F("txtEmail"),
							  status : status,
							  remarks : $F('txtRemarks'),
							  lastUpdatedBy : $F('txtLastUpdatedBy'),
							  lastUpdate : $('txtLastUpdate').value
							},
				onComplete: function (response){
					$("contents").update(response.responseText);
				}
				
			});
		}
		
	</script>
</html>