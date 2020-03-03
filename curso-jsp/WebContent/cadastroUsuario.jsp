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
		
	 <form action="salvaUsuario" method="post" id="formUser">
	 
		<ul class="form-style-1">
			<li>
			<h1>Cadastro de Usuário</h1>
				<h3 style="color: green">${msg}</h3>
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
					
					<tr>
						<td>Nome:</td>
						<td><input type="text" id="nome" name="nome"
							value="${user.nome}"></td>
					</tr>
					
					<tr>
						<td>telefone:</td>
						<td><input type="text" id="telefone" name="telefone"
							value="${user.telefone}"></td>
					</tr>
					
					<tr> 
					 <td><input id="botao" type="submit" value="Salvar"> <input id="botao" type="submit" value="Cancelar" onclick="document.getElementById('formUser').action = 'salvaUsuario?acao=reset'"></td>
					</tr>
				</table> 
			</li>
		</ul>
	</form>

<div class="container">
	<table class="responsive-table">
	<caption>Usuários Cadastrados</caption>
	<tr>
		<th>ID</th>
		<th>LOGIN</th>
		<th>NOME</th>
		<th>TELEFONE</th>
		<th>EXCLUIR</th>
		<th>EDITAR</th>
	</tr>
		<c:forEach items="${usuarios}" var="user">
			<tr>
				<td style="width: 100px"><c:out value="${user.id}"></c:out></td>
				<td style="width: 100px"><c:out value="${user.login}"></c:out></td>
				<td style="width: 100px"><c:out value="${user.nome}"></c:out></td>
				<td style="width: 100px"><c:out value="${user.telefone}"></c:out></td>

				<td style="width: 80px"><a href="salvaUsuario?acao=delete&user=${user.id}"><img alt="excluir" title="Excluir" src="resources/img/excluirr.png" width="20px" height="20px"> </a></td>
				<td style="width: 60px"><a href="salvaUsuario?acao=editar&user=${user.id}"><img alt="editar" title="Editar" src="resources/img/Editar.png" width="20px" height="20px"> </a></td>
			</tr>
		</c:forEach>

	</table>
</div>

</body>
</html>