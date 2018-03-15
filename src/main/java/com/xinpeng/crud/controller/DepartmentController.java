package com.xinpeng.crud.controller;

import com.xinpeng.crud.bean.Department;
import com.xinpeng.crud.bean.Msg;
import com.xinpeng.crud.service.DepartmentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * @Author 吕新鹏
 * @Date 2018/3/6 21:29
 */
@Controller
public class DepartmentController {

    @Autowired
    DepartmentService departmentService;

    @RequestMapping("/depts")
    @ResponseBody
    public Msg getDepts(){
        List<Department> list = departmentService.getAllDepts();
        return Msg.success().add("depts",list);
    }
}
