<%@ page import="java.util.*,java.io.*,hellojsp.db.*,hellojsp.util.*,dao.*" %><%

Hello m = new Hello(request, response, out);

Form f = new Form();
f.setRequest(request);

AES a = new AES();

Page p = new Page();
p.setWriter(out);
p.setVar("m", m);

Message msg = new Message();
p.setVar("msg", msg);


String userId = null;
String UploadPath = "E:/Intel-Workspace/hellojsp-news/src/main/webapp/uploads";

String pageTitle = null;

Auth auth = new Auth(request, response);
if(auth.validate()) {
	userId = auth.get("user_id");
}
	String language = auth.get("language");
	if(language.equals("EN")){
		msg.setLocale(Locale.ENGLISH);
	}else{
		msg.setLocale(Locale.KOREAN);
	};
	if(userId == null){
		m.jsReplace("/admin/login.jsp", "window");
	}

%>