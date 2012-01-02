package sg.edu.nus.iss.vms.common.util;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.context.ApplicationContext;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.context.support.WebApplicationContextUtils;

import sg.edu.nus.iss.vms.common.dto.CodeDto;
import sg.edu.nus.iss.vms.common.service.CodeManagementServices;

public class CodeLookupUtil {

	/**
	 * Gets the code Description based on the code ID passed in.
	 */
	public static String getCodeDescriptionByCodeId(Long codeId) {
		String codeDescription = "";
		CodeManagementServices codeMgr = getCodeManagementServices();
		codeDescription = codeMgr.getCodeDescriptionByCodeId(codeId);
		return codeDescription;
	}
	
	/**
	 * Gets the code Value based on the code ID passed in.
	 */
	public static String getCodeValueByCodeId(Long codeId) {
		String codeValue = "";
		CodeManagementServices codeMgr = getCodeManagementServices();
		codeValue = codeMgr.getCodeValueByCodeId(codeId);
		return codeValue;
	}

	/**
	 * gets the list of codes based on the category name
	 * 
	 */
	public static List<CodeDto> getListOfCodeByCategory(String category) {
		CodeManagementServices codeMgr = getCodeManagementServices();
		return codeMgr.getListOfCodeByCategory(category);
	}

	public static CodeDto getCodeByCategoryAndCodeValue(String category,
			String value) {
		CodeManagementServices codeMgr = getCodeManagementServices();
		return codeMgr.getCodeDescriptionByCodeCategoryAndCodeDesc(category,
				value);
	}

	/**
	 * @return the reference to Code management Services
	 */
	private static CodeManagementServices getCodeManagementServices() {
		HttpServletRequest curRequest = ((ServletRequestAttributes) RequestContextHolder
				.currentRequestAttributes()).getRequest();
		HttpSession session = curRequest.getSession();
		ApplicationContext ctx = WebApplicationContextUtils
				.getWebApplicationContext(session.getServletContext());
		CodeManagementServices codeMgr = (CodeManagementServices) ctx
				.getBean("codeManagementServiceImpl"); //$NON-NLS-1$
		return codeMgr;
	}

}
