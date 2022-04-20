<%-- 
    Document   : index
    Created on : Apr 19, 2022, 8:51:04 PM
    Author     : Alexandre
--%>

<%@page import="java.util.Random"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<% 
    
    Random random = new Random();
    if(request.getParameter("logout-form")!=null){
        session.removeAttribute("userName");
        session.removeAttribute("number1");
        response.sendRedirect(request.getRequestURI());
    }
    if(request.getParameter("gerarNumeros")!=null){
        session.setAttribute("number1", random.nextInt(10)+1);
        session.setAttribute("number2", random.nextInt(20 - 11 + 1)+11);
        session.setAttribute("number3", random.nextInt(30 - 21 + 1)+21);
        session.setAttribute("number4", random.nextInt(40 - 31 + 1)+31);
        session.setAttribute("number5", random.nextInt(50 - 41 + 1)+41);
        session.setAttribute("number6", random.nextInt(60 - 51 + 1)+51);
        
        response.sendRedirect(request.getRequestURI());
    }
%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <title>Controle de Sessao</title>
    </head>
    <body>
        <%@include file="WEB-INF/jspf/header.jspf" %>
        <%if(session.getAttribute("userName")!=null){
            if(session.getAttribute("number1")!=null){%>
                <h3>Números da dica para loteria:</h3>
                <p>
                    <%= 
                        session.getAttribute("number1")+", "+
                        session.getAttribute("number2")+", "+
                        session.getAttribute("number3")+", "+
                        session.getAttribute("number4")+", "+
                        session.getAttribute("number5")+", "+
                        session.getAttribute("number6")
                    %>
                </p>
            <%}else{%>
                <form>
                    Você ainda não tem os números da dica para loteria
                    <input type="submit" name="gerarNumeros" value="gerar"/>
                
                </form><%
                
            }%>
                   
            
            
        <%}else{%>
            <p style="color: red">Você precisa logar para ver as dicas para loteria!</p>
        <%}%>
    </body>
</html>
