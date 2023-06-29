<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="java.util.List,model.Task,java.sql.Date"%>

<!doctype html>
<html lang="en" data-bs-theme="auto">
  <head><script src="/docs/5.3/assets/js/color-modes.js"></script>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Hugo 0.111.3">
    <title>Pagina Principal</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
	
    <link rel="canonical" href="https://getbootstrap.com/docs/5.3/examples/headers/">
    <link rel="canonical" href="https://getbootstrap.com/docs/5.3/examples/album/">

<link href="/docs/5.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">

    <!-- Favicons -->
<link rel="apple-touch-icon" href="/docs/5.3/assets/img/favicons/apple-touch-icon.png" sizes="180x180">
<link rel="icon" href="/docs/5.3/assets/img/favicons/favicon-32x32.png" sizes="32x32" type="image/png">
<link rel="icon" href="/docs/5.3/assets/img/favicons/favicon-16x16.png" sizes="16x16" type="image/png">
<link rel="manifest" href="/docs/5.3/assets/img/favicons/manifest.json">
<link rel="mask-icon" href="/docs/5.3/assets/img/favicons/safari-pinned-tab.svg" color="#712cf9">
<link rel="icon" href="/docs/5.3/assets/img/favicons/favicon.ico">
<meta name="theme-color" content="#712cf9">

	

    
    <!-- Custom styles for this template -->
    <link href="headers.css" rel="stylesheet">
  </head>
  <body>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>
    <svg xmlns="http://www.w3.org/2000/svg" style="display: none;">
      <symbol id="check2" viewBox="0 0 16 16">
        <path d="M13.854 3.646a.5.5 0 0 1 0 .708l-7 7a.5.5 0 0 1-.708 0l-3.5-3.5a.5.5 0 1 1 .708-.708L6.5 10.293l6.646-6.647a.5.5 0 0 1 .708 0z"/>
      </symbol>
      <symbol id="circle-half" viewBox="0 0 16 16">
        <path d="M8 15A7 7 0 1 0 8 1v14zm0 1A8 8 0 1 1 8 0a8 8 0 0 1 0 16z"/>
      </symbol>
      <symbol id="moon-stars-fill" viewBox="0 0 16 16">
        <path d="M6 .278a.768.768 0 0 1 .08.858 7.208 7.208 0 0 0-.878 3.46c0 4.021 3.278 7.277 7.318 7.277.527 0 1.04-.055 1.533-.16a.787.787 0 0 1 .81.316.733.733 0 0 1-.031.893A8.349 8.349 0 0 1 8.344 16C3.734 16 0 12.286 0 7.71 0 4.266 2.114 1.312 5.124.06A.752.752 0 0 1 6 .278z"/>
        <path d="M10.794 3.148a.217.217 0 0 1 .412 0l.387 1.162c.173.518.579.924 1.097 1.097l1.162.387a.217.217 0 0 1 0 .412l-1.162.387a1.734 1.734 0 0 0-1.097 1.097l-.387 1.162a.217.217 0 0 1-.412 0l-.387-1.162A1.734 1.734 0 0 0 9.31 6.593l-1.162-.387a.217.217 0 0 1 0-.412l1.162-.387a1.734 1.734 0 0 0 1.097-1.097l.387-1.162zM13.863.099a.145.145 0 0 1 .274 0l.258.774c.115.346.386.617.732.732l.774.258a.145.145 0 0 1 0 .274l-.774.258a1.156 1.156 0 0 0-.732.732l-.258.774a.145.145 0 0 1-.274 0l-.258-.774a1.156 1.156 0 0 0-.732-.732l-.774-.258a.145.145 0 0 1 0-.274l.774-.258c.346-.115.617-.386.732-.732L13.863.1z"/>
      </symbol>
      <symbol id="sun-fill" viewBox="0 0 16 16">
        <path d="M8 12a4 4 0 1 0 0-8 4 4 0 0 0 0 8zM8 0a.5.5 0 0 1 .5.5v2a.5.5 0 0 1-1 0v-2A.5.5 0 0 1 8 0zm0 13a.5.5 0 0 1 .5.5v2a.5.5 0 0 1-1 0v-2A.5.5 0 0 1 8 13zm8-5a.5.5 0 0 1-.5.5h-2a.5.5 0 0 1 0-1h2a.5.5 0 0 1 .5.5zM3 8a.5.5 0 0 1-.5.5h-2a.5.5 0 0 1 0-1h2A.5.5 0 0 1 3 8zm10.657-5.657a.5.5 0 0 1 0 .707l-1.414 1.415a.5.5 0 1 1-.707-.708l1.414-1.414a.5.5 0 0 1 .707 0zm-9.193 9.193a.5.5 0 0 1 0 .707L3.05 13.657a.5.5 0 0 1-.707-.707l1.414-1.414a.5.5 0 0 1 .707 0zm9.193 2.121a.5.5 0 0 1-.707 0l-1.414-1.414a.5.5 0 0 1 .707-.707l1.414 1.414a.5.5 0 0 1 0 .707zM4.464 4.465a.5.5 0 0 1-.707 0L2.343 3.05a.5.5 0 1 1 .707-.707l1.414 1.414a.5.5 0 0 1 0 .708z"/>
      </symbol>
    </svg>
    


  <header class="header py-3 mb-3 border-bottom">
  <div class="container-fluid">
    <div class="header-content d-flex align-items-center justify-content-between">
      
      <div> <h2>AGENDA</h2> </div>
      
      <div class="barra-de-busca text-center d-flex align-items-center">
        <form class="search-form align-items-center" role="search">
          <div class="input-group">
            <input type="search" id="mySearchInput" class="form-control form-control-sm" placeholder="Search..." aria-label="Search">
            
            <a href="/AgendaDWI/registerTarefa?id_usuario=${id_usuario}&nome_usuario=${nome_usuario}">
              <button type="button" class="btn btn-sm btn-outline-success">Adicionar</button>
            </a>
          </div>
        </form>
      </div>

      <div class="user-info">
        <p class="fw-bold user-name">${nome_usuario}</p>
        <br>
        <a class="dropdown-item fw-bold" href="/AgendaDWI/logout">
        	<button type="button" class="btn btn-dark">logout</button>
        </a>
      </div>
    </div>
  </div>
