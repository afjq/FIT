package com.fit;

import java.math.BigDecimal;
import java.sql.Timestamp;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import com.fit.controller.PaySuccessController;
import com.fit.domain.Grade;
import com.fit.domain.OrderState;
import com.fit.domain.Train;
import com.fit.domain.admin.Admin;
import com.fit.domain.admin.TOrderDetail;
import com.fit.domain.admin.TotalOrder;
import com.fit.domain.coach.Coach;
import com.fit.domain.coach.CoachOrder;
import com.fit.domain.user.Act;
import com.fit.domain.user.Car;
import com.fit.domain.user.CarItem;
import com.fit.domain.user.Muscle;
import com.fit.domain.user.ShopOrder;
import com.fit.domain.user.UODetail;
import com.fit.domain.user.User;
import com.fit.domain.user.UserOrder;
import com.fit.mapper.GradeMapper;
import com.fit.mapper.OrderStateMapper;
import com.fit.mapper.TrainMapper;
import com.fit.mapper.admin.AdminMapper;
import com.fit.mapper.admin.TOrderDetailMapper;
import com.fit.mapper.admin.TotalOrderMapper;
import com.fit.mapper.coach.CoachMapper;
import com.fit.mapper.user.ActMapper;
import com.fit.mapper.user.CarItemMapper;
import com.fit.mapper.user.CarMapper;
import com.fit.mapper.user.MuscleMapper;
import com.fit.mapper.user.UODetailMapper;
import com.fit.mapper.user.UserMapper;
import com.fit.mapper.user.UserOrderMapper;
import com.fit.service.admin.TotalOrderService;
import com.fit.service.coach.CoachOrderService;
import com.fit.service.user.CarService;
import com.fit.service.user.ShopOrderService;

@RunWith(SpringRunner.class)
@SpringBootTest
public class FitApplicationTests {

	@Test
	public void contextLoads() {
	}
	
	
	@Autowired
	private CoachOrderService coachOrderService;
	@Test
	public void insertCoachOrder() {
		CoachOrder coachOrder = new CoachOrder();
		coachOrder.setCoachOrderCoach(this.coachMapper.findByCoachId(1));
		coachOrder.setCoachOrderCreatetime(new Date());
		coachOrder.setCoachOrderId("111173628fba4ac2b7d154bb8faeb318");
//		coachOrder.setCoachOrderUser(this.userMapper.findByUId(1));
		System.out.println("准备好了coachOrder："+coachOrder);
		this.coachOrderService.insert(coachOrder);
	}
	
	@Autowired
	private PaySuccessController paySuccessController;
	
	@Test
	public void orderSolve() {
		String orderId = "d37b05f859754dbb8de5cfe069ed6ab1";
		this.paySuccessController.orderSolve(null, orderId);
	}
	
	@Autowired
	private ShopOrderService shopOrderService;
	
	@Test
	public void insertshopOrder() {
		ShopOrder shopOrder = new ShopOrder();
		shopOrder.setShoporderId("testShopOrderId");
		BigDecimal price = new BigDecimal("2225");
		shopOrder.setShoporderPrice(price);
//		User u = this.userMapper.findByUId(1);
//		shopOrder.setShoporderUser(u);
		System.out.println("准备好的shopOrder："+shopOrder);
		this.shopOrderService.insert(shopOrder);
	}
	
	@Test
	public void uuuid() {
		String random = UUID.randomUUID().toString().replace("-", "");
		System.out.println(random);
		String random1 = random.substring(0,6);
		System.out.println(random1);
	}
	
	
	@Autowired
	private UODetailMapper uODetailMapper;
	
	@Test
	public void insertUOrderDetail() {
		UODetail uODetail = new UODetail();
		uODetail.setUoDetailTrainName("测试用户订单详情1");
		uODetail.setUoDetailTrainPrice(new BigDecimal(1111));
		UserOrder uo = this.userOrderMapper.findByUserOrderId("30ee1dc812334ac8b3e6d335f7616301");
		System.out.println("找到的用户订单："+uo);
		uODetail.setUo(uo);
		System.out.println("准备好的uODetail"+uODetail);
		this.uODetailMapper.insert(uODetail);
	}
	
	@Autowired
	private OrderStateMapper orderStateMapper;
	
	@Autowired
	private UserOrderMapper userOrderMapper;
	
