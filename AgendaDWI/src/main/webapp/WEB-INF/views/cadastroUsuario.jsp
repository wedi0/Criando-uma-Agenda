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
    <title>Cadastrar novo Usuário!</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
    <link rel="canonical" href="https://getbootstrap.com/docs/5.3/examples/checkout/">
    <link href="/docs/5.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
    <!-- Favicons -->
    <link rel="apple-touch-icon" href="/docs/5.3/assets/img/favicons/apple-touch-icon.png" sizes="180x180">
    <link rel="icon" href="/docs/5.3/assets/img/favicons/favicon-32x32.png" sizes="32x32" type="image/png">
    <link rel="icon" href="/docs/5.3/assets/img/favicons/favicon-16x16.png" sizes="16x16" type="image/png">
    <link rel="manifest" href="/docs/5.3/assets/img/favicons/manifest.json">
    <link rel="mask-icon" href="/docs/5.3/assets/img/favicons/safari-pinned-tab.svg" color="#712cf9">
    <link rel="icon" href="/docs/5.3/assets/img/favicons/favicon.ico">
    <meta name="theme-color" content="#712cf9">
    <style>
        .container {
            max-width: 600px;
            margin: 0 auto;
        }
        h1 {
            font-size: 24px;
            margin-bottom: 20px;
        }
    </style>
</head>
<body>
<div class="container">
    <div class="container">
  <main>
    <div class="row justify-content-center">
      <div class="col-md-7 col-lg-8">
        <h1 class="mb-3 text-center">Cadastrar novo Usuário</h1>
        <form id="formulario" class="needs-validation" action="<%= request.getContextPath() %>/registerUsuario" method="post">
          <div class="row g-3">
            <div class="col-12">
              <label for="name" class="form-label">Nome</label>
              <input type="text" class="form-control" id="name" name="nome" placeholder="Nome" required maxlength="70">
            </div>
            <div class="col-12">
              <label for="username" class="form-label">Username</label>
              <div class="input-group has-validation">
                <input type="text" class="form-control" id="username" placeholder="Login" name="login" required maxlength="70">
              </div>
            </div>
            <div class="col-12">
              <label for="password" class="form-label">Senha</label>
              <div class="input-group has-validation">
                <span class="input-group-text">*</span>
                <input type="password" class="form-control" id="password" name="senha" required>
              </div>
            </div>
            <div class="col-12">
              <label for="email" class="form-label">Email</label>
              <div class="input-group has-validation">
                <span class="input-group-text">@</span>
                <input type="email" class="form-control" id="email" placeholder="email@example.com" name="email" required maxlength="70">
              </div>
            </div>
            <div class="col-12">
              <button class="w-100 btn btn-primary btn-lg" type="submit">Cadastrar</button>
            </div>
            <div class="col-12 text-center">
              Voltar ao <a href="/AgendaDWI/login">Login</a>
            </div>
          </div>
        </form>
      </div>
    </div>
  </main>
</div>

    
</div>
<script src="/docs/5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>
<script src="checkout.js"></script>
<dialog class="dialog-userExiste">
    <h1>Usuário com este nome já existe!</h1>
    <p>Por favor insira outro nome para o usuário.</p>
    <button class="close">Ok</button>
</dialog>
<script>
    const modalExiste = document.querySelector(".dialog-userExiste");
    const buttonClose = document.querySelector(".dialog-userExiste .close");

    buttonClose.onclick = function () {
        modalExiste.close();
        console.log("opa");
    }

    <% boolean modal = (boolean) request.getAttribute("modal"); %>
    if (<%= modal %>) {
        modalExiste.showModal();
    }
</script>
</body>
</html>
