<%@ page contentType="text/html; charset=utf-8" %><%@ include file="/init.jsp" %><%

    MenuDao menu = new MenuDao();

    DataSet menuInfo = menu.find("status != -1", "menu_name, module, module_id, sort", "sort");
    if(!menuInfo.next()) { m.jsError("No Data"); return; }

    NewsDao news = new NewsDao();

    DataSet newsList = news.find("status != -1 AND type = 'photo'", "type, subject, content, photo_name");
    if(!newsList.next()) { m.jsError("No Data"); return; }

    DataSet newsPhoto = news.find("status != -1 AND type = 'photo'", "photo_name");
    if(!newsPhoto.next()) { m.jsError("No data"); return; }

    p.setBody("front/newsDetail");
    p.setVar("form_script", f.getScript());
    p.setVar("newsList", newsList);
    p.print();


%>