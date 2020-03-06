<%@ page contentType="text/html; charset=utf-8" %><%@ include file="/init.jsp" %><%

        MenuDao menu = new MenuDao();

        DataSet menuInfo = menu.find("status != -1", "menu_name, module, module_id, sort", "sort");
        if(!menuInfo.next()) { m.jsError("No Data"); return; }

        BannerDao banner = new BannerDao();

        DataSet bannerList = banner.find("status != -1", "title, content, photo_name");
        if(!bannerList.next()) { m.jsError("No Data"); return; }

        NewsDao news = new NewsDao();

        DataSet newsList = news.find("status != -1 AND type = 'photo'", "type, subject, content, photo_name");
        if(!newsList.next()) { m.jsError("No Data"); return; }

//        DataSet newsPhoto = news.find("status != -1 AND type = 'photo'", "photo_name");
//        if(!newsPhoto.next()) { m.jsError("No data"); return; }

        BlogDao blog = new BlogDao();

        DataSet blogList = blog.find("status != -1", "subject, content, reg_date, att_file_name", "reg_date DESC", 3);
        if(!blogList.next()) { m.jsError("No Data"); return; }

        while (blogList.next()){
                blogList.put("reg_date", m.time("MM-dd", blogList.s("reg_date")));
        }



        p.setBody("front/index");
        p.setVar("form_script", f.getScript());
        p.setVar("menuInfo", menuInfo);
        p.setVar("bannerList", bannerList);
        p.setVar("newsList", newsList);
        p.setVar("blogList", blogList);
//        p.setVar("newsPhoto", newsPhoto);
        p.print();


%>