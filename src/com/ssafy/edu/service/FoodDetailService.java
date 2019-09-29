package com.ssafy.edu.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssafy.edu.dao.FoodDetailDao;
import com.ssafy.edu.dto.FoodDetailDto;

@Service
public class FoodDetailService implements IFoodDetailService{
	@Autowired
	private FoodDetailDao foodDetailDao;
	/*@Override
	public int makeFPK() {
		String sql = " SELECT MAX(food_code) FROM FOODINFO ";
		int result = -1;
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		try {
			conn = getConnection();
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();
			while(rs.next())
				result = rs.getInt(1);
			
		} catch (Exception e) {
			// TODO: handle exception
		}finally {
			close(rs,psmt,conn);
		}
		result++;
		return result;
	}*/
	/*public boolean insertDetail(FoodDetailDto dto) {
		boolean check = true;
		int food_code = makeFPK();
		String sql = "INSERT INTO FOODNUTRITION(food_code,daily,calorie,carbohydrate,protein,fat,sugars,salt,cholesterol,fatty_acid,trans_fat) "+
				" VALUE(?,?,?,?,?,?,?,?,?,?,?)";
		Connection conn = null;
		PreparedStatement psmt = null;
		try {
			conn = getConnection();
			psmt = conn.prepareStatement(sql);
			int i = 1;
			psmt.setInt(i++, food_code);
			psmt.setDouble(i++, dto.getDaily());
			psmt.setDouble(i++, dto.getCalorie());
			psmt.setDouble(i++, dto.getCarbohydrate());
			psmt.setDouble(i++, dto.getProtein());
			psmt.setDouble(i++, dto.getFat());
			psmt.setDouble(i++, dto.getSugars());
			psmt.setDouble(i++, dto.getSalt());
			psmt.setDouble(i++, dto.getCholesterol());
			psmt.setDouble(i++, dto.getFatty_acid());
			psmt.setDouble(i++, dto.getTrans_fat());
			
			int count = psmt.executeUpdate();
			if(count <= 0) {
				check = false;
				throw new SQLException("추가에 실해하셨습니다.");
			}
		} catch (Exception e) {
			check = false;
		}finally {
			close(null,psmt,conn);
		}
		return check;
	}*/
	/*public boolean deleteDetail(int code) {
		boolean check = true;
		String sql = "DELETE FROM FOODNUTRITION "+"WHERE FOOD_CODE=? ";
		Connection conn = null;
		PreparedStatement psmt = null;
		try {
			conn = getConnection();
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, code);
			int count = psmt.executeUpdate();
			if(count <= 0) {
				check = false;
				throw new SQLException("삭제에 실패하였습니다.");
			}
		} catch (Exception e) {
			check = false;
		}finally {
			close(null,psmt,conn);
		}
		return check;
	}*/
	public FoodDetailDto findDetailByInt(int food_code) throws Exception{
		return foodDetailDao.findDetailByInt(food_code);
	}
}
