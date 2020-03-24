<%@ page contentType="text/html; charset=utf-8" %><%@ include file="../init.jsp" %><%
//Step1
    NewsDao news = new NewsDao();
    ContactDao contact = new ContactDao();

//Step2
int id = m.reqInt("id");
if(id == 0) { m.jsError("Primary Key is required"); return; }

//Step3
DataSet info = news.find("id = " + id);
if(!info.next()) { m.jsError("No Data"); return; }

//Step4
info.put("reg_date", m.time("yyyy-MM-dd HH:mm", info.s("reg_date")));

    f.addElement("s_keyword", null, null);

    //Step3
    ListManager lm = new ListManager();
    //lm.setDebug(out);
    lm.setRequest(request);
    lm.setTable("tb_contact a");
    lm.setFields("a.*");
    lm.addWhere("a.status != -1 AND news_id =" + id);
    lm.addSearch("a.first_name, a.subject, a.content, a.last_name, a.email, a.phone", f.get("s_keyword"), "LIKE");
    lm.setOrderBy("a.id DESC");

    //Step3
    DataSet list = lm.getDataSet();
    while(list.next()) {
        list.put("reg_date", m.time("yyyy-MM-dd hh:mm", list.s("reg_date")));
    }

    pageTitle = "news";
//Step5
p.setLayout("admin");
p.setBody("admin/news/read");
p.setVar("info", info);
p.setVar("list", list);
p.setVar("total_cnt", lm.getTotalNum());
p.setVar("pagebar", lm.getPaging());
p.setVar("form_script", f.getScript());
p.setVar("pageTitle", pageTitle);
p.print();

%>