package com.example.webdemo413.service;

import com.example.webdemo413.Javabean.*;
import com.example.webdemo413.mapper.userMapper;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class userService
{
	//注入set生成成员变量
	@Resource
	private com.example.webdemo413.mapper.userMapper userMapper;

//	@log(operationType="登录",operationName = "用户登录")
//	public List<userDate> Login(String USERNAME){
//		List<userDate> userDateList=userMapper.userLogin(USERNAME);
//		return userDateList;
//	}
//
	public List<userDate> tableQuery1(int beginNumber, int endNumber, String username){
		List<userDate> userDateList=userMapper.tableQuery(beginNumber,endNumber,username);
		return userDateList;
	}

	public List<UploadFile> fileQuery(int beginNumber, int endNumber, String name){
		List<UploadFile> userDateList=userMapper.fileQuery(beginNumber,endNumber,name);
		return userDateList;
	}

	public int count1(){
		int count=userMapper.count();
		return count;
	}

	public int filecount(){
		int count=userMapper.filecount();
		return count;
	}


	public int adduser1(userDate userDate){
		int count=userMapper.adduser(userDate);
		return count;
	}

	public int change1(userDate userDate){
		int count=userMapper.change(userDate);
		return count;
	}

	public int deleteUser1(userDate userDate){
		int count=userMapper.deleteUser(userDate);
		return count;
	}

	@Transactional
	public Map<String,List<Menu>> menu1(Admin admin){

		List<Menu> menuList = userMapper.menu(admin);

		Map<String,List<Menu>> map = new HashMap<>();

		for (Menu menu : menuList)
		{
			if (map.containsKey(menu.getMenu()))
			{
				List<Menu> valueList =map.get(menu.getMenu());
				valueList.add(menu);
			} else
			{
				List<Menu> valueList = new ArrayList<>();
				valueList.add(menu);
				map.put(menu.getMenu(), valueList);
			}
		}
		return map;
	}

	public List<authority> authority1(Admin admin){
		List<authority> authorityList=userMapper.authority(admin);
		return authorityList;
	}


	public int insertmenu1(String ADMIN,int firstid){
		int count=userMapper.insertmenu1(ADMIN,firstid);
		return count;
	}

	public int insertmenu2(int firstid,int secondid,String ADMIN){
		int count=userMapper.insertmenu2(firstid,secondid,ADMIN);
		return count;
	}

	public int insertmenu3(int permissionsid,int roleid){
		int count=userMapper.insertmenu3(permissionsid,roleid);
		return count;
	}
	public int clearmenu1(int roleid){
		int count=userMapper.clearmenu(roleid);
		return count;
	}

	public List<Role> roletable(){
		List<Role> roleList=userMapper.roletable();
		return roleList;
	}

	public int registered(Admin admin){
		int count=userMapper.registered(admin);
		return count;
	}

	public int addrelation(Admin admin){
		int count=userMapper.addrelation(admin);
		return count;
	}

	public int UploadFile(UploadFile uploadFile){
		int count=userMapper.UploadFile(uploadFile);
		return count;
	}




}
