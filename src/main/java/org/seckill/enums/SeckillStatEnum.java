package org.seckill.enums;


/**
 * 使用枚举表述常量数据字段
 * @author hjy
 *
 */
public enum SeckillStatEnum {
	SUCCESS(1,"秒杀成功"),
	END(0,"秒杀结束"),
	REPEATE_KILL(-1,"重复秒杀"),
	INNER_ERROR(-2,"系统异常"),
	DATA_REWRITE(-3,"数据串改");
	private int state;
	
	private String stateInfo;

	//在上面SUCCESS（1，“秒杀成功”）其实就是调用了这个构造方法
	private SeckillStatEnum(int state, String stateInfo) {
		this.state = state;
		this.stateInfo = stateInfo;
	}

	public int getState() {
		return state;
	}

	public String getStateInfo() {
		return stateInfo;
	}

	public static SeckillStatEnum stateOf(int index){
		for(SeckillStatEnum state : values()){
			if(state.getState() == index){
				return state;
			}
		}
		return null;
	}
}
