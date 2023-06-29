package dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import model.Task;
import model.User;

public class AgendaDao {

	 	final String serverName = "localhost";    //caminho do servidor do BD
	    
	    //String localhostPort = "8080"; //porta de acesso localhost
	    
	    final String dataBasePort="3306"; //porta de acesso banco de dados

	    final String mydatabase ="dbagenda";        //nome do seu banco de dados

	    final String url = "jdbc:mysql://" + serverName + ":" + dataBasePort + "/"+ mydatabase;

	    final String user = "root";        //nome de um usuário de seu BD

	    final String password = "root";
	
	
	
	
	
	
	
	
// Busca tarefas:
	
	
	private int chaveSequencial = 0;
	
	public List<Task> buscaTarefaIdUsuario(int id) throws ClassNotFoundException {
		String SELECT_TAREFA = "SELECT id_tarefa, titulo, descricao, data_criacao, data_conclusao, status, id_usuario FROM tarefas"
				+ " WHERE id_usuario=? order by id_tarefa desc;";
		List<Task> tarefas = null;
		Task tarefa = null;

		Class.forName("com.mysql.jdbc.Driver");

		try (Connection connection = DriverManager.getConnection(url, user, password);

				PreparedStatement preparedStatement = connection.prepareStatement(SELECT_TAREFA)) {
			preparedStatement.setInt(1, id);

			System.out.println(preparedStatement);
			try (ResultSet resultSet = preparedStatement.executeQuery();) {
				tarefas = new ArrayList<>();
				while (resultSet.next()) {
					tarefa = new Task();
					tarefa.setId_tarefa(resultSet.getInt("id_tarefa"));
					tarefa.setTitulo(resultSet.getString("titulo"));
					tarefa.setDescricao(resultSet.getString("descricao"));
					tarefa.setData_criacao(resultSet.getDate("data_criacao"));
					tarefa.setData_conclusao(resultSet.getDate("data_conclusao"));
					tarefa.setStatus(resultSet.getBoolean("status"));
					tarefa.setId_usuario(resultSet.getInt("id_usuario"));
					tarefas.add(tarefa);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}

		} catch (SQLException e) {
			// process sql exception
			e.printStackTrace();
		}
		return tarefas;
	}

	public Task buscaTarefaIdTarefa(int id) throws ClassNotFoundException {
		String SELECT_TAREFA = "SELECT id_tarefa, titulo, descricao, data_criacao, data_conclusao, status, id_usuario FROM tarefas"
				+ " WHERE id_tarefa=?;";

		Task tarefa = null;

		Class.forName("com.mysql.jdbc.Driver");

		try (Connection connection = DriverManager.getConnection(url, user, password);

				PreparedStatement preparedStatement = connection.prepareStatement(SELECT_TAREFA)) {
			preparedStatement.setInt(1, id);

			System.out.println(preparedStatement);
			try (ResultSet resultSet = preparedStatement.executeQuery();) {
				if (resultSet.next()) {
					tarefa = new Task();
					tarefa.setId_tarefa(resultSet.getInt("id_tarefa"));
					tarefa.setTitulo(resultSet.getString("titulo"));
					tarefa.setDescricao(resultSet.getString("descricao"));
					tarefa.setData_criacao(resultSet.getDate("data_criacao"));
					tarefa.setData_conclusao(resultSet.getDate("data_conclusao"));
					tarefa.setStatus(resultSet.getBoolean("status"));
					tarefa.setId_usuario(resultSet.getInt("id_usuario"));
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}

		} catch (SQLException e) {
			// process sql exception
			e.printStackTrace();
		}
		return tarefa;
	}

	
	
	
	public int removeTarefa(int id_tarefa) throws ClassNotFoundException {
		String REMOVE_TAREFA = "DELETE FROM tarefas" + " WHERE id_tarefa=?;";

		int result = 0;

		Class.forName("com.mysql.jdbc.Driver");

		try (Connection connection = DriverManager.getConnection(url, user, password);

				PreparedStatement preparedStatement = connection.prepareStatement(REMOVE_TAREFA)) {
			preparedStatement.setInt(1, id_tarefa);

			System.out.println(preparedStatement);
			result = preparedStatement.executeUpdate();
		} catch (SQLException e) {
			// process sql exception
			e.printStackTrace();
		}
		return result;
	}

	public int alterarTarefa(Task tarefa) throws ClassNotFoundException {

		String UPDATE_TAREFA = "UPDATE tarefas SET titulo=?, descricao=?, data_conclusao=?, status=?"
				+ " WHERE id_tarefa = ?;";

		Class.forName("com.mysql.jdbc.Driver");

		int result = 0;

		try (Connection connection = DriverManager.getConnection(url, user, password);

				PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_TAREFA)) {
			preparedStatement.setString(1, tarefa.getTitulo());
			preparedStatement.setString(2, tarefa.getDescricao());
			System.out.println(tarefa.isStatus());
			if (tarefa.isStatus()) {
				preparedStatement.setDate(3, Date.valueOf(LocalDate.now()));
			} else {
				preparedStatement.setDate(3, null);
			}
			preparedStatement.setBoolean(4, tarefa.isStatus());
			preparedStatement.setInt(5, tarefa.getId_tarefa());

			System.out.println(preparedStatement);
			result = preparedStatement.executeUpdate();

		} catch (SQLException e) {
			// process sql exception
			e.printStackTrace();
		}
		return result;
	}

	public int registerTarefa(Task tarefa) throws ClassNotFoundException {

		String SELECT_TAREFA = "SELECT max(id_tarefa) FROM tarefas";

		Class.forName("com.mysql.jdbc.Driver");

		try (Connection connection = DriverManager.getConnection(url, user, password);

				PreparedStatement preparedStatement = connection.prepareStatement(SELECT_TAREFA)) {

			System.out.println(preparedStatement);
			try (ResultSet resultSet = preparedStatement.executeQuery();) {
				if (resultSet.next()) {
					chaveSequencial = resultSet.getInt("max(id_tarefa)");
					chaveSequencial++;
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

		String INSERT_TAREFAS_SQL = "INSERT INTO tarefas"
				+ "  (id_tarefa, titulo, descricao, data_criacao, data_conclusao, status, id_usuario) VALUES "
				+ " (?,?,?,?,?,?,?);";

		int result = 0;

		Class.forName("com.mysql.jdbc.Driver");

		try (Connection connection = DriverManager.getConnection(url, user, password);

				PreparedStatement preparedStatement = connection.prepareStatement(INSERT_TAREFAS_SQL)) {
			preparedStatement.setInt(1, chaveSequencial);
			preparedStatement.setString(2, tarefa.getTitulo());
			preparedStatement.setString(3, tarefa.getDescricao());
			preparedStatement.setDate(4, Date.valueOf(LocalDate.now()));
			if (tarefa.isStatus()) {
				preparedStatement.setDate(5, Date.valueOf(LocalDate.now()));
			} else {
				preparedStatement.setDate(5, null);
			}
			preparedStatement.setBoolean(6, tarefa.isStatus());
			preparedStatement.setInt(7, tarefa.getId_usuario());

			System.out.println(preparedStatement);
			result = preparedStatement.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}

	

	/***********************************************************************/

	// USUARIO:
	/***********************************************************************/

	
	public int registerEmployee(User usuario) throws ClassNotFoundException {

		String SELECT_USUARIO = "SELECT max(id_usuario) FROM usuarios;";

		System.out.println("opa");

		Class.forName("com.mysql.jdbc.Driver");

		try (Connection connection = DriverManager.getConnection(url, user, password);

				PreparedStatement preparedStatement = connection.prepareStatement(SELECT_USUARIO)) {

			System.out.println(preparedStatement);
			try (ResultSet resultSet = preparedStatement.executeQuery();) {
				if (resultSet.next()) {
					chaveSequencial = resultSet.getInt("max(id_usuario)");
					System.out.println(chaveSequencial);
					chaveSequencial++;
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

		String INSERT_USERS_SQL = "INSERT INTO usuarios" + "  (id_usuario, nome, login, senha, email) VALUES "
				+ " (?,?,?,?,?);";

		int result = 0;

		Class.forName("com.mysql.jdbc.Driver");

		try (Connection connection = DriverManager.getConnection(url, user, password);

				PreparedStatement preparedStatement = connection.prepareStatement(INSERT_USERS_SQL)) {
			preparedStatement.setInt(1, chaveSequencial);
			preparedStatement.setString(2, usuario.getNome());
			preparedStatement.setString(3, usuario.getLogin());
			preparedStatement.setString(4, usuario.getSenha());
			preparedStatement.setString(5, usuario.getEmail());

			System.out.println(preparedStatement);
			result = preparedStatement.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}

	public User LoginUsuario(String username) throws ClassNotFoundException {
		String SELECT_LOGIN = "SELECT id_usuario, nome, login, senha, email FROM usuarios " + "WHERE login=?;";

		User user1 = null;

		Class.forName("com.mysql.jdbc.Driver");

		try (Connection connection = DriverManager.getConnection(url, user, password);

				PreparedStatement preparedStatement = connection.prepareStatement(SELECT_LOGIN)) {
			preparedStatement.setString(1, username);

			System.out.println(preparedStatement);
			try (ResultSet resultSet = preparedStatement.executeQuery();) {
				if (resultSet.next()) {
					user1 = new User();
					user1.setId(resultSet.getInt("id_usuario"));
					user1.setNome(resultSet.getString("nome"));
					user1.setLogin(resultSet.getString("login"));
					user1.setSenha(resultSet.getString("senha"));
					user1.setEmail(resultSet.getString("email"));
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return user1;
	}

	

	public boolean VerificaUsername(String username) throws ClassNotFoundException {

		username.toLowerCase();

		boolean verf = false;

		String SELECT_USER = "SELECT COUNT(*) FROM usuarios WHERE login = ?";

		Class.forName("com.mysql.jdbc.Driver");

		try (Connection connection = DriverManager.getConnection(url, user, password);

				PreparedStatement preparedStatement = connection.prepareStatement(SELECT_USER)) {
			preparedStatement.setString(1, username);

			try (ResultSet resultSet = preparedStatement.executeQuery();) {
				resultSet.next();
				int count = resultSet.getInt(1);
				if (count > 0) {
					System.out.println("Usuário já existe.");
					verf = false;
				} else {
					System.out.println("Usuário válido.");
					verf = true;
				}

			} catch (SQLException e) {
				e.printStackTrace();
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return verf;
	}

	public String VerificaSenha(String username) throws ClassNotFoundException {

		String SELECT_USER = "SELECT senha FROM usuarios " + "WHERE login=?;";

		String senha = null;

		Class.forName("com.mysql.jdbc.Driver");

		try (Connection connection = DriverManager.getConnection(url, user, password);

				PreparedStatement preparedStatement = connection.prepareStatement(SELECT_USER)) {
			preparedStatement.setString(1, username);

			try (ResultSet resultSet = preparedStatement.executeQuery();) {
				while (resultSet.next()) {
					senha = resultSet.getString("senha");
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return senha;
	}
}
