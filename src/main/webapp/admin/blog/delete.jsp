<%@ page contentType="text/html; charset=utf-8" %><%@ include file="../init.jsp" %><%

//Step1
BlogDao blog = new BlogDao();

//Step2
int id = m.reqInt("id");
if(id == 0) { m.jsError("Primary Key is required"); return; }

//Step3
DataSet info = blog.find("id = " + id);
if(!info.next()) { m.jsError("No Data"); return; }

f.addElement("id", info.s("id"), "title:'ID', required:true");

//Step5
if(m.isPost() && f.validate()) {

	if(!"".equals(info.s("att_file_name"))) {
		m.delFile(UploadPath + "/" + info.s("att_file_name"));
	}
	blog.item("status", -1);

	//blog.setDebug(out);
	if(!blog.update("id = " + id)) {
		m.jsAlert("Error occurred(delete)");
		return;
	}

	m.redirect("index.jsp");
	return;
}
	pageTitle = "blog";
//Step6
p.setLayout("admin");
p.setBody("admin/blog/delete");
p.setVar("info", info);
p.setVar("form_script", f.getScript());
p.setVar("pageTitle", pageTitle);
p.print();

%>