<%-- 
    Document   : formCliente.jsp
    Created on : 11/06/2020, 16:15:14
    Author     : Gustavo Simon
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Inclusão de clientes</title>
    </head>
    <body>
        <strong>
            Dados do cliente:
        </strong>
        <br></br>
        <form method="post" action="incluiCliente.jsp">
            Nome: <input type="text" name="nome"><br>
            Endereço: <input type="text" name="endereco"><br>
            Telefone <input type="text" name="telefone"><br>
            Email: <input type="email" name="email"><br>
            <br>
            <input type="reset">&nbsp;<input type="submit" value="Enviar">
            <button>
              <a href="../index.html">
                Voltar
              </a>
            </button>
        </form>
    </body>
</html>
