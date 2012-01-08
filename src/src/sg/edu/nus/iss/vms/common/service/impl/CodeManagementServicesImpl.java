package sg.edu.nus.iss.vms.common.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.apache.log4j.Logger;
import org.hibernate.FetchMode;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;

import sg.edu.nus.iss.vms.common.SessionBean;
import sg.edu.nus.iss.vms.common.dto.CodeDto;
import sg.edu.nus.iss.vms.common.orm.Manager;
import sg.edu.nus.iss.vms.common.service.CodeManagementServices;
import sg.edu.nus.iss.vms.common.vo.CodeLookupVo;

public class CodeManagementServicesImpl implements CodeManagementServices {

	private final Logger logger = Logger
			.getLogger(CodeManagementServicesImpl.class);
	private Manager manager;
	private SessionBean sessionBean;

	public Manager getManager() {
		return this.manager;
	}

	public void setManager(Manager manager) {
		this.manager = manager;
	}

	public SessionBean getSessionBean() {
		return this.sessionBean;
	}

	public void setSessionBean(SessionBean sessionBean) {
		this.sessionBean = sessionBean;
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see sg.edu.nus.iss.vms.staffmgmt.service.impl.StaffManagementServices#
	 * getListOfUser()
	 */
	@Override
	public List<CodeDto> getCodeListByCategory(String category) {
		logger.debug("getCodeListByCategory(String) - start");
		logger.debug("getCodeListByCategory(String) @ Service Layer getting CodeList By Code Category :"
				+ category);
		List<CodeDto> codeList = new ArrayList<CodeDto>();
		try {
			String hQL = "from CodeDto c where c.catId.nme='" + category + "'";
			codeList = this.manager.find(hQL);
		} catch (Exception ex) {
			this.logger.error("Data Access Error", ex);
		} finally {
			this.logger.debug("getCodeListByCategory(String) - end");
		}
		return codeList;
	}

	@Override
	public String getCodeDescriptionByCodeId(Long codeId) {
		String codeDescription = "";
		try {
			String hQL = "from CodeDto c where c.cdId=" + codeId.toString();
			List<CodeDto> codeList = this.manager.find(hQL);
			if (!codeList.isEmpty()) {
				CodeDto codeDto = codeList.get(0);
				codeDescription = codeDto.getDesc();
			}

		} catch (Exception ex) {
			this.logger.error("Data Access Error", ex);
		} finally {
			return codeDescription;
		}

	}

	@Override
	public String getCodeValueByCodeId(Long codeId) {
		String codeValue = "";
		try {
			String hQL = "from CodeDto c where c.cdId=" + codeId.toString();
			List<CodeDto> codeList = this.manager.find(hQL);
			if (!codeList.isEmpty()) {
				CodeDto codeDto = codeList.get(0);
				codeValue = codeDto.getVal();
			}

		} catch (Exception ex) {
			this.logger.error("Data Access Error", ex);
		} finally {
			return codeValue;
		}

	}

	/*public CodeDto getCodeDescriptionByCodeCategoryAndCodeDesc(String category,
			String codeDesc) {

		try {
			DetachedCriteria criteria = DetachedCriteria
					.forClass(CodeDto.class);
			criteria.setFetchMode("catId", FetchMode.JOIN)
					.createAlias("catId", "cat")
					.add(Restrictions.eq("cat.nme", category))
					.add(Restrictions.eq("val", codeDesc));

			return (CodeDto) manager.findByDetachedCriteria(criteria).get(0);

		} catch (Exception ex) {
			this.logger.error("Data Access Error", ex);
			return null;
		}

	}*/

	@Override
	public CodeDto getCodeById(Long id) {

		try {
			manager.get(CodeDto.class, id);

			return (CodeDto) manager.get(CodeDto.class, id);

		} catch (Exception ex) {
			this.logger.error("Data Access Error", ex);
			return null;
		}

	}

	@Override
	public CodeLookupVo getCodeByCategoryAndCodeValue(String category, String val) {
		if (logger.isDebugEnabled()) {
			logger.debug("getCodeByCategoryAndCodeValue(String, String) - start");
			logger.debug("getCodeByCategoryAndCodeValue(String, String) - @ Getting Code DTO by a specific Category Value."
					+ category + ", Category Value:" + val);
		}
		
		List<CodeDto> codeList = new ArrayList<CodeDto>();
		CodeLookupVo codeLookupVo = null;
		try {
			String hQL = "from CodeDto c where c.catId.nme='" + category
					+ "' and c.val='" + val + "'";
			codeList = this.manager.find(hQL);
			if (codeList != null) {
				codeLookupVo = new CodeLookupVo(codeList.get(0));
				return codeLookupVo;
			}
		} catch (Exception ex) {
			this.logger.error("getCodeByCategoryAndCodeValue(String, String) - error", ex);
		} finally {
			if (logger.isDebugEnabled()) {
				logger.debug("getCodeByCategoryAndCodeValue(String, String) - end");
			}
		}

		if (logger.isDebugEnabled()) {
			logger.debug("getCodeByCategoryAndCodeValue(String, String) - end");
		}
		return codeLookupVo;
	}

	/*public CodeDto getCodeByCodeCategoryAndCodeDesc(String category, String codeValue) {
		this.logger
				.debug("@ Service Layer Getting Code DTO by a specific Category Value."
						+ category + ", Category Value:" + codeValue);
		List<CodeDto> codeList = new ArrayList<CodeDto>();
		try {
			String hQL = "from CodeDto c where c.catId.nme='" + category
					+ "' and c.desc='" + codeValue + "'";
			codeList = this.manager.find(hQL);
			if (codeList != null)
				return codeList.get(0);
		} catch (Exception ex) {
			this.logger.error("Data Access Error", ex);
		} finally {
			this.logger.debug("@ Service Layer: getCodeDtoByCatVal");
		}
		return null;
	}*/
}