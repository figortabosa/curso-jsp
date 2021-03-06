package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import beans.BeanCursoJsp;
import connection.SingleConnection;

public class DaoUsuario {
	private Connection connection;

	public DaoUsuario() {
		connection = SingleConnection.getConnection();
	}

	public void salvar(BeanCursoJsp usuario) {

		try {
			String sql = "insert into usuarios(login, senha, nome, telefone) values (?, ?, ?, ?)";
			PreparedStatement insert = connection.prepareStatement(sql);
			insert.setString(1, usuario.getLogin());
			insert.setString(2, usuario.getSenha());
			insert.setString(3, usuario.getNome());
			insert.setString(4, usuario.getTelefone());
			insert.execute();
			connection.commit();

		} catch (Exception e) {
			e.printStackTrace();
			try {
				connection.rollback();
			} catch (SQLException e2) {
				e2.printStackTrace();
			}

		}

	}

	public List<BeanCursoJsp> listar() throws SQLException {
		List<BeanCursoJsp> listar = new ArrayList<BeanCursoJsp>();
		String sql = "select * from usuarios ";
		PreparedStatement statement = connection.prepareStatement(sql);
		ResultSet resultSet = statement.executeQuery();
		while (resultSet.next()) {

			BeanCursoJsp beanCursoJsp = new BeanCursoJsp();
			beanCursoJsp.setId(resultSet.getLong("id"));
			beanCursoJsp.setLogin(resultSet.getString("login"));
			beanCursoJsp.setSenha(resultSet.getString("senha"));
			beanCursoJsp.setNome(resultSet.getString("nome"));
			beanCursoJsp.setSenha(resultSet.getString("telefone"));

			listar.add(beanCursoJsp);
		}
		return listar;
	}

	public void delete(String id) {
		try {
			String sql = "delete from usuarios where id = '" + id + "'";
			PreparedStatement preparedStatement = connection.prepareStatement(sql);
			preparedStatement.execute();
			connection.commit();
		} catch (Exception e) {
			e.printStackTrace();
			try {
				connection.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
		}
	}

	public BeanCursoJsp consultar(String id) throws SQLException {
		String sql = "select * from usuarios where id= '" + id + "'";
		PreparedStatement preparedStatement = connection.prepareStatement(sql);
		ResultSet resultSet = preparedStatement.executeQuery();
		if (resultSet.next()) {
			BeanCursoJsp beanCursoJsp = new BeanCursoJsp();
			beanCursoJsp.setId(resultSet.getLong("id"));
			beanCursoJsp.setLogin(resultSet.getString("login"));
			beanCursoJsp.setSenha(resultSet.getString("senha"));
			beanCursoJsp.setNome(resultSet.getString("nome"));
			beanCursoJsp.setTelefone(resultSet.getString("telefone"));

			return beanCursoJsp;
		}
		return null;
	}

	public boolean validarLogin(String login) throws SQLException {
		String sql = "select count(1) as qtd from usuarios where login= '" + login + "'";
		PreparedStatement preparedStatement = connection.prepareStatement(sql);
		ResultSet resultSet = preparedStatement.executeQuery();
		if (resultSet.next()) {
			return resultSet.getInt("qtd") <= 0;
		}
		return false;
	}
	
	public boolean validarLoginUpdat(String login, String senha, String id) throws SQLException {
		String sql = "SELECT COUNT(1) AS qtd FROM usuarios WHERE login = '" + login + "' AND senha = '" + senha + "' AND id <> '" + id + "'";
		PreparedStatement preparedStatement = connection.prepareStatement(sql);
		ResultSet resultSet = preparedStatement.executeQuery();
		if (resultSet.next()) {
			return resultSet.getInt("qtd") <= 0;
		}
		return false;
	}

	public void atualizar(BeanCursoJsp usuario) {

		try {
			String sql = "update usuarios set login = ?, senha = ?, nome = ?, telefone = ? where id = " + usuario.getId();
			PreparedStatement preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setString(1, usuario.getLogin());
			preparedStatement.setString(2, usuario.getSenha());
			preparedStatement.setString(3, usuario.getNome());
			preparedStatement.setString(4, usuario.getTelefone());
			preparedStatement.executeUpdate();
			connection.commit();
		} catch (Exception e) {
			e.printStackTrace();
			try {
				connection.rollback();
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
		}
	}
}
