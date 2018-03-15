package com.xinpeng.crud.test;

import com.xinpeng.crud.bean.Department;
import com.xinpeng.crud.bean.Employee;
import com.xinpeng.crud.dao.DepartmentMapper;
import com.xinpeng.crud.dao.EmployeeMapper;
import org.apache.ibatis.reflection.SystemMetaObject;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

/**
 * 测试DAO层的工作
 * @Author 吕新鹏
 * @Date 2018/2/22 9:42
 * 1.导入SpringTest模块
 * 2.@ContextConfiguration指定Spring配置文件的位置
 * 3.直接autowired要是用的组建
 */

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath*:applicationContext.xml"})
public class MapperTest {

    @Autowired
    DepartmentMapper departmentMapper;
    @Autowired
    EmployeeMapper employeeMapper;
    /*
    * 测试Department
    */
    @Test
     public void TestCRUD(){
        System.out.println(departmentMapper);

        //1.插入几个部门
        //departmentMapper.insertSelective(new Department(null,"开发部"));
        //departmentMapper.insertSelective(new Department(null,"测试部"));
        //2.生成员工数据
        employeeMapper.insertSelective(new Employee(null,"jerry","M","jerry@126.com",1));
     }
}
