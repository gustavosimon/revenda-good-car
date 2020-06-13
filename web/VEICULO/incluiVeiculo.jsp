<%-- 
    
    Document   : incluiVeiculo.jsp
    Created on : 11/06/2020, 15:48:11
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
        <title>Inclusão de veículo</title>
    </head>
    <body>
        <% 
        String url = "jdbc:derby://localhost:1527/bancoGoodCar"; 
        Connection con = DriverManager.getConnection(url, "simon", "simon");
        Statement stmt = con.createStatement();
        String modelo = request.getParameter("modelo"); 
        String ano = request.getParameter("ano");
        String km = request.getParameter("km");
        String potencia = request.getParameter("potencia"); 
        String preco = request.getParameter("preco"); 
        String marca = request.getParameter("marca");        
        String sql = "INSERT INTO VEICULO"
                + "(MODELO,ANO,QUILOMETRAGEM,POTENCIA,PRECO,ID_MARCA) "
                + "VALUES('"+modelo+"',"+ano+","+km+","+potencia+","+preco+","+marca+")";

        try{
            if (stmt.executeUpdate(sql) == 1){
                out.print("Veículo incluído com sucesso!<br>");
            }else{
                out.print("Veículo não inserido!");
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



