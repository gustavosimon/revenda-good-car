<%-- 
    Document   : listaMarcas
    Created on : 11/06/2020, 22:20:28
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
        <title>Listagem de marcas</title>
    </head>
    <body>
        <strong>Listagem de marcas</strong>
        <br></br>
        <%
            String url = "jdbc:derby://localhost:1527/bancoGoodCar";
            Connection con = DriverManager.getConnection(url, "simon", "simon");
            String sql = "SELECT * FROM MARCA";
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery(sql);
        %>
      <table>
        <thead>
            <tr>
                <td>ID</td>
                <td>Nome da marca</td>
            </tr>
        </thead>
        <tbody>
            <%
                while(rs.next()){
                    out.println("<tr key={0}><td>"+rs.getString("ID")+"</td><td>"+rs.getString("NOME_MARCA")+"<td><button><a href=alteraFormMarca.jsp?ID="+rs.getString("ID")+">Alterar</a></button></td><td><button><a href=excluiMarca.jsp?ID="+rs.getString("ID")+">Excluir</a></button></td></tr>");
                }
            %>
        </tbody>
      </table>
        <br></br>
        <button>
            <a href="../index.html">
                Voltar
            </a>
        </button>
    </body>
</html>
