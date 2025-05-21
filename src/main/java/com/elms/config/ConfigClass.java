package com.elms.config;

import javax.persistence.EntityManager;
import javax.persistence.Persistence;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;

@Configuration
@ComponentScan(basePackages = "com.elms")
public class ConfigClass {

	@Bean
	public EntityManager EM()
	{
		return Persistence.createEntityManagerFactory("project").createEntityManager();
	}
}
