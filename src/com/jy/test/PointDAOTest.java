package com.jy.test;

import static org.junit.Assert.*;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.Random;

import org.junit.Test;

import com.jy.point.PointDAO;
import com.jy.point.PointDTO;
import com.jy.utill.DBConnetor;

public class PointDAOTest {

	@Test
	public void updateTest()throws Exception{
		PointDTO pointDTO = new PointDTO();
		pointDTO.setNum(192);
		pointDTO.setName("nana");
		pointDTO.setKor(50);
		pointDTO.setEng(50);
		pointDTO.setMath(50);
		pointDTO.setTotal(150);
		pointDTO.setAvg(50.0);
		
		PointDAO pointDAO = new PointDAO();
		Connection con =DBConnetor.getConnection();
		int result = pointDAO.update(con, pointDTO);
		assertEquals(1, result);
		
		
	}
	
	
	
	//@Test
	public void insertTest() throws Exception{
		PointDAO pointDAO = new PointDAO();
		Connection con = DBConnetor.getConnection();
		for(int i=0;i<10;i++) {
			Random rs = new Random();
			PointDTO pointDTO = new PointDTO();
			pointDTO.setName("name"+i);
			pointDTO.setKor(rs.nextInt(101));
			pointDTO.setEng(rs.nextInt(101));
			pointDTO.setMath(rs.nextInt(101));
			pointDTO.setTotal(pointDTO.getKor()+pointDTO.getEng()+pointDTO.getMath());
			pointDTO.setAvg(pointDTO.getTotal()/3.0);
			pointDAO.insert(con, pointDTO);
			Thread.sleep(500); //잠깐 쉬었다가 올라가기
		}
		con.close();
	}
	
	
	
	
	//@Test
	public void selectListTest()throws Exception{
		PointDAO pointDAO = new PointDAO();
		Connection con = DBConnetor.getConnection();
		ArrayList<PointDTO> ar = pointDAO.selectList(con);
		assertNotEquals(0, ar.size());
		
	}
	
	
	
	
	//@Test
	public void selectOneTest() throws Exception{
		PointDAO pointDAO = new PointDAO();
		Connection con = DBConnetor.getConnection();
		PointDTO pointDTO = pointDAO.selectOne(con, 46);
		assertNull(pointDTO);
	}
	
	
	//@Test
	public void test2() throws Exception{
		Connection con = DBConnetor.getConnection();
		assertNotNull(con);
	}
	
	
	
	//@Test
	public void test() throws Exception {
		
		PointDAO pointDAO = new PointDAO();
		Connection con = DBConnetor.getConnection();
		
		int result = pointDAO.delete(con, 123456);
		System.out.println(result);
		
		//단정문 
		assertEquals(1, result);
	
	}
}
