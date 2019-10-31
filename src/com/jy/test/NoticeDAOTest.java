package com.jy.test;

import static org.junit.Assert.*;

import java.sql.Connection;
import java.util.ArrayList;

import org.junit.Test;

import com.jy.notice.NoticeDAO;
import com.jy.notice.NoticeDTO;
import com.jy.utill.DBConnetor;

public class NoticeDAOTest {

	//@Test
	public void noticeUpdateTest()throws Exception {
		NoticeDTO noticeDTO = new NoticeDTO(); 
		noticeDTO.setNum(200);
		noticeDTO.setTitle("adad");
		noticeDTO.setContents("ggg");
		
		NoticeDAO noticeDAO = new NoticeDAO();
		Connection con = DBConnetor.getConnection();
		int result = noticeDAO.noticeUpdate(con, noticeDTO);
		assertEquals(1, result);
		
	}
	
	//@Test
	public void noticeWriteTest() throws Exception {
		NoticeDAO noticeDAO = new NoticeDAO();
		Connection con = DBConnetor.getConnection();
		for(int i=0;i<10;i++) {
			NoticeDTO noticeDTO = new NoticeDTO();
			
			noticeDTO.setTitle("title"+i);
			noticeDTO.setWriter("writer"+i);
			noticeDTO.setContents("contents"+i);
			noticeDAO.noticeWrite(con, noticeDTO);
			Thread.sleep(500); //잠깐 쉬었다가 올라가기
			
		}
		con.close();
	}
	
	//@Test
	public void noticeSelectTest() throws Exception{
		NoticeDAO noticeDAO = new NoticeDAO();
		Connection con = DBConnetor.getConnection();
		ArrayList<NoticeDTO> ar =noticeDAO.noticeList(con);
		assertNotEquals(0, ar.size());
		
	}
		
	
	//@Test
	public void noticeSelectResutlTest() throws Exception {
		NoticeDAO noticeDAO = new NoticeDAO();
		Connection con = DBConnetor.getConnection();
		NoticeDTO noticeDTO=noticeDAO.noticeSelect(con, 2);
		assertNull(noticeDTO);
		
	}
	
	@Test
	public void noticeDeleteTest() throws Exception{
		NoticeDAO noticeDAO = new NoticeDAO();
		Connection con = DBConnetor.getConnection();
		int result = noticeDAO.noticeDelete(con, 123456);
		System.out.println(result);
		assertEquals(1, result);
		
	}
	
}
