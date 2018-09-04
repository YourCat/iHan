package com.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.IDao.PersonMapper;
import com.domain.Person;
import com.service.PersonService;


@Service("personService")
public class PersonServiceImpl implements PersonService {
	@Resource
	private PersonMapper PersonDao;
	public Person getPersonById(int PersonId) {
		// TODO Auto-generated method stub
		return this.PersonDao.selectByPrimaryKey(PersonId);
	}
	public int deletePersonById(int PersonId) {
		// TODO Auto-generated method stub
		return this.PersonDao.deleteByPrimaryKey(PersonId);
	}
	public int insert(Person Person) {
		// TODO Auto-generated method stub
		return this.PersonDao.insert(Person);
	}
	public int updatePersonById(Person Person) {
		// TODO Auto-generated method stub
		return this.PersonDao.updateByPrimaryKey(Person);
	}
    public List<Person> findAll() {
        List<Person> allPerson = PersonDao.findAll();
        return allPerson;
    }
}