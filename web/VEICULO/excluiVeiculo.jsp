<%-- 
    Document   : excluiVeiculo.jsp
    Created on : 11/06/2020, 17:52:15
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
        <title>Excluisão de veículo</title>
    </head>
    <body>
        <%
            String url = "jdbc:derby://localhost:1527/bancoGoodCar";
            Connection con = DriverManager.getConnection(url, "simon", "simon");
            String sql = "DELETE FROM VEICULO WHERE ID=" + request.getParameter("ID");
            Statement stmt = con.createStatement();
            if(stmt.executeUpdate(sql) == 1){
                out.print("Veiculo código "+request.getParameter("ID")+" excluído com sucesso!<br>");
                out.print("<button><a href='../index.html'>Voltar</a></button>");
            }
        %>
    </body>
</html>
