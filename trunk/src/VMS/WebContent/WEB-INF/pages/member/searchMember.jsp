<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ taglib prefix="tg" tagdir="/WEB-INF/tags"%>

<body>
<head>
<script type='text/javascript' src='/VMS/dwr/interface/VmsDwr.js'></script>
<script type='text/javascript' src='/VMS/dwr/engine.js'></script>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/sys/vms/yui/build/fonts/fonts-min.css" />
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/sys/vms/yui/build/datatable/assets/skins/sam/datatable.css" />
<script type="text/javascript"
	src="<%=request.getContextPath()%>/sys/vms/yui/build/dragdrop/dragdrop-min.js"></script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/sys/vms/yui/build/element/element-min.js"></script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/sys/vms/yui/build/datasource/datasource-min.js"></script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/sys/vms/yui/build/event-delegate/event-delegate-min.js"></script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/sys/vms/yui/build/datatable/datatable-min.js"></script>
<style type="text/css">

/* Pagination
---------------------------------------- */
.pagingItem {
	font-weight: normal;
	text-decoration: none;
	color: #747474;
	margin: 0 2px;
	padding: 0 2px;
	background-color: #eeeeee;
	border: 1px solid #bababa;
	font-size: 0.9em;
	line-height: 1.5em;
}

.pagingItemCurrent {
	padding: 0 2px;
	margin: 0 2px;
	font-weight: normal;
	color: #FFFFFF;
	background-color: #bfbfbf;
	border: 1px solid #bfbfbf;
	font-size: 0.9em;
}

.pagingDots {
	font-weight: normal;
}

.pagination span a:hover {
	border-color: #d2d2d2;
	background-color: #d2d2d2;
	color: #FFF;
	text-decoration: none;
}

.pagination img {
	vertical-align: middle;
}

.yui-skin-sam .yui-dt-liner {
	white-space: nowrap;
}

#myAutoComplete {
	width: 25em;
	padding-bottom: 2em;
}
</style>
<script type="text/javascript">
	function getProjectMember(val, name) {
		document.getElementById("projectId").value = val;
		document.getElementById("projectName").value = name;
		document.getElementById("searchMemberForm").submit();
	}
</script>
</head>
<body class="yui-skin-sam">
	<h2>Search Member</h2>
	<a href="#">Home</a> >
	<a href="#">Project</a> > Search Member

	<br />

	<form id="searchMemberForm" name="searchMemberForm" method="post"
		action="<%=request.getContextPath()%>/admin/member/list.html">
		<input type="hidden" id="projectId" name="projectId">
		<div id="myAutoComplete">
			<label> Project Name</label> <input id="projectName"
				name="projectName" type="text" value="${projectName}"> <input
				type="submit" name="search" id="search" value="Submit">
			<div id="myContainer"></div>
		</div>
	</form>

	<table width="400px" border="1">
		<tr>
			<th width="50px">No.</th>
			<th width="350px">Project Name</th>
		</tr>
		<c:forEach items="${projectList}" var="item" varStatus="status">
			<tr>
				<td>${status.count}</td>
				<td><a href="#"
					onclick="getProjectMember('${item.projectId}', '${item.projectName}')">${item.projectName}</a>
				</td>
			</tr>
		</c:forEach>
	</table>


	<br />



	<%-- // show only current page worth of data --%>
	<table width="720px" border="1">
		<tr>
			<th width="20px">No.</th>
			<th width="250px">First Name</th>
			<th width="250px">Last Name</th>
			<th width="200px">Member Type</th>
		</tr>
		<c:forEach items="${pagedListHolder.pageList}" var="item">
			<tr>
				<td>${item.personId}</td>
				<td>${item.firstName}</td>
				<td>${item.lastName}</td>
				<td>${item.memberType}</td>
			</tr>
		</c:forEach>
	</table>
	<br>
	<p>
		<jsp:useBean id="pagedListHolder" scope="request"
			type="org.springframework.beans.support.PagedListHolder" />
		<%-- // create link for pages, "~" will be replaced later on with the proper page number --%>
		<c:url value="/admin/member/list.html" var="pagedLink">
			<c:param name="p" value="~" />
		</c:url>

		<%-- // load our paging tag, pass pagedListHolder and the link --%>
		<tg:paging pagedListHolder="${pagedListHolder}"
			pagedLink="${pagedLink}" />
	</p>
</body>