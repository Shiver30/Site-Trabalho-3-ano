<?php

    session_start();




?>



<script>

    // Função para pesquisar 

    // Função para cadastrar usuariono banco de dados ( tem que colocar as imagens )

    function cadastrarUsuario($conexao,$nome, $idade, $cpf, $sexo, $email, $senha, $img, $estado_id, $cidade_id) {
        $sql = "INSERT INTO usuarios ( usuarios_nome, usuarios_idade, usuarios_cpf, usuarios_sexo, usuarios_email, usuarios_senha, usuarios_img ) VALUES (?, ?, ?, ?, ?, ?, ? )";
        $comando = mysql_prepare($conexao, $sql);
        mysqli_stmt_bind_param($comando, "sssssss", $nome, $idade, $cpf, $sexo, $email, $senha, $img );


    }
    // Função para listar os estados e cidades do banco de dados

    function listar($conexao) {
    $sql = "SELECT * FROM estado ORDER BY estado_nome";
    $comando = mysqli_prepare($conexao, $sql);
    mysqli_stmt_execute($comando);
    $resultado = mysqli_stmt_get_result($comando);
    $lista_estados = [];
    while ($estado = mysqli_fetch_assoc($resultado)) {
        $lista_estados[] = $estado;
    }
    mysqli_stmt_close($comando);
    return $lista_estados;
    }

    function listarCidades($conexao, $estado_id) {
    $sql = "SELECT * FROM cidade WHERE estado_id = ? ORDER BY cidade_nome";
    $comando = mysqli_prepare($conexao, $sql);
    mysqli_stmt_bind_param($comando, 'i', $estado_id);
    mysqli_stmt_execute($comando);
    $resultado = mysqli_stmt_get_result($comando);
    $lista_cidades = [];
    while ($cidade = mysqli_fetch_assoc($resultado)) {
        $lista_cidades[] = $cidade;
    }
    mysqli_stmt_close($comando);
    return $lista_cidades;
    }


</script>