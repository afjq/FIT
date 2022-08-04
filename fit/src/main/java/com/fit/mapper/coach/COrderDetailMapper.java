package com.fit.mapper.coach;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.fit.domain.coach.COrderDetail;

@Mapper
public interface COrderDetailMapper {
//	通过订单id查找订单详情集合
	List<COrderDetail> findBycoDetailOrderId(Integer coDetailOrderId);

//	支付成功，插入订单到教练订单详情
	void insert(@Param("cOrderDetail")COrderDetail cOrderDetail);

}
