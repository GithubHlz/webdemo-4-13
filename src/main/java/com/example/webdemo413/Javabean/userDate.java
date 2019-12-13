package com.example.webdemo413.Javabean;

import java.math.BigDecimal;
import java.util.List;

public class userDate
{
	private BigDecimal USERID;
	private String USERNAME, PASSWORD, SEXY, PROFESSION, POSITION, PHONE, EMAIL, REGISTEREDTIME, INTEGRAL, UPLOADDOCUMENT, DOWNLOADDOCUMENT, USERSTATE;

	private log log;
	private List<log> logList;


	public userDate()
	{
	}

	public userDate(BigDecimal USERID, String USERNAME, String PASSWORD, String SEXY, String PROFESSION, String POSITION, String PHONE, String EMAIL, String REGISTEREDTIME, String INTEGRAL, String UPLOADDOCUMENT, String DOWNLOADDOCUMENT, String USERSTATE, log log, List<log> logList)
	{
		this.USERID = USERID;
		this.USERNAME = USERNAME;
		this.PASSWORD = PASSWORD;
		this.SEXY = SEXY;
		this.PROFESSION = PROFESSION;
		this.POSITION = POSITION;
		this.PHONE = PHONE;
		this.EMAIL = EMAIL;
		this.REGISTEREDTIME = REGISTEREDTIME;
		this.INTEGRAL = INTEGRAL;
		this.UPLOADDOCUMENT = UPLOADDOCUMENT;
		this.DOWNLOADDOCUMENT = DOWNLOADDOCUMENT;
		this.USERSTATE = USERSTATE;
		this.log = log;
		this.logList = logList;
	}

	public BigDecimal getUSERID()
	{
		return USERID;
	}

	public void setUSERID(BigDecimal USERID)
	{
		this.USERID = USERID;
	}

	public String getUSERNAME()
	{
		return USERNAME;
	}

	public void setUSERNAME(String USERNAME)
	{
		this.USERNAME = USERNAME;
	}

	public String getPASSWORD()
	{
		return PASSWORD;
	}

	public void setPASSWORD(String PASSWORD)
	{
		this.PASSWORD = PASSWORD;
	}

	public String getSEXY()
	{
		return SEXY;
	}

	public void setSEXY(String SEXY)
	{
		this.SEXY = SEXY;
	}

	public String getPROFESSION()
	{
		return PROFESSION;
	}

	public void setPROFESSION(String PROFESSION)
	{
		this.PROFESSION = PROFESSION;
	}

	public String getPOSITION()
	{
		return POSITION;
	}

	public void setPOSITION(String POSITION)
	{
		this.POSITION = POSITION;
	}

	public String getPHONE()
	{
		return PHONE;
	}

	public void setPHONE(String PHONE)
	{
		this.PHONE = PHONE;
	}

	public String getEMAIL()
	{
		return EMAIL;
	}

	public void setEMAIL(String EMAIL)
	{
		this.EMAIL = EMAIL;
	}

	public String getREGISTEREDTIME()
	{
		return REGISTEREDTIME;
	}

	public void setREGISTEREDTIME(String REGISTEREDTIME)
	{
		this.REGISTEREDTIME = REGISTEREDTIME;
	}

	public String getINTEGRAL()
	{
		return INTEGRAL;
	}

	public void setINTEGRAL(String INTEGRAL)
	{
		this.INTEGRAL = INTEGRAL;
	}

	public String getUPLOADDOCUMENT()
	{
		return UPLOADDOCUMENT;
	}

	public void setUPLOADDOCUMENT(String UPLOADDOCUMENT)
	{
		this.UPLOADDOCUMENT = UPLOADDOCUMENT;
	}

	public String getDOWNLOADDOCUMENT()
	{
		return DOWNLOADDOCUMENT;
	}

	public void setDOWNLOADDOCUMENT(String DOWNLOADDOCUMENT)
	{
		this.DOWNLOADDOCUMENT = DOWNLOADDOCUMENT;
	}

	public String getUSERSTATE()
	{
		return USERSTATE;
	}

	public void setUSERSTATE(String USERSTATE)
	{
		this.USERSTATE = USERSTATE;
	}

	public log getLog()
	{
		return log;
	}

	public void setLog(log log)
	{
		this.log = log;
	}

	public List<log> getLogList()
	{
		return logList;
	}

	public void setLogList(List<log> logList)
	{
		this.logList = logList;
	}

	@Override
	public String toString() {
		return "Customer [USERID=" + USERID + ", USERNAME=" + USERNAME +
				", PROFESSION=" + PROFESSION + ", SEXY=" + SEXY + "]";
	}

}
