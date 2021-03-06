package com.xinpeng.crud.impl;

import com.xinpeng.crud.bean.Department;
import com.xinpeng.crud.dao.DepartmentMapper;
import com.xinpeng.crud.service.DepartmentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @Author 吕新鹏
 * @Date 2018/3/6 21:32
 */
@Service
public class DepartmentServiceImpl implements DepartmentService{
    @Autowired
    DepartmentMapper departmentMapper;

    public List<Department> getAllDepts(){
        List<Department> list = departmentMapper.selectByExample(null);
        return  list;
    }
}
