package com.elms.service;

import java.sql.PreparedStatement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
import javax.persistence.Query;
import javax.transaction.Transactional;

import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.elms.dao.EmpDao;
import com.elms.dao.HrDao;
import com.elms.entity.EmployeeData;
import com.elms.entity.HrData;
import com.elms.entity.Leave;

import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@Service
public class EmpHrService {

	@Autowired
	EmpDao empDao;
	@Autowired 
	HrDao hrDao;
	@Autowired
	EntityManager em;
	
	public void roleValidation(String name,String email, String password,String role)
	{
		
		       EmployeeData employee = new EmployeeData(); 
	            if ("employee".equalsIgnoreCase(role)) {
	                // Handle Employee registration
	              
	                employee.setName(name);
	                employee.setEmail(email);
	                employee.setPassword(password);
	                
	               empDao.save(employee);
	            }else if ("hr".equalsIgnoreCase(role)) {
	                // Handle HR registration
	                HrData hr = new HrData();
	                hr.setName(name);
	                hr.setEmail(email); // HR ID
	                hr.setPassword(password);
	                
	                // Save the HR data
	                hrDao.save(hr);
	            }      
	}
	public String checkData(String email, String password, HttpServletResponse resp, HttpServletRequest req) {
	    // Check in EmployeeData
	    Query q1 = em.createQuery("select e from EmployeeData e where e.email=:email and e.password=:password");
	    q1.setParameter("email", email);
	    q1.setParameter("password", password);

	    List<EmployeeData> empList = q1.getResultList();
	    if (!empList.isEmpty()) {
	        EmployeeData l1 = empList.get(0);
	        HttpSession session = req.getSession();
	        session.setAttribute("name", l1.getName());
	        session.setAttribute("email", l1.getEmail());
	        return "Emp_home.jsp";
	    }

	    // Check in HrData
	    Query q2 = em.createQuery("select e from HrData e where e.email=:email and e.password=:password");
	    q2.setParameter("email", email);
	    q2.setParameter("password", password);

	    List<HrData> hrList = q2.getResultList();
	    if (!hrList.isEmpty()) {
	        HrData l2 = hrList.get(0);
	        HttpSession session = req.getSession();
	        session.setAttribute("email", l2.getEmail());
	        return "Admin_home.jsp";
	    }

	    // If not found in either
	    HttpSession session = req.getSession();
	    session.setAttribute("error", "Invalid credentials");
	    return "index.jsp";
	}


	public List<EmployeeData> allRequest()
	{
		Query q = em.createQuery("SELECT e FROM EmployeeData e");
		return q.getResultList();
	}
	
	public void submitLeave(Leave leave,HttpServletRequest req)
	{
		HttpSession session = req.getSession();
		String email=(String) session.getAttribute("email");
		Query q=em.createQuery("select e from EmployeeData e where email=:email ");
		q.setParameter("email", email);
		
		List<EmployeeData> list=q.getResultList();
		if(!list.isEmpty())
		{
			EmployeeData emp=list.get(0);
		;
			empDao.leaveSave(leave,emp);
		}
		
	}

	public String home(HttpServletRequest req)
	{
		 HttpSession session = req.getSession();
		String name= (String) session.getAttribute("name");
		return name; 
	}
	
	public List<Leave> allLeaves()
	{
		Query q=em.createQuery("select e from Leave e");
		List<Leave>list=q.getResultList();
		
		return list;
	}
	public List<Leave> allMyLeave(HttpServletRequest req) {
	    HttpSession session = req.getSession();
	    String email = (String) session.getAttribute("email");

	    // Get employee data based on the email
	    Query q = em.createQuery("select e from EmployeeData e where e.email = :email");
	    q.setParameter("email", email);
	    List<EmployeeData> list = q.getResultList();
	    
	    EmployeeData data = list.get(0);
	    int id = data.getId();

	    // Get all leave records for the employee based on the employee ID
	    Query q1 = em.createQuery("select l from Leave l where l.employee.id = :id");
	    q1.setParameter("id", id);
	    
	    return q1.getResultList();
	}

	public List<EmployeeData> allEmployee()
	{
		Query q=em.createQuery("select e from EmployeeData");
		List<EmployeeData> list=q.getResultList();
		return list;
	}
	public Map<String, Object> viewLeave(int id, HttpServletRequest req) {
	    Map<String, Object> result = new HashMap();
	    Query q = em.createQuery("select e from Leave e where e.id=:id");
	    q.setParameter("id", id);
	    List<Leave> leaveList = q.getResultList();
	    if (!leaveList.isEmpty()) {
	        Leave leave = leaveList.get(0);
	        result.put("leave", leave);
	        result.put("leaveEmp", leave.getEmployee().getName());
	        Query q2 = em.createQuery("select e from EmployeeData e where e.id=:id");
	        q2.setParameter("id", leave.getEmployee().getId());
	        List<EmployeeData> empList = q2.getResultList();
	        if (!empList.isEmpty()) {
	            EmployeeData emp = empList.get(0);
	            result.put("leaveEmp", emp.getName());
	        }
	    }
	    return result;
	}

	

	public void updateLeaveStatus(int id, String status) {
	    EntityTransaction tx = em.getTransaction();
	    tx.begin();
	    Leave l = em.find(Leave.class, id);
	    if (l != null) {
	        l.setStatus(status);
	        em.merge(l); // ensure it's updated
	    }
	    tx.commit();
	}
	
	public List<Leave> approvedRequest()
	{
		Query q=em.createQuery("select e from Leave e where status='Approved'");
		List<Leave>list=q.getResultList();
		return list;
	}
	public List<Leave> rejectedRequest()
	{
		Query q=em.createQuery("select e from Leave e where status='Rejected'");
		List<Leave>list=q.getResultList();
		return list;
	}

}
