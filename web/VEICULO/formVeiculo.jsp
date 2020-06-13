<%-- 
    Document   : formVeiculo.jsp
    Created on : 11/06/2020, 13:58:17
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
        <title>Inclusão de veículos</title>
    </head>
    <body>
        <%
            String url = "jdbc:derby://localhost:1527/bancoGoodCar";
            Connection con = DriverManager.getConnection(url, "simon", "simon");
            String sql = "SELECT * FROM MARCA";
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery(sql);
        %>
        <strong>
            Dados do veículo:
        </strong>
        <br></br>
        <form method="post" action="incluiVeiculo.jsp">
            Modelo: <input type="text" name="modelo" required><br>
            Ano: <input type="text" name="ano" required><br>
            Quilometragem: <input type="text" name="km" required><br>
            Potência: <input type="text" name="potencia" required><br>
            Preço: <input type="text" name="preco" required><br>
            Marca: 
            <select name="marca">                                
                <%
                    while(rs.next()){
                        out.println("<option value="+rs.getString("ID")+">"+rs.getString("NOME_MARCA")+"</option>");
                    }
                %>
            </select>
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
