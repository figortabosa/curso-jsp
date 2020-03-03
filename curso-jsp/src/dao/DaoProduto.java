package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;

import beans.BeanCursoJsp;
import beans.BeanProduto;
import connection.SingleConnection;

public class DaoProduto {
	private Connection connection;
	
	public DaoProduto() {
		connection = SingleConnection.getConnection();
	}
	
	public void salvarProduto(BeanProduto produto) {
		
		try {
		String sql = "insert into produto(nome, quantidade, valor) values(?, ?, ?)";
		PreparedStatement insert = connection.prepareStatement(sql);
		insert.setString(1, produto.getNome());
		insert.setDouble(2, produto.getQuantidade());
		insert.setDouble(3, produto.getValor());
		insert.execute();
		connection.commit();
		
		}catch (Exception e) {
			e.printStackTrace();
			try {
				connection.rollback();
			}catch (Exception e1) {
				e.printStackTrace();
			}
		}
	}
}
