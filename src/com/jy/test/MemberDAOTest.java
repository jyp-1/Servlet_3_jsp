package com.jy.test;

import static org.junit.Assert.*;

import java.sql.Connection;

import javax.websocket.Session;

import org.junit.Test;

import com.jy.member.MemberDAO;
import com.jy.member.MemberDTO;
import com.jy.utill.DBConnetor;

public class MemberDAOTest {

	//@Test
	public void test() throws Exception {
		MemberDAO memberDAO = new MemberDAO();
		Connection con = DBConnetor.getConnection();
		MemberDTO memberDTO = new MemberDTO();
		memberDTO.setId("");
		memberDTO.setPw("");
		memberDTO=memberDAO.memberLogin(con, memberDTO);
		
		assertNotNull(memberDTO);
	}
	
	//@Test
	public void MemberUpdateTest()throws Exception{
		MemberDAO memberDAO = new MemberDAO();
		MemberDTO memberDTO = new MemberDTO();
		
		memberDTO.setId("admin");
		memberDTO.setPw("admin");
		memberDTO.setPhone("0106664444");
				
		
		Connection con = DBConnetor.getConnection();
		int result = memberDAO.memberUpdate(con, memberDTO);
		con.close();
		assertEquals(1, result);
		
		
	}/*
		 * //@Test public void MemberDelete() throws Exception{ MemberDAO memberDAO =
		 * new MemberDAO(); Connection con = DBConnetor.getConnection(); int result =
		 * memberDAO.memberDelete(con, ); System.out.println(result); assertEquals(1,
		 * result); }
		 */

}
