<%-- 
    Document   : listaVeiculos
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
        <title>Listagem de veículos</title>
    </head>
    <body>
        <strong>Listagem de veículos </strong>
        <br></br>
        <%
            String url = "jdbc:derby://localhost:1527/bancoGoodCar";
            Connection con = DriverManager.getConnection(url, "simon", "simon");
            String sql = "select v.ID, v.MODELO, v.ANO, v.QUILOMETRAGEM, v.POTENCIA, v.PRECO, m.NOME_MARCA from VEICULO AS V JOIN MARCA AS M ON V.ID_MARCA = M.ID ORDER BY V.ID";
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery(sql);
        %>
      <table>
        <thead>
            <tr>
                <td>Modelo</td>
                <td>Ano</td>
                <td>Quilometragem</td>
                <td>Potencia</td>
                <td>Preço</td>
                <td>Marca</td>
            </tr>
        </thead>
        <tbody>
            <%
                while(rs.next()){
                    out.println("<tr key={"+rs.getString("ID")+"}><td>"+rs.getString("MODELO")+"</td><td>"+rs.getString("ANO")+"</td><td>"+rs.getString("QUILOMETRAGEM")+"</td><td>"+rs.getString("POTENCIA")+"</td><td>"+rs.getString("PRECO")+"</td><td>"+rs.getString("NOME_MARCA")+"</td><td><button><a href=alteraFormVeiculo.jsp?ID="+rs.getString("ID")+">Alterar</a></button></td><td><button><a href=excluiVeiculo.jsp?ID="+rs.getString("ID")+">Excluir</a></button></td></tr>");
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
