<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>

    <h1>Cadastro</h1>

    <form action="cadastro_endereco.php" method="post" onsubmit="return validarSenha()"  enctype="multipart/form-data">

    <p>Nome:</p>
    <input type="text" placeholder="Digite seu nome completo" name="nome" required><br>

    <p>Email:</p>
    <input type="email" placeholder="Digite seu email" name="email" required><br>

    <p>Senha:</p>
    <input type="text" placeholder="Digite sua senha" id="senha" name="senha" required><br>

    <p>Confirme sua senha:</p>
    <input type="text" placeholder="Confirme sua senha" id="senhaConfirmacao" name="senhaConfirmacao" required><br>

    <script>
    function validarSenha() {
        var senha = document.getElementById("senha").value;
        var senhaConfirmacao = document.getElementById("senhaConfirmacao").value;

        if (senha !== senhaConfirmacao) {
            alert("As senhas não coincidem. Por favor, tente novamente.");
            return false;
        }
        return true;
    }

    </script>

    <h3>Dados Pessoais:</h3>

    <p>Data de nascimento:</p>
    <input type="text" placeholder="Digite sua data de nascimento" name="data_nascimento" required><br>

    <p>CPF:</p>
    <input type="text" placeholder="Digite seu CPF" name="cpf" required><br>

    <p>Sexo:</p>
    <select name="sexo" id="sexo" required>
        <option value="m">Masculino</option>
        <option value="f">Feminino</option>
        <option value="o">Outro</option>
    </select>
    <br>

<<<<<<< HEAD:html/cadastro.php
    <button type="submit">Prosseguir Cadastro</button>
=======
    <p>foto de perfil:</p>
    <input type="file" name="foto" id="foto" accept="image/*">
    <br><br>

>>>>>>> abbacd125f0bc2c429bc38e7509899bac26b1693:html/cadastro_usuario.php
    </form>
</body>
</html>