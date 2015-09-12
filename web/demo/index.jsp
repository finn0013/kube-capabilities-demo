<%-- 
Having all of this logic/code in a JSP is not good practice. 
This route was taken only to facilitate a very quick and dirty example.

This is not the most sound way to get all of this, however it was the easiest
given the network constraints of not being able to grab this data from the
browser (since we only have it exposed on the cluster).

We are doing a server side rest call, writing results to a file, then readin
in the results with jquery.
--%>

<%@page import="javax.json.*" %>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.io.*"%>
<%@page import="java.nio.file.*"%>
<%@page import="java.util.*"%>

<html>
<head>
<title>Kubernetes Capabilities Demo</title>
<link rel="stylesheet" type="text/css" href="kcd.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>
<script type="text/javascript">

// Nodes
$.getJSON("/kcd/nodes.json", function(data) {
	for (var i in data.items) {	
		var nodeName = data.items[i].metadata.name.replace(".", "").replace(".", "").replace(".", "");
		var node = "<div class='node'>"
		node += "<span class='name'>Node " + data.items[i].metadata.name + "</span>";
		node += "<span class='created'>Created " + data.items[i].metadata.creationTimestamp + "</span>";
		node += "<span class='state'>State: " + data.items[i].status.conditions[0].type + "</span>";
		node += "<div id='node" + nodeName + "'></div>"
		node += "</div>"
		
		$("#cluster-info").append(node);
	}

	// Pods
	$.getJSON("/kcd/pods.json", function(data) {
		for (var i in data.items) {
			var parentNodeName = data.items[i].spec.nodeName.replace(".", "").replace(".", "").replace(".", "");
			var pod = "<div class='pod " + data.items[i].metadata.labels.color + "' id='" + parentNodeName + data.items[i].metadata.name+ "'>";
			pod += "<span class='name'>Pod " + data.items[i].metadata.name + "</span>";						
			pod += "<span class='created'>Created " + data.items[i].metadata.creationTimestamp + "</span>";			
			pod += "<span class='data'>Environment: " + data.items[i].metadata.labels.env + "</span>";
			pod += "<span class='data'>Build: " + data.items[i].metadata.annotations.build + "</span>";
			pod += "<span class='state'>State: " + data.items[i].status.phase + " - " + data.items[i].status.conditions[0].type + "</span>";
			pod += "</div>"
			
			$("#node" + parentNodeName).append(pod);
		}        			
	});
});
</script>
</head>

<body>
	<div id="cluster-info">
	
	</div>        
	<ul></ul>
</body>
</html>
		
<%
lookup("localhost:8001/api/v1/nodes", "nodes.json");
lookup("localhost:8001/api/v1/pods", "pods.json");
%>
<%!
public void lookup(String command, String fileName) {
	StringBuilder response = new StringBuilder();
	try {
		Runtime r = Runtime.getRuntime();
		Process p = r.exec("curl " + command);
	
		InputStreamReader isr = new InputStreamReader(p.getInputStream());
		BufferedReader br = new BufferedReader(isr);
		String line = null;
		while ((line = br.readLine()) != null) {
	        	response.append(line);
		}
		br.close();
		isr.close();
	} catch (Exception e) {
		e.printStackTrace();
		response.append("ERROR!");
		response.append(e.getMessage());
	}
	
	try {
		Files.deleteIfExists(Paths.get("/usr/local/tomcat/webapps/kcd/" + fileName));
	} catch (Exception e) {
		e.printStackTrace();
	}		

	try {
		PrintWriter writer = new PrintWriter("/usr/local/tomcat/webapps/kcd/" + fileName, "UTF-8");
		writer.print(response.toString());
		writer.close();
	} catch (Exception e) {
		e.printStackTrace();
	}		
}
%>