</header>





  
<main>
  

		
	
  
  <div class="container">
  <div class="row justify-content-center">
    <div class="col-md-8">
      <%
      List<Task> lista = (List<Task>) request.getAttribute("tarefas");

            if(lista != null) {
              for(Task tarefa : lista) {
      %>
      <table class="table table-bordered">
        <tr>
          <td class="fw-bold text-primary">Título:</td>
          <td><%= tarefa.getTitulo() %></td>
          <td>
            <a href="/AgendaDWI/mostraTarefa?id_tarefa=<%= tarefa.getId_tarefa() %>&nome_usuario=${nome_usuario}">
              <button type="button" class="btn btn-sm btn-outline-primary">Editar</button>
            </a>
          </td>
        </tr>
        <tr>
          <td class="fw-bold text-primary">Descrição:</td>
          <td><%= tarefa.getDescricao() %></td>
          <td>
            <a href="/AgendaDWI/removeTarefa?id_tarefa=<%= tarefa.getId_tarefa() %>&id_usuario=${ id_usuario }&nome_usuario=${nome_usuario}">
              <button type="button" class="btn btn-sm btn-outline-danger">Remover</button>
            </a>
          </td>
        </tr>
        <tr>
          <td class="fw-bold text-primary">Criação:</td>
          <td><%= tarefa.getData_criacao() %></td>
          <td></td>
        </tr>
      </table>
      <small>
        <% 
        if(tarefa.isStatus()) {
        %>
         <p class="text-info"> Concluído em <%= tarefa.getData_conclusao() %></p>
        <%
        } else {
        %>
        <p class="text-success">Em andamento </p>
        <%
        }
        %>
      </small>
      <% 
        }
      }
      %>
    </div>
  </div>
</div>


  
  


</main>

	
	
	
	<dialog class="dialog-tarefaCadastrada">
      
      	<h1>
      		Tarefa Cadastrada
      	</h1>
      	
      	<button class="close-C">Ok</button>
      
      </dialog>
      
    <dialog class="dialog-tarefaAlterada">
      
      	<h1>
      		Tarefa Alterada com sucesso
      	</h1>
      	
      	<button class="close-A">Ok</button>
      
      </dialog>

    

    <script src="/docs/5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>
 
 	<script>
 	
 		
 		
 		const modalCadastro = document.querySelector(".dialog-tarefaCadastrada")
 		const modalAltera = document.querySelector(".dialog-tarefaAlterada")
      	const buttonCloseCadastro = document.querySelector(".dialog-tarefaCadastrada .close-C")
      	const buttonCloseAltera = document.querySelector(".dialog-tarefaAlterada .close-A")
      	
      	buttonCloseCadastro.onclick = function () {
 				modalCadastro.close()
				console.log("olaaaaa")
			}
 		
 		buttonCloseAltera.onclick = function () {
 			modalAltera.close()
			console.log("Deu?")
		}
 		
 		<%
 			boolean mCadastra = (boolean) request.getAttribute("tarefaCadastrada");
 			boolean mAltera = (boolean) request.getAttribute("tarefaAlterada");
 		%>
 		
 		if(<%= mAltera %>) {
 			modalAltera.showModal()
  		}
 		
 		if(<%= mCadastra %>) {
 			modalCadastro.showModal()
  		}
 		
 		
 		const inputSearchAgenda = document.querySelector('#mySearchInput')
 		const allContainer = document.querySelector('.g-3')
 		
 		const filterTarefas = (tarefas, inputValue, returnMatchedTarefas) => tarefas.filter(tarefa => {
 				const matchedTarefas = tarefa.textContent.substr(0, 50).toLowerCase().includes(inputValue)
 				return returnMatchedTarefas ? matchedTarefas : !matchedTarefas
 		})
 		
 		const hideTarefas = (tarefas, inputValue) => {
 			filterTarefas(tarefas, inputValue, false).forEach(tarefa => { 
 				tarefa.classList.add('hidden')
 			})
 		}
 		
 		const showTarefas = (tarefas, inputValue) => {
 			filterTarefas(tarefas, inputValue, true).forEach(tarefa => { 
 				tarefa.classList.remove('hidden')
 			})
 		}
 		
 		inputSearchAgenda.addEventListener('input', event => {
 			console.log('opa')
 			const inputValue = event.target.value.trim().toLowerCase()
 			const tarefas = Array.from(allContainer.children)
 			
 			hideTarefas(tarefas, inputValue)
 			
 			showTarefas(tarefas, inputValue)
 			
 		})
 		
 	</script>
 	
  </body>
</html>