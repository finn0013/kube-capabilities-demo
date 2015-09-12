<%-- 
Having all of this logic/code in a JSP is not good practice. 
This route was taken only to facilitate a very quick and dirty example.
--%>

<%@page import="javax.json.*" %>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.io.*"%>
<%@page import="java.util.*"%>

<html>
<head>
<title>JSP!</title>
</head>

<body>
        <p>This is my JSP page. Takes me back to the good old "Hello, World" days from when Java first came out.</p>

        <p>Here's the date. Just because I can.</p>

        <p><%= new SimpleDateFormat("yyyy.MM.dd").format(new Date()) %></p>

        <p>Now, for something truly useful, hereare the running pods:</p>

		<%= exec("curl localhost:8001/api/v1/pods") %>

</body>
</html>


<%!

public String exec(String command) {

	StringBuilder response = new StringBuilder();

	try {
		Runtime r = Runtime.getRuntime();
		Process p = r.exec(command);
	
		InputStreamReader isr = new InputStreamReader(p.getInputStream());
		BufferedReader br = new BufferedReader(isr);
		String line = null;
		while ((line = br.readLine()) != null) {
	        	response.append(line);
		}

		br.close();
		isr.close();
	} catch (Exception e) {
		response.append("ERROR!");
		response.append(e.getMessage());
	}

	return response.toString();
}

%>
