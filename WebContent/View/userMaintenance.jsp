<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>User Maintenance</title>
		<jsp:include page = "headerUserMaintenance.jsp" />
	</head>
	
	<body>
		<div class = "container container-fluid">
			<div id = "contents">
				<br>
					<input type = "text" id = "txtSearch" placeholder = "Search" />
					<button type="button" class="btn btn-primary" id = "btnSearch" style = "margin-top:-4px;margin-left:-10px;"><span class="glyphicon  glyphicon glyphicon-search" aria-hidden="true"></span></button>
					<button type="button" class="btn btn-success" id = "btnSearch" style = "margin-left:2px;margin-top:-4px;"><span class="glyphicon  glyphicon glyphicon-refresh" aria-hidden="true"></button>
					<button type="button" class="btn btn-primary" id = "btnAddUser" style = "float:right;"><span class="glyphicon  glyphicon glyphicon-plus" aria-hidden="true"></span>&nbsp;&nbsp; Add User</button>
				<br><br>

				<table class = "table table-hover" id = "usersTable">
					<tr>
						<th>USER ID</th>
						<th>USER NAME</th>
						<th>USER ACESS</th>
						<th>ACTIVE TAG</th>
						<th>ENTRY DATE</th>
						<th>ACTIONS</th>
					</tr>
					
					<c:forEach var = "a" items = "${userList}">
						<tr>
							<td>${a.getUserId()}</td>
							<td>${a.getFirstName()}  &nbsp; ${a.getMiddleInitial()} &nbsp; ${a.getLastName()}</td>
							<td>${a.getUserAccess()}</td>
							<td>${a.getStatus()}</td>
							<td>${a.getEntryDate()}</td>
							<td><button type="button" class="btn btn-success" id = "btnUpdate"><span class="glyphicon  glyphicon glyphicon-pencil" aria-hidden="true"></span></button></td>
						</tr>
					</c:forEach>
					
				</table>
				
			</div>
		</div>
			
	</body>
	
	<script type="text/javascript">
		var contextPath = "${pageContext.request.contextPath}";

		$('btnAddUser').observe('click', function(){
			addUserPage();
		});
		
		$('btnSearch').observe('click', function(){
			search();
		});
			
		
		
		function addUserPage(){
			new Ajax.Request(contextPath + "/UserMaintenanceController",{
				method: "get",
				parameters: { action: "addUserPage" },
				onComplete: function (response){
					$("contents").update(response.responseText);
				}
				
			});
		}
		
		function search(){
			alert(1);
			new Ajax.Request(contextPath + "/UserMaintenanceController",{
				method: "get",
				parameters: { action: "search",
							  txtSearch : $F('txtSearch')
							},
				onComplete: function (response){
					$("contents").update(response.responseText);
				}
				
			});
		}
	</script>
</html>