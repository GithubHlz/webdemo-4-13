package com.example.webdemo413.mapper;

import com.example.webdemo413.Javabean.*;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface userMapper
{
//	public List<userDate> userLogin(@Param("USERNAME") String USERNAME);
	public List<userDate> tableQuery(@Param("beginNumber") int beginNumber, @Param("endNumber") int endNumber, @Param("username") String username);
	public int count();
	public int adduser(userDate userDate);
	public int change(userDate userDate);
	public int deleteUser(userDate userDate);
	public List<authority> authority(Admin admin);
	public List<Menu> menu(Admin admin);

	public int insertmenu1(@Param("ADMIN") String ADMIN, @Param("firstid") int firstid);
	public int insertmenu2(@Param("firstid") int firstid, @Param("secondid") int secondid, @Param("ADMIN") String ADMIN);
	public int insertmenu3(@Param("PERMISSIONSID") int permissionsid, @Param("roleid") int roleid);
	public int clearmenu(@Param("roleid") int roleid);

	public List<Role> roletable();

	public int registered(Admin admin);
	public int addrelation(Admin admin);

	public int UploadFile(UploadFile uploadFile);

	public List<UploadFile> fileQuery(@Param("beginNumber") int beginNumber, @Param("endNumber") int endNumber, @Param("name") String name);
	public int filecount();
}
