package com.IDao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.domain.Echart;

public interface BarMapper {

	List<Echart> queryby(@Param("table")String table,@Param("category")String category,@Param("bdate")String bdate,@Param("edate")String edate);

}