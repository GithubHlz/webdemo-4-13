package com.example.webdemo413.Javabean;

import java.math.BigDecimal;

public class Admin
{
	private BigDecimal admin;
	private String adminName;
	private String password,phone,profession,position;

	public Admin()
	{
	}

	public Admin(BigDecimal admin, String adminName, String password, String phone, String profession, String position)
	{
		this.admin = admin;
		this.adminName = adminName;
		this.password = password;
		this.phone = phone;
		this.profession = profession;
		this.position = position;
	}

	public BigDecimal getAdmin()
	{
		return admin;
	}

	public void setAdmin(BigDecimal admin)
	{
		this.admin = admin;
	}

	public String getAdminName()
	{
		return adminName;
	}

	public void setAdminName(String adminName)
	{
		this.adminName = adminName;
	}

	public String getPassword()
	{
		return password;
	}

	public void setPassword(String password)
	{
		this.password = password;
	}

	public String getPhone()
	{
		return phone;
	}

	public void setPhone(String phone)
	{
		this.phone = phone;
	}

	public String getProfession()
	{
		return profession;
	}

	public void setProfession(String profession)
	{
		this.profession = profession;
	}

	public String getPosition()
	{
		return position;
	}

	public void setPosition(String position)
	{
		this.position = position;
	}
}
