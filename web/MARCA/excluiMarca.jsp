<%-- 
    Document   : excluiMarca.jsp
    Created on : 11/06/2020, 23:05:27
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
            String valVeiculos = "SELECT * FROM VEICULO WHERE ID_MARCA=" + request.getParameter("ID");     
            String sql = "DELETE FROM MARCA WHERE ID=" + request.getParameter("ID");
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery(valVeiculos);
            if (rs.next()) {
                out.print("Possuem veículos cadastrados com a marca código "+request.getParameter("ID")+". Não será possível excluí-la!");
                out.print("<button><a href='../index.html'>Voltar</a></button>");
            } else {
                if(stmt.executeUpdate(sql) == 1){
                    out.print("Veiculo código "+request.getParameter("ID")+" excluído com sucesso!<br>");
                    out.print("<button><a href='../index.html'>Voltar</a></button>");
                }
            }
        %>
    </body>
</html>
