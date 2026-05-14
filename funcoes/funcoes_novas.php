<script>
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
</script>