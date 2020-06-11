<%-- 
    Document   : listaClientes
    Created on : 10/06/2020, 22:54:10
    Author     : Gustavo Simon
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%--<%@page contentType="text/html" pageEncoding="UTF-8"%>--%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Listagem de clientes</title>
    </head>
    <body>
        <strong>Listagem de clientes </strong>
        <br></br>
        <%
            String url = "jdbc:derby://localhost:1527/bancoGoodCar";
            Connection con = DriverManager.getConnection(url, "simon", "simon");
            String sql = "SELECT * FROM CLIENTE";
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery(sql);
        %>
      <table>
        <thead>
            <tr>
                <td>Nome</td>
                <td>Endereço</td>
                <td>Telefone</td>
                <td>E-mail</td>
            </tr>
        </thead>
        <tbody>
            <%
                while(rs.next()){
                    out.println("<tr key={0}><td>"+rs.getString("NOME")+"</td><td>"+rs.getString("ENDERECO")+"</td><td>"+rs.getString("TELEFONE")+"</td><td>"+rs.getString("EMAIL")+"</td></tr>");
                }
            %>
        </tbody>
      </table>
        <br></br>
        <button>
            <a href="../index.html">
            Voltar
        </button>
    </body>
</html>
