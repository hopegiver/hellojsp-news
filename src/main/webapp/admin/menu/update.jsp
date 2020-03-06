<%@ page contentType="text/html; charset=utf-8" %><%@ include file="/init.jsp" %><%

	if(userId == null){
		m.jsAlert("Need to login");
		m.jsReplace("/admin/login.jsp", "window");
	}
//Step1
	MenuDao menu = new MenuDao();

//Step2
int id = m.reqInt("id");
if(id == 0) { m.jsError("Primary Key is required"); return; }

//Step3
DataSet info = menu.find("id = " + id);
if(!info.next()) { m.jsError("No Data"); return; }

//Step4
f.addElement("module", info.s("module"), "title:'module'");
f.addElement("menu_name", info.s("menu_name"), "title:'menu_name', required:true");
f.addElement("module_id", info.s("module_id"), "title:'module_id'");
f.addElement("parent_id", info.s("parent_id"), "title:'parent_id'");
f.addElement("sort", info.s("sort"), "title:'sort'");
f.addElement("reg_date", info.s("reg_date"), "title:'reg_date', editable:false");

//Step5
if(m.isPost() && f.validate()) {

	menu.item("module", f.get("module"));
	menu.item("menu_name", f.get("menu_name"));
	menu.item("module_id", f.getInt("module_id", 0));
	menu.item("parent_id", f.getInt("parent_id", 0));
	menu.item("sort", f.get("sort"));


	//blog.setDebug(out);
	if(!menu.update("id = " + id)) {
		m.jsAlert("Error occurred(update)");
		return;
	}

	m.redirect("index.jsp");
	return;
}

//Step6
p.setLayout("blog");
p.setBody("admin/menu/update");
p.setVar("info", info);
p.setVar("form_script", f.getScript());
p.print();

%>