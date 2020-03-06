<%@ page contentType="text/html; charset=utf-8" %><%@ include file="/init.jsp" %><%

	if(userId == null){
		m.jsAlert("Need to login");
		m.jsReplace("/admin/login.jsp", "window");
	}
//Step1
	MenuDao menu = new MenuDao();

//Step2
	f.addElement("menu_name", null, "title:'menu_name', required:true");
	f.addElement("parent_id", null, "title:'parent_id'");
	f.addElement("module", null, "title:'module'");
	f.addElement("module_id", "", "title:'module_id'");
	f.addElement("parent_id", "", "title:'parent_id'");
	f.addElement("sort", null, "title:'sort'");

//Step3
if(m.isPost() && f.validate()) {

	menu.item("menu_name", f.get("menu_name"));
	menu.item("parent_id", f.get("parent_id"));
	menu.item("module", f.get("module"));
	menu.item("module_id", f.get("module_id"));
	menu.item("parent_id", f.get("parent_id"));
	menu.item("sort", f.get("sort"));
	menu.item("reg_date", m.time("yyyyMMddHHmmss"));
	menu.item("status", 1);

	//blog.setDebug(out);
	if(!menu.insert()) {
		m.jsError(" occurred(insert)");
		return;
	}
	m.redirect("index.jsp");
	return;
}
//Step4
//p.setDebug(out);
p.setLayout("blog");
p.setBody("admin/menu/create");
p.setVar("form_script", f.getScript());
p.print();

%>