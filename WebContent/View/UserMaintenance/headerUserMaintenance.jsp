<html>
	<head>
		<script src="${pageContext.request.contextPath}/JS/bootstrap.min.js"></script>
		<script src="${pageContext.request.contextPath}/JS/npm.js"></script>
		
		<script src="${pageContext.request.contextPath}/JS/jquery-1.12.4.js"></script>
		<script src="${pageContext.request.contextPath}/JS/jquery.dataTables.min.js"></script>
		
		<link rel="stylesheet" href="${pageContext.request.contextPath}/CSS/bootstrap.min.css" type="text/css">	
		<link rel="stylesheet" href="${pageContext.request.contextPath}/CSS/userMaintenanceStyle.css" type="text/css">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/CSS/jquery.dataTables.min.css" type="text/css">
		
		<script type="text/javascript" src = "${pageContext.request.contextPath}/JS/prototype.js"></script>
	</head>
	
		<script type="text/javascript">
			var contextPath = "${pageContext.request.contextPath}";
			
			document.observe('dom:loaded',function(){
				new Ajax.Request(contextPath + "/UserMaintenanceController",{
					method: "get",
					parameters: { action: "loadPage" },
					onComplete: function (response){
						$("contents").update(response.responseText);
					}
					
				});
			});
			
			var $j = jQuery.noConflict();
		    $j(document).ready(function() {
		        $j('#example').DataTable({"pagingType": "full_numbers"});
		    });
		    
		    
		</script>	
</html>