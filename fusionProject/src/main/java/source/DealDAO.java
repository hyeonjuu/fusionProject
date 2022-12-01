package source;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.SQLIntegrityConstraintViolationException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

public class DealDAO {

	private Connection conn; // 자바와 데이터베이스를 연결하는 Connection 객
	private PreparedStatement pstmt; // 쿼리문 대기 및 설
	private ResultSet rs; // 결괏값 받아오

	public DealDAO() {
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
	public BankAccount getBankAccount(String bankNumber) {
		String sql;
		BankAccount bankAccount = null;
		try {
			sql = "Select * from bank_account where banknumber = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,bankNumber);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				bankAccount = new BankAccount();
				bankAccount.setBankNumber(rs.getString(1));
				bankAccount.setBank(rs.getString(2));
				bankAccount.setBalance(rs.getInt(5));
			}
			
		} catch(SQLException e) {
			e.printStackTrace();
		}
		return bankAccount;
		
	}
	public int deposit(BankAccount host, BankAccount target, int amount,String showMesseage) {
		String sql;
		try{
			sql = "insert into deal value(deal_seq.nextval,'입금',to_char(systimestamp,'yyyy/mm/hh hh:mi:ss'),?,?,?,?,?,?,?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, host.getBank());
			pstmt.setString(2, host.getBankNumber());
			pstmt.setString(3, target.getBank());
			pstmt.setString(4, target.getBankNumber());
			pstmt.setInt(5, amount);
			pstmt.setInt(6, host.getBalance());
			pstmt.setString(7,showMesseage);
			
			return pstmt.executeUpdate();
		}catch(SQLException e) {
			//deposit입금 , 출금 withdraw
		}
		return -1;
	}

	public int withdraw(BankAccount host,BankAccount target) {
		String sql;
		try{
			sql = "insert into deal value(deal_seq.nextval,?,?,?";
			pstmt = conn.prepareStatement(sql);
		}catch(SQLException e) {
			//deposit입금 , 출금 withdraw
		}
		return -1;
		
	}
	


}
