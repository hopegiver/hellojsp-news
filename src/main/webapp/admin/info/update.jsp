<%@ page contentType="text/html; charset=utf-8" %><%@ include file="/init.jsp" %><%

	if(userId == null){
		m.jsAlert("Need to login");
		m.jsReplace("/admin/login.jsp", "window");
	}
//Step1
	InfoDao siteInfo = new InfoDao();

//Step2
int id = m.reqInt("id");
if(id == 0) { m.jsError("Primary Key is required"); return; }

//Step3
DataSet info = siteInfo.find("id = " + id);
if(!info.next()) { m.jsError("No Data"); return; }

//Step4
f.addElement("site_name", info.s("site_name"), "title:'site_name',  required:true");
f.addElement("email", info.s("email"), "title:'email', required:true");
f.addElement("phone", info.s("phone"), "title:'phone'");
f.addElement("telephone", info.s("telephone"), "title:'telephone'");
f.addElement("address", info.s("address"), "title:'address'");
f.addElement("reg_date", info.s("reg_date"), "title:'reg_date', editable:false");

//Step5
if(m.isPost() && f.validate()) {

	siteInfo.item("site_name", f.get("site_name"));
	siteInfo.item("email", f.get("email"));
	siteInfo.item("phone", f.get("phone", null));
	siteInfo.item("telephone", f.get("telephone", null));
	siteInfo.item("address", f.get("address"));


	//blog.setDebug(out);
	if(!siteInfo.update("id = " + id)) {
		m.jsAlert("Error occurred(update)");
		return;
	}

	m.redirect("index.jsp");
	return;
}

//Step6
p.setLayout("admin");
p.setBody("admin/info/update");
p.setVar("info", info);
p.setVar("form_script", f.getScript());
p.print();

%>