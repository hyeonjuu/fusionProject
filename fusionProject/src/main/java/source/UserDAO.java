package source;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLIntegrityConstraintViolationException;

public class UserDAO {
	
	private Connection conn;  //자바와 데이터베이스를 연결하는 Connection 객
	private PreparedStatement pstmt; // 쿼리문 대기 및 설
	private ResultSet rs; // 결괏값 받아오
	
	public UserDAO() {
		// UserDAO가 실행되면 자동으로 생성되는 부분
		// 메소드마다 반복되는 코드를 이곳에 넣
		try {
				Class.forName("oracle.jdbc.driver.OracleDriver");
				String db_url = "jdbc:oracle:thin:@localhost:1521:xe";
				String db_id = "hyeonju";
				String db_pwd = "dkagh";
				conn = DriverManager.getConnection(db_url,db_id,db_pwd);
				System.out.println("성공");
			} catch (Exception e) {
				System.out.println("실패");
				e.printStackTrace();
			}

	}
	
	public int login(String id, String password) {
		String sql =  "select password from ACCOUNT where id = ?";
		try{
			pstmt = conn.prepareStatement(sql);  //sql 쿼리문을 대기시킨
			pstmt.setString(1,id);  // 
			rs = pstmt.executeQuery(); // 쿼리를 실행한 결과를 rs에 저 
			System.out.println("성공?");			
			if(rs.next()) { 
				if(rs.getString(1).equals(password)) {  // 입력된 ID를 가진 Password 값을 가져온다.
					return 1;  //같으면 1을 리턴 (비밀번호 일치)
				}else {
					return 0;  //틀리면 0을 리턴 (비밀번호 불 일치)
				}
			}
			return -1;	// rs.next()가 false (일치하는 아이디 없음)
		} catch(Exception e){ 
			e.printStackTrace();
		}
		return -2;  //아예 try문 오류 (데이터베이스 오류)
	}
		
	public int signUp(Account account, Member member) {
		String sql = "insert int account value(?,?,?)";
		String code = "1234";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,account.getId());
			pstmt.setString(2,account.getPassword());
			if(account.getCode().equals(code)) {
				account.setWhetherAdmin(1);
			}else {
				account.setWhetherAdmin(0);
			}
			pstmt.setInt(3,account.getWhetherAdmin());	
			return pstmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		sql = "insert into member value(Member_seq.nextval,?,?,?,?,?,?,?)";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,member.getName());
			pstmt.setString(2,member.getId());
			pstmt.setString(3,member.getBirth());
			pstmt.setString(4,member.getEmail());
			pstmt.setString(5,member.getAddr());
			pstmt.setString(6,member.getGender());
			pstmt.setString(7,member.getTel());
			return pstmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return -1;
	}
	


}
