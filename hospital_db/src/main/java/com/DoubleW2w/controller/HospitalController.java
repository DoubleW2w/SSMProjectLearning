package com.DoubleW2w.controller;

import com.DoubleW2w.mapper.TbPatientMapper;
import com.DoubleW2w.pojo.TbPatient;
import com.DoubleW2w.pojo.TbPatientExample;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.math.BigDecimal;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

/**
 * @author DoubleW2w
 **/
@Controller
public class HospitalController {
    @Autowired
    private TbPatientMapper tbPatientMapper;

    /**
     * 处理 http://localhost:8888/select.do 请求
     * 查询全部的用户
     * @param model
     * @return
     */
    @RequestMapping("/select.do")
    public String getList(Model model){
        TbPatientExample tbPatientExample = new TbPatientExample();
        List<TbPatient> selectAll = tbPatientMapper.selectByExample(tbPatientExample);
        System.out.println(selectAll);
        for (TbPatient tbPatient : selectAll) {
            System.out.println(tbPatient.toString());
        }
        model.addAttribute("selectAll",selectAll);
        return "info";
    }

    @RequestMapping("/adds.do")
    public String adds(Model model) {
        return "addInfo";
    }

    /**
     * 挂号
     * @param request
     * @return
     */
    @RequestMapping("/insert.do")
    public String toAddDev(HttpServletRequest request) {
        TbPatient tbPatient = this.createTbPatient(request);
        int insert = tbPatientMapper.insert(tbPatient);
        System.out.println(tbPatient);
        System.out.println(insert);
        return "redirect:/select.do";
    }

    /**
     * 查询患者信息,姓名，医师类别，科室要正确
     * @param model
     * @param name
     * @param type
     * @param dep
     * @return
     */
    @RequestMapping("/list.do")
    public String getAll(Model model, String name, String type, String dep) {
        TbPatientExample tbPatientExample = new TbPatientExample();
        TbPatientExample.Criteria criteria = tbPatientExample.createCriteria();
        criteria.andNameEqualTo(name);
        criteria.andTypeEqualTo(type);
        criteria.andDepartmentEqualTo(dep);
        List<TbPatient> selectAll = tbPatientMapper.selectByExample(tbPatientExample);
        System.out.println(name+"==="+type+"==="+dep);
        model.addAttribute("selectAll", selectAll);
        return "info";
    }

    /**
     * 更新患者就诊状态
     * @param model
     * @param id
     * @return
     */
    @RequestMapping("/upd.do")
    public String upDev(Model model,int id) {
        TbPatient tbPatient = tbPatientMapper.selectByPrimaryKey(id);
        tbPatient.setState(1);
        tbPatientMapper.updateByPrimaryKey(tbPatient);
        return "redirect:/select.do";
    }

    /**
     * 从挂号信息创建一项挂号信息
     * @param request
     * @return
     */
    private TbPatient createTbPatient(HttpServletRequest request){
        TbPatient tbPatient = new TbPatient();
        tbPatient.setName(request.getParameter("name"));
        tbPatient.setSex(request.getParameter("sex"));
        System.out.println(request.getParameter("sex"));
        tbPatient.setAge(Integer.parseInt(request.getParameter("age")));
        tbPatient.setPhone(request.getParameter("phone"));
        tbPatient.setType(request.getParameter("type"));
        tbPatient.setDepartment(request.getParameter("department"));
        tbPatient.setPrice(BigDecimal.valueOf(Integer.parseInt(request.getParameter("price"))));
        String registerTime = request.getParameter("registerTime");
        Date date =null;
        try{
            date = new SimpleDateFormat("yyyy-MM-dd").parse(registerTime);
        }catch (Exception e){
            e.printStackTrace();
        }
        tbPatient.setRegisterTime(date);
        tbPatient.setState(Integer.parseInt(request.getParameter("state")));
        return tbPatient;
    }
}
