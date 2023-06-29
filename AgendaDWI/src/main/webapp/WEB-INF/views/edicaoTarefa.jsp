<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ page import="model.Task"%>
<!doctype html>
<html lang="en" data-bs-theme="auto">
  <head>
    <script src="/docs/5.3/assets/js/color-modes.js"></script>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Hugo 0.111.3">
    <title>Editando a tarefa!</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
    <link rel="canonical" href="https://getbootstrap.com/docs/5.3/examples/checkout/">
    <link href="/docs/5.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
    <!-- Favicons -->
    <!-- Custom styles for this template -->
    <link href="checkout.css" rel="stylesheet">
    <style>
      html,
      body {
        height: 100%;
      }

      body {
        display: flex;
        align-items: center;
        padding-top: 40px;
        padding-bottom: 40px;
        background-color: #f5f5f5;
      }

      .form-signin {
        width: 100%;
        max-width: 330px;
        padding: 15px;
        margin: auto;
      }
    </style>
  </head>
  <body class="bg-body-tertiary">
    <div class="container">
      <main class="form-signin">
        <div class="py-5 text-center">
          <h2>Alterar Tarefa</h2>
        </div>
        <div class="col-md-7 col-lg-8">
          <form class="needs-validation" action="<%=request.getContextPath()%>/alteraTarefa" method="post">
            <div class="row g-3">
              <div class="col-12">
                <label for="titulo" class="form-label">Título</label>
                <div class="input-group has-validation">
                  <input type="text" class="form-control" id="titulo" value="${ tarefa.titulo }" name="titulo" required maxlength="100">
                </div>
              </div>
              <div class="col-12">
                <label for="descricao" class="form-label">Descrição</label>
                <div class="input-group has-validation">
                  <input type="text" class="form-control" id="descricao" value="${ tarefa.descricao }" name="descricao">
                </div>
              </div>
              <div class="form-check">
                <hr class="my-4">
                <%
                Task tarefa = (Task) request.getAttribute("tarefa");
                                  if (tarefa.isStatus()) {
                %>
                <input type="checkbox" class="form-check-input" id="save-info" name="status" checked>
                <label class="form-check-label" for="save-info">Tarefa Concluída em <%= tarefa.getData_conclusao() %></label>
                <%
                  } else {
                %>
                <input type="checkbox" class="form-check-input" id="save-info" name="status">
                <label class="form-check-label" for="save-info">Tarefa Concluída</label>
                <%
                  }
                %>
                <hr class="my-4">
              </div>
              <input type="hidden" name="id_tarefa" value="${ tarefa.id_tarefa }" />
              <input type="hidden" name="id_usuario" value="${ tarefa.id_usuario }" />
              <input type="hidden" name="nome_usuario" value="${ nome_usuario }" />
              <button class="w-100 btn btn-primary btn-lg" type="submit">Alterar Tarefa</button>
                           
              
            </div>
          </form>
        </div>
      </main>
    </div>
    <script src="/docs/5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>
    <script src="checkout.js"></script>
  </body>
</html>
