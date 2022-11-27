package source;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.SQLIntegrityConstraintViolationException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

public class TransferDAO {

	private Connection conn; // 자바와 데이터베이스를 연결하는 Connection 객
	private PreparedStatement pstmt; // 쿼리문 대기 및 설
	private ResultSet rs; // 결괏값 받아오

	public TransferDAO() {
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

	public int transfer() {
		String sql;
		return -1;
		
	}
		
	public int create(String id,String password) {
		String sql;
		
		try {
			sql = "insert into bank_account values('1234'||LPAD(BA_SEQ.NEXTVAL,7,'0'),'개혁은행',?,?,?,?,?,?,SYSDATE)";
			//insert into bank_account values(TO_CHAR(SYSDATE,'YYYYMMDD')||LPAD(BA_SEQ.NEXTVAL,7,'0'),'개혁은행','test1234','1234',0,1,'개혁예적금','대기',SYSDATE);
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,id);
			pstmt.setString(2,password);
			pstmt.setInt(3,0);
			pstmt.setDouble(4, 1.0);
			pstmt.setString(5, "대기");
			pstmt.setString(6,"개혁예적금");
			return pstmt.executeUpdate();
		
			} catch (Exception e) {
			e.printStackTrace();
		}
		return -1; // 오류
	}
	
	public int selectBankAccountNumber(BankAccount ba) {
		String sql;
		try {
			sql = "select * from (select * from bank_account order by banknumber desc) where rownum = 1";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				
				ba.setBankNumber(rs.getString(1));
				ba.setBank(rs.getString(2));
				ba.setName(rs.getString(8));
				ba.setDate(rs.getString(9));
				return 1;
			}
		}catch (SQLException e) {
			e.printStackTrace();
		}
		return -1;
	}
	public String getUserName(String id) {
		String sql;
		try {
			sql = "select name from member where id = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,id);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return rs.getString(1);
			}

		}catch(SQLException e) {
			e.printStackTrace();
		}
		return "오류";
	}
	
	public ResultSet getMyAccounts(String id) {
		String sql;
		try {
			sql = "select * from bank_account where id = ? ";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			return rs;
		} catch(SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public int checkId(String id) {
		String sql = "select name from bank_ account where id = ?"; // 
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
	public int totalBalance(String id) {
		try {
			String sql = "select sum(balance) from bank_account where id =?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
			
		}
		return -1;
	}
	
	
	public int countRow(String id) {
		try {
			String sql = "select count(*) from bank_account where id = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,id);
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
