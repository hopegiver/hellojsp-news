<%@ page import="java.util.*,java.io.*,hellojsp.db.*,hellojsp.util.*,dao.*" %><%

Hello m = new Hello(request, response, out);

Form f = new Form();
f.setRequest(request);

Page p = new Page();
p.setWriter(out);
p.setVar("m", m);

Message msg = new Message();
p.setVar("msg", msg);

Json j = new Json();
j.setWriter(out);

String userId = null;
String UploadPath = "E:/Intel-Workspace/hellojsp-news/src/main/webapp/uploads";

String pageTitle = null;

Auth auth = new Auth(request, response);
if(auth.validate()) {
	userId = auth.get("user_id");
}

%>