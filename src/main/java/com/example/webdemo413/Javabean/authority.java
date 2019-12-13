package com.example.webdemo413.Javabean;

import java.util.List;

public class authority
{
	private String title;
	private int id;
	private List<authority> children;

	public authority(String title, int id, List<authority> children)
	{
		this.title = title;
		this.id = id;
		this.children = children;
	}

	public authority()
	{
	}

	public String getTitle()
	{
		return title;
	}

	public void setTitle(String title)
	{
		this.title = title;
	}

	public int getId()
	{
		return id;
	}

	public void setId(int id)
	{
		this.id = id;
	}

	public List<authority> getChildren()
	{
		return children;
	}

	public void setChildren(List<authority> children)
	{
		this.children = children;
	}
}
