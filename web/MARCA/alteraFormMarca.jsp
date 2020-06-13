<%-- 
    Document   : alteraFormMarca
    Created on : 11/06/2020, 22:55:46
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
        <title>Alteração de marcas</title>
    </head>
    <body>
        <%
            String url = "jdbc:derby://localhost:1527/bancoGoodCar";
            Connection con = DriverManager.getConnection(url, "simon", "simon");
            String id = request.getParameter("ID");
            String sql = "SELECT * FROM MARCA WHERE ID=" + id;
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery(sql);
            String nome_marca =  "";
            if(rs.next()){
                nome_marca = rs.getString("NOME_MARCA");
            }
        %>
        <strong>
            Dados do cliente:
        </strong>
        <br></br>
        <form method="post" action="alteraMarca.jsp?ID=<%=id%>">
            Nome da marca: <input type="text" name="nome_marca" value="<%=nome_marca%>" required><br>
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
