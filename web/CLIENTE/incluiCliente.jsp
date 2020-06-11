<%-- 
    Document   : incluiCliente.jsp
    Created on : 11/06/2020, 16:17:02
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
        <title>Cliente incluído!</title>
    </head>
    <body>
    <body>
        <% 
        String url = "jdbc:derby://localhost:1527/bancoGoodCar"; 
        Connection con = DriverManager.getConnection(url, "simon", "simon");
        Statement stmt = con.createStatement();
        String nome = request.getParameter("nome"); 
        String endereco = request.getParameter("endereco");
        String telefone = request.getParameter("telefone");
        String email = request.getParameter("email"); 
        String sql = "INSERT INTO CLIENTE"
                + "(NOME,ENDERECO,TELEFONE,EMAIL) "
                + "VALUES('"+nome+"','"+endereco+"',"+telefone+",'"+email+"')";
        try{
            if (stmt.executeUpdate(sql) == 1){
                out.print("Cliente incluído com sucesso!<br>");
            }else{
                out.print("Cliente não inserido!");
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
