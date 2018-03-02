package com.framework.utils;

import java.io.IOException;
import java.util.Date;

import org.codehaus.jackson.JsonGenerator;
import org.codehaus.jackson.JsonProcessingException;
import org.codehaus.jackson.map.JsonSerializer;
import org.codehaus.jackson.map.SerializerProvider;
import org.springframework.stereotype.Component;

/**
 * 将返回的JSON格式中，<br>
 * 日期类型转化为字符串类型，<br>
 * 用于前台显示
 * 
 * @Copyright (C),沪友科技
 * @author zlf
 * @Date:2015年11月14日
 */
@Component
public class JsonDateSerializer extends JsonSerializer<Date> {

	@Override
	public void serialize(Date date, JsonGenerator jsonGenerator, SerializerProvider serializerProvider) throws IOException, JsonProcessingException {
		jsonGenerator.writeString(DateUtil.format(date));
	}

}
