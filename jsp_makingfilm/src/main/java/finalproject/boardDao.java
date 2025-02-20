package finalproject;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class boardDao {


	// 의존성 주입(객체를 생성함에 동시에 초기화)
	private Connection conn;

	public boardDao(Connection conn) {
		this.conn = conn;
	}


	// 입력(insert) - 넘어오는 데이터는 BoardDTO의 dto
	public int insertData(board dto) {

		int result = 0;

		PreparedStatement pstmt = null;
		String sql;

		try {

			sql = "insert into board (title, writer, script)";
			sql += "values (?,?,?)";

			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, dto.getTitle());
			pstmt.setString(2, dto.getWriter());
			pstmt.setString(3, dto.getScript());

			result = pstmt.executeUpdate(); // 실행해준다

			pstmt.close();// 닫아준다.

		} catch (Exception e) {
			System.out.println(e.toString());
		}

		return result; // result로 반환
		// --여기까지가 입력(insert)

	}

	// 전체 데이터 갯수 구하기
	public int getDataCount(String searchKey, String searchValue) {

	int totalCount = 0;
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql;
		
		try {
			
			searchValue = "%" + searchValue + "%";
			
			sql = "select nvl(count(*),0) from board ";
			sql+= "where " + searchKey + " like ?";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, searchValue);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				totalCount = rs.getInt(1);
			}
			
			rs.close();
			pstmt.close();
			
			
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return totalCount;
	}

	// 전체 데이터 출력(페이지마다 개수 제한)
	public List<board> getLists(int start, int end,String searchKey, String searchValue) {
	//rownum을 매개변수로 할당해서 해당범위만 list로 출력

		List<board> lists = new ArrayList<board>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql;

		try {
			
			searchValue = "%" + searchValue + "%";
			
			sql = "select * from (";
			sql+= "select rownum rnum, data.* from (";
			sql+= "select title, writer, script";
			sql+= "from board where " + searchKey + " like ? ";
			sql+= "order by num desc) data) " ;
			sql+= "where rnum>=? and rnum<=?";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, searchValue);
			pstmt.setInt(2, start);
			pstmt.setInt(3, end);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				
				board dto = new board();
				
				dto.setTitle(rs.getString("title"));
				dto.setWriter(rs.getString("writer"));
				dto.setScript(rs.getString("script"));
				
				lists.add(dto);
			}
			
			rs.close();
			pstmt.close();

		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
		return lists;
	}
	
	
	
	// title로 조회한 한개의 데이터
	public board getReadData(String title) {

		board dto = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql;

		try {

			sql = "select title, writer, script";
			sql += "from board where title=?";

			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, title);

			rs = pstmt.executeQuery();

			if (rs.next()) { // 데이터가 1개니까 while문 x if문사용

				dto = new board();// 위에서 객체생성했으니 이렇게

				dto.setTitle(rs.getString("title"));
				dto.setWriter(rs.getString("writer"));
				dto.setScript(rs.getString("script"));

			}

			rs.close();
			pstmt.close();

		} catch (Exception e) {
			System.out.println(e.toString());
		}

		return dto;
	}
	
	
	//수정
	public int updateData(board dto) {
		
		int result = 0;
		
		PreparedStatement pstmt = null;
		String sql;
		
		try {
			
			sql = "update board set writer=?,script=?,";
			sql+= "where title=?";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, dto.getTitle());
			pstmt.setString(2, dto.getWriter());
			pstmt.setString(3, dto.getScript());

			
			result = pstmt.executeUpdate();
			
			pstmt.close();
			
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
		return result;
	}
	
	//삭제
	public int deleteData(String title) {
		
		int result = 0;
		
		PreparedStatement pstmt = null;
		String sql;
		
		try {
			
			sql = "delete board where title=?";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, title);
			
			result = pstmt.executeUpdate();
			
			pstmt.close();
			
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
		return result;
		
	}

}
