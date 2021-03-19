<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
</body>
<script>
let json = JSON.parse('${getbiRqCode}');

alert('${getbiRqCode}');
   
   
   let rqCode = json[0].biCode;   
   
    let input  = document.createElement("input");
     input.type = "hidden";
     input.name = "rqCode";
     input.value = rqCode;
     
     let input2 = document.createElement("input");
      input2.type = "hidden";
      input2.name = "rqDetailSelect";
      input2.value = "bh";
     
     let form = document.createElement("form");
     form.action = "Detail";
     form.method = "post";
     form.appendChild(input);
      form.appendChild(input2);
     document.body.appendChild(form);
     form.submit();

</script>
</html>