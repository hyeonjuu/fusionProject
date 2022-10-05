package source;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLIntegrityConstraintViolationException;

public class UserDAO {
	
	private Connection conn = null;
	private PreparedStatement pstmt; //������ ��� �� ����
	private ResultSet rs; //�ᱣ��
	
	public UserDAO() {
		//����̹� �˻� (db�� ���� �غ�)
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
	
	public int login(String Id, String Password) {
		String sql =  "select PASSWORD from Account where ID = ?";
		try{
			pstmt = conn.prepareStatement(sql);  //sql ������ ���
			pstmt.setString(1,Id);  // ù��° ? �� �Ű������� �޾ƿ� id�� ����
			rs = pstmt.executeQuery(); //������ ������ ����� rs�� ����
			if(rs.next()) { 
				if(rs.getString(1).equals(Password)) {
					return 1;  //�α��� ����
				}else {
					return 0;  //��й�ȣ Ʋ��
				}
			}
			return -1;	//���̵� ����
		} catch(Exception e){ 
			e.printStackTrace();
		}
		return -2;  //����
	}
		
	public int join(Account account) {
		String sql = "insert into ACCOUNT values(?,?,?)"; 
		String code = "1234";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,account.getID());
			pstmt.setString(2, account.getPASSWORD());
			if(account.getCode() == null) {
			    account.setCode("");
			}
			if(account.getCode().equals(code)) {
				account.setWHETHERADMIN(1);
			}else {
				account.setWHETHERADMIN(0);
			}
			pstmt.setInt(3,account.getWHETHERADMIN());

			System.out.println("문제x"+account.getID());
			return pstmt.executeUpdate();
			
		}
//		catch(SQLIntegrityConstraintViolationException e) {
//			System.out.println(account.getID());
//		    return -1;
//		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return -2;
	}
	


}
