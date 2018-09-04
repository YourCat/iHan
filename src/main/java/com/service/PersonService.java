package com.service;

import java.util.List;

import com.domain.Person;

public interface PersonService {
	public Person getPersonById(int PersonId);

	int deletePersonById(int PersonId);

	int insert(Person Person);

	int updatePersonById(Person Person);
	
	List<Person> findAll();
}