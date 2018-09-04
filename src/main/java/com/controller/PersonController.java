package com.controller;

import java.awt.print.Printable;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.swing.plaf.basic.BasicInternalFrameTitlePane.SystemMenuBar;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import com.domain.Person;
import com.service.PersonService;
import com.service.BarService;

import net.sf.json.JSONArray;



@Controller
@RequestMapping("/Person")
public class PersonController {
	@Resource
	private BarService BarService;
	@Resource
	private PersonService PersonService;
	
	@RequestMapping("/showPerson")
	public String toIndex(HttpServletRequest request,Model model){
		int PersonId = Integer.parseInt(request.getParameter("id"));
		Person Person = this.PersonService.getPersonById(PersonId);
		model.addAttribute("Person", Person);
		return "showPerson";
	}
    /**
     *跳转到添加用户界面
     */
    @RequestMapping("toAddPerson")
    public String toAddPerson(){
        return "addPerson";
    }
    /**
     * 添加用户并重定向  
     * @param model
     * @param Person
     * @return
     */
    @RequestMapping("addPerson") 
    public String addPerson(Model model,Person Person){
        if(Person != null){
            PersonService.insert(Person);
        }
        return "redirect:/Person/PersonInfo";
    }
    /**
     * 修改用户
     * @param model
     * @param request
     * @param Person
     * @return
     */
    @RequestMapping("updatePerson")  
    public String UpdatePerson(Model model,Person Person){
    	System.out.print(PersonService.updatePersonById(Person));
    	if(PersonService.updatePersonById(Person)>0){  
    		Person = PersonService.getPersonById(Person.getId());  
    		model.addAttribute("Person", Person);  
    		return "redirect:/Person/PersonInfo";  
    	} 
        return "error";  
    }
    /**
     * 查询所有用户
     * @param request
     * @param model
     * @return
     */
    @RequestMapping("getAllPerson")  
    public String getAllPerson(Model model){
        List<Person> Person = PersonService.findAll();
        model.addAttribute("PersonList",Person);
        return "allPerson";
    }

    /**
     * 查询单个用户
     * @param id
     * @param request
     * @param model
     * @return
     */
    @RequestMapping("/getPerson")  
    public String getPerson(int id,Model model){
        model.addAttribute("Person", PersonService.getPersonById(id));  
        return "editPerson";
    }
    /**
     * 根据id删除用户
     * @param id
     * @param request
     * @param response
     */
    @RequestMapping("/delPerson") 
    public String deletePerson(int id,Model model){
        model.addAttribute("Person", PersonService.deletePersonById(id));  
        return "redirect:/Person/PersonInfo";
    }
    
    /**
     * 分页查询用户信息
     * @param pn 默认从第一页开始  请求参数
     * @param model
     * @return
     */
	@RequestMapping("PersonInfo")
    public String getPersons(@RequestParam(value="pn",defaultValue="1")Integer pn,Model model){
        //从第一条开始 每页查询五条数据
        PageHelper.startPage(pn, 5);
        List<Person> Persons = PersonService.findAll();
        //将用户信息放入PageInfo对象里
		PageInfo page = new PageInfo(Persons,5);
        model.addAttribute("pageInfo", page);
        return "allPerson";
    }
	@RequestMapping("Main")
	public String Main(Model model) {
		return "main";
	}
	@RequestMapping("Tmp")
	public String Tmp(Model model) {
		return "tmp";
	}
	@RequestMapping("Find")
	public String Find(Model model){
		return "find";
	}
    @RequestMapping("Try") 
    public String Try(String id,String category,Model model){
    	model.addAttribute("id",id);
    	model.addAttribute("category",category);
    	return "try";
    }
	@RequestMapping("Echart")
	public String Echart(Model model){
		return "echart";
	}
	@RequestMapping("BarDao")
	public @ResponseBody JSONArray BarDao(String bdate,String edate,String id,String category,Model model){
		String table = id+'_'+category;;
	    String barArr = BarService.queryby(table,category,bdate,edate);
	    System.out.print(barArr);
	    JSONArray json = JSONArray.fromObject(barArr);
		return json;
	}
}