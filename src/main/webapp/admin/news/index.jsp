<%@ page contentType="text/html; charset=utf-8" %><%@ include file="../init.jsp" %><%

        //Step1
       NewsDao news = new NewsDao();

        //Step2
        f.addElement("s_keyword", null, null);

        //Step3
        ListManager lm = new ListManager();
        //lm.setDebug(out);
        lm.setRequest(request);
        lm.setTable("tb_news a");
        lm.setFields("a.*");
        lm.addWhere("a.status != -1");
        lm.addSearch("a.subject, a.short_news, a.long_news", f.get("s_keyword"), "LIKE");
        lm.setOrderBy("a.id DESC");

        //Step3
        DataSet list = lm.getDataSet();
        while(list.next()) {
            list.put("reg_date", m.time("yyyy-MM-dd", list.s("reg_date")));
        }
        pageTitle = "news";
        //Step4
        //    p.setDebug(out);
        p.setLayout("admin");
        p.setBody("admin/news/index");
        p.setLoop("list", list);
        p.setVar("total_cnt", lm.getTotalNum());
        p.setVar("pagebar", lm.getPaging());
        p.setVar("form_script", f.getScript());
        p.setVar("pageTitle", pageTitle);
        p.print();


%>