<%@ page contentType="text/html; charset=utf-8" %><%@ include file="../init.jsp" %><%

        //Step1
        MenuDao menu = new MenuDao();

        //Step2
        DataSet menuInfo = menu.find("status != -1", "id, name, module, module_id, parent_id, sort", "sort");

        DataSet subMenu = menu.find("status != -1 AND parent_id != 0", "id, name, module, module_id, sort, parent_id, reg_date", "sort");

//        DataSet thirdSubMenu = menu.find("status != -1 AND parent_id != 0", "id, name, module, module_id, sort, parent_id, reg_date", "sort");

        while(subMenu.next()) {
            subMenu.put("reg_date", m.time("yyyy-MM-dd", subMenu.s("reg_date")));
        }

        while(menuInfo.next()) {
            menuInfo.put("reg_date", m.time("yyyy-MM-dd", menuInfo.s("reg_date")));
        }

        DataSet parent = menu.find("status != -1 AND parent_id = 0");

        int id = m.reqInt("id");
        int del = m.reqInt("del");
        DataSet info = menu.find("id = " + id);
        if(id != 0) {
                if(del == 1){
                        menu.item("status", -1);

                        //blog.setDebug(out);
                        if(!menu.update("id = " + id)) {
                                m.jsAlert("Error occurred(delete)");
                                return;
                        }
                        m.redirect("index.jsp");
                        return;
                } else {
                        if(!info.next()) { m.jsError("No Data"); return; }
                        f.addElement("module", info.s("module"), "title:'module'");
                        f.addElement("name", info.s("name"), "title:'name', required:true");
                        f.addElement("module_id", info.s("module_id"), "title:'module_id'");
                        f.addElement("parent_id", info.s("parent_id"), "title:'parent_id'");
                        f.addElement("sort", info.s("sort"), "title:'sort'");
                        f.addElement("reg_date", info.s("reg_date"), "title:'reg_date', editable:false");

                        if(m.isPost() && f.validate()) {

                                menu.item("module", f.get("module"));
                                menu.item("name", f.get("name"));
                                menu.item("module_id", f.getInt("module_id", 0));
                                menu.item("parent_id", f.getInt("parent_id", 0));
                                menu.item("sort", f.get("sort"));


                                //blog.setDebug(out);
                                if(!menu.update("id = " + id)) {
                                        m.jsAlert("Error occurred(update)");
                                        return;
                                }

                                m.redirect("index.jsp");
                                return;
                        }
                }
        } else {
                f.addElement("name", null, "title:'name', required:true");
                f.addElement("parent_id", null, "title:'parent_id'");
                f.addElement("module", null, "title:'module'");
                f.addElement("module_id", "", "title:'module_id'");
                f.addElement("parent_id", "", "title:'parent_id'");
                f.addElement("sort", null, "title:'sort'");
                if(m.isPost() && f.validate()) {

                        menu.item("module", f.get("module"));
                        menu.item("name", f.get("name"));
                        menu.item("module_id", f.getInt("module_id", 0));
                        menu.item("parent_id", f.getInt("parent_id", 0));
                        menu.item("sort", f.get("sort"));
                        menu.item("reg_date", m.time("yyyyMMddHHmmss"));
                        menu.item("status", 1);


                        //blog.setDebug(out);
                        if(!menu.insert()) {
                                m.jsError(" occurred(insert)");
                                return;
                        }

                        m.redirect("index.jsp");
                        return;
                }
        }


        //Step4
        pageTitle = "menu";
        //    p.setDebug(out);
        p.setLayout("admin");
        p.setBody("admin/menu/index");
        p.setLoop("menuInfo", menuInfo);
        p.setLoop("subMenu", subMenu);
//        p.setVar("thirdSubMenu", thirdSubMenu);
        p.setLoop("info", info);
        p.setVar("id", id);
        p.setVar("parent", parent);
        p.setVar("form_script", f.getScript());
        p.setVar("pageTitle", pageTitle);
        p.print();

%>