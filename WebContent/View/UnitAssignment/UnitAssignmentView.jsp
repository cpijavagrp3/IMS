<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<div id="divUnit">
	<table>
		<tr>
			<td>UNIT NO.</td>
			<td>
				<div class="input-group">
					<input type="text" id="txtUnitNo" class="form-control" readonly>

					<div class="input-group-btn">
						<button type="button" class="btn btn-primary" data-toggle="modal"
							data-target="#modUnit" id="btnUnit">
							<i class="glyphicon glyphicon-search"></i>
						</button>
					</div>
				</div>
				<div class="modal fade" id="modUnit" role="dialog">
					<div class="modal-dialog">
						<div class="modal-content" id="lovUnit"></div>

					</div>
				</div>

			</td>
			<td>SERIAL NO.</td>
			<td><input type="text" id="txtSerialNo" class="form-control"
				id="txtSerialNo" readonly></td>
		</tr>
		<tr>
			<td>UNIT NAME</td>
			<td><input type="text" id="txtUnitName" class="form-control"
				id="txtUnitName" readonly></td>
			<td>BRAND</td>
			<td><input type="text" id="txtUnitBrand" class="form-control"
				id="txtBrand" readonly></td>
		</tr>
		<tr>
			<td>TAG NUMBER</td>
			<td><input type="text" id="txtTagNo" class="form-control"
				id="txtTagNo" readonly></td>
			<td>MODEL</td>
			<td><input type="text" id="txtUnitModel" class="form-control"
				id="txtModel" readonly></td>
		</tr>
		<tr>
			<td>TYPE</td>
			<td><input type="text" id="txtUnitType" class="form-control"
				id="txtType" readonly></td>
			<td>COLOR</td>
			<td><input type="text" id="txtUnitColor" class="form-control"
				id="txtColor" readonly></td>
		</tr>
	</table>
</div>
<hr>

<table>
	<tr>
		<td>ASSIGNEE</td>
		<td><div class="input-group">
				<input type="text" class="form-control" id="txtAssignee" readonly>
				<div class="input-group-btn">
					<button class="btn btn-primary" type="button">
						<i class="glyphicon glyphicon-search"></i>
					</button>
				</div>
			</div></td>
		<td>STATUS</td>
		<td><input type="text" class="form-control" id="txtStatus"></td>
	</tr>
	<tr>
		<td>LOCATION</td>
		<td><input type="text" class="form-control" id="txtLocation"></td>
		<td>ASSIGNED BY</td>
		<td><input type="text" class="form-control" id="txtAssignedBy"></td>
	</tr>
	<tr>
		<td>IP ADDRESS</td>
		<td><input type="text" class="form-control" id="txtIAdd"></td>
		<td>DATE ASSIGNED</td>
		<td><input type="text" class="form-control" id="txtDate"></td>
	</tr>
</table>

<br>
<div align="center">
	<input type="button" id="btnAssign" value="Assign Unit"
		class="btn btn-primary">
</div>

<br>

<div>
	<input type="text" id="txtSearch"
		placeholder="Enter keyword to search...">
</div>
<div>
	<table class="table table-hover">
		<tr>
			<th>NO.</th>
			<th>UNIT NAME</th>
			<th>ASSIGNEE</th>
			<th>LOCATION</th>
			<th>IP ADDRESS</th>
			<th>STATUS</th>
			<th>ASSIGNED BY</th>
			<th>DATE ASSIGNED</th>
			<th>RETURN DATE</th>
		</tr>
	</table>
</div>
<script>
	var path = "${pageContext.request.contextPath}";

	$("btnUnit").observe("click", getUnitList);

	function getUnitList() {

		new Ajax.Request(path + "/unitAssignment", {
			method : "get",
			parameters : {
				action : "loaded"
			},
			onComplete : function(response) {
				$("lovUnit").update(response.responseText);
			}
		})

	}
</script>