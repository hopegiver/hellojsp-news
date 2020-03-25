<%@ page contentType="text/html; charset=utf-8" %><%@ include file="/init.jsp" %><%@ include file="/inc.jsp" %><%

    int id = m.reqInt("id");
    if(id == 0) { m.jsError("Primary Key is required"); return; }

    DataSet item = news.find("id = " + id);
    if(!item.next()) { m.jsError("No Data"); return; }

    item.put("reg_date", m.time("MM-dd HH:mm"));

    f.addElement("first_name", null, "title:'first_name', required:true");
    f.addElement("last_name", null, "title:'last_name', required:true");
    f.addElement("phone1", null, "title:'phone', required:true");
    f.addElement("phone2", null, "title:'phone', required:true");
    f.addElement("phone3", null, "title:'phone', required:true");
    f.addElement("email", null, "title:'email', required:true");
    f.addElement("subject", null, "title:'subject', required:true");
    f.addElement("content", null, "title:'content', required:true");
    if(m.isPost() && f.validate()) {
        contact.item("news_id", id);
        contact.item("first_name", f.get("first_name"));
        contact.item("last_name", f.get("last_name"));
        contact.item("phone", f.glue("-", "phone1, phone2, phone3"));
        contact.item("email", f.get("email"));
        contact.item("subject", f.get("subject"));
        contact.item("content", f.get("content"));
        contact.item("reg_date", m.time("yyyyMMddHHmmss"));
        contact.item("status", 1);
        //blog.setDebug(out);
        if(!contact.insert()) {
            m.jsError(" occurred(insert)");
            return;
        }
        m.jsErrClose("Thanks for comment");
        return;
    }

    DataSet info = siteInfo.find("status != -1 ");
    if(!info.next()) { m.jsError("No Data"); return; }

    p.setBody("front/detail");
    p.setVar("form_script", f.getScript());
    p.setVar("item", item);
    p.setVar("info", info);
    p.print();


%>