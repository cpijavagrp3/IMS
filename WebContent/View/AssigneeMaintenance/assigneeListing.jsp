<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<html>
<body>
	<input type="text" id="txtSearch" value="Enter keyword to search..."/>
	<input type="button" id="btnAddAssignee" value="+ Add Assignee"/>

	<div id="AssigneeListTable">
	<table>
 		<tr name="headName" class="tableRow">
			<th class="tableColumn">NO.</th> 
			<th class="tableColumn">ASSIGNEE NAME</th>
			<th class="tableColumn">DEPARTMENT</th>
			<th class="tableColumn">LOCATION</th>
			<th class="tableColumn">ENTRY DATE</th>
			<th class="tableColumn">ACTIVE TAG</th>
			<th class="tableColumn">ACTIONS</th>
		</tr>
		<c:forEach var="u" items="${assigneeList}">
		<tr name="rowName" class="tableRow" id="row${u.assigneeNumber}">
			<td class="tableColumn">${u.assigneeNumber}</td>
			<td class="tableColumn">${u.assigneeName}</td>
			<td class="tableColumn">${u.department}</td>
			<td class="tableColumn">${u.location}</td>
			<td class="tableColumn">${u.entryDate}</td>
			<td class="tableColumn">${u.activeTag}</td>
			<td class="tableColumn"><input type="button" name="updateAssignee" value="Update" id="btnUpdate${u.assigneeNumber}"/></td>
		</tr>
		</c:forEach>	
	
	</table>
</div>

</body>
<script>

addUpdateToRowButton();

function addUpdateToRowButton(){
	$$("div#AssigneeListTable tr[name='rowName']").each(function(e){
		console.log(e.down("td",6).down("input", 0).id);
 		$(e.down("td",6).down("input", 0).id).observe("click", function(){
			updateAssignee(e);
 		});
		
		/*$(e).observe("mouseover", function(){
			$(e).addClassName("lightblue");
		});

		$(e).observe("mouseout", function(){
			$(e).removeClassName("lightblue");
		}); */
	});
}

function updateAssignee(e){
	var assigneeNumber = e.down("td",0).innerHTML;
	new Ajax.Request("${pageContext.request.contextPath}"+"/AssigneeMaintenanceController",
			{
		method : "post",
		parameters : {
			action : "updateAssignee",
			assigneeNumber : assigneeNumber,
		}, 	onComplete : function(response) {
			$("mainContent").update(response.responseText)
		}
	});
}

 $("btnAddAssignee").observe("click", function() {
	addAssignee();
});

function addAssignee() {
	new Ajax.Request("${pageContext.request.contextPath}"+"/AssigneeMaintenanceController",
			{
		method : "post",
		parameters : {
			action : "addAssignee"
		}, 	onComplete : function(response) {
			$("mainContent").update(response.responseText)
		}
	});
}

function onLoad() {
	new Ajax.Request("${pageContext.request.contextPath}"+"/AssigneeMaintenanceController",
			{
		method : "get",
		parameters : {
			action : "onLoad"
		}, 	onComplete : function(response) {
			$("mainContent").update(response.responseText)
		}
	});
	
}
if('${initiate}' != "Y") {
	onLoad();
}


if('${backToAssigneeListing}') {
	onLoad();
}  
</script>
</html>