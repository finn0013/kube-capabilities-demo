<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>


<html>
<head>
<title>JSP!</title>
</head>

<body>
        <p>This is my JSP page. Takes me back to the good old "Hello, World" days from when Java first came out.</p>

        <p>Here's the date. Just because I can.</p>

        <p><%= new SimpleDateFormat("yyyy.MM.dd").format(new Date()) %></p>

</body>
</html>