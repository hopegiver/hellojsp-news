<%@ page contentType="text/html; charset=utf-8" %><%@ include file="/init.jsp" %><%

        MenuDao menu = new MenuDao();

        DataSet menuInfo = menu.find("status != -1", "id, name, module, module_id, parent_id, sort", "sort");
        if(!menuInfo.next()) { m.jsError("No Data"); return; }

//        DataSet subMenu = menu.find("status != -1 AND parent_id != 0", "name, module, module_id, sort, parent_id", "sort");
//        if(!subMenu.next()) { m.jsError("No Data"); return; }

        BannerDao banner = new BannerDao();

        DataSet bannerList = banner.find("status != -1", "title, content, photo_name");
        if(!bannerList.next()) { m.jsError("No Data"); return; }

        NewsDao news = new NewsDao();

        DataSet MaxId = news.query("select id from tb_news ORDER BY ID DESC", 1);
        if(!MaxId.next()) { m.jsError("No Data"); return; }
        int maxIdNum = MaxId.getInt("id");

        DataSet photoNews = news.find("status != -1 AND type = 'photo'", "type, subject, content, photo_name", "id DESC", 4);
        if(!photoNews.next()) { m.jsError("No Data"); return; }

        DataSet oldPhotoNews = news.find("status != -1 AND type = 'photo' AND id <" + (maxIdNum - 6), "type, subject, content, photo_name", "id DESC", 6);
        if(!oldPhotoNews.next()) { m.jsError("No Data"); return; }

        DataSet oldPhotoNewsFirst = news.find("status != -1 AND type = 'photo' AND id <=" + (maxIdNum - 5), "type, subject, content, photo_name", "id DESC", 1);
        if(!oldPhotoNewsFirst.next()) { m.jsError("No Data"); return; }

        DataSet latestNews = news.find("status != -1 AND latest = 'Y'", " * ", "id DESC", 1);
        if(!latestNews.next()) { m.jsError("No data"); return; }

        DataSet mediaNews = news.find("status != -1 AND video_url != ''", " * ", "id DESC", 3);
        if(!mediaNews.next()) { m.jsError("No data"); return; }

        DataSet newsPhoto = news.find("status != -1 AND type = 'photo'", "photo_name");
        if(!newsPhoto.next()) { m.jsError("No data"); return; }

        BlogDao blog = new BlogDao();
        DataSet blogList = blog.find("status != -1", "subject, content, reg_date, att_file_name", "reg_date DESC", 3);

        while (blogList.next()){
                blogList.put("reg_date", m.time("MM-dd", blogList.s("reg_date")));
        }

        ContactDao contact = new ContactDao();
        f.addElement("first_name", null, "title:'first_name', required:true");
        f.addElement("last_name", null, "title:'last_name', required:true");
        f.addElement("phone", null, "title:'phone', required:true");
        f.addElement("email", null, "title:'email', required:true");
        f.addElement("title", null, "title:'title', required:true");
        f.addElement("subject", null, "title:'subject', required:true");
        if(m.isPost() && f.validate()) {
                contact.item("first_name", f.get("first_name"));
                contact.item("last_name", f.get("last_name"));
                contact.item("phone", f.get("phone"));
                contact.item("email", f.get("email"));
                contact.item("title", f.get("title"));
                contact.item("subject", f.get("subject"));
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

        InfoDao siteInfo = new InfoDao();

        DataSet info = siteInfo.find("status != -1 ");
        if(!info.next()) { m.jsError("No Data"); return; }


        p.setBody("front/index");
        p.setVar("form_script", f.getScript());
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