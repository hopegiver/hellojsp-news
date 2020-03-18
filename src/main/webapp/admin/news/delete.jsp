<%@ page contentType="text/html; charset=utf-8" %><%@ include file="../init.jsp" %><%
//Step1
	NewsDao news = new NewsDao();

//Step2
int id = m.reqInt("id");
if(id == 0) { m.jsError("Primary Key is required"); return; }

//Step3
DataSet info = news.find("id = " + id);
if(!info.next()) { m.jsError("No Data"); return; }

f.addElement("id", info.s("id"), "title:'ID', required:true");

//Step5
if(m.isPost() && f.validate()) {

	if(!"".equals(info.s("photo_name"))) {
		m.delFile(UploadPath + "/" + info.s("photo_name"));
	}
	news.item("status", -1);

	//blog.setDebug(out);
	if(!news.update("id = " + id)) {
		m.jsAlert("Error occurred(delete)");
		return;
	}

	m.redirect("index.jsp");
	return;
}
	pageTitle = "news";
//Step6
p.setLayout("admin");
p.setBody("admin/news/delete");
p.setVar("info", info);
p.setVar("form_script", f.getScript());
p.setVar("pageTitle", pageTitle);
p.print();

%>