<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>User Maintenance</title>
		<jsp:include page = "/View/UserMaintenance/headerUserMaintenance.jsp" />
	</head>
	
	<body>
		<div class = "container container-fluid">
			<div id = "contents">
				<br>
					<button type="button" class="btn btn-primary" id = "btnAddUser" style = "float:right;"><span class="glyphicon  glyphicon glyphicon-plus" aria-hidden="true"></span>&nbsp;&nbsp; Add User</button>
				<br><br>
				
				
				<table id="example" class="table table-hover table-condensed" cellspacing="0" width="100%">
					<thead>
						<tr>
							<!-- 0 --><th>User Id</th>	
				            <!-- 1 --><th>User Name</th>	
				            <!-- 2 --><th>User Access</th>
				            <!-- 3 --><th>Active Tag</th>	
				            <!-- 4 --><th>Entry Date</th>	
				            
				            <!-- 5 --><th style = "display:none;">Password</th> 
				            <!-- 6 --><th style = "display:none;">Email</th>
				            <!-- 7 --><th style = "display:none;">Remarks</th>
				            <!-- 8 --><th style = "display:none;">Last Updated By</th>
				            <!-- 9 --><th style = "display:none;">Last Update</th>
				            <!-- 10 --><th style = "display:none;">First Name</th>
				            <!-- 11 --><th style = "display:none;">Last Name</th>
				            <!-- 12 --><th style = "display:none;">Middle Initial</th>
				            <!-- 13 --><th>Actions</th>
				       </tr>
				   	</thead>
				       
				   	<tbody>
				        <c:forEach var = "a" items = "${userList}">
				        	
							<tr class = "rows">
								<!-- 0 --><td>${a.getUserId()}</td>
								<!-- 1 --><td>${a.getFirstName()} ${a.getMiddleInitial()} ${a.getLastName()}</td>
								<!-- 2 --><td>${a.getUserAccess()}</td>
								<!-- 3 --><td>${a.getStatus()}</td>
								<!-- 4 --><td>${a.getEntryDate()}</td>
								
								<!-- 5 --><td style = "display:none;">${a.getPassword()}</td>
								<!-- 6 --><td style = "display:none;">${a.getEmail()}</td>
								<!-- 7 --><td style = "display:none;">${a.getRemarks()}</td>
								<!-- 8 --><td style = "display:none;">${a.getLastUpdatedBy()}</td>
								<!-- 9 --><td style = "display:none;">${a.getLastUpdate()}</td>
								<!-- 10 --><td style = "display:none;">${a.getFirstName()}</td>
								<!-- 11 --><td style = "display:none;">${a.getLastName()}</td>
								<!-- 12 --><td style = "display:none;">${a.getMiddleInitial()}</td>
								
								<!-- 13 --><td><button type="button" class="btn btn-success btnUpdate" ><span class="glyphicon  glyphicon glyphicon-pencil" aria-hidden="true"></span></button></td>
							</tr>
							
						</c:forEach>
						
				   	</tbody>
				         
				</table>
				
				
			</div>
		</div>
			
	</body>
	
	<script type="text/javascript">
		var contextPath = "${pageContext.request.contextPath}";
	    
		$('btnAddUser').observe('click', function(){
			addUserPage();
		});
		
		$$('.rows').each(function(e) {
		    e.observe('click', function(){
		    	var userId = 		e.down("td",0).innerHTML;
		    	var firstName = 	e.down("td",10).innerHTML;
		    	var lastName = 		e.down("td",11).innerHTML;
		    	var middleInitial = e.down("td",12).innerHTML;
		    	var email = 		e.down("td",6).innerHTML;
		    	var status = 		e.down("td",3).innerHTML;
		    	var userAccess = 	e.down("td",2).innerHTML;
		    	var entryDate = 	e.down("td",4).innerHTML;
		    	var remarks = 		e.down("td",7).innerHTML;
		    	var lastUpdatedBy = e.down("td",8).innerHTML;  	
		    	var lastUpdate = 	e.down("td",9).innerHTML;  	
		    	
		    	new Ajax.Request(contextPath + "/UserMaintenanceController",{
					method: "post",
					parameters: { action : "updateUserInfo",
								  userId : userId,
								  firstName : firstName,
								  lastName : lastName,
								  middleInitial : middleInitial,
								  email : email,
								  status : status,
								  userAccess : userAccess,
								  entryDate : entryDate,
								  remarks : remarks,
								  lastUpdatedBy : lastUpdatedBy,
								  lastUpdate : lastUpdate,
								},
					onComplete: function (response){
						$("contents").update(response.responseText);
					}
					
				});
		    	
		    	
		    });
		})

		function addUserPage(){
			new Ajax.Request(contextPath + "/UserMaintenanceController",{
				method: "get",
				parameters: { action: "addUserPage" },
				onComplete: function (response){
					$("contents").update(response.responseText);
				}
				
			});
		}
		
		
	</script>
</html>