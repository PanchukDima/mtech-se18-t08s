<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="tg" tagdir="/WEB-INF/tags"%>

<body>
<head>
<script type='text/javascript'
	src='<%=request.getContextPath()%>/dwr/interface/VmsDwr.js'></script>
<script type='text/javascript'
	src='<%=request.getContextPath()%>/dwr/engine.js'></script>

<link type="text/css"
	href="<%=request.getContextPath()%>/sys/css/paging.css"
	rel="stylesheet" />
<script type="text/javascript">
        var genList="";
        function generateCert(reqId) {
            
            document.getElementById("certRequestId").value=reqId;
            document.forms["form"].submit();

        }
</script>
</head>
<body>
	<h2><fmt:message key="message.administration.generateCertificate.label"/></h2>
	
	<div id="breadcrumb">
		 <a href="#"><fmt:message key="message.common.home.label"/></a>/ 
                <fmt:message key="message.administration.generateCertificate.label"/>
	</div>

		<form id="form" name="form" method="post" action="generateCertificate.html">
			<table width="690" class="proj-table">
				<tr>
					<th width="80">Certificate Request Id</th>
					<th width="150"> <fmt:message key="message.projectManagement.projectName.label"/></th>
                    <th width="150"><fmt:message key="message.administration.requestType.label"/></th>
                    <th width="150"><fmt:message key="message.administration.requestBy.label"/></th>
                    <th width="150"><fmt:message key="message.administration.requestDate.label"/></th>
                    <th width="80" colspan="2"><fmt:message key="message.common.generate.button"/></th>
				</tr>
					<c:forEach items="${certReqVoList}" var="item" varStatus="status">
						<tr>            
								<td>${item.certReqId}</td>
                    			<td>${item.prjName}</td>
                    			<td>${item.reqTpName}</td>
                    			<td>${item.reqByName}</td>
                                <td><fmt:formatDate pattern="dd-MM-yyyy" value="${item.reqDte}" /></td>
                                <td><input type="button" name="generate" id="generate" value=<fmt:message key="message.common.generate.button"/>  onclick="generateCert('${item.certReqId}')"/></td>
								<td><input type="hidden" name="certRequestId" id="certRequestId" /></td>
						</tr>
                   </c:forEach>
				
			</table>
		</form>

</body>