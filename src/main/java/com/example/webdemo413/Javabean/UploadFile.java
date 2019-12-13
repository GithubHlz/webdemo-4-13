package com.example.webdemo413.Javabean;

public class UploadFile
{
	private String name,adminName,upload_date,down_integral,fileType;

	public UploadFile(String name, String adminName, String upload_date, String down_integral, String fileType)
	{
		this.name = name;
		this.adminName = adminName;
		this.upload_date = upload_date;
		this.down_integral = down_integral;
		this.fileType = fileType;
	}

	public UploadFile()
	{
	}

	public String getName()
	{
		return name;
	}

	public void setName(String name)
	{
		this.name = name;
	}

	public String getAdminName()
	{
		return adminName;
	}

	public void setAdminName(String adminName)
	{
		this.adminName = adminName;
	}

	public String getUpload_date()
	{
		return upload_date;
	}

	public void setUpload_date(String upload_date)
	{
		this.upload_date = upload_date;
	}

	public String getDown_integral()
	{
		return down_integral;
	}

	public void setDown_integral(String down_integral)
	{
		this.down_integral = down_integral;
	}

	public String getFileType()
	{
		return fileType;
	}

	public void setFileType(String fileType)
	{
		this.fileType = fileType;
	}
}
