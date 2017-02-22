<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Insert title here</title>
	</head>
	
	<body>
		<%@ page import="java.util.Date" %>   
		<%@ page import="java.text.SimpleDateFormat" %>    
		<% 
			Date date = new Date();
			SimpleDateFormat df = new SimpleDateFormat("dd-MMM-yy");
		%>
		
		<h1>User Maintenance</h1>
		<input type = "button" id = "btnBack" value = "Back"/><br><br>
		<table>
			<tr>
				<td><label>USER ID </label></td>
				<td><input type = "text" id = "txtUserId" maxlength = "15"/></td>
			</tr>
			
			<tr>
				<td><label>FIRST NAME </label></td>
				<td><input type = "text" id = "txtFirstName" maxlength = "250"/></td>
			</tr>
			
			<tr>
				<td><label>MIDDLE INITIAL </label></td>
				<td><input type = "text" id = "txtMiddleInitial" maxlength = "3"/></td>
			</tr>
			
			<tr>
				<td><label>LAST NAME </label></td>
				<td><input type = "text" id = "txtLastName" maxlength = "250"/></td>
			</tr>
			
			<tr>
				<td><label>EMAIL </label></td>
				<td><input type = "text" id = "txtEmail" maxlength = "100"/></td>
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
				<td><select id = "selectUserAccess" style = "text-align:left;width:100%;"><option>ADMIN</option> <option>USER</option></select></td>
			</tr>
			
			<tr>
				<td><label>ENTRY DATE </label></td>
				<td><input type = "text" id = "txtEntryDate" value = "<%=df.format(date).toString().toUpperCase()%>" readonly = "readonly" disabled/></td>
			</tr>
			
			<tr>
				<td><label>REMARKS </label></td>
				<td><input type = "text" id = "txtRemarks" maxlength = "1000"/></td>
			</tr>
			
			<tr>
				<td><label>LAST UPDATED BY </label></td>
				<td><input type = "text" id = "txtLastUpdatedBy" readonly = "readonly" disabled/></td>
			</tr>
			
			<tr>
				<td><label>LAST UPDATE </label></td>
				<td><input type = "text" id = "txtLastUpdate" value = "<%=df.format(date).toString().toUpperCase()%>" readonly="readonly" disabled/></td>
			</tr>
			
			<tr>
				<td><input type = "button" id = "btnSave" value = "Save" style = "width: 100%; margin-top:20px;"/></td>
				<td><input type = "button" id = "btnChangePassword" value = "Change Password" style = "width: 100%; margin-top:20px;"/></td>
			</tr>
		</table>
		
		
	</body>
	
	<script type="text/javascript">
		var contextPath = "${pageContext.request.contextPath}";
		//SESSION THE LOGIN
		$('txtLastUpdatedBy').value = "ADMIN";

		$('rdoActive').setAttribute("checked", "checked");
		var status = $('rdoActive').value;
		
		$('rdoActive').observe("click", function(){
			$('rdoActive').setAttribute("checked", "true");
			$('rdoInactive').setAttribute("checked", "false");
			status = $('rdoActive').value;
		});
		
		$('rdoInactive').observe("click", function(){
			$('rdoActive').setAttribute("checked", "false");
			$('rdoInactive').setAttribute("checked", "true");
			status = $('rdoInactive').value;
		});
		
		
		
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
			var password = 		userId;
			var firstName = 	$F("txtFirstName").toUpperCase();
			var middleInitial = $F("txtMiddleInitial").toUpperCase();
			var lastName = 		$F("txtLastName").toUpperCase();
			var email = 		$F("txtEmail");
			
			if(userId == "" || firstName == "" || lastName == "" || middleInitial == ""){
				alert("Please Fill All the Fields");
			}else if(userId == null || firstName == null || lastName == null || middleInitial == null){
				alert("Please Fill All the Fields");
			}else if(!isNaN(firstName) || !isNaN(lastName) || !isNaN(middleInitial)){
				alert("Please Enter Letters Only for Names.");
			}else if(email != "" && !email.includes("@")){
				alert("Invalid Email Address.");
			}else{
				addUser();
				
			}
		}
		
		function addUser(){
			new Ajax.Request(contextPath + "/UserMaintenanceController",{
				method: "post",
				parameters: { action: "addUser",
							  userId : $F("txtUserId"),
							  password : $F("txtUserId"),
							  firstName : $F("txtFirstName").toUpperCase(),
							  middleInitial : $F("txtMiddleInitial").toUpperCase(),
							  lastName : $F("txtLastName").toUpperCase(),
							  email : $F("txtEmail"),
							  status : status,
							  userAccess : $F('selectUserAccess'),
							  entryDate : $('txtEntryDate').value,
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