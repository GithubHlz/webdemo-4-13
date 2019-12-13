package com.example.webdemo413.Javabean;

public class ResultEntity
{
	private int Status;
	private String msg;

	public ResultEntity()
	{
	}

	public ResultEntity(int status, String msg)
	{
		Status = status;
		this.msg = msg;
	}

	public int getStatus()
	{
		return Status;
	}

	public void setStatus(int status)
	{
		Status = status;
	}

	public String getMsg()
	{
		return msg;
	}

	public void setMsg(String msg)
	{
		this.msg = msg;
	}
}
