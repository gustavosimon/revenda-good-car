<%-- 
    Document   : alteraFormCliente.jsp
    Created on : 11/06/2020, 20:19:51
    Author     : Gustavo Simon
--%>

<%@page import="java.math.BigInteger"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Alteração de cliente</title>
    </head>
    <body>
        <%
            String url = "jdbc:derby://localhost:1527/bancoGoodCar";
            Connection con = DriverManager.getConnection(url, "simon", "simon");
            String id = request.getParameter("ID");
            String sql = "SELECT * FROM CLIENTE WHERE ID=" + id;
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery(sql);
            Integer size = rs.getFetchSize();
            
            String nome =  "", endereco = "", email = "", telefone = "";
            
            if(rs.next()){
                nome = rs.getString("NOME");
                endereco = rs.getString("ENDERECO");
                email = rs.getString("EMAIL");
                telefone = rs.getString("TELEFONE");
            }
        %>
        <strong>
            Dados do cliente:
        </strong>
        <br></br>
        <form method="post" action="alteraCliente.jsp?ID=<%=id%>">
            Nome: <input type="text" name="nome" value="<%=nome%>"  required><br>
            Endereço: <input type="text" name="endereco" value="<%=endereco%>" required><br>
            Telefone <input type="text" name="telefone" value="<%=telefone%>"  required><br>
            Email: <input type="email" name="email" value="<%=email%>"  required><br>
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
