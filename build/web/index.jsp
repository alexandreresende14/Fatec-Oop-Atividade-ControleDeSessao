<%-- 
    Document   : index
    Created on : Apr 19, 2022, 8:51:04 PM
    Author     : Alexandre
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%
    if(request.getParameter("login-form")!=null){
        session.setAttribute("userName", request.getParameter("userName"));
        response.sendRedirect(request.getRequestURI());
    }
    if(request.getParameter("logout-form")!=null){
        session.removeAttribute("userName");
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
        <%if(session.getAttribute("userName")!=null){%>
            Voce esta logado!
        <%}else{%>
        <form>
            User Name: <input type="text" name="userName" placeholder="login:"/>
            <input type="submit" name="login-form"/>
        </form>
        <%}%>
    </body>
</html>
