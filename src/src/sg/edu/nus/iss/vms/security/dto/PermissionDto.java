package sg.edu.nus.iss.vms.security.dto;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.PrimaryKeyJoinColumn;
import javax.persistence.Table;

import sg.edu.nus.iss.vms.common.dto.BaseVersionDto;

@Entity
@Table(name = "tb_permission")
@PrimaryKeyJoinColumn(name = "permi_id")
@NamedQueries( { 
	@NamedQuery(name = "PermissionDto.findAll", query = "SELECT permissionDto FROM PermissionDto permissionDto")
	
})

public class PermissionDto extends BaseVersionDto implements Serializable {

	private static final long serialVersionUID = 1L;
	

	private Long permissionID;
	private String uri;
	private String description;

	public PermissionDto() {
	}

	@Id
	@GeneratedValue
	@Column(name = "PERMI_ID", unique = true, nullable = false)
	public Long getPermissionID() {
		return this.permissionID;
	}

	public void setPermissionID(Long permissionID) {
		this.permissionID = permissionID;
	}

	@Column(name = "URI", nullable = false, length = 1000)
	public String getUri() {
		return this.uri;
	}

	public void setUri(String uri) {
		this.uri = uri;
	}

	@Column(name = "DESC", length = 200)
	public String getDescription() {
		return this.description;
	}

	public void setDescription(String description) {
		this.description = description;
	}
}