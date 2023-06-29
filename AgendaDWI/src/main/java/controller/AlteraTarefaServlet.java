package controller;

import java.io.IOException;

import dao.AgendaDao;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Task;

/**
 * Servlet implementation class AlteraTarefaServlet
 */
@WebServlet("/alteraTarefa")
public class AlteraTarefaServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	Task tarefa = new Task();
	AgendaDao tarefaDao = new AgendaDao();
	

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("LOG: Alterando Tarefa....");
		
		String paramId_tarefa = request.getParameter("id_tarefa");
		int id_tarefa = Integer.valueOf(paramId_tarefa);
		
		String paramId_usuario = request.getParameter("id_usuario");
		int id_usuario = Integer.valueOf(paramId_usuario);
		String nome_usuario = request.getParameter("nome_usuario");
		
		String titulo = request.getParameter("titulo");
		String descricao = request.getParameter("descricao");
		String status = request.getParameter("status");
		
		tarefa.setId_tarefa(id_tarefa);
		tarefa.setTitulo(titulo);
		tarefa.setDescricao(descricao);
		
		if(status == null) {
			tarefa.setStatus(false);
		} else {
			tarefa.setStatus(true);
		}
		
		try {
			tarefaDao.alterarTarefa(tarefa);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		boolean tarefaCadastrada = false;
    	boolean tarefaAlterada = true;
		
		request.setAttribute("id_usuario", id_usuario);
		request.setAttribute("tarefaCadastrada", tarefaCadastrada);
		request.setAttribute("tarefaAlterada", tarefaAlterada);
		request.setAttribute("nome_usuario", nome_usuario);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("/tarefaListagem");
		dispatcher.forward(request, response);
	}

}
