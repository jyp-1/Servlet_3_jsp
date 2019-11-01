package com.jy.member;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class MemberDAO {

		
		//insert
		public int memberInsert(Connection con, MemberDTO memberDTO) throws Exception {
			int result = 0;
			String sql = "insert into member values(?,?,?,?,?,3)";
			
			PreparedStatement st = con.prepareStatement(sql);
			
			st.setString(1, memberDTO.getId());
			st.setString(2, memberDTO.getPw());
			st.setString(3, memberDTO.getName());
			st.setString(4, memberDTO.getEmail());
			st.setString(5, memberDTO.getPhone());
			
			result =st.executeUpdate();
			
			st.close();
			con.close();
			
			return result;
		}
		
		//update
		public int memberUpdate(Connection con, MemberDTO memberDTO) throws Exception{
			int result=0;
			String sql = "update member set pw=?, phone=? where id=?";
			
			PreparedStatement st = con.prepareStatement(sql);
			
			st.setString(1, memberDTO.getPw());
			st.setString(2, memberDTO.getPhone());
			st.setString(3, memberDTO.getId());
			
			result = st.executeUpdate();
			
			st.close();
			
			return result;
		}
		
		//login
		
		public MemberDTO memberLogin(Connection con, MemberDTO memberDTO)throws Exception{
						
			String sql="select * from member where id=? and pw=?";
			
			PreparedStatement st = con.prepareStatement(sql);
			
			st.setString(1, memberDTO.getId());
			st.setString(2, memberDTO.getPw());
			
			ResultSet rs = st.executeQuery();
			
			if(rs.next()) {
				memberDTO.setName(rs.getString("name"));
				memberDTO.setEmail(rs.getString("email"));
				memberDTO.setPhone(rs.getString("phone"));
				memberDTO.setGrade(rs.getInt("grade"));
			}else {
				memberDTO =null;
			}
		
			rs.close();
			st.close();
			
			return memberDTO;
		
		};
		
		//Delete
		
		public int memberDelete(Connection con, MemberDTO memberDTO) throws Exception {
			int result=0;
			String sql="delete member where id=? ";
			PreparedStatement st = con.prepareStatement(sql);
			st.setString(1, memberDTO.getId());
			result = st.executeUpdate();
			
			st.close();
			return result;
		};
		
		
		
		
	}
	
	

