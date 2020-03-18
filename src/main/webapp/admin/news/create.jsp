<%@ page contentType="text/html; charset=utf-8" %><%@ include file="/init.jsp" %><%
	if(userId == null){
		m.jsAlert("Need to login");
		m.jsReplace("/admin/login.jsp", "window");
	}
//Step1
	NewsDao news = new NewsDao();

//Step2
	f.addElement("latest", null, "title:'latest'");
	f.addElement("type", null, "title:'type', required:true");
	f.addElement("subject", null, "title:'subject', required:true");
	f.addElement("short_news", null, "title:'short_news', required:true");
	f.addElement("long_news", null, "title:'long_news', required:true");
	f.addElement("photo_name", null, "title:'photo_name'");
	f.addElement("video_url", null, "title:'video_url'");
//Step3
if(m.isPost() && f.validate()) {

	news.item("latest", f.get("latest"));
	news.item("type", f.get("type"));
	news.item("subject", f.get("subject"));
	news.item("short_news", f.get("short_news"));
	news.item("long_news", f.get("long_news"));
	news.item("video_url", f.get("video_url"));

	File attFile = f.saveFile("photo_name", UploadPath);
	if(attFile != null) {
		news.item("photo_name", f.getFileName("photo_name"));
	}
	news.item("reg_date", m.time("yyyyMMddHHmmss"));
	news.item("status", 1);

	//blog.setDebug(out);
	if(!news.insert()) {
		m.jsError(" occurred(insert)");
		return;
	}

	m.redirect("index.jsp");
	return;
}
	pageTitle = "news";
//Step4
//p.setDebug(out);
p.setLayout("admin");
p.setBody("admin/news/create");
p.setVar("form_script", f.getScript());
p.setVar("pageTitle", pageTitle);
p.print();

%>