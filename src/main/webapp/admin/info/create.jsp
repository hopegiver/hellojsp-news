<%@ page contentType="text/html; charset=utf-8" %><%@ include file="../init.jsp" %><%

//Step1
	InfoDao siteInfo = new InfoDao();

//Step2
	f.addElement("site_name", null, "title:'menu_name', required:true");
	f.addElement("email", null, "title:'parent_id', required:true");
	f.addElement("phone", null, "title:'module'");
	f.addElement("telephone", null, "title:'module_id'");
	f.addElement("address", null, "title:'address'");

//Step3
if(m.isPost() && f.validate()) {

	siteInfo.item("site_name", f.get("site_name"));
	siteInfo.item("email", f.get("email"));
	siteInfo.item("phone", f.get("phone"));
	siteInfo.item("telephone", f.get("telephone"));
	siteInfo.item("address", f.get("address"));
	siteInfo.item("reg_date", m.time("yyyyMMddHHmmss"));
	siteInfo.item("status", 1);

	//blog.setDebug(out);
	if(!siteInfo.insert()) {
		m.jsError(" occurred(insert)");
		return;
	}
	m.redirect("index.jsp");
	return;
}
//Step4
	pageTitle = "info";
//p.setDebug(out);
p.setLayout("admin");
p.setBody("admin/info/create");
p.setVar("form_script", f.getScript());
p.setVar("pageTitle", pageTitle);
p.print();

%>