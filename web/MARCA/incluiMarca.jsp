<%-- 
    Document   : incluiMarca
    Created on : 11/06/2020, 22:47:23
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
        <% 
        String url = "jdbc:derby://localhost:1527/bancoGoodCar"; 
        Connection con = DriverManager.getConnection(url, "simon", "simon");
        Statement stmt = con.createStatement();
        String nome = request.getParameter("nome_marca"); 
        String sql = "INSERT INTO MARCA"
                + "(NOME_MARCA) "
                + "VALUES('"+nome+"')";
        try{
            if (stmt.executeUpdate(sql) == 1){
                out.print("Marca incluída com sucesso!");
            }else{
                out.print("Marca não inserida!");
            }
        }catch(Exception ex){
            out.print("Erro ao inserir dados na base: " + ex.getMessage());
        }
        %>
        <button>
          <a href="../index.html">
            Voltar
          </a>
        </button>

    </body>
</html>
