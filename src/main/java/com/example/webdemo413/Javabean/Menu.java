package com.example.webdemo413.Javabean;

import java.math.BigDecimal;

public class Menu
{
	private BigDecimal menuid;
	private String menu;
	private String sonMenu;
	private String link;

	public Menu()
	{
	}

	public Menu(BigDecimal menuid, String menu, String sonMenu, String link)
	{
		this.menuid = menuid;
		this.menu = menu;
		this.sonMenu = sonMenu;
		this.link = link;
	}

	public BigDecimal getMenuid()
	{
		return menuid;
	}

	public void setMenuid(BigDecimal menuid)
	{
		this.menuid = menuid;
	}

	public String getMenu()
	{
		return menu;
	}

	public void setMenu(String menu)
	{
		this.menu = menu;
	}

	public String getSonMenu()
	{
		return sonMenu;
	}

	public void setSonMenu(String sonMenu)
	{
		this.sonMenu = sonMenu;
	}

	public String getLink()
	{
		return link;
	}

	public void setLink(String link)
	{
		this.link = link;
	}
}
