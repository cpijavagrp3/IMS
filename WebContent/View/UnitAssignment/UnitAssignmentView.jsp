<div>
	<table>
		<tr>
			<td>UNIT NO.</td>
			<td>
				<div class="input-group">
					<input type="text" class="form-control" readonly>

					<div class="input-group-btn">
						<button type="button" class="btn btn-primary" data-toggle="modal"
							data-target="#modUnit" id="btnUnit">
							<i class="glyphicon glyphicon-search"></i>
						</button>
					</div>
				</div>
				<div class="modal fade" id="modUnit" role="dialog">
					<div class="modal-dialog">
						<div class="modal-content">

							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal">&times;</button>
								<h4 class="modal-title">Select unit...</h4>
							</div>
							<div class="modal-body">
								<table class="table table-hover" id="lovUnit">
									<tr>
										<th>Unit No.</th>
									</tr>
									<tr>
									<td><label>sdfsdfsdf</label></td>
									<td><button id="" class="btn btn-primary btn-xs">SELECT</button></td>
									</tr>
								</table>
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-primary"
									data-dismiss="modal">Close</button>
							</div>

						</div>

					</div>
				</div>



			</td>
			<td>SERIAL NO.</td>
			<td><input type="text" class="form-control" id="txtSerialNo"
				readonly></td>
		</tr>
		<tr>
			<td>UNIT NAME</td>
			<td><input type="text" class="form-control" id="txtUnitName"
				readonly></td>
			<td>BRAND</td>
			<td><input type="text" class="form-control" id="txtBrand"
				readonly></td>
		</tr>
		<tr>
			<td>TAG NUMBER</td>
			<td><input type="text" class="form-control" id="txtTagNo"
				readonly></td>
			<td>MODEL</td>
			<td><input type="text" class="form-control" id="txtModel"
				readonly></td>
		</tr>
		<tr>
			<td>TYPE</td>
			<td><input type="text" class="form-control" id="txtType"
				readonly></td>
			<td>COLOR</td>
			<td><input type="text" class="form-control" id="txtColor"
				readonly></td>
		</tr>
	</table>

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
</div>
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
$("btnii").observe("click", function(){
	alert($F("ii"));
});

</script>