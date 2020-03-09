<%@ page contentType="text/html; charset=utf-8" %><%@ include file="/init.jsp" %><%

        MenuDao menu = new MenuDao();

        DataSet menuInfo = menu.find("status != -1", "id, menu_name, module, module_id, parent_id, sort", "sort");
        if(!menuInfo.next()) { m.jsError("No Data"); return; }

        DataSet subMenu = menu.find("status != -1 AND parent_id != 0", "menu_name, module, module_id, sort, parent_id", "sort");
        if(!subMenu.next()) { m.jsError("No Data"); return; }

        BannerDao banner = new BannerDao();

        DataSet bannerList = banner.find("status != -1", "title, content, photo_name");
        if(!bannerList.next()) { m.jsError("No Data"); return; }

        NewsDao news = new NewsDao();

        DataSet newsList = news.find("status != -1 AND type = 'photo'", "type, subject, content, photo_name");
        if(!newsList.next()) { m.jsError("No Data"); return; }

        DataSet newsPhoto = news.find("status != -1 AND type = 'photo'", "photo_name");
        if(!newsPhoto.next()) { m.jsError("No data"); return; }

        BlogDao blog = new BlogDao();

        DataSet blogList = blog.find("status != -1", "subject, content, reg_date, att_file_name", "reg_date DESC", 3);

        while (blogList.next()){
                blogList.put("reg_date", m.time("MM-dd", blogList.s("reg_date")));
        }

        ContactDao contact = new ContactDao();

//Step2
        f.addElement("first_name", null, "title:'first_name', required:true");
        f.addElement("last_name", null, "title:'last_name', required:true");
        f.addElement("phone", null, "title:'phone', required:true");
        f.addElement("email", null, "title:'email', required:true");
        f.addElement("title", null, "title:'title', required:true");
        f.addElement("subject", null, "title:'subject', required:true");
//Step3
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



        p.setBody("front/index");
        p.setVar("form_script", f.getScript());
        p.setVar("menuInfo", menuInfo);
        p.setVar("subMenu", subMenu);
        p.setVar("bannerList", bannerList);
        p.setVar("newsList", newsList);
        p.setVar("blogList", blogList);
        p.setVar("newsPhoto", newsPhoto);
        p.setVar("form_script", f.getScript());
        p.print();


%>