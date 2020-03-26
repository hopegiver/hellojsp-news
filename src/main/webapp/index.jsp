<%@ page contentType="text/html; charset=utf-8" %><%@ include file="/init.jsp" %><%@ include file="/inc.jsp" %><%

	DataSet menuInfo = menu.find("status != -1", "id, menu_name, module, module_id, parent_id, sort", "sort");
	if(!menuInfo.next()) { m.jsError("No Data"); return; }

	DataSet bannerList = banner.find("status != -1", "title, content, photo_name");
	if(!bannerList.next()) { m.jsError("No Data"); return; }

	DataSet MaxId = news.query("select id from tb_news ORDER BY ID DESC", 1);
	if(!MaxId.next()) { m.jsError("No Data"); return; }
	int maxIdNum = MaxId.getInt("id");

	DataSet photoNews = news.find("status != -1 AND type = 'photo'", " * ", "id DESC", 4);
	if(!photoNews.next()) { m.jsError("No Data"); return; }

	DataSet oldPhotoNews = news.find("status != -1", " * ", "id DESC LIMIT 6 OFFSET 6");
	if(!oldPhotoNews.next()) { m.jsError("No Data"); return; }

	DataSet oldPhotoNewsFirst = news.find("status != -1", " * ", "id DESC LIMIT 1 OFFSET 5");
	if(!oldPhotoNewsFirst.next()) { m.jsError("No Data"); return; }

	DataSet latestNews = news.find("status != -1 AND latest = 'Y'", " * ", "id DESC", 1);
	if(!latestNews.next()) { m.jsError("No data"); return; }
	latestNews.put("reg_date", m.time("MM-dd HH:mm"));

	DataSet mediaNews = news.find("status != -1 AND video_url != ''", " * ", "id DESC", 3);
	if(!mediaNews.next()) { m.jsError("No data"); return; }

	DataSet newsPhoto = news.find("status != -1 AND type = 'photo'", "id ,photo_name", "id DESC", 6);
	if(!newsPhoto.next()) { m.jsError("No data"); return; }

	DataSet blogList = blog.find("status != -1", "subject, content, reg_date, att_file_name", "reg_date DESC", 3);

	while (blogList.next()){
		blogList.put("reg_date", m.time("MM-dd", blogList.s("reg_date")));
	}

	f.addElement("first_name", null, "title:'first_name', required:true");
	f.addElement("last_name", null, "title:'last_name', required:true");
	f.addElement("phone1", null, "title:'phone', required:true");
	f.addElement("phone2", null, "title:'phone', required:true");
	f.addElement("phone3", null, "title:'phone', required:true");
	f.addElement("email", null, "title:'email', required:true");
	f.addElement("subject", null, "title:'subject', required:true");
	f.addElement("content", null, "title:'content', required:true");
	if(m.isPost() && f.validate()) {
		contact.item("first_name", f.get("first_name"));
		contact.item("last_name", f.get("last_name"));
		contact.item("phone", f.glue("-", "phone1, phone2, phone3"));
		contact.item("email", f.get("email"));
		contact.item("subject", f.get("subject"));
		contact.item("content", f.get("content"));
		contact.item("reg_date", m.time("yyyyMMddHHmmss"));
		contact.item("status", 1);
		//blog.setDebug(out);
		if(!contact.insert()) {
			m.jsError(" occurred(insert)");
			return;
		}
		m.redirect("index.jsp");
		return;
	}

	DataSet info = siteInfo.find("status != -1 ");
	if(!info.next()) { m.jsError("No Data"); return; }

	p.setBody("front/index");
	p.setVar("menuInfo", menuInfo);
//        p.setVar("subMenu", subMenu);
	p.setVar("bannerList", bannerList);
	p.setVar("oldPhotoNews", oldPhotoNews);
	p.setVar("oldPhotoNewsFirst", oldPhotoNewsFirst);
	p.setVar("photoNews", photoNews);
	p.setVar("latestNews", latestNews);
	p.setVar("mediaNews", mediaNews);
	p.setVar("blogList", blogList);
	p.setVar("newsPhoto", newsPhoto);
	p.setVar("info", info);
	p.setVar("form_script", f.getScript());
	p.print();


%>