package com.xinpeng.crud.service;

import com.xinpeng.crud.bean.Employee;

import java.util.List;

/**
 * @Author 吕新鹏
 * @Date 2018/3/15 19:03
 */
public interface EmployeeService {

    List<Employee> getAll();

    void saveEmp(Employee employee);

    boolean checkUser(String empName);

    Employee getEmp(Integer id);

    void updateEmp(Employee employee);

    void deleteEmp(Integer id);

    void deleteManyEmp(List<Integer> ids);
}
