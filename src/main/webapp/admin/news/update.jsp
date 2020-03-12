<%@ page contentType="text/html; charset=utf-8" %><%@ include file="/init.jsp" %><%
	if(userId == null){
		m.jsAlert("Need to login");
		m.jsReplace("/admin/login.jsp", "window");
	}
//Step1
	NewsDao news = new NewsDao();

//Step2
int id = m.reqInt("id");
if(id == 0) { m.jsError("Primary Key is required"); return; }

//Step3
DataSet info = news.find("id = " + id);
if(!info.next()) { m.jsError("No Data"); return; }

//Step4
f.addElement("latest", info.s("latest"), "title:'latest', required:true");
f.addElement("type", info.s("type"), "title:'type', required:true");
f.addElement("subject", info.s("subject"), "title:'subject', required:true");
f.addElement("short_news", info.s("short_news"), "title:'short_news', required:true");
f.addElement("long_news", info.s("long_news"), "title:'long_news', required:true");
f.addElement("photo_name", info.s("photo_name"), "title:'photo_name'");
f.addElement("video_url", info.s("video_url"), "title:'video_url'");

//Step5
if(m.isPost() && f.validate()) {

	news.item("latest", f.get("latest"));
	news.item("type", f.get("type"));
	news.item("subject", f.get("subject"));
	news.item("short_news", f.get("short_news"));
	news.item("long_news", f.get("long_news"));
	news.item("video_url", f.get("video_url"));
	news.item("mod_date", m.time("yyyyMMddHHmmss"));


	if("Y".equals(f.get("photo_name_del"))) {
		news.item("photo_name", "");
		m.delFile(UploadPath + "/" + info.s("photo_name"));
	}
	
	File attFile = f.saveFile("photo_name", UploadPath);
	if(attFile != null) {
		news.item("photo_name", f.getFileName("photo_name"));

		if(!"".equals(info.s("photo_name"))) {
			m.delFile(UploadPath + "/" + info.s("photo_name"));
		}
	}

	//blog.setDebug(out);
	if(!news.update("id = " + id)) {
		m.jsAlert("Error occurred(update)");
		return;
	}

	m.redirect("index.jsp");
	return;
}

//Step6
p.setLayout("blog");
p.setBody("admin/news/update");
p.setVar("info", info);
p.setVar("form_script", f.getScript());
p.print();

%>