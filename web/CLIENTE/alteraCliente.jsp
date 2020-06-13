<%-- 
    Document   : alteraCliente
    Created on : 11/06/2020, 20:19:14
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
        <title>Alteração de cliente</title>
    </head>
    <body>
        <% 
        String url = "jdbc:derby://localhost:1527/bancoGoodCar"; 
        Connection con = DriverManager.getConnection(url, "simon", "simon");
        Statement stmt = con.createStatement();
        String nome = request.getParameter("nome"); 
        String endereco = request.getParameter("endereco");
        String telefone = request.getParameter("telefone");
        String email = request.getParameter("email"); 

        String sql = "UPDATE CLIENTE SET "
                    + "NOME = '" +nome+ "',"
                    + "ENDERECO ='"+endereco+"',"
                    + "TELEFONE="+telefone+","
                    + "EMAIL= '"+email+"' WHERE ID=" + request.getParameter("ID");                                
        
        try{
            if (stmt.executeUpdate(sql) == 1){
                out.print("Cliente alterado com sucesso!<br>");
            }else{
                out.print("Cliente não alterado!");
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
