package com.DoubleW2w.mapper;

import com.DoubleW2w.pojo.TbPatient;
import com.DoubleW2w.pojo.TbPatientExample;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

public interface TbPatientMapper {
    long countByExample(TbPatientExample example);

    int deleteByExample(TbPatientExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(TbPatient record);

    int insertSelective(TbPatient record);

    List<TbPatient> selectByExample(TbPatientExample example);

    TbPatient selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") TbPatient record, @Param("example") TbPatientExample example);

    int updateByExample(@Param("record") TbPatient record, @Param("example") TbPatientExample example);

    int updateByPrimaryKeySelective(TbPatient record);

    int updateByPrimaryKey(TbPatient record);
}