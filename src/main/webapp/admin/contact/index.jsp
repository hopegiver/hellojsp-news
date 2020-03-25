<%@ page contentType="text/html; charset=utf-8" %><%@ include file="../init.jsp" %><%


        //Step1
      ContactDao contact = new ContactDao();
      NewsDao news = new NewsDao();

        //Step2
        f.addElement("s_keyword", null, null);

        //Step3
        ListManager lm = new ListManager();
        //lm.setDebug(out);
        lm.setRequest(request);
        lm.setTable("tb_contact a");
        lm.setFields("a.*");
        lm.addWhere("a.status != -1");
        lm.addSearch("a.first_name, a.subject, a.content, a.last_name, a.email, a.phone", f.get("s_keyword"), "LIKE");
        lm.setOrderBy("a.id DESC");

        //Step3
        DataSet list = lm.getDataSet();
        while(list.next()) {
            list.put("reg_date", m.time("yyyy-MM-dd hh:ss", list.s("reg_date")));
        }

        DataSet newsPhoto = news.find("status != -1", "photo_name, id");
        pageTitle = "contact";

        //Step4
        //    p.setDebug(out);
        p.setLayout("admin");
        p.setBody("admin/contact/index");
        p.setVar("list", list);
        p.setVar("newsPhoto", newsPhoto);
        p.setVar("total_cnt", lm.getTotalNum());
        p.setVar("pagebar", lm.getPaging());
        p.setVar("form_script", f.getScript());
        p.setVar("pageTitle", pageTitle);
        p.print();

%>