<%@ page contentType="text/html; charset=utf-8" %><%@ include file="../init.jsp" %><%

//Step1
BlogDao blog = new BlogDao();

//Step2
f.addElement("subject", null, "title:'subject', required:true");
f.addElement("content", null, "title:'content', required:true");
f.addElement("att_file_name", null, "title:'att_file_name'");

//Step3
if(m.isPost() && f.validate()) {

	blog.item("subject", f.get("subject"));
	blog.item("content", f.get("content"));

	File attFile = f.saveFile("att_file_name", UploadPath);
	if(attFile != null) {
		blog.item("att_file_name", f.getFileName("att_file_name"));
	}
	blog.item("reg_date", m.time("yyyyMMddHHmmss"));
	blog.item("status", 1);

	//blog.setDebug(out);
	if(!blog.insert()) {
		m.jsError(" occurred(insert)");
		return;
	}

	m.redirect("index.jsp");
	return;
}
	pageTitle = "blog";

//Step4
p.setDebug(out);
p.setLayout("admin");
p.setBody("admin/blog/create");
p.setVar("form_script", f.getScript());
p.setVar("pageTitle", pageTitle);
p.print();

%>