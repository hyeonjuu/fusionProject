package source;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class AdminDAO {
	private Connection conn;  //자바와 데이터베이스를 연결하는 Connection 객
	private PreparedStatement pstmt; // 쿼리문 대기 및 설
	private ResultSet rs; // 결괏값 받아오
	
	public AdminDAO() {
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
		String sql =  "select password from admin where id = ?";
		try{
			pstmt = conn.prepareStatement(sql);  //sql 쿼리문을 대기시킨
			pstmt.setString(1,id);  // 
			rs = pstmt.executeQuery(); // 쿼리를 실행한 결과를 rs에 저 	
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
	
	public int checkAdminCode(String code) {
		String sql = "select code from bank";
		try{
			pstmt = conn.prepareStatement(sql); 
			rs = pstmt.executeQuery(); // 쿼리를 실행한 결과를 rs에 저 
			System.out.println("성공?");			
			if(rs.next()) { 
				if(rs.getString(1).equals(code)) {  // 입력된 ID를 가진 Password 값을 가져온다.
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
	
	public int signUpAdmin(Admin admin) {
		String sql;
		try {
			int isAdmin = checkAdminCode(admin.getCode());
			if(isAdmin == 1) {
			sql = "insert into admin values(?,?,?,?,?,?,?,?)";
		
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, admin.getId());
			pstmt.setString(2, admin.getName());
			pstmt.setString(3, admin.getPassword());
			pstmt.setString(4, admin.getDept());
			pstmt.setString(5, admin.getRank());
			pstmt.setString(6, admin.getEmail());
			pstmt.setString(7, admin.getBirth());
			pstmt.setString(8, admin.getTel());
			return pstmt.executeUpdate();
			} else {
				return -1;
			}
			
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return -2;
	}
}
