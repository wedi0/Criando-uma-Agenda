<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="model.User"%>


<!doctype html>
<html lang="en" data-bs-theme="auto">
  <head><script src="../assets/js/color-modes.js"></script>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Hugo 0.111.3">
    <title>Login</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">

    <link rel="canonical" href="https://getbootstrap.com/docs/5.3/examples/sign-in/">
    
<link href="../assets/dist/css/bootstrap.min.css" rel="stylesheet">

   <style>
        .form-signin {
            max-width: 400px;
            margin: 0 auto;
            text-align: center;
            padding: 20px;
        }
        h1 {
            font-size: 24px;
            margin-bottom: 20px;
        }
    </style>
</head>
<body>
<main class="form-signin">
    <h1>Login</h1>
    <form action="<%= request.getContextPath() %>/Login" method="post">
        <div class="form-floating">
            <input type="text" class="form-control" id="floatingInput" name="usuario" required>
            <label for="floatingInput">Username</label>
        </div>
        <div class="form-floating">
            <input type="password" class="form-control" id="floatingPassword" placeholder="Password" name="senha" required>
            <label for="floatingInput">Password</label>
        </div>
        <button class="w-100 btn btn-lg btn-primary" type="submit">Login</button>
        <br>
        <br>
        Deseja se cadastrar? <a href="/AgendaDWI/registerUsuario">Cadastrar</a>
    </form>
</main>

<dialog class="dialog-incorreto">
    <h1>
        Login ou senha incorreta!
    </h1>
    <button class="close">Ok</button>
</dialog>

<dialog class="dialog-sucesso">
    <h1>
        Usuário cadastrado com sucesso!
    </h1>
    <button class="confirm">Ok</button>
</dialog>

<script>
    const modalLogin = document.querySelector(".dialog-incorreto");
    const modalUser = document.querySelector(".dialog-sucesso");
    const buttonConfirm = document.querySelector(".dialog-sucesso .confirm");
    const buttonClose = document.querySelector(".dialog-incorreto .close");

    <% boolean userSucesso = (boolean) request.getAttribute("userSucesso");
       boolean primeiraExecucao = (boolean) request.getAttribute("primeiraExecucao");
       boolean verificaLogin = (boolean) request.getAttribute("verificaLogin");
       if (!primeiraExecucao && !verificaLogin) { %>
        modalLogin.showModal();
    <% } %>

    <% if (userSucesso) { %>
        modalUser.showModal();
    <% } %>

    buttonClose.onclick = function () {
        modalLogin.close();
        console.log("opa");
    }

    buttonConfirm.onclick = function () {
        modalUser.close();
        console.log("opa");
    }
</script>

</body>
</html>