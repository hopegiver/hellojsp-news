<%@ page import="javax.xml.crypto.Data" %>
<%@ page contentType="text/html; charset=utf-8" %><%@ include file="init.jsp" %><%

    pageTitle = "dashboard";

    p.setLayout("admin");
    p.setBody("admin/dashboard");
    p.setVar("form_script", f.getScript());
    p.setVar("pageTitle", pageTitle);
    p.print();

%>

