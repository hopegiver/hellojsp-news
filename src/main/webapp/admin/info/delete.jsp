<%@ page contentType="text/html; charset=utf-8" %><%@ include file="../init.jsp" %><%

//Step1
	InfoDao siteInfo = new InfoDao();

//Step2
int id = m.reqInt("id");
if(id == 0) { m.jsError("Primary Key is required"); return; }

//Step3
DataSet info = siteInfo.find("id = " + id);
if(!info.next()) { m.jsError("No Data"); return; }

f.addElement("id", info.s("id"), "title:'ID', required:true");

//Step5
if(m.isPost() && f.validate()) {
	siteInfo.item("status", -1);

	//blog.setDebug(out);
	if(!siteInfo.update("id = " + id)) {
		m.jsAlert("Error occurred(delete)");
		return;
	}

	m.redirect("index.jsp");
	return;
}
	pageTitle = "info";
//Step6
p.setLayout("admin");
p.setBody("admin/info/delete");
p.setVar("info", info);
p.setVar("form_script", f.getScript());
p.setVar("pageTitle", pageTitle);
p.print();

%>