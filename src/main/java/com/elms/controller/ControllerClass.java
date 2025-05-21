package com.elms.controller;

import java.util.Collections;
import java.util.List;
import java.util.Map;

import javax.persistence.Query;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.elms.entity.EmployeeData;
import com.elms.entity.Leave;
import com.elms.service.EmpHrService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@Controller
public class ControllerClass {
	
	@Autowired
	private EmpHrService service;
	
	@PostMapping("/register")
    public String registerUser(@RequestParam("name") String name,
                               @RequestParam("email") String email,
                               @RequestParam("password") String password,
                               @RequestParam("role") String role) {
        
		service.roleValidation(name, email, password, role);
		
        return "index.jsp";  // Redirect to login page after successful registration
    }
	@PostMapping("/login")
	public String login( @RequestParam("email") String email,
                               @RequestParam("password") String password,HttpServletResponse resp,
                               HttpServletRequest req)
	{
		return service.checkData(email, password,resp,req);
	}
	@GetMapping("/allRequest")
	public ModelAndView allRequest(ModelAndView mv)
	{
		List<Leave> list=service.allLeaves();
		
		mv.addObject("list",list);
		
		mv.setViewName("allRequest.jsp");
		return mv;
	}
	
	@PostMapping("/submitLeave")
	public String submitLeave(@ModelAttribute Leave leave,HttpServletRequest req)
	{
		service.submitLeave(leave,req);
		return "thankYou.jsp";
	}
	
	@GetMapping("/homePage")
	public ModelAndView home(ModelAndView mv,HttpServletRequest req)
	{
		String name=service.home(req);
		mv.setViewName("Emp_home.jsp");
		mv.addObject("name", name);
		return mv;
	}
	@GetMapping("/AllLeaves")
	public ModelAndView allLeaves(ModelAndView mv,HttpServletRequest req)
	{
		List<Leave>list=service.allMyLeave(req);
		Collections.sort(list);
		mv.addObject("list",list);
		mv.setViewName("AllLeaves.jsp");
		
		return mv;
	}
	@GetMapping("/viewLeaves")
	public ModelAndView viewLeave(ModelAndView mv, @RequestParam("id") int id, HttpServletRequest req) {
	    Map<String, Object> result = service.viewLeave(id, req);
	    if (result.containsKey("leave")) {
	    	
	        mv.addObject("leave", result.get("leave"));
	        mv.addObject("leaveEmp", result.get("leaveEmp"));
	        mv.setViewName("viewDetail.jsp");
	    } else {
	        mv.setViewName("error.jsp"); // Handle the case when leave details are not found
	    }
	    return mv;
	}

	
	@PostMapping("/approveLeave")
	public String approveLeave(@RequestParam("id") int id, Model model) {
	    service.updateLeaveStatus(id, "Approved");
	    model.addAttribute("message", "Leave has been approved successfully!");
	    return "Response.jsp"; // returns response.jsp
	}

	@PostMapping("/rejectLeave")
	public String rejectLeave(@RequestParam("id") int id, Model model) {
	    service.updateLeaveStatus(id, "Rejected");
	    model.addAttribute("message", "Leave has been Rejected!");
	    return "Response.jsp";
	}

	@GetMapping("/ApproveLeaves")
	public ModelAndView approvedLeaves(ModelAndView mv)
	{
		List<Leave>list=service.approvedRequest();
		mv.addObject("list", list);
		mv.setViewName("ApproveReject.jsp");
		return mv;
	}
	@GetMapping("/rejectedLeaves")
	public ModelAndView rejectedRequest(ModelAndView mv)
	{
		List<Leave>list=service.rejectedRequest();
		mv.addObject("list", list);
		mv.setViewName("ApproveReject.jsp");
		return mv;
	}
	
	@GetMapping("/logout")
	public String logout(HttpServletRequest request) {
	    HttpSession session = request.getSession(); // get session if exists
	  
	        session.invalidate(); // destroy the session
	       return "index.jsp";
	}
}
