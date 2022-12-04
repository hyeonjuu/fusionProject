package source;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.SQLIntegrityConstraintViolationException;
import java.text.DecimalFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;

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
			sql = "select b.banknumber ,b.bank,b.balance, m.name from bank_account b, member m where b.id = m.id and b.banknumber = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,bankNumber);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				bankAccount = new BankAccount();
				bankAccount.setBankNumber(rs.getString(1));
				bankAccount.setBank(rs.getString(2));
				bankAccount.setBalance(rs.getInt(3));
				bankAccount.setUserName(rs.getString(4));
			}
			
		} catch(SQLException e) {
			e.printStackTrace();
		}
		return bankAccount;
		
	}
	public BankAccount getBankAccount(String bankNumber,String password) {
		String sql;
		BankAccount bankAccount = null;
		try {
			sql = "select b.banknumber ,b.bank,b.balance, m.name from bank_account b, member m where b.id = m.id and b.banknumber = ? and b.password = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,bankNumber);
			pstmt.setString(2, password);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				bankAccount = new BankAccount();
				bankAccount.setBankNumber(rs.getString(1));
				bankAccount.setBank(rs.getString(2));
				bankAccount.setBalance(rs.getInt(3));
				bankAccount.setUserName(rs.getString(4));
			}
			
		} catch(SQLException e) {
			e.printStackTrace();
		}
		return bankAccount;
		
	}
	public int depositLog(BankAccount host, BankAccount target, int amount,String showMessage) {
		String sql;
		try{
			sql = "insert into deal values(deal_seq.nextval,'입금',to_char(systimestamp,'yyyy/mm/hh hh:mi:ss'),?,?,?,?,?,?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, host.getBank());
			pstmt.setString(2, host.getBankNumber());
			pstmt.setString(3, target.getBank());
			pstmt.setString(4, target.getBankNumber());
			pstmt.setInt(5, amount);
			pstmt.setInt(6, host.getBalance());
			pstmt.setString(7,showMessage);
		 //유저 받은 거 database 입력하기 
			return pstmt.executeUpdate();
		}catch(SQLException e) {
			//deposit입금 , 출금 withdraw
			e.printStackTrace();
		}
		return -1;
	}
	public int withdrawLog(BankAccount host, BankAccount target, int amount,String showMessage) {
		String sql;
		try{
			sql = "insert into deal values(deal_seq.nextval,'출금',to_char(systimestamp,'yyyy/mm/hh hh:mi:ss'),?,?,?,?,?,?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, host.getBank());
			pstmt.setString(2, host.getBankNumber());
			pstmt.setString(3, target.getBank());
			pstmt.setString(4, target.getBankNumber());
			pstmt.setInt(5, amount);
			pstmt.setInt(6, host.getBalance());
			pstmt.setString(7, target.getUserName());
			
			return pstmt.executeUpdate();
		}catch(SQLException e) {
			//deposit입금 , 출금 withdraw
			e.printStackTrace();
		}
		return -1;
	}
	
	public int updateBalance(BankAccount bankAccount) {
		String sql;
		try {
			sql = "update bank_account set balance = ? where banknumber = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bankAccount.getBalance());
			pstmt.setString(2,bankAccount.getBankNumber());
			return pstmt.executeUpdate();
			
		}catch (SQLException e) {
			e.printStackTrace();
		}
		return -1;
	}
	
	public ArrayList<Deal> getDealList(String bankNumber){
		String sql;
		ArrayList<Deal> list = new ArrayList<Deal>();
		try {
			sql="Select * from deal where hostbankaccount = ? order by no desc";
			pstmt= conn.prepareStatement(sql);
			pstmt.setString(1, bankNumber);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				Deal deal = new Deal();
				deal.setNo(rs.getInt(1));
				deal.setType(rs.getString(2));
				deal.setTransfertime(rs.getString(3));
				deal.setHostBank(rs.getString(4));
				deal.setHostBankAccount(rs.getString(5));
				deal.setTargetBank(rs.getString(6));
				deal.setTargetBankAccount(rs.getString(7));
				deal.setAmount(rs.getInt(8));
				deal.setBalance(rs.getInt(9));
				deal.setShowMessage(rs.getString(10));
				
				list.add(deal);
			}
			System.out.println(list.size());
		} catch(SQLException e) {
			e.printStackTrace();
			System.out.println("실패");
		}
		
		return list;
	}
	public String replace(String bankNumber) {
		StringBuilder str = new StringBuilder(bankNumber);
		str.insert(4,"-");
		str.insert(8,"-");
		return str.toString();
	}
	public String comma(int balance) {
		DecimalFormat decFormat = new DecimalFormat("#,###");
		String val =  decFormat.format(balance);
		return val;
	}

}
