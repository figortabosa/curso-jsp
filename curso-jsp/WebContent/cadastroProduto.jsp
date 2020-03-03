<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Cadastro de Produto</title>
</head>
<body>
	<h3>Cadastro de Produto</h3>
	
	<form action="salvarProduto" method="post">
		<table>
			<tr>
				<td>Nome:</td>
				<td><input type="text" id="Nome" name="Nome"></td>
			</tr>
			
			<tr>
				<td>Quantidade:</td>
				<td><input type="text" id="qtd" name="qtd"></td>
			</tr>
			
			<tr>
				<td>Valor:</td>
				<td><input type="text" id="valor" name="valor"> </td>
			</tr>
	
		</table>
		<input type="submit" value="Cadastrar">
	</form>
</body>
</html>