<?php

if(isset($_POST["cadastrar"])){
    
    $nome = $_POST["nome"];
    $empresa = $_POST["empresa"];
    $sobrenome = $_POST["sobrenome"];
    $login = $_POST["login"];
    $senha = $_POST["senha"];
    $tipo_logradouro = $_POST["tipo_logradouro"];
    $logradouro = $_POST["logradouro"];
    $numero = $_POST["numero"];
    $bairro = $_POST["bairro"];
    $cep = $_POST["cep"];
    $estado = $_POST["estado"];
    $telefone = $_POST["telefone"];
    $email = $_POST["email"];
   
    include("conexao.php");
      
    $sqlcadalunoend = "insert into endereco (cod_end,tipo_logradouro,logradouro,numero,bairro,cep,estado)
                    values(null,'".$tipo_logradouro."','".$logradouro."','".$numero."','".$bairro."','".$cep."','".$estado."')";

    $sqlcadcontato = "insert into contato (cod_contato,tel,email) values (null,'".$telefone."','".$email."')";

    $sqlcadaluno = "insert into cliente (nome_clie,sobrenome_clie,login,senha,cod_end,cod_contato)
                    values ('".$nome."','".$sobrenome."','".$login."','".$senha."')";  
    
    if(mysqli_query($con, $sqlcadalunoend)){
        if(mysqli_query($con , $sqlcadcontato)){
          if(mysqli_query($con, $sqlcadaluno)){
            Alert("Cadastro efetuado com sucesso!");
            header('Location: index.html');

    }else{
        Alert("Não foi possível efetuar o cadastro");
    }
    }
    }
    
     
}
?>

