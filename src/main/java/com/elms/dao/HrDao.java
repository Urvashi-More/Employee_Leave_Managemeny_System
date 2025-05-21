package com.elms.dao;

import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.elms.entity.HrData;

@Component
public class HrDao {
	
	@Autowired
	EntityManager em;
	
	

	public void save(HrData hr)
	{
		EntityTransaction et=em.getTransaction();
		et.begin();
		em.persist(hr);
		et.commit();
	}
}
