<%-- 
    Document   : alteraMarca
    Created on : 11/06/2020, 23:01:36
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
        <title>JSP Page</title>
    </head>
    <body>
        <% 
        String url = "jdbc:derby://localhost:1527/bancoGoodCar"; 
        Connection con = DriverManager.getConnection(url, "simon", "simon");
        Statement stmt = con.createStatement();
        
        String nome_marca = request.getParameter("nome_marca"); 
        
        String sql = "UPDATE MARCA SET "
                    + "NOME_MARCA = '" +nome_marca+ "'"
                    + " WHERE ID=" + request.getParameter("ID");                                
        
        try{
            if (stmt.executeUpdate(sql) == 1){
                out.print("Marca alterada com sucesso!<br>");
            }else{
                out.print("Marca não alterada!");
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
