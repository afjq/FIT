package com.fit.service.admin;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.fit.domain.admin.TOrderDetail;
import com.fit.mapper.admin.TOrderDetailMapper;

@Service	
public class TOrderDetailService {
	
	@Autowired
	private TOrderDetailMapper tOrderDetailMapper;
	
//	通过订单id查找订单详情集合
	@Transactional(propagation=Propagation.REQUIRED, readOnly=true)
	public List<TOrderDetail> findByTOrderId(Integer tOrderId){
		try {
			return this.tOrderDetailMapper.findByTOrderId(tOrderId);
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException(e);
		}
	}
	
//	插入总订单详情
	@Transactional(propagation=Propagation.REQUIRED,rollbackFor= {Exception.class})
	public void insert(@Param("tOrderDetail")TOrderDetail tOrderDetail) {
		try {
			this.tOrderDetailMapper.insert(tOrderDetail);
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException(e);
		}
	}

}
