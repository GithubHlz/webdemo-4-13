package com.example.webdemo413.control;

import com.example.webdemo413.Javabean.*;
import com.example.webdemo413.service.userService;
import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import org.apache.commons.io.FileUtils;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class UserController
{
	@Resource
	private userService userService;

//	测试
//	@RequestMapping("/test")
//	public void test1(HttpServletResponse response, HttpServletRequest request)
//	{
//		List<Admin> adminList=userService.test();
//		System.out.println(adminList.size());
//	}

//	登录界面1
	@RequestMapping("/login")
	public String test3()
	{
		return "login";
	}
//	登录界面2
//	@RequestMapping("/login.action")
//	public void test2()
//	{
//
//	}



	@RequestMapping("/login.action")
	public ModelAndView test1(HttpServletResponse response, HttpServletRequest request, int USERNAME, String uPass)
	{
		System.out.println();
		Admin admin=new Admin();
		admin.setAdmin(BigDecimal.valueOf(USERNAME));
		Map<String,List<Menu>> menuMap=userService.menu1(admin);

		ModelAndView modelAndView=new ModelAndView();
		modelAndView.addObject("menu",menuMap);
		modelAndView.setViewName("background");
		return modelAndView;
	}

	@RequestMapping("/userQuery.action")
	public ModelAndView userQuery1(HttpServletResponse response, HttpServletRequest request){
		ModelAndView modelAndView=new ModelAndView();
		modelAndView.setViewName("user_query");
		return modelAndView;
	}

	@RequestMapping("/tableQuery.action")
	@ResponseBody
	public table tablequery(HttpServletResponse response, HttpServletRequest request, int page, int limit, String username){

		int beginNumber=(page-1)*limit;
		List<userDate> userDateList=userService.tableQuery1(beginNumber,limit,username);
		int count=userService.count1();
		table table=new table();
		table.setCode(0);
		table.setMsg("");
		table.setCount(""+count);
		table.setData(userDateList);
		return table;
	}

	@RequestMapping("/filequery.action")
	@ResponseBody
	public table filequery(int page, int limit,String username){
		System.out.println(username);
		int beginNumber=(page-1)*limit;
		List<UploadFile> uploadFileList=userService.fileQuery(beginNumber,limit,username);
		int count=userService.filecount();
		table table=new table();
		table.setCode(0);
		table.setCount(""+count);
		table.setData(uploadFileList);
		return table;
	}



	@RequestMapping("/addUser.action")
	@ResponseBody
	public ResultEntity addUser(String USERNAME, String REGISTEREDTIME, String INTEGRAL, String UPLOADDOCUMENT, String DOWNLOADDOCUMENT, String USERSTATE){
		userDate userDate=new userDate();
		userDate.setUSERNAME(USERNAME);
		userDate.setREGISTEREDTIME(REGISTEREDTIME);
		userDate.setINTEGRAL(INTEGRAL);
		userDate.setUPLOADDOCUMENT(UPLOADDOCUMENT);
		userDate.setDOWNLOADDOCUMENT(DOWNLOADDOCUMENT);
		userDate.setUSERSTATE(USERSTATE);

		ResultEntity res = new ResultEntity();
		if (userService.adduser1(userDate)>0){
			res.setStatus(1);
			res.setMsg("新增成功");
		}else {
			res.setStatus(0);
			res.setMsg("新增失败");
		}
		return res;
	}

	@RequestMapping("/upload.action")
	@ResponseBody
	public Map<String,Object> uploadfile(MultipartFile file){
		Map map = new HashMap<String,Object>();
		String fileName=file.getOriginalFilename();
		String temp[]=fileName.split("\\.");
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");

		UploadFile uploadFile=new UploadFile();
		uploadFile.setName(temp[0]);
		uploadFile.setAdminName("张三");
		uploadFile.setUpload_date(df.format(new Date()));
		uploadFile.setDown_integral("10");
		uploadFile.setFileType(temp[temp.length-1]);

		try
		{
			file.transferTo(new File("F:/Desktop/四阶段/上传文件夹/"+file.getOriginalFilename()));
			int count=userService.UploadFile(uploadFile);
			if (count>0){
				map.put("msg","ok");
				map.put("code",200);
			}
		} catch (IOException e)
		{
			map.put("msg","error");
			map.put("code",0);
			e.printStackTrace();
		}
		return map;
	}

	@RequestMapping("/authority.action")
	public ModelAndView authority(HttpServletResponse response, HttpServletRequest request){
		ModelAndView modelAndView=new ModelAndView();
		modelAndView.setViewName("authority");
		return modelAndView;
	}


	@RequestMapping("/authority1.action")
	@ResponseBody
	public List<authority> authority1(HttpServletResponse response, HttpServletRequest request){

		Admin admin=new Admin();
		admin.setAdmin(BigDecimal.valueOf(1));

		List<authority> authorityList=userService.authority1(admin);
		return authorityList;
	}

	@RequestMapping("/authority2.action")
	@ResponseBody
	public List<authority> authority2(String msg,int xm){
		System.out.println(msg);
		System.out.println(xm);
		Gson gson=new Gson();
		List<authority> authorityList=gson.fromJson(msg,  new TypeToken<List<authority>>() {}.getType());

//		for (int i = 0; i <authorityList.size() ; i++)
//		{
//			userService.insertmenu1("4",authorityList.get(i).getId());
//			for (int j = 0; j < authorityList.get(i).getChildren().size(); j++)
//			{
//				userService.insertmenu2(authorityList.get(i).getId(),authorityList.get(i).getChildren().get(j).getId(),"4");
//			}
//		}

		int num=userService.clearmenu1(xm);
		for (int i = 0; i <authorityList.size() ; i++)
		{
			userService.insertmenu3(authorityList.get(i).getId(),xm);
			for (int j = 0; j < authorityList.get(i).getChildren().size(); j++)
			{
				userService.insertmenu3(authorityList.get(i).getChildren().get(j).getId(),xm);
			}
		}
		return null;
	}


	@RequestMapping("/Change.action")
	@ResponseBody
	public ResultEntity changeUser(String USERNAME, String REGISTEREDTIME, String INTEGRAL, String UPLOADDOCUMENT, String DOWNLOADDOCUMENT, String USERSTATE){
		userDate userDate=new userDate();
		userDate.setUSERNAME(USERNAME);
		userDate.setREGISTEREDTIME(REGISTEREDTIME);
		userDate.setINTEGRAL(INTEGRAL);
		userDate.setUPLOADDOCUMENT(UPLOADDOCUMENT);
		userDate.setDOWNLOADDOCUMENT(DOWNLOADDOCUMENT);
		userDate.setUSERSTATE(USERSTATE);

		ResultEntity res = new ResultEntity();
		if (userService.change1(userDate)>0){
			res.setStatus(1);
			res.setMsg("修改成功");
		}else {
			res.setStatus(0);
			res.setMsg("修改失败");
		}
		return res;
	}

	@RequestMapping("/delete.action")
	@ResponseBody
	public ResultEntity deleteUser(String USERNAME, String REGISTEREDTIME, String INTEGRAL, String UPLOADDOCUMENT, String DOWNLOADDOCUMENT, String USERSTATE){
		userDate userDate=new userDate();
		userDate.setUSERNAME(USERNAME);

		ResultEntity res = new ResultEntity();
		if (userService.deleteUser1(userDate)>0){
			res.setStatus(1);
			res.setMsg("删除成功");
		}else {
			res.setStatus(0);
			res.setMsg("删除失败");
		}
		return res;
	}

	@RequestMapping("/role.action")
	@ResponseBody
	public List<Role> roleAction(){
		List<Role> roleList=userService.roletable();
		return roleList;
	}

	@RequestMapping("/registered.action")
	@ResponseBody
	public ResultEntity registered(String uesrname, String password, String repassword, int admin, String profession, String position){

		Admin admin1=new Admin();
		admin1.setAdminName(uesrname);
		admin1.setPassword(password);
		admin1.setAdmin(BigDecimal.valueOf(admin));
		admin1.setProfession(profession);
		admin1.setPosition(position);

		ResultEntity res = new ResultEntity();

		if (userService.registered(admin1)>0){
			if (userService.addrelation(admin1)>0){
				res.setStatus(1);
				res.setMsg("注册成功");
			}
		}else {
			res.setStatus(0);
			res.setMsg("注册失败");
		}
		return res;
	}

	@RequestMapping("/Download1.action")
	public ModelAndView Download1(HttpServletResponse response, HttpServletRequest request){
		ModelAndView modelAndView=new ModelAndView();
		modelAndView.setViewName("download");
		return modelAndView;
	}


	@RequestMapping("/Download.action")
	public ResponseEntity<byte[]> export(String fileName, String type) throws IOException
	{
		System.out.println("文件下载："+fileName+"."+type);
		File file = new File("F:\\文件上传文件夹\\" + fileName+"."+type);//上传保存的文件路径
		HttpHeaders headers = new HttpHeaders();

		// MediaType:互联网媒介类型 contentType：具体请求中的媒体类型信息
		headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
		headers.setContentDispositionFormData("attachment", fileName);
		return new ResponseEntity<byte[]>(FileUtils.readFileToByteArray(file), headers, HttpStatus.CREATED);

	}



}
