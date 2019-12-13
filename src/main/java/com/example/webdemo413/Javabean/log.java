package com.example.webdemo413.Javabean;

import java.math.BigDecimal;
import java.util.List;

public class log
{
	private BigDecimal LOGID,USERID;
	private String LOGTIME,INTEGRAL,OPERATING;

	private userDate userDates;
	private List<userDate> userDateList;

	private parameter parameters;
	private List<parameter> parameterList;
	public log()
	{
	}

	public log(BigDecimal LOGID, BigDecimal USERID, String LOGTIME, String INTEGRAL, String OPERATING, userDate userDates, List<userDate> userDateList, parameter parameters, List<parameter> parameterList)
	{
		this.LOGID = LOGID;
		this.USERID = USERID;
		this.LOGTIME = LOGTIME;
		this.INTEGRAL = INTEGRAL;
		this.OPERATING = OPERATING;
		this.userDates = userDates;
		this.userDateList = userDateList;
		this.parameters = parameters;
		this.parameterList = parameterList;
	}

	public BigDecimal getLOGID()
	{
		return LOGID;
	}

	public void setLOGID(BigDecimal LOGID)
	{
		this.LOGID = LOGID;
	}

	public BigDecimal getUSERID()
	{
		return USERID;
	}

	public void setUSERID(BigDecimal USERID)
	{
		this.USERID = USERID;
	}

	public String getLOGTIME()
	{
		return LOGTIME;
	}

	public void setLOGTIME(String LOGTIME)
	{
		this.LOGTIME = LOGTIME;
	}

	public String getINTEGRAL()
	{
		return INTEGRAL;
	}

	public void setINTEGRAL(String INTEGRAL)
	{
		this.INTEGRAL = INTEGRAL;
	}

	public String getOPERATING()
	{
		return OPERATING;
	}

	public void setOPERATING(String OPERATING)
	{
		this.OPERATING = OPERATING;
	}

	public userDate getUserDates()
	{
		return userDates;
	}

	public void setUserDates(userDate userDates)
	{
		this.userDates = userDates;
	}

	public List<userDate> getUserDateList()
	{
		return userDateList;
	}

	public void setUserDateList(List<userDate> userDateList)
	{
		this.userDateList = userDateList;
	}

	public parameter getParameters()
	{
		return parameters;
	}

	public void setParameters(parameter parameters)
	{
		this.parameters = parameters;
	}

	public List<parameter> getParameterList()
	{
		return parameterList;
	}

	public void setParameterList(List<parameter> parameterList)
	{
		this.parameterList = parameterList;
	}
}
