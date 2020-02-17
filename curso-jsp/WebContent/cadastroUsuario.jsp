<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="resources/css/cadastro.css">
<title>Cadastro de Usuário</title>
</head>
<body>

	 <form action="salvaUsuario" method="post">
	 
		<ul class="form-style-1">
			<li>
			<h1>Cadastro de Usuário</h1>
				<table>
					<tr>
						<td>Codigo:</td>
						<td><input type="text" readonly="readonly" id="id" name="id"
							value="${user.id}" class="field-long"></td>
					</tr>

					<tr>
						<td>Login:</td>
						<td><input type="text" id="login" name="login"
							value="${user.login}"></td>
					</tr>

					<tr>
						<td>Senha:</td>
						<td><input type="password" id="senha" name="senha"
							value="${user.senha}"></td>
					</tr>
				</table> <input type="submit" value="Salvar">
			</li>
		</ul>
	</form>

<div class="container">
	<table class="responsive-table">
		<c:forEach items="${usuarios}" var="user">
			<tr>
				<td><c:out value="${user.id}"></c:out></td>
				<td><c:out value="${user.login}"></c:out></td>
				<td><c:out value="${user.senha}"></c:out></td>

				<td><a href="salvaUsuario?acao=delete&user=${user.login}">Excluir</a></td>
				<td><a href="salvaUsuario?acao=editar&user=${user.login}">Editar</a></td>
			</tr>
		</c:forEach>

	</table>
</div>

</body>
</html>