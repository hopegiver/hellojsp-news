<%@ page contentType="text/html; charset=utf-8" %><%@ include file="../init.jsp" %><%--<%@ include file="update.jsp" %>--%><%

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

        int id = m.reqInt("id");
        if(id == 0) { m.jsError("Primary Key is required"); return; }

//Step3
        DataSet info = menu.find("id = " + id);
        if(!info.next()) { m.jsError("No Data"); return; }
//Step4
        f.addElement("module", info.s("module"), "title:'module'");
        f.addElement("menu_name", info.s("menu_name"), "title:'menu_name', required:true");
        f.addElement("module_id", info.s("module_id"), "title:'module_id'");
        f.addElement("parent_id", info.s("parent_id"), "title:'parent_id'");
        f.addElement("sort", info.s("sort"), "title:'sort'");
        f.addElement("reg_date", info.s("reg_date"), "title:'reg_date', editable:false");

        //Step4
        pageTitle = "menu";
        //    p.setDebug(out);
        p.setLayout("admin");
        p.setBody("admin/menu/index");
        p.setVar("menuInfo", menuInfo);
        p.setVar("subMenu", subMenu);
        p.setVar("list", list);
        p.setVar("info", info);
        p.setVar("parent", parent);
        p.setVar("total_cnt", lm.getTotalNum());
        p.setVar("pagebar", lm.getPaging());
        p.setVar("form_script", f.getScript());
        p.setVar("pageTitle", pageTitle);
        p.print();

%>