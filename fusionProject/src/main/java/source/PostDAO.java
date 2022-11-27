package source;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class PostDAO {

	private Connection conn; // 자바와 데이터베이스를 연결하는 Connection 객
	private PreparedStatement pstmt; // 쿼리문 대기 및 설
	private ResultSet rs; // 결괏값 받아오

	public PostDAO() {
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

	public int getNext() {
		String sql;
		try {
			sql = "select no from Post order by no desc";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				return rs.getInt(1) + 1;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return -1;
	}

	public ArrayList<Post> getPostList(String category, int pageNumber) {
		String sql;
		ArrayList<Post> list = new ArrayList<Post>();
		try {
			int no = getNext() - (pageNumber - 1) * 10;
			sql = "select * from(select * from post where no < ? and available = 1 and category = ? order by no desc) where rownum <= 10 ";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, no);
			pstmt.setString(2, category);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Post post = new Post();
				post.setNo(rs.getInt(1));
				post.setCategory(rs.getString(2));
				post.setTitle(rs.getString(3));
				post.setWriter(rs.getString(4));
				post.setContents(rs.getString(5));
				post.setDateeOfIssue(rs.getString(6));
				post.setAvailable(rs.getInt(7));
				list.add(post);
				System.out.println("게시글 삽입");
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("게시글 실패");
		}
		return list;
	}

	public boolean nextPage(String category, int pageNumber) {
		String sql;
		try {
			int no = getNext() - (pageNumber - 1) * 10;
			sql = "select * from post where no < ? and available = 1 and category = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, no);
			pstmt.setString(2, category);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				return true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}

	public int createPost(Post post) {
		String sql = null;
		try {
			if (post.getCategory().equals("news")) {
				sql = "insert into post values(news_seq.nextval,?,?,?,?,to_char(SYSDATE,'yyyy-mm-dd hh24:mi:ss'),?)";
			} else if (post.getCategory().equals("notice")) {
				sql = "insert into post values(notice_seq.nextval,?,?,?,?,to_char(SYSDATE,'yyyy-mm-dd hh24:mi:ss'),?)";

			} else if (post.getCategory().equals("qna")) {
				sql = "insert into post values(qna_seq.nextval,?,?,?,?,to_char(SYSDATE,'yyyy-mm-dd hh24:mi:ss'),?)";
			}
			System.out.println(post.getCategory());
			System.out.println(sql);
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, post.getCategory());
			pstmt.setString(2, post.getTitle());
			pstmt.setString(3, post.getWriter());
			pstmt.setString(4, post.getContents());
			pstmt.setString(5, "1");
			// "insert into post
			// values(POST_SEQ.NEXTVAL,'news','제목','test1234','내용입니다.',to_char(SYSDATE,'yyyy-mm-dd
			// hh24:mi:ss'))";
			return pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return -1;
	}

	public Post getPost(int no, String category) {
		String sql;
		try {
			sql = "select * from post where no = ? and category = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, no);
			pstmt.setString(2, category);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				Post post = new Post();
				post.setNo(rs.getInt(1));
				post.setCategory(rs.getString(2));
				post.setTitle(rs.getString(3));
				post.setWriter(rs.getString(4));
				post.setContents(rs.getString(5));
				post.setDateeOfIssue(rs.getString(6));
				post.setAvailable(rs.getInt(7));
				return post;
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public String translateCategory(String category) {
		if(category.equals("news"))
			return "새소식";
		else if(category.equals("notice"))
			return "공지사항";
		else if(category.equals("qna"))
			return "자주 묻는 질문";
		return null;
	}
	
	public int update(Post post) {
		String sql;
		try {
			sql = "update post set writer = ?, title = ? ,contents = ? where no = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, post.getWriter());
			pstmt.setString(2, post.getTitle());
			pstmt.setString(3, post.getContents());
			pstmt.setInt(4, post.getNo());
			return pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return -1;
	}
	
	public int delete(int no,String category) {
		String sql;
		try {
			sql = "update post set available = 0 where no = ? and category = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, no);
			pstmt.setString(2, category);
			return pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return -1;
	}
	
	// "insert into post
	// values(POST_SEQ.NEXTVAL,'news','제목','test1234','내용입니다.',to_char(SYSDATE,'yyyy-mm-dd
	// hh24:mi:ss'))";
}
