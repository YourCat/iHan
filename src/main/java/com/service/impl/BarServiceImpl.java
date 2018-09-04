package com.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.IDao.BarMapper;
import com.IDao.PersonMapper;
import com.domain.Echart;
import com.domain.Person;
import com.google.gson.Gson;
import com.service.BarService;

@Service("barService")
public class BarServiceImpl implements BarService {
	@Resource
	private BarMapper BarDao;
	
	public String queryby(String table,String category,String bdate,String edate) {
		// TODO Auto-generated method stub
		System.out.print(table);
		List<Echart> allEchart = BarDao.queryby(table,category,bdate,edate);
        Gson gson = new Gson();
        String str = gson.toJson(allEchart);
		return str;
	}
}
