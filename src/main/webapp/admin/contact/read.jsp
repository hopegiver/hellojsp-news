<%@ page contentType="text/html; charset=utf-8" %><%@ include file="/init.jsp" %><%
    if(userId == null){
        m.jsAlert("Need to login");
        m.jsReplace("/admin/login.jsp", "window");
    }
//Step1
    ContactDao contact = new ContactDao();

//Step2
int id = m.reqInt("id");
if(id == 0) { m.jsError("Primary Key is required"); return; }

//Step3
DataSet info = contact.find("id = " + id);
if(!info.next()) { m.jsError("No Data"); return; }

//Step4
info.put("reg_date", m.time("yyyy-MM-dd HH:mm", info.s("reg_date")));
    pageTitle = "contact";
//Step5
p.setLayout("admin");
p.setBody("admin/contact/read");
p.setVar("info", info);
p.setVar("pageTitle", pageTitle);
p.print();

%>