package test;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class UserDAO {
	
	private Connection conn = null;
	private PreparedStatement pstmt; //쿼리문 대기 및 설정
	private ResultSet rs; //결괏값
	
	public UserDAO() {
		//드라이버 검색 (db와 연동 준비)
		try {
				Class.forName("oracle.jdbc.driver.OracleDriver");
				String db_url = "jdbc:oracle:thin:@localhost:1521:xe";
				String db_id = "hyeonju";
				String db_pwd = "dkagh";
				conn = DriverManager.getConnection(db_url,db_id,db_pwd);
			} catch (Exception e) {
				e.printStackTrace();
			}

	}
	
	public int login(String Id, String Password) {
		String sql =  "select PASSWORD from Account where ID = ?";
		try{
			pstmt = conn.prepareStatement(sql);  //sql 쿼리문 대기
			pstmt.setString(1,Id);  // 첫번째 ? 에 매개변수로 받아온 id를 대입
			rs = pstmt.executeQuery(); //쿼리를 실행한 결과를 rs에 저장
			if(rs.next()) { 
				if(rs.getString(1).equals(Password)) {
					return 1;  //로그인 성공
				}else {
					return 0;  //비밀번호 틀림
				}
			}
			return -1;	//아이디 없음
		} catch(Exception e){ 
			e.printStackTrace();
		}
		return -2;  //오류
	}
		
	public int join(Account account, Bank bank) {
		String sql = "insert into Account values(?,?,?)"; //into , member(?,?,?,?,?,?,?,?,?)\"
		String code = "1234";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,account.getID());
			pstmt.setString(2, account.getPASSWORD());
			if(account.getCode().equals(code)) {
				account.setWHETHERADMIN(1);
			}else {
				account.setWHETHERADMIN(0);
			}
			pstmt.setInt(3,account.getWHETHERADMIN());
//			pstmt.setString(4,bank.getName());
//			pstmt.setDouble(5, bank.getRate());
			return pstmt.executeUpdate();		
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return -2;
	}
	


}
