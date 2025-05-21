package com.elms.dao;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.elms.entity.EmployeeData;
import com.elms.entity.Leave;

import jakarta.servlet.http.HttpServletRequest;

@Component
public class EmpDao {

	@Autowired
	EntityManager em;
	
	public void save(EmployeeData emp)
	{
		EntityTransaction et=em.getTransaction();
		et.begin();
		em.persist(emp);
		et.commit();
	}
	
	public void leaveSave(Leave leave,EmployeeData emp)
	{
		EntityTransaction et=em.getTransaction();
		leave.setEmployee(emp);
		
		et.begin();
		em.persist(leave);
		et.commit();
	}
}
