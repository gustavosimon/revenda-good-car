<%-- 
    Document   : formMarca
    Created on : 11/06/2020, 22:44:59
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
        <title>Inclusão de marcas</title>
    </head>
    <body>
        <strong>
            Dados da marca:
        </strong>
        <br></br>
        <form method="post" action="incluiMarca.jsp">
            Nome da marca: <input type="text" name="nome_marca" required><br>
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
