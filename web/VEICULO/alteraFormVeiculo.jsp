<%-- 
    Document   : alteraFormVeiculo
    Created on : 11/06/2020, 21:01:50
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
            String sql = "SELECT * FROM MARCA";
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery(sql);
            
            String id = request.getParameter("ID");
            String sql1 = "SELECT * FROM VEICULO WHERE ID=" + id;
            Statement stmt1 = con.createStatement();
            ResultSet rs1 = stmt1.executeQuery(sql1);
            Integer size = rs1.getFetchSize();
            
            String modelo =  "",  ano = "", quilometragem = "", potencia = "", preco = "", id_marca = "";
            
            if(rs1.next()){
                modelo = rs1.getString("MODELO");
                ano = rs1.getString("ANO");
                quilometragem = rs1.getString("QUILOMETRAGEM");
                potencia = rs1.getString("POTENCIA");
                preco = rs1.getString("PRECO");
                id_marca = rs1.getString("ID_MARCA");
            }
        %>
        <strong>
            Dados do cliente:
        </strong>
        <br></br>
        <form method="post" action="alteraVeiculo.jsp?ID=<%=id%>">
            Modelo: <input type="text" name="modelo" value="<%=modelo%>"><br>
            Ano: <input type="text" name="ano" value="<%=ano%>"><br>
            Quilometragem: <input type="text" name="km" value="<%=quilometragem%>"><br>
            Potência: <input type="text" name=potencia value="<%=potencia%>"><br>
            Preço: <input type="text" name="preco" value="<%=preco%>"><br>
            Marca: 
            <select name="marca" value="<%=id_marca%>">                                
                <%
                    while(rs.next()){
                        out.println("<option value="+rs.getString("ID")+">"+rs.getString("NOME_MARCA")+"</option>");
                    }
                %>
            </select>
            <br>
            <input type="reset">&nbsp;<input type="submit" value="Enviar">
    </body>
</html>
