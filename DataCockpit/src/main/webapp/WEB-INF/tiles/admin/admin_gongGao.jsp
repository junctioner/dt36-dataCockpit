<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<section class="content container-fluid" style="background-color: #C6C6C6;height:600px">
	<center>
	<span style="font-size:36px;font-weight: bolder">${ggg.title }</span>
     </center>
     <span style="margin-left:20px">
    <fmt:formatDate value="${ggg.publishDate }" pattern="yyyy年MM月dd日"/></span>
     
     <span style="margin-left:700px">发布人：${ggg.publisher }</span>
     <!-- <hr size="5" color="red"> -->
      <hr>
      <div style="width: 800px;height:500px;border: 3px;border-color: black">
           ${ggg.details }
      </div>
</section>