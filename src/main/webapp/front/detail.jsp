<%@ page contentType="text/html; charset=utf-8" %><%@ include file="/init.jsp" %><%@ include file="/inc.jsp" %><%

    int id = m.reqInt("id");
    if(id == 0) { m.jsError("Primary Key is required"); return; }

    DataSet info = news.find("status != -1 AND id = " + id);
    if(!info.next()) { m.jsError("No Data"); return; }

    p.setBody("front/detail");
    p.setVar("form_script", f.getScript());
    p.setVar("info", info);
    p.print();


%>