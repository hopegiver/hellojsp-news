<%@ page import="javax.xml.crypto.Data" %>
<%@ page contentType="text/html; charset=utf-8" %><%@ include file="/init.jsp" %><%
UserDao user = new UserDao();

	f.addElement("login_id", null, "title:'login_id', required:'Y'");
	f.addElement("passwd", null, "title:'password', required:'Y'");

	AdminDao admin = new AdminDao();

	if(m.isPost() && f.validate()) {

		String pass = m.sha256(f.get("passwd"));
		DataSet info = admin.find("login_id = ? AND passwd = ? AND status = 1", new Object[] {f.get("login_id"), pass});

	    if(info.next()) {
	    	auth.put("user_id", f.get("login_id"));
			auth.save();
			
			m.jsAlert("Login success");
			m.jsReplace("dashboard.jsp");
		} else {
			m.jsError("id or password is not correct.");
			auth.destroy();
		}
		return;
		
	}
	p.setBody("admin/login");
	p.setVar("form_script", f.getScript());
	p.setVar("pageTitle", pageTitle);
	p.print();

%>

