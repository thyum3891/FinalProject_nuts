package com.kh.mybatis.common;

import java.sql.CallableStatement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import org.apache.ibatis.type.JdbcType;
import org.apache.ibatis.type.TypeHandler;


/**
 * 마이바티스에서 컬럼의 옵션형태로 값이 들어가는 경우 이러한 Type을 지원하기 위한 Helper
 *  -> 취미 : 운동,영화보기,음악감상  
 *   DB에 데이터 입력시에는 String[] -> String 전환
 *   DB에서 추출할때는 String -> String[] 전환하는 역할
 *   
 *   -> 자세한 내용은 Mybatis 홈페이지나 메뉴얼 참고!
 *
 */
public class walkingTypeHandler implements TypeHandler<String[]> {

	@Override
	public void setParameter(PreparedStatement ps, int i, String[] parameter, JdbcType jdbcType) throws SQLException {
		if(parameter != null) {
			ps.setString(i, String.join("/", parameter));
		}else {
			ps.setString(1, "");
		}
	}

	@Override
	public String[] getResult(ResultSet rs, String columnName) throws SQLException {
		return rs.getString(columnName).split("/");
	}

	@Override
	public String[] getResult(ResultSet rs, int columnIndex) throws SQLException {
		return rs.getString(columnIndex).split("/");
	}

	@Override
	public String[] getResult(CallableStatement cs, int columnIndex) throws SQLException {
		return cs.getString(columnIndex).split("/");
	}

}
