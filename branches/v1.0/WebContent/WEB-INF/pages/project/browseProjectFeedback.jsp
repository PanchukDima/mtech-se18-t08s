<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="tg" tagdir="/WEB-INF/tags"%>

<head>

    <link type="text/css"
          href="<%=request.getContextPath()%>/sys/css/paging.css"
          rel="stylesheet" />

</head>
<body>
    <h2>Review Project Feedback</h2>
    <div id="breadcrumb">
        <a href="#">Home</a> / Review Project Feedback</div>

    <div class="query">  
        <form:form name="browseProjectFeedback" method="post"  commandName="feedbackVo" 
                   action="searchProjectFeedback.html" >
            <table width="707" height="105" class="query-table" >
                <tr>
                    <td width="122">Project Id:</td>
                    <td width="197">
                        <spring:bind path="feedbackVo.prjId">  
                            <form:input path="prjId"/>
                        </spring:bind>
                        <form:errors path="prjId" cssClass="error"/>  
                    </td>
                    <td width="157">Feedback Title:</td>
                    <td width="203">
                        <spring:bind path="feedbackVo.fbTitle">
                            <form:input path="fbTitle"/>
                        </spring:bind>
                        <form:errors path="fbTitle" cssClass="error"/>  
                    </td>
                </tr>
                <tr>
                    <td>Project Name:</td>
                    <td>
                        <spring:bind path="feedbackVo.prjName">  
                            <form:input path="prjName"/>
                        </spring:bind>
                        <form:errors path="prjName" cssClass="error"/>  
                    </td>
                    <td>Status:</td>
                    <td>
                        <form:select path="fbStatus">
                            <form:option value="" label="ALL"/>
                            <c:forEach items="${fbCodeList}" var="item" varStatus="status">
                                <form:option value="${item.val}">${item.val}</form:option>
                            </c:forEach>
                        </form:select>       
                    </td>
                </tr>

                <tr>
                    <td colspan="4" align="center">    
                        <input type="submit" name="btn_Search" id="btn_Search" value="Search">
                    </td>
                </tr>

            </table>
        </form:form>
    </div>
    <!-- end of query -->
    <table width="700" class="proj-table">
        <tr>
            <td colspan="6" align="left">
                Search Results</td>
        </tr>
        <tr>
            <th>Feedback Code</th>
            <th>Project Name</th>
            <th>Feedback Title</th>
            <th>Created by</th>
            <th>Status</th>
            <th>Actions</th>
        </tr>
        <c:forEach items="${pagedListHolder.pageList}" var="item">
            <tr>
                <td>${item.prjFbId}</td>
                <td>${item.prjId.nme}</td>
                <td>${item.title}</td>
                <td>${item.createdBy}</td>
                <td>
                    <c:forEach items="${fbCodeList}" var="item2" varStatus="status">
                        <c:set var="fbStsId">${item.stsCd}</c:set>
                        <c:set var="codeId">${item2.cdId}</c:set>

                        <c:if test="${fbStsId == codeId}">
                            <c:out value="${item2.val}"/>
                        </c:if>
                    </c:forEach>
                </td>
                <td><a href="
                       <c:url value="viewProjectFeedbackDetails.html">
                           <c:param name="prjFbId" value="${item.prjFbId}"/> 
                       </c:url>
                       ">Details</a></td>
                <!-- <td><input type="submit" name="btn_publish" id="btn_publish" value="Publish"></td>-->

            </tr>
        </c:forEach>
    </table>
    <div class="pagination">
        <jsp:useBean id="pagedListHolder" scope="request"
                     type="org.springframework.beans.support.PagedListHolder" />

        <%-- // create link for pages, "~" will be replaced later on with the proper page number --%>
        <c:url value="/project/browseProjectFeedback.html" var="pagedLink">
            <c:param name="p" value="~" />
        </c:url>

        <%-- // load our paging tag, pass pagedListHolder and the link --%>
        <tg:paging pagedListHolder="${pagedListHolder}"
                   pagedLink="${pagedLink}" />
    </div>
</body>