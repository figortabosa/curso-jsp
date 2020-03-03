<jsp:useBean id="calcula" class="beans.BeanCursoJsp" type="beans.BeanCursoJsp" scope="page"/>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<jsp:setProperty property="*" name="calcula"/>
	<h3> Seja bem vindo ao sistema em jsp </h3>
	
	
	<a href="salvaUsuario?acao=listartodos"><img alt="Cadastrar Usuário" title="Cadastrar Usuário" src="resources/img/usuario.png" width="100" height="100"></a >
	<a href="cadastroProduto.jsp"><img alt="Cadastrar Produto" title="Cadastrar Produto" src="resources/img/produto.jpg" width="100" height="100"></a>
	
</body>
</html>