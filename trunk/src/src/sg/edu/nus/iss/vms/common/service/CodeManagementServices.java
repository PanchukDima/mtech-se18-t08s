package sg.edu.nus.iss.vms.common.service;

import java.util.List;

import sg.edu.nus.iss.vms.common.dto.CodeDto;

public interface CodeManagementServices {

	public List<CodeDto> getListOfCodeByCategory(String category);

	public String getCodeDescriptionByCodeId(Long codeId);

	public String getCodeValueByCodeId(Long codeId);

	//public CodeDto getCodeDescriptionByCodeCategoryAndCodeDesc(String category, String codeDesc);

	public CodeDto getCodeByCatAndVal(String Category, String catVal);

	public CodeDto getCodeByCodeCategoryAndCodeDesc(String category, String codeValue);

	public CodeDto getCodeDtobyId(Long id);
}