package sg.edu.nus.iss.vms.member.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.apache.log4j.Logger;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;

import sg.edu.nus.iss.vms.common.SessionBean;
import sg.edu.nus.iss.vms.common.orm.Manager;
import sg.edu.nus.iss.vms.member.service.MemberManagementService;
import sg.edu.nus.iss.vms.project.dto.ProjectDto;
import sg.edu.nus.iss.vms.project.dto.ProjectMemberDto;
import sg.edu.nus.iss.vms.project.vo.ProjectMemberVo;

public class MemberManagementServiceImpl implements MemberManagementService {

	private Manager manager;
	private SessionBean sessionBean;
	private final Logger logger = Logger
			.getLogger(MemberManagementServiceImpl.class);

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

	@Override
	public List<ProjectMemberDto> getListOfMembers(long projectId) {
		// try{debug();}catch(Exception ex){ex.printStackTrace();}
		List<ProjectMemberDto> memberList = new ArrayList<ProjectMemberDto>();
		try {
			this.logger.debug("@ Service Layer getting user 1");
			String hQL = "from ProjectMember where projectId=" + projectId;
			memberList = manager.find(hQL);
		} catch (Exception ex) {
			this.logger.error("Data Access Error", ex);
		} finally {
			this.logger.debug("@ Service Layer getting user 2");
		}
		return memberList;
	}

	@Override
	public List<ProjectMemberVo> getListOfMembersbyProject(ProjectDto projectDto) {
		try {
			DetachedCriteria criteria = DetachedCriteria
					.forClass(ProjectMemberDto.class);
			criteria.add(Restrictions.eq("prjId", projectDto));
			List<ProjectMemberDto> memberList = manager
					.findByDetachedCriteria(criteria);

			List<ProjectMemberVo> projectMemberVos = new ArrayList<ProjectMemberVo>();

			for (ProjectMemberDto projectMemberDto : memberList) {
				ProjectMemberVo projectMemberVo = new ProjectMemberVo();
				projectMemberVo.setRoleCd(String.valueOf(projectMemberDto
						.getRoleCd().longValue()));
				projectMemberVo.setUsrLoginId(projectMemberDto.getUsrLoginId());
				projectMemberVos.add(projectMemberVo);

			}

			return projectMemberVos;
		} catch (Exception ex) {
			this.logger.error("Data Access Error", ex);
		}
		return null;
	}

	@Override
	public List<ProjectMemberDto> getListOfMembers() {
		// try{debug();}catch(Exception ex){ex.printStackTrace();}
		List<ProjectMemberDto> userList = new ArrayList<ProjectMemberDto>();
		try {
			this.logger.debug("@ Service Layer getting user 1");
			// List<Person> tempList = this.manager.list(Person.class);
			// for (Person person : tempList) {
			// MemberVo newMember = new MemberVo();
			// newMember.setPersonId(person.getPersonId());
			// newMember.setFirstName(person.getFirstName());
			// newMember.setLastName(person.getLastName());
			// newMember.setEmail(person.getEmail());
			// newMember.setMobile(person.getMobile());
			// newMember.setMemberType(person.getTypeId().getCodeName());
			// userList.add(newMember);
			// }

		} catch (Exception ex) {
			this.logger.error("Data Access Error", ex);
		} finally {
			this.logger.debug("@ Service Layer getting user 2");
		}
		return userList;
	}
}