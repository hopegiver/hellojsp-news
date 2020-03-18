<%@ page contentType="text/html; charset=utf-8" %><%@ include file="../init.jsp" %><%

        //Step1
        MenuDao menu = new MenuDao();

        //Step2
        f.addElement("s_keyword", null, null);

        //Step3
        ListManager lm = new ListManager();
        //lm.setDebug(out);
        lm.setRequest(request);
        lm.setTable("tb_menu a");
        lm.setFields("a.*");
        lm.addWhere("a.status != -1");
        lm.addSearch("a.menu_name, a.module", f.get("s_keyword"), "LIKE");
        lm.setOrderBy("a.id DESC");

        //Step3
        DataSet list = lm.getDataSet();
        while(list.next()) {
            list.put("reg_date", m.time("yyyy-MM-dd", list.s("reg_date")));
        }
        DataSet menuInfo = menu.find("status != -1", "id, menu_name, module, module_id, parent_id, sort", "sort");

        DataSet subMenu = menu.find("status != -1 AND parent_id != 0", "id, menu_name, module, module_id, sort, parent_id, reg_date", "sort");

        while(subMenu.next()) {
            subMenu.put("reg_date", m.time("yyyy-MM-dd", list.s("reg_date")));
        }

        while(menuInfo.next()) {
            menuInfo.put("reg_date", m.time("yyyy-MM-dd", list.s("reg_date")));
        }

        DataSet parent = menu.find("status != -1 AND parent_id = 0 ");

        //Step4
        pageTitle = "menu";
        //    p.setDebug(out);
        p.setLayout("admin");
        p.setBody("admin/menu/index");
        p.setVar("menuInfo", menuInfo);
        p.setVar("subMenu", subMenu);
        p.setVar("list", list);
        p.setVar("parent", parent);
        p.setVar("total_cnt", lm.getTotalNum());
        p.setVar("pagebar", lm.getPaging());
        p.setVar("form_script", f.getScript());
        p.setVar("pageTitle", pageTitle);
        p.print();

%>