	@Test
	public void insertUOrder() {
		UserOrder uOrder = new UserOrder();
		Timestamp d = new Timestamp(System.currentTimeMillis()); 
		System.out.println("timestamp获得的系统当前时间"+d);
		
		uOrder.setUserorderCreatetime(d);
		uOrder.setUserorderPhone("123456789");
		
		BigDecimal price = new BigDecimal(5455);
		System.out.println("BigDecimal构造的高精度价格："+price);
		uOrder.setUserorderPrice(price);
		
		OrderState s = this.orderStateMapper.selectByPrimaryKey(1);
		uOrder.setUserorderState(s);
		
//		User u = this.userMapper.findByUId(1);
//		System.out.println(u);
//		uOrder.setUserorderUser(u);
		
		String random = UUID.randomUUID().toString().replace("-", "");
		System.out.println("随机产生的订单编号："+random);
		
		uOrder.setUserorderId(random);
		System.out.println("准备好的uorder:"+uOrder);
		this.userOrderMapper.insert(uOrder);
	}
	
	@Test
	public void findByUserOrderId() {
		UserOrder uo = this.userOrderMapper.findByUserOrderId("30ee1dc812334ac8b3e6d335f7616301");
		System.out.println(uo);
	}
	@Test
	public void findByUserId1() {
		List<UserOrder> uo = this.userOrderMapper.findByUserId(1);
		System.out.println("用户所有订单：");
		for (UserOrder userOrder : uo) {
			System.out.println(userOrder);
		}
	}
	
	
	@Autowired
	private CarService carService;
	
	@Test
	public void findByUserId() {
		Car car = this.carService.findByUserId(1);
		System.out.println(car);
	}
	
	
	@Autowired
	private UserMapper userMapper;
	
//	根据用户Id查找用户
	@Test
	public void findByUId() {
//		User u = this.userMapper.findByUId(1);
//		System.out.println(u);
	}
	
	@Autowired
	private CarMapper carMapper;
	@Test
	public void insertCar() {
		Car car = new Car();
//		找到用户
		User carUser = this.userMapper.selectByUserPhone("18346577246");
		car.setCarUser(carUser);
		this.carMapper.insert(car);
	}
	
	
	@Autowired
	private CarItemMapper carItemMapper;
	@Test
	public void insertCarItem() {
		CarItem carItem = new CarItem();
		carItem.setCaritemTrainName("测试2商品名");
//		carItem.setCaritemTrainPrice((double) 5674);
		this.carItemMapper.insert(carItem);
	}
	
	@Test
	public void findBytrainNamecarId() {
		CarItem carItem = this.carItemMapper.findBytrainNamecarId("腹肌撕裂", 1);
		System.out.println(carItem);
	}
	
	@Test
	public void findByCarId() {
		List<CarItem> carItemList = this.carItemMapper.findByCarId(3);
		System.out.println("Id为3的购物车的所有Item");
		for (CarItem carItem : carItemList) {
			System.out.println(carItem);
			System.out.println("----------------------");
		}
	}
	
	@Autowired
	private CoachMapper coachMapper;
	@Test
	public void selectAll() {
		List<Coach> coachList = this.coachMapper.selectAll();
		System.out.println("所有教练：");
		for (Coach coach : coachList) {
			System.out.println(coach);
		}
	}
	
	@Autowired
	private GradeMapper gradeMapper;
	@Test
	public void findAllGrade() {
		List<Grade> gradeList = this.gradeMapper.findAll();
		System.out.println("所有等级：");
		for (Grade grade : gradeList) {
			System.out.println(grade);
		}
	}
	
	@Autowired
	private TotalOrderService totalOrderService;
	
	@Test
	public void findAllTOrder() {
		List<TotalOrder> totalOrderList = this.totalOrderService.findAll();
		System.out.println("订单：");
		for (TotalOrder totalOrder : totalOrderList) {
			System.out.println(totalOrder);
		}
	}


	@Autowired
	private TOrderDetailMapper tOrderDetailMapper;
	
	@Test
	public void findByTOrderId() {
		List<TOrderDetail> tOrderDetailList =  this.tOrderDetailMapper.findByTOrderId(1);
		System.out.println("所有订单详情：");
		for (TOrderDetail tOrderDetail : tOrderDetailList) {
			System.out.println("详情课程名："+tOrderDetail.gettOrderDetailName());
			System.out.println("详情课程价格："+tOrderDetail.gettOrderDetailPrice());
			System.out.println("---------------------------------------------");
		}
	}
	
	
//	@Autowired 
//	private UserMapper userMapper;
//
//	@Test 
//	public void selectByUserPhone(){ 
//		System.out.println("test select user");
//		User user = this.userMapper.selectByUserPhone("18346577246"); 
//		System.out.println(user); 
//	}
//	
//	@Test
//	public void insert() {
//		System.out.println("test insert user");
//		User user = new User();
//		this.userMapper.insert(user);
//	}
//
//	
	@Autowired
	private AdminMapper adminMapper;
	
	@Test
	public void findByPhoneTest() {
//		Admin a = this.adminMapper.findByPhone("12345678");
//		System.out.println(a);
	}
	
	@Autowired
	private ActMapper actMapper;
	
	@Test
	public void findAllAct() {
		List<Act> actList = this.actMapper.findAll();
		for (Act act : actList) {
			System.out.println("每个动作act"+act);
			System.out.println("__________________________");
			System.out.println("动作 "+act.getActName()+" 能锻炼的肌肉是：");
			for (Muscle muscle : act.getMuscleList()) {
				System.out.println(muscle.getMuscleName());
			}
			System.out.println("---------------------------------------");
		}
	}
	
	@Test
	public void findActById(){
		Act act = this.actMapper.findById(2);
		System.out.println("找到的动作："+act);
		System.out.println("动作: "+act.getActName()+"能锻炼到肌肉：");
		List<Muscle> muscleList = act.getMuscleList();
		for (Muscle muscle : muscleList) {
			System.out.println(muscle.getMuscleName());
		}
		System.out.println("-------------------------------------");
	}
	
	@Autowired
	private MuscleMapper muscleMapper;
	
	@Test
	public void findAllMuscle() {
		List<Muscle> muscleList = this.muscleMapper.findAll();
		System.out.println("查询肌肉表所有肌肉：");
		for (Muscle muscle : muscleList) {
//			System.out.println("肌肉 "+muscle.getMuscleName()+" 可以通过以下动作锻炼：");
//			for (Act act : muscle.getActList()) {
//				System.out.println(act.getActName());
//			}
			System.out.println(muscle);
			System.out.println("-------------------------------------------------");
		}
	}
	
	@Test
	public void findMumscleById() {
		Muscle muscle = this.muscleMapper.findById(3);
		System.out.println("肌肉 "+muscle.getMuscleName()+"可以通过以下动作锻炼：");
		List<Act> actList = muscle.getActList();
		for (Act act : actList) {
			System.out.println(act);
			System.out.println("---------------------------------------");
		}
	}
	
	@Autowired
	private TrainMapper TrainMapper;
	
	@Test
	public void findByCoachId() {
		List<Train> trainList = this.TrainMapper.findByCoachId(1);
		System.out.println("coachId 为 1 的教练开设的课程训练有：");
		for (Train train : trainList) {
			System.out.println("train名字："+train.getTrainName());
			System.out.println("train课时："+train.getTrainPeriod());
			System.out.println("train价格："+train.getTrainPrice());
			System.out.println("coach教练是："+train.getTrainCoach());
			System.out.println("coach教练姓名是："+train.getTrainCoach().getCoachName());
		}
		System.out.println("----------------------------------");
	}
	@Test
	public void findTrainByTrainName() {
		Train train = this.TrainMapper.findTrainByTrainName("添加课程测试3");
		System.out.println(train);
	}
	
	@Test
	public void findByGradeId() {
		List<Train> trainList = this.TrainMapper.findByGradeId(2);
		System.out.println("等级为2中级，找到的train：");
		for (Train train : trainList) {
			System.out.println(train);
		}
	}
	
	@Test
	public void findById() {
		Train traiList = this.TrainMapper.findById(2);
		System.out.println("id为2的train：");
	}
	
	@Autowired
	private TotalOrderMapper totalOrderMapper;
	
	@Test
	public void findAllTotalOrder() {
		List<TotalOrder> totalOrderList =  this.totalOrderMapper.findAll();
		System.out.println("所有的订单：");
		for (TotalOrder totalOrder : totalOrderList) {
			System.out.println("订单创建时间"+totalOrder.getTotalOrderCreatetime());
			System.out.println("订单创建教练"+totalOrder.getTotalOrderCoach().getCoachName());
			System.out.println("--------------------------------------");
			List<TOrderDetail> tOrderDetailList = totalOrder.getTOrderDetailList();
			System.out.println("详情是：");
			for (TOrderDetail detail : tOrderDetailList) {
				System.out.println(detail);
				System.out.println("________________-");
			}
		}
	}
}
