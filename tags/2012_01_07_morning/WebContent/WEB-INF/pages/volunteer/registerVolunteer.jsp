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
                    alert(loginId + " exist");
                }else{
                    alert(loginId + " doesn't exist");
                }                            
            });
        }
    </script>
</head>
<body>
    <h2><fmt:message key="message.volunteerManagement.registerVolunteer.label"/></h2>
   <!-- <div id="breadcrumb">
        <a href="#"><fmt:message key="message.common.home.label"/></a>/<fmt:message key="message.volunteerManagement.registerVolunteer.label"/>
    </div>
	-->
    <div class="query">
        <c:if test="${not empty msg}">
            <div class="info">
                <c:out value="${msg}" escapeXml="false" />
                <br />
            </div>
        </c:if>
        <c:if test="${not empty errors}">
            <div class="error">
                <c:out value="Error:" />
                <c:forEach var="error" items="${errors}">
                    <c:out value="${error}" escapeXml="false" />
                    <br />
                </c:forEach>
			</div>
        </c:if>

        <form:form name="registerVolunteer" method="post"
                   commandName="command" 
                   action="registerVolunteer.html">
            <form:hidden path="cmdType"/>
            <table width="400" class="query-table">
                <tr>
                    <td colspan="3">
                        <form:errors path="*" cssClass="error" element="div" />
                    </td>
                </tr>
                <tr>
                    <td align="left">
                        <fmt:message key="message.common.loginid.label"/>
                    </td>
                    <td>:</td>
                    <td align="left">       
                        <form:input path="loginId"/>
                        <form:errors path="loginId" cssClass="error"/> 
                        <input type="button" name="check" value="Check" onclick="checkUserLoginId()"/>
                    </td>
                </tr>	
                <tr>
                    <td width="133" align="left"><fmt:message key="message.common.title.label"/></td>
                    <td width="10">:</td>
                    <td width="246" align="left">
                        <form:select path="title">
                            <c:forEach items="${titleList}" var="item" varStatus="status">
                                <form:option value="${item.cdId}">${item.val}</form:option>
                            </c:forEach>
                        </form:select>                        
                        <form:errors path="title" cssClass="error"/>
                    </td>
                </tr>		
                <tr>
                    <td align="left"><fmt:message key="message.common.name.label"/></td>
                    <td>:</td>
                    <td align="left">       
                        <form:input path="nme"/>
                        <form:errors path="nme" cssClass="error"/>                        
                    </td>
                </tr>		
                <tr>
                    <td align="left"><fmt:message key="message.common.email.label"/></td>
                    <td>:</td>
                    <td align="left">
                        <form:input path="email"/>
                        <form:errors path="email" cssClass="error"/>
                    </td>
                </tr>		
                <tr>
                    <td align="left"><fmt:message key="message.volunteerManagement.password.label"/></td>
                    <td>:</td>
                    <td align="left">
                        <form:password path="pwd"/>
                        <form:errors path="pwd" cssClass="error"/>
                    </td>
                </tr>		
                <tr>
                    <td align="left"><fmt:message key="message.volunteerManagement.cfgpassword.label"/></td>
                    <td>:</td>
                    <td align="left">
                        <form:password path="cfpwd"/>
                        <form:errors path="cfpwd" cssClass="error"/>
                    </td>
                </tr>		
                <tr>
                    <td align="left"><fmt:message key="message.common.address.label"/></td>
                    <td>:</td>
                    <td align="left"><label for="textarea"></label>
                        <form:textarea path="addr" cols="45" rows="5"></form:textarea>
                        <form:errors path="addr" cssClass="error"/>
                    </td>
                </tr>		
                <tr>
                    <td align="left"><fmt:message key="message.common.postCode.label"/></td>
                    <td>:</td>
                    <td align="left">
                        <form:input path="postCd"/>
                        <form:errors path="postCd" cssClass="error"/>
                    </td>
                </tr>		
                <tr>
                    <td align="left"><fmt:message key="message.common.country.label"/></td>
                    <td>:</td>
                    <td align="left">
                        <form:select path="ctryCd">
                            <c:forEach items="${countryList}" var="item" varStatus="status">
                                <form:option value="${item.cdId}">${item.val}</form:option>
                            </c:forEach>
                        </form:select>
                        <form:errors path="ctryCd" cssClass="error"/>
                    </td>
                </tr>		
                <tr>
                    <td align="left"><fmt:message key="message.common.mobile.label"/></td>
                    <td>:</td>
                    <td align="left">
                        <form:input path="mobile"/>
                        <form:errors path="mobile" cssClass="error"/>
                    </td>
                </tr>		
                <tr>
                    <td align="left"><fmt:message key="message.common.dateOfBirth.label"/></td>
                    <td>:</td>
                    <td align="left">
                        <form:input path="dob" cssClass="Date" maxlength="25" size="25"/>
                        <form:errors path="dob" cssClass="error"/>
                        <img src="<%=request.getContextPath()%>/sys/images/cal.gif" onClick="javascript:NewCssCal('dob','ddMMyyyy')" style="cursor:pointer"/>
                    </td>
                </tr>		
                <tr>
                    <td align="left"><fmt:message key="message.volunteerManagement.intrest.label"/></td>
                    <td>:</td>
                    <td align="left">
                        <form:textarea path="intrst" cols="45" rows="5"></form:textarea>
                        <form:errors path="intrst" cssClass="error"/>
                    </td>
                </tr>		
                <tr>
                    <td align="left"><fmt:message key="message.volunteerManagement.skillSet.label"/></td>
                    <td>:</td>
                    <td align="left">
                        <form:textarea path="skillSet" cols="45" rows="5"></form:textarea>
                        <form:errors path="skillSet" cssClass="error"/>
                    </td>
                </tr>	
                <tr>
                    <td align="left"><fmt:message key="message.volunteerManagement.qualifation.label"/></td>
                    <td>:</td>
                    <td align="left">
                        <form:textarea path="qualAtt" cols="45" rows="5"></form:textarea>
                        <form:errors path="qualAtt" cssClass="error"/>
                    </td>
                </tr>
                <tr>
					<td colspan="2"></td>
                    <td ><input type="submit" name="button" id="button" value="<fmt:message key="message.common.save.button"/>"></td>
                </tr>
            </table>
        </form:form>
    </div>
</body>