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

	
	
	public int bankAccountCreate(BankAccount ba, String id) {
		String sql = "select id from Member where id = ?";
		LocalDate now = LocalDate.now();
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyyMMdd");
		int count = countRow();
		try {
			String sql = "insert into bank_account values(TO_CHAR(SYSDATE,'YYYYMMDD')||LPAD(:SEQ_NO, 3, '0') SEQ FROM DUAL,?,?,?,?,?,?,?)";
			pstmt = conn.prepareStatement(sql);

			
			System.out.println("성공?");
			if (rs.next()) {
				if (rs.getString(1).equals(id)) { // 입력된 ID를 가진 Password 값을 가져온다.
					return 1; // 같으면 1을 리턴 (비밀번호 일치)
				} else {
					return 0; // 틀리면 0을 리턴 (비밀번호 불 일치)
				}
			}
			return -1; // rs.next()가 false (일치하는 아이디 없음)
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -2; // 아예 try문 오류 (데이터베이스 오류)
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
