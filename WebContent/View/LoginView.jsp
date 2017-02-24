<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
<jsp:include page="header.jsp"></jsp:include>
</head>
<body>
	<div id="initContent">
		<br>
		<br>
		<table>
			<tr>
				<td><label>Username: </label></td>
				<td><input type="text" id="txtUsername" class="form-control"></td>
			</tr>
			<tr>
				<td><label>Password: </label></td>
				<td><input type="password" id="txtPassword"
					class="form-control"></td>
			</tr>
			<tr>
				<td></td>
				<td align="right"><br>
				<input type="button" id="btnLogin" value="Login"
					class="btn btn-primary btn-md"></td>
			</tr>
		</table>
	</div>
</body>
<script type="text/javascript">
	var path = "${pageContext.request.contextPath}";

	$("btnLogin").observe("click", login);

	function login() {
		new Ajax.Request(path + "/main", {
			method : "post",
			parameters : {
				action : "login",
				userName : $F("txtUsername"),
				pass : $F("txtPassword")
			},
			onComplete : function(response) {
				$('initContent').update(response.responseText);
			}
		});
	}
</script>

</html>