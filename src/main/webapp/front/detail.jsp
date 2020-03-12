<%@ page contentType="text/html; charset=utf-8" %><%@ include file="/init.jsp" %><%@ include file="/inc.jsp" %><%

    int id = m.reqInt("id");
    if(id == 0) { m.jsError("Primary Key is required"); return; }

    DataSet item = news.find("id = " + id);
    if(!item.next()) { m.jsError("No Data"); return; }

    item.put("reg_date", m.time("MM-dd HH:mm"));

    DataSet info = siteInfo.find("status != -1 ");
    if(!info.next()) { m.jsError("No Data"); return; }

    p.setBody("front/detail");
    p.setVar("form_script", f.getScript());
    p.setVar("item", item);
    p.setVar("info", info);
    p.print();


%>