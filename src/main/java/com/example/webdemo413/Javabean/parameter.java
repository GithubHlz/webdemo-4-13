package com.example.webdemo413.Javabean;

import java.math.BigDecimal;

public class parameter
{
	private BigDecimal PARAMETERID;
	private String PARAMETER_NAME;

	public parameter()
	{
	}

	public parameter(BigDecimal PARAMETERID, String PARAMETER_NAME)
	{
		this.PARAMETERID = PARAMETERID;
		this.PARAMETER_NAME = PARAMETER_NAME;
	}

	public BigDecimal getPARAMETERID()
	{
		return PARAMETERID;
	}

	public void setPARAMETERID(BigDecimal PARAMETERID)
	{
		this.PARAMETERID = PARAMETERID;
	}

	public String getPARAMETER_NAME()
	{
		return PARAMETER_NAME;
	}

	public void setPARAMETER_NAME(String PARAMETER_NAME)
	{
		this.PARAMETER_NAME = PARAMETER_NAME;
	}
}
