<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<div class="modal-header">
	<button type="button" id="btnUnit" class="close" data-dismiss="modal">&times;</button>
	<h4 class="modal-title">Select unit...</h4>
</div>
<div class="modal-body">
	<table class="table table-hover" id="tabUnit">
		<tr>
			<th>UNIT NO.</th>
			<th>NAME</th>
			<th>TAG</th>
			<th>TYPE</th>
			<th>SERIAL NO.</th>
			<th>BRAND</th>
			<th>MODEL</th>
			<th>COLOR</th>
		</tr>
		<c:forEach var="unit" items="${dbRecords}">
			<tr id="rowName">
				<td>${unit.unitNo}</td>
				<td>${unit.unitName}</td>
				<td>${unit.tagNumber}</td>
				<td>${unit.type}</td>
				<td>${unit.serialNo}</td>
				<td>${unit.brand}</td>
				<td>${unit.model}</td>
				<td>${unit.color}</td>
			</tr>
		</c:forEach>
	</table>
</div>
<div class="modal-footer">
	<input type="button" id="btnSel" class="btn btn-primary"
		data-dismiss="modal" value="SELECT">
</div>
<script>
	var unitNo = -1;
	var unitName = "";
	var tagNo = "";
	var type = "";
	var serialNo = "";
	var brand = "";
	var model = "";
	var color = "";
	
	addObserveToTable();

	function addObserveToTable() {
		$$("#rowName").each(function(e) {
			$(e).observe("click", function() {
				onSelectRow(e);
			});
		});
	}

	function onSelectRow(row) {
		$$("#rowName").each(function(e) {
			if ($(e).down("td", 0).innerHTML != row.down("td", 0).innerHTML) {
				e.removeClassName("selectedRowUn");
				unitNo = -1;
			}
		});

		row.toggleClassName("selectedRowUn");

		if (row.hasClassName("selectedRowUn")) {
			unitNo = $(row).down("td", 0).innerHTML;
			unitName = $(row).down("td", 1).innerHTML;;
			tagNo = $(row).down("td", 2).innerHTML;;
			type = $(row).down("td", 3).innerHTML;;
			serialNo = $(row).down("td", 4).innerHTML;;
			brand = $(row).down("td", 5).innerHTML;;
			model = $(row).down("td", 6).innerHTML;;
			color = $(row).down("td", 7).innerHTML;;
		} else {
			clearUnitList();
		}
	}

	$("btnSel").observe("click", function() {
		if (unitNo < 0) {
			alert("No unit selected");
		} else {
			$("txtUnitNo").value = unitNo;
			$("txtUnitName").value = unitName;
			$("txtTagNo").value = tagNo;
			$("txtUnitType").value = type;
			$("txtSerialNo").value = serialNo;
			$("txtUnitBrand").value = brand;
			$("txtUnitModel").value = model;
			$("txtUnitColor").value = color;
		}
	});
	
	function clearUnitList() {
		unitNo = -1;
		unitName = "";
		tagNo = "";
		type = "";
		serialNo = "";
		brand = "";
		model = "";
		color = "";
	}
	
</script>