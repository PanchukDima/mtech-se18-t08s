<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="tg" tagdir="/WEB-INF/tags"%>

<body>
<head>
	<script type="text/javascript">
		var defProjName = 'Please select...';

        window.onload = init;

        function init() {

        }

        function checkUserLoginId(){
                var loginId = document.getElementById("loginId").value;
                VmsDwr.isUserLoginIdExist(loginId,function(result){
                        if(result){
                                alert(loginId + " already exist.");
                        }else{
                                alert(loginId + " does not exist.");
                        }                            
                });
        }
    </script>
</head>
<body>
        <h2><fmt:message key="message.volunteerManagement.updateVolunteer.label"/></h2>
        <div id="breadcrumb">
                <a href="#"><fmt:message key="message.common.home.label"/></a> / 
                <fmt:message key="message.volunteerManagement.updateVolunteer.label"/>
        </div>
        <div class="query">
                <c:if test="${not empty msg}"> 
                        <div class="infoblock">
                                <c:out value="${msg}" escapeXml="false"/><br/>
                        </div>
                </c:if>

                <c:if test="${not empty errors}"> 
                        <div class="errorblock">
                                <c:forEach var="error" items="${errors}">  
                                        <c:out value="${error}" escapeXml="false"/><br/>
                                </c:forEach>
                        </div>
                </c:if>
            
                <form:form name="updateVolunteer" method="post"
                           commandName="command" 
                           action="updateVolunteer.html">
                        <form:hidden path="cmdType"/>
                        <table width="400" class="proj-table">
                                <tr>
                                        <th align="left">
                                                <fmt:message key="message.common.loginid.label"/>
                                        </th>
                                        <th>:</th>
                                        <th align="left">  
                                                ${command.loginId}
                                                <form:hidden path="loginId"/>
                                                <form:errors path="loginId" cssClass="error"/> 
                                        </th>
                                </tr>	
                                <tr>
                                        <th width="133" align="left"><fmt:message key="message.common.title.label"/> <span class="mandatory"><fmt:message key="message.common.symbol.mandatory.label"/></span></th>
                                        <th width="10"><fmt:message key="message.common.symbol.afterLabel.label" /></th>
                                        <th width="246" align="left">
                                                <form:select path="title">
                                                        <c:forEach items="${titleList}" var="item" varStatus="status">
                                                                <form:option value="'${item.cdId}'">${item.val}</form:option>
                                                        </c:forEach>
                                                </form:select>                        
                                                <form:errors path="title" cssClass="error"/>
                                        </th>
                                </tr>		
                                <tr>
                                        <th align="left"><fmt:message key="message.common.name.label"/> <span class="mandatory"><fmt:message key="message.common.symbol.mandatory.label"/></span></th>
                                        <th><fmt:message key="message.common.symbol.afterLabel.label" /></th>
                                        <th align="left">       
                                                <form:input path="nme"/>
                                                <form:errors path="nme" cssClass="error"/>                        
                                        </th>
                                </tr>		
                                <tr>
                                        <th align="left"><fmt:message key="message.common.email.label"/> <span class="mandatory"><fmt:message key="message.common.symbol.mandatory.label"/></span></th>
                                        <th><fmt:message key="message.common.symbol.afterLabel.label" /></th>
                                        <th align="left">
                                                <form:input path="email"/>
                                                <form:errors path="email" cssClass="error"/>
                                        </th>
                                </tr>		
                               <!--  <tr>
                                        <th align="left"><fmt:message key="message.volunteerManagement.password.label"/> <span class="mandatory"><fmt:message key="message.common.symbol.mandatory.label"/></span></th>
                                        <th><fmt:message key="message.common.symbol.afterLabel.label" /></th>
                                        <th align="left">
                                                <form:password path="pwd"/>
                                                <form:errors path="pwd" cssClass="error"/>
                                        </th>
                                </tr>		
                                <tr>
                                        <th align="left"><fmt:message key="message.volunteerManagement.cfgpassword.label"/> <span class="mandatory"><fmt:message key="message.common.symbol.mandatory.label"/></span></th>
                                        <th><fmt:message key="message.common.symbol.afterLabel.label" /></th>
                                        <th align="left">
                                                <form:password path="cfpwd"/>
                                                <form:errors path="cfpwd" cssClass="error"/>
                                        </th>
                                </tr>		
                                -->
                                <tr>
                                        <th align="left"><fmt:message key="message.common.address.label"/></th>
                                        <th><fmt:message key="message.common.symbol.afterLabel.label" /></th>
                                        <th align="left"><label for="textarea"></label>
                                                <form:textarea path="addr" cols="45" rows="5"></form:textarea>
                                                <form:errors path="addr" cssClass="error"/>
                                        </th>
                                </tr>		
                                <tr>
                                        <th align="left"><fmt:message key="message.common.postCode.label"/></th>
                                        <th><fmt:message key="message.common.symbol.afterLabel.label" /></th>
                                        <th align="left">
                                                <form:input path="postCd"/>
                                                <form:errors path="postCd" cssClass="error"/>
                                        </th>
                                </tr>		
                                <tr>
                                        <th align="left"><fmt:message key="message.common.country.label"/></th>
                                        <th><fmt:message key="message.common.symbol.afterLabel.label" /></th>
                                        <th align="left">
                                                <form:select path="ctryCd">
                                                        <c:forEach items="${countryList}" var="item" varStatus="status">
                                                                <form:option value="${item.cdId}">${item.val}</form:option>
                                                        </c:forEach>
                                                </form:select>
                                                <form:errors path="ctryCd" cssClass="error"/>
                                        </th>
                                </tr>		
                                <tr>
                                        <th align="left"><fmt:message key="message.common.mobile.label"/></th>
                                        <th><fmt:message key="message.common.symbol.afterLabel.label" /></th>
                                        <th align="left">
                                                <form:input path="mobile"/>
                                                <form:errors path="mobile" cssClass="error"/>
                                        </th>
                                </tr>		
                                <tr>
                                        <th align="left"><fmt:message key="message.common.dateOfBirth.label"/></th>
                                        <th><fmt:message key="message.common.symbol.afterLabel.label" /></th>
                                        <th align="left">
                                                <form:input path="dob" cssClass="Date" maxlength="25" size="25"/>
                                                <form:errors path="dob" cssClass="error"/>
                                                <img src="<%=request.getContextPath()%>/sys/images/cal.gif" onClick="javascript:NewCssCal('dob')" style="cursor:pointer"/>
                                        </th>
                                </tr>		
                                <tr>
                                        <th align="left"><fmt:message key="message.volunteerManagement.intrest.label"/></th>
                                        <th><fmt:message key="message.common.symbol.afterLabel.label" /></th>
                                        <th align="left">
                                                <form:textarea path="intrst" cols="45" rows="5"></form:textarea>
                                                <form:errors path="intrst" cssClass="error"/>
                                        </th>
                                </tr>		
                                <tr>
                                        <th align="left"><fmt:message key="message.volunteerManagement.skillSet.label"/></th>
                                        <th><fmt:message key="message.common.symbol.afterLabel.label" /></th>
                                        <th align="left">
                                                <form:textarea path="skillSet" cols="45" rows="5"></form:textarea>
                                                <form:errors path="skillSet" cssClass="error"/>
                                        </th>
                                </tr>	
                                <tr>
                                        <th align="left"><fmt:message key="message.volunteerManagement.qualifation.label"/></th>
                                        <th><fmt:message key="message.common.symbol.afterLabel.label" /></th>
                                        <th align="left">
                                                <form:textarea path="qualAtt" cols="45" rows="5"></form:textarea>
                                                <form:errors path="qualAtt" cssClass="error"/>
                                        </th>
                                </tr>
                                <tr>
                                        <th colspan="3" ><input type="submit" name="button" id="button" class="button" value="<fmt:message key="message.common.update.button"/>"></th>
                                </tr>
                        </table>
                </form:form>
        </div>
</body>