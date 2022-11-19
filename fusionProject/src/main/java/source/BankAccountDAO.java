package source;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLIntegrityConstraintViolationException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

public class BankAccountDAO {

	private Connection conn; // 자바와 데이터베이스를 연결하는 Connection 객
	private PreparedStatement pstmt; // 쿼리문 대기 및 설
	private ResultSet rs; // 결괏값 받아오

	public BankAccountDAO() {
		// UserDAO가 실행되면 자동으로 생성되는 부분
		// 메소드마다 반복되는 코드를 이곳에 넣
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			String db_url = "jdbc:oracle:thin:@localhost:1521:xe";
			String db_id = "hyeonju";
			String db_pwd = "dkagh";
			conn = DriverManager.getConnection(db_url, db_id, db_pwd);
			System.out.println("성공");
		} catch (Exception e) {
			System.out.println("실패");
			e.printStackTrace();
		}

	}

	
	
	public int create(BankAccount ba, String id) {
		String sql = "select id from Member where id = ?";
		
		try {
			sql = "insert into bank_account values('1234'||LPAD(BA_SEQ.NEXTVAL,7,'0'),'개혁은행',?,?,?,?,?,?,SYSDATE)";
			//insert into bank_account values(TO_CHAR(SYSDATE,'YYYYMMDD')||LPAD(BA_SEQ.NEXTVAL,7,'0'),'개혁은행','test1234','1234',0,1,'개혁예적금','대기',SYSDATE);
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,id);
			pstmt.setString(2, ba.getPassword());
			pstmt.setInt(3,0);
			pstmt.setDouble(4, 1.0);
			pstmt.setString(5,"개혁예적금");
			pstmt.setString(6, "대기");
			return pstmt.executeUpdate();
			} catch (Exception e) {
			e.printStackTrace();
		}
		return -1; // 오류
	}

	public int checkId(String id) {
		String sql = "select id from bank_ account where id = ?"; // 아이디 중복 체크
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,id);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				if (rs.getString(1).equals(id)) { // 입력된 ID값이 존재하나
					return -2; // 아이디 중복 생성
				}
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
	}
	
	public int countRow() {
		try {
			String sql = "select count(*) from bank_account";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1;
	}



}
