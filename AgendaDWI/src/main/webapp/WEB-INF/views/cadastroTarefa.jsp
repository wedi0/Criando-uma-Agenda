<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!doctype html>
<html lang="en" data-bs-theme="auto">
  <head>
    <script src="/docs/5.3/assets/js/color-modes.js"></script>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Hugo 0.111.3">
    <title>Cadastrar nova tarefa!</title>
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
          <h2>Nova Tarefa</h2>
        </div>
        <div class="col-md-7 col-lg-8">
          <form class="needs-validation" action="<%= request.getContextPath() %>/registerTarefa" method="post">
            <div class="row g-3">
              <div class="col-12">
                <label for="titulo" class="form-label">Título</label>
                <div class="input-group has-validation">
                  
                  <input type="text" class="form-control" id="titulo" placeholder="Título" name="titulo" maxlength="100" required>
                </div>
              </div>
              <div class="col-12">
                <label for="descricao" class="form-label">Descrição</label>
                <div class="input-group has-validation">
                  <input type="text" class="form-control" id="descricao" placeholder="Descrição" name="descricao">
                </div>
              </div>
              <div class="form-check">
                <hr class="my-4">
                <input type="checkbox" class="form-check-input" id="save-info" name="status">
                <label class="form-check-label" for="save-info">Tarefa Concluída</label>
                <hr class="my-4">
              </div>
              <button class="w-100 btn btn-primary btn-lg" type="submit">Cadastrar Tarefa</button>
            </div>
          </form>
        </div>
      </main>
    </div>
    <script src="/docs/5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>
    <script src="checkout.js"></script>
  </body>
</html>
