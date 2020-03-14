<%@ page import="javax.xml.crypto.Data" %>
<%@ page contentType="text/html; charset=utf-8" %><%@ include file="/init.jsp" %><%

    p.setLayout("admin");
    p.setBody("admin/dashboard");
    p.setVar("form_script", f.getScript());
    p.print();

%>

