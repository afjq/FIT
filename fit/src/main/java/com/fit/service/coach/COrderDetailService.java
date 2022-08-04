package com.fit.service.coach;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.fit.domain.coach.COrderDetail;
import com.fit.mapper.coach.COrderDetailMapper;

@Service
public class COrderDetailService {
	@Autowired
	private COrderDetailMapper coOrderDetailMapper;
	
//	通过订单id查找订单详情集合
	@Transactional(propagation=Propagation.REQUIRED, readOnly=true)
	public List<COrderDetail> findBycoDetailOrderId(Integer coDetailOrderId){
		try {
			return this.coOrderDetailMapper.findBycoDetailOrderId(coDetailOrderId);
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException(e);
		}
	}
	
//	支付成功，插入订单到教练订单详情
	@Transactional(propagation=Propagation.REQUIRED,rollbackFor= {Exception.class})
	public void insert(@Param("cOrderDetail")COrderDetail cOrderDetail) {
		try {
			this.coOrderDetailMapper.insert(cOrderDetail);
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException(e);
		}
	}


}
