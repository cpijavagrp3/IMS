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
		<h1>Update User</h1>
		<input type = "button" id = "btnBack" value = "Back"/><br><br>
		
		<table>
			<tr>
				<td><label>USER ID </label></td>
				<td><input type = "text" id = "txtUserId" maxlength = "15" readonly = "readonly" disabled value = "${userId}"/></td>
			</tr>
			
			<tr>
				<td><label>FIRST NAME </label></td>
				<td><input type = "text" id = "txtFirstName" maxlength = "250" value = "${firstName}"/></td>
			</tr>
			
			<tr>
				<td><label>MIDDLE INITIAL </label></td>
				<td><input type = "text" id = "txtMiddleInitial" maxlength = "3" value = "${middleInitial}"/></td>
			</tr>
			
			<tr>
				<td><label>LAST NAME </label></td>
				<td><input type = "text" id = "txtLastName" maxlength = "250" value = "${lastName}"/></td>
			</tr>
			
			<tr>
				<td><label>EMAIL </label></td>
				<td><input type = "text" id = "txtEmail" maxlength = "100" value = "${email}"/></td>
			</tr>
			
			<tr>
				<td><label>STATUS </label></td>
				<td>
					<input type = "radio" id = "rdoActive" 		name = "rdoName" value = "Y" />Active 
					<input type = "radio" id = "rdoInactive" 	name = "rdoName" value = "N" />Inactive
				</td>
			</tr>
			
			<tr>
				<td><label>USER ACCESS </label></td>
				<td><input type = "text" id = "txtUserAccess" style = "text-align:left;width:100%;" disabled value = "${userAccess}" /></td>
			
			<tr>
				<td><label>ENTRY DATE </label></td>
				<td><input type = "text" id = "txtEntryDate" value = "${entryDate}" readonly = "readonly" disabled/></td>
			</tr>
			
			<tr>
				<td><label>REMARKS </label></td>
				<td><input type = "text" id = "txtRemarks" maxlength = "1000" value = "${remarks}"/></td>
			</tr>
			
			<tr>
				<td><label>LAST UPDATED BY </label></td>
				<td><input type = "text" id = "txtLastUpdatedBy" readonly = "readonly" disabled value = "${lastUpdatedBy}"/></td>
			</tr>
			
			<tr>
				<td><label>LAST UPDATE </label></td>
				<td><input type = "text" id = "txtLastUpdate" value = "${lastUpdate}" readonly="readonly" disabled/></td>
			</tr>
			
			<tr>
				<td><input type = "button" id = "btnSave" value = "Save" style = "width: 100%; margin-top:20px;"/></td>
				<td><input type = "button" id = "btnChangePassword" value = "Change Password" style = "width: 100%; margin-top:20px;"/></td>
			</tr>
			
		</table>	
		
	</body>
	
	<script type="text/javascript">
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
				alert("Please Fill All the Fields");
			}else if(userId == null || firstName == null || lastName == null || middleInitial == null){
				alert("Please Fill All the Fields");
			}else if(!isNaN(firstName) || !isNaN(lastName) || !isNaN(middleInitial)){
				alert("Please Enter Letters Only for Names.");
			}else if(email != "" && !email.includes("@")){
				alert("Invalid Email Address.");
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