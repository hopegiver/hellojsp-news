<%@ page import="javax.xml.crypto.Data" %>
<%@ page contentType="text/html; charset=utf-8" %><%@ include file="init.jsp" %><%

    language = f.get("language");
    auth.put("language", f.get("language"));
    auth.save();

    m.jsReplace("/admin/banner/index.jsp");

    p.setBody("layout/layout_admin");
    p.setVar("form_script", f.getScript());
    p.setVar("language", language);
    p.print();

%>

