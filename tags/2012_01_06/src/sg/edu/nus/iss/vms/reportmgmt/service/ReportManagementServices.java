package sg.edu.nus.iss.vms.reportmgmt.service;

import java.sql.SQLException;

import net.sf.jasperreports.engine.JRException;

public interface ReportManagementServices {

	public byte[] generateVolunteerCertificate(Long certRequestId,String reqBy,String requestType) throws JRException,SQLException;

        //Need to get certificate request


}
