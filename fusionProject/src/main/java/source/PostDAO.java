package source;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class PostDAO {
	
	private Connection conn;  //자바와 데이터베이스를 연결하는 Connection 객
	private PreparedStatement pstmt; // 쿼리문 대기 및 설
	private ResultSet rs; // 결괏값 받아오
	
	public PostDAO() {
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
	public int getNext() {
		return -1;
	}
	
	public ArrayList<Post> getPostList(String category, int pageNumber){
		String sql;
		ArrayList<Post> list = new ArrayList<Post>();
		try{
			sql  = "select * from Post where no < ? and available = 1 order by no desc limit 10";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, getNext()-(pageNumber - 1) * 10);
			rs = pstmt.executeQuery();
			while(rs.next()){
				Post post = new Post();
				post.setNo(rs.getInt(1));
				post.setCategory(rs.getString(2));
				post.setTitle(rs.getString(3));
				post.setWriter(rs.getString(4));
				post.setContents(rs.getString(5));
				post.setDateeOfIssue(rs.getString(6));
				post.setAvailable(rs.getInt(7));
				list.add(post);
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return list;
	}
	
	
	
	public int createPost(Post post) {
		String sql;
		try {
			sql = "insert into post values(POST_SEQ.NEXTVAL,?,?,?,?,to_char(SYSDATE,'yyyy-mm-dd hh24:mi:ss'),?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, post.getCategory());
			pstmt.setString(2, post.getTitle());
			pstmt.setString(3, post.getWriter());
			pstmt.setString(4, post.getContents());
			pstmt.setString(5, "1");
			//"insert into post values(POST_SEQ.NEXTVAL,'news','제목','test1234','내용입니다.',to_char(SYSDATE,'yyyy-mm-dd hh24:mi:ss'))";
			return pstmt.executeUpdate();
		} catch(SQLException e) {
			e.printStackTrace();
		}
		return -1;
	}
	
	//"insert into post values(POST_SEQ.NEXTVAL,'news','제목','test1234','내용입니다.',to_char(SYSDATE,'yyyy-mm-dd hh24:mi:ss'))";
}
