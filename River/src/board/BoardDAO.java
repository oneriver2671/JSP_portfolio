package board;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

public class BoardDAO {
	
	// 여기서 이렇게 쓰는건 별로인가? 
	private static final String JDBC_DRIVER = "com.mysql.cj.jdbc.Driver";
	private static final String JDBC_URL = "jdbc:mysql://localhost:3306/river";
	private static final String USER = "root";
	private static final String PASSWD = "adsl48596!";
	
	private static BoardDAO boardDAO;
	private Connection con = null;
	private Statement stmt = null;
	private PreparedStatement pstmt = null;
	
	// 생성자
	public BoardDAO() {
		try {
			Class.forName(JDBC_DRIVER);		// 라이브러리 찾는 것. 1번만 수행해도 되기 때문에, 생성자에 넣음.
		} catch (Exception e) {
			e.printStackTrace();
		}		
	}
	
	// 객체 리턴용 메소드
	public static BoardDAO getInstance() {
		if(boardDAO == null) {
			boardDAO = new BoardDAO();
		}
		return boardDAO;
	}
	
	
	
	// DB connect 메소드
	public void connect() {	
		try {
			con = DriverManager.getConnection(JDBC_URL, USER, PASSWD);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	// DB disconnect 메소드
	public void disconnect() {
		if(stmt != null) {
			try {
				stmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		} 
		// pstmt 추가
		if(pstmt != null) {
			try {
				pstmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		if(con != null) {
			try {
				con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
	}
	
	/* 각 게시판별 게시물 갯수 세는 메소드 (for paging) */
	public int selectListCount(String sort) {	// sort : 게시판 종류
		connect();
		int listCount = 0;
		ResultSet rs = null;
		
		try {
			pstmt = con.prepareStatement("select count(*) from board where sort = ?");
			pstmt.setString(1, sort);
			
			rs = pstmt.executeQuery();
			if(rs.next()) {
				listCount = rs.getInt(1);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			disconnect();
		}
		return listCount;
	}
	
	
	
	/* 게시판별 게시글 전체 출력 메소드 */
	public ArrayList<BoardDTO> selectArticleList(String sort, int page, int limit) {	// 매개변수들이 추가됨.
		
		// page, limit 활용 추가해 10개만 출력하기 (pstmt 활용 예정)
		connect();
		BoardDTO dto = null;	
		ArrayList<BoardDTO> boardList = new ArrayList<BoardDTO>();
		String board_list_sql="select * from board where sort=? order by orders desc limit ?,15";
		int startrow = (page-1)*15; 	
		
		try {
			// stmt = con.createStatement();
			pstmt = con.prepareStatement(board_list_sql);
			pstmt.setString(1, sort);
			pstmt.setInt(2, startrow);
			
			// ResultSet rs = stmt.executeQuery("select * from board where sort='"+sort+"' order by orders desc;");
			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next()) {
				dto = new BoardDTO();	// dto 객체 생성.
				dto.setOrders(rs.getInt("orders"));
				dto.setSort(rs.getString("sort"));
				dto.setWriter_id(rs.getString("writer_id"));
				dto.setTitle(rs.getString("title"));
				dto.setContent(rs.getString("content"));
				dto.setWrited_date(rs.getString("writed_date"));
				dto.setCheck_num(rs.getInt("check_num"));
				dto.setLike_num(rs.getInt("like_num"));
				dto.setAttached(rs.getString("attached"));
				
				boardList.add(dto);		// ArrayList에 추가.
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			disconnect();
			
		}
		return boardList;		// 이 메소드를 사용하는 곳으로 ArrayList를 리턴.
	}
	
	
	/* 이전글, 다음글 기능을 위한 select */
	public ArrayList<Integer> select(String sort) {
		connect();
		ArrayList<Integer> boardList = new ArrayList<>();
	
		try {
			stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery("select orders from board where sort = '"+ sort +"' order by orders desc;");
			
			while(rs.next()) {
				int orders = rs.getInt(1);
				boardList.add(orders);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			disconnect();
		}
		return boardList;
	}
	
	
	/* 게시글이 첫번째인지, 마지막인지 확인용 메소드 (view에서 이전글, 다음글 처리 때문) */
	public int[] checkArticleNum(String sort) {	
		connect();
		
		int[] articleNum = new int[2];	// 첫번째, 마지막 게시물 번호 들어갈거임.
	
		try {
			stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery("select max(orders), min(orders) from board where sort = '"+ sort +"';");
			
			if(rs.next()) {
				articleNum[0] = rs.getInt(1);
				articleNum[1] = rs.getInt(2);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			disconnect();
		}
		return articleNum;		// 한 게시판의 board_number 최대값, 최솟값 반환
	}
	
	
	/* 검색 기능을 위한 select */
	public ArrayList<BoardDTO> search(String board_sort, String day, String sort, String content, int page, int limit) {   // day, sort: 검색조건 / content: 검색내용 
		connect();
		BoardDTO dto = null;		    // 가져온 정보 담기 위함.
		ArrayList<BoardDTO> boardList = new ArrayList<BoardDTO>();
		int startrow = (page-1)*15; 	
		
		try {
			// stmt = con.createStatement();
			ResultSet rs = null;
			
			/* 다른 조건도 작업 필요 */
			// 전체기간
			if(day.equals("전체기간")) {
				if(sort.equals("제목+내용")) {
					pstmt = con.prepareStatement("select * from board where sort=? and (title like ? or content like ?) order by orders desc limit ?, 15;");
					pstmt.setString(1, board_sort);
					pstmt.setString(2, "%"+content+"%");
					pstmt.setString(3, "%"+content+"%");
					pstmt.setInt(4, startrow);
					rs = pstmt.executeQuery();
				}
				if(sort.equals("제목만")) {
					pstmt = con.prepareStatement("select * from board where sort=? and title like ? order by orders desc limit ?, 15;");
					pstmt.setString(1, board_sort);
					pstmt.setString(2, "%"+content+"%");
					pstmt.setInt(3, startrow);
					rs = pstmt.executeQuery();
				}
			
			}
			// 1일
			if(day.equals("1일")) {
				if(sort.equals("제목+내용")) {
					pstmt = con.prepareStatement("select * from board where sort=? and writed_date >= date_add(now(), interval -1 day) and (title like ? or content like ?) order by orders desc limit ?, 15;");
					pstmt.setString(1, board_sort);
					pstmt.setString(2, "%"+content+"%");
					pstmt.setString(3, "%"+content+"%");
					pstmt.setInt(4, startrow);
					rs = pstmt.executeQuery();				
				}
				if(sort.equals("제목만")) {
//					rs = stmt.executeQuery("select * from board where writed_date >= date_add(now(), interval -1 day) and title like '%"+content+"%'"
//							+ " order by orders desc;");	
					pstmt = con.prepareStatement("select * from board where sort=? and writed_date >= date_add(now(), interval -1 day) and title like ? order by orders desc limit ?, 15;");
					pstmt.setString(1, board_sort);
					pstmt.setString(2, "%"+content+"%");
					pstmt.setInt(3, startrow);
					rs = pstmt.executeQuery();
				}	
			}
			if(day.equals("1주")) {
				if(sort.equals("제목+내용")) {
//					rs = stmt.executeQuery("select * from board where writed_date >= date_add(now(), interval -1 week) and (title like '%"+content+"%' or content like '%"+content+"%')"
//							+ " order by orders desc;");	
					pstmt = con.prepareStatement("select * from board where sort=? and writed_date >= date_add(now(), interval -1 week) and (title like ? or content like ?) order by orders desc limit ?, 15;");
					pstmt.setString(1, board_sort);
					pstmt.setString(2, "%"+content+"%");
					pstmt.setString(3, "%"+content+"%");
					pstmt.setInt(4, startrow);
					rs = pstmt.executeQuery();
				}
				if(sort.equals("제목만")) {
//					rs = stmt.executeQuery("select * from board where writed_date >= date_add(now(), interval -1 week) and title like '%"+content+"%'"
//							+ " order by orders desc;");
					pstmt = con.prepareStatement("select * from board where sort=? and writed_date >= date_add(now(), interval -1 week) and title like ? order by orders desc limit ?, 15;");
					pstmt.setString(1, board_sort);
					pstmt.setString(2, "%"+content+"%");
					pstmt.setInt(3, startrow);
					rs = pstmt.executeQuery();
				}	
			}
		
			while(rs.next()) {
				dto = new BoardDTO();	  // dto 객체 생성.
				dto.setOrders(rs.getInt("orders"));
				dto.setSort(rs.getString("sort"));
				dto.setWriter_id(rs.getString("writer_id"));
				dto.setTitle(rs.getString("title"));
				dto.setContent(rs.getString("content"));
				dto.setWrited_date(rs.getString("writed_date"));
				dto.setCheck_num(rs.getInt("check_num"));
				dto.setLike_num(rs.getInt("like_num"));
				dto.setAttached(rs.getString("attached"));
				
				boardList.add(dto);		// ArrayList에 추가.
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			disconnect();
		}
		return boardList;		// 이 메소드를 사용하는 곳으로 ArrayList를 리턴.
	}
	
	
	// 글번호에 따른 '상세페이지' 출력 메소드
	public BoardDTO content(int orders) {
		connect();
		BoardDTO dto = null;		    // 가져온 정보 담기 위함.
		
		try {
			stmt = con.createStatement();
			
			ResultSet rs = stmt.executeQuery("select * from board where orders="+orders+";");

			while(rs.next()) {
				dto = new BoardDTO();	// dto 객체 생성.
				dto.setOrders(rs.getInt("orders"));
				dto.setSort(rs.getString("sort"));
				dto.setWriter_id(rs.getString("writer_id"));
				dto.setTitle(rs.getString("title"));
				dto.setContent(rs.getString("content"));
				dto.setWrited_date(rs.getString("writed_date"));
				dto.setCheck_num(rs.getInt("check_num"));
				dto.setLike_num(rs.getInt("like_num"));
				dto.setAttached(rs.getString("attached"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			disconnect();
		}
		return dto;		// 이 메소드를 사용하는 곳으로 ArrayList를 리턴.
	}
	
	
	/* 새로 작성한 글 DB입력 */
	public int insert(BoardDTO dto) {
		connect();
		
		String id = dto.getWriter_id();
		String sort = dto.getSort();
		String title = dto.getTitle();
		String content = dto.getContent();
		String attached = dto.getAttached();	// freeBoard에선 null값 오류 뜰 수도. 확인해보기.
		
		int result = 0;
		
		try {
			stmt = con.createStatement();
			
			result = stmt.executeUpdate("insert into board(sort, writer_id, title, content, writed_date, check_num, like_num, attached)"
					+ "values('"+sort+"', '"+id+"', '"+title+"', '"+content+"', now(), 0, 0, '"+attached+"');");
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			disconnect();
		}
		return result;
	}
	
	/* 글 수정 */
	public int update(BoardDTO dto) {
		connect();
		
		int orders = dto.getOrders();
		String sort = dto.getSort();
		String title = dto.getTitle();
		String content = dto.getContent();
		String attached = dto.getAttached();
		
		int result = 0;
		
		try {
			stmt = con.createStatement();
			
			result = stmt.executeUpdate("update board set sort='"+sort+"', title='"+title+"', content='"+
					content+"', attached='"+attached+"' where orders="+orders+";");
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			disconnect();
		}
		return result;
	}
	
	
	/* 글 삭제 */
	public int delete(int orders) {
		connect();
		int result = 0;
		
		try {
			stmt = con.createStatement();
			result = stmt.executeUpdate("delete from board where orders="+orders+";");

			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			disconnect();
		}
		return result;
	}
	
	/* 조회수 입력 */
	public int hits(int orders) {
		connect();
		int result = 0;
		
		// 문제 : 글쓴이라면, 증가되지 않아야 함. + 동일한 사람이 2번이상 조회하면 1번으로 처리. (중복방지는 실무에서 대게 cookie를 쓴다고 함.)
		try {
			stmt = con.createStatement();
			result = stmt.executeUpdate("update board set check_num=check_num+1 where orders="+orders+";");

			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			disconnect();
		}
		return result;
	}
	
	/* 좋아요 입력 */
	public int likePlus(int orders) {
		connect();
		int result = 0;
		
		// 문제 : 글쓴이라면, 증가되지 않아야 함. + 동일한 사람이 2번이상 조회하면 1번으로 처리. (중복방지는 실무에서 대게 cookie를 쓴다고 함.)
		try {
			stmt = con.createStatement();
			result = stmt.executeUpdate("update board set like_num=like_num+1 where orders="+orders+";");

			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			disconnect();
		}
		return result;
	}
	
	/* 게시글별 댓글 insert 메소드 */
	public int insertComment(CommentDTO dto) {
		connect();
		
		String writer_id = dto.getWriter_id();
		String board_sort = dto.getBoard_sort();
		int board_num = dto.getBoard_num();
		String content = dto.getContent();
		
		int result = 0;
		
		try {
			pstmt = con.prepareStatement("insert into board_comment values(default, ?, ?, now(), ?, ?);");
			pstmt.setString(1, writer_id);
			pstmt.setString(2, content);
			pstmt.setInt(3, board_num);
			pstmt.setString(4, board_sort);
			result = pstmt.executeUpdate();
		
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			disconnect();
		}
		return result;
	}
	
	
	/* 댓글 select용 메소드 */
	public ArrayList<CommentDTO> selectComment(int board_num) {
		CommentDTO commentDTO = null;
		ArrayList<CommentDTO> commentList = new ArrayList<CommentDTO>();
		ResultSet rs = null;
		connect();
		
	
		try {
			pstmt = con.prepareStatement("select * from board_comment where board_num=? order by comment_num desc;");
			pstmt.setInt(1, board_num);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				commentDTO = new CommentDTO();
				commentDTO.setComment_num(rs.getInt(1));
				commentDTO.setWriter_id(rs.getString(2));
				commentDTO.setContent(rs.getString(3));
				commentDTO.setWrited_date(rs.getString(4));
				
				commentList.add(commentDTO);
			}
		
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			disconnect();
		}
		
		return commentList;
	}
	
	
	/* 댓글 삭제 */
	public int deleteComment(int comment_num) {
		connect();
		int result = 0;
		
		try {
			pstmt = con.prepareStatement("delete from board_comment where comment_num=?;");
			pstmt.setInt(1, comment_num);
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			disconnect();
		}
		return result;
	}
	
	/* 좋아요 증가 */
	public int addLikeNum(int board_num) {
		connect();
		int result = 0;
		
		try {
			pstmt = con.prepareStatement("update board set like_num = like_num+1 where orders=?");
			pstmt.setInt(1, board_num);
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			disconnect();
		}
		return result;
	}
	
	/* 좋아요 감소 */
	public int decreaseLikeNum(int board_num) {
		connect();
		int result = 0;
		
		try {
			pstmt = con.prepareStatement("update board set like_num = like_num-1 where orders=?");
			pstmt.setInt(1, board_num);
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			disconnect();
		}
		return result;
	}
	
	/* 좋아요 테이블 튜플 추가 */
	public int insertLikeNum(String member_id, int board_num) {
		connect();
		int result = 0;
		
		try {
			pstmt = con.prepareStatement("insert into member_like_info values(?, ?)");
			pstmt.setString(1, member_id);		// 회원 id
			pstmt.setInt(2, board_num);			// 게시물 번호
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			disconnect();
		}
		return result;
	}
	
	/* 좋아요 테이블 튜플 제거 */
	public int deleteLikeNum(String member_id, int board_num) {
		connect();
		int result = 0;
		
		try {
			pstmt = con.prepareStatement("delete from member_like_info where member_id=? and board_num=?");
			pstmt.setString(1, member_id);		// 회원 id
			pstmt.setInt(2, board_num);			// 게시물 번호
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			disconnect();
		}
		return result;
	}
	
	/* 좋아요 테이블 select (상세페이지용) */
	public boolean getLikeNum(String member_id, int board_num) {
		connect();
		boolean result = false;		// true : 좋아요를 눌렀던 게시물
		ResultSet rs = null;
		
		try {
			pstmt = con.prepareStatement("select board_num from member_like_info where member_id=? and board_num=?");
			pstmt.setString(1, member_id);		// 회원 id
			pstmt.setInt(2, board_num);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				result = true;
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			disconnect();
		}
		return result;		// 쿼리결과가 없으면 false, 있으면 true를 반환.
	}

	
	
	/*---------------- 페이지 넘기기를 위한 작업 (자유게시판용) ---------------- */
	
	// 마지막 게시물 번호 추출 목적의 메소드
	public int getNext() {
		connect();
		String sql = "select orders from board order by orders desc";
		
		try {
			//  PreparedStatement 는 SQL문에서 Like키워드를 사용할경우 사용할수없다.
			PreparedStatement pstmt = con.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			
			if(rs.next()) {	
				return rs.getInt(1) + 1;	// 마지막 게시물 번호+1 => getList()메소드에서 쓸거임!
											// #.근데 이거, 굳이 모두 select해야하나? 가장 큰 값 불러오면 되지않음? (문제되는 상황이 있을지 생각해보자)
			}
			return 1;	// 첫번째 게시물인 경우
				
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			disconnect();
		}
		return -1;		// DB 오류 시.
	}
	
	
	public ArrayList<BoardDTO> getList(int pageNum) {		// 매개변수로 pageNum.
		connect();
		BoardDTO dto = null;		    // 가져온 정보 담기 위함.
		ArrayList<BoardDTO> boardList = new ArrayList<BoardDTO>();
		String sql = "select * from board where orders<? and sort='자유게시판' order by orders desc limit 15;";
		
		try {
			PreparedStatement pstmt = con.prepareStatement(sql);
			// setInt() : 컴마 앞은 위의 ? 위치(인덱스). 컴마 뒤는 값.
			pstmt.setInt(1, getNext() - (pageNum - 1)*15);	// 이해했다. 문제는, 게시글 번호 중간에 비는 숫자가 없어야함. (삭제하면 비는 상태임)
						                                    //  db의 rowNumber를 따와서 해결하자! ★★★
			ResultSet rs = pstmt.executeQuery();
		
			while(rs.next()) {
				dto = new BoardDTO();	// dto 객체 생성.
				dto.setOrders(rs.getInt("orders"));
				dto.setSort(rs.getString("sort"));
				dto.setWriter_id(rs.getString("writer_id"));
				dto.setTitle(rs.getString("title"));
				dto.setContent(rs.getString("content"));
				dto.setWrited_date(rs.getString("writed_date"));
				dto.setCheck_num(rs.getInt("check_num"));
				dto.setLike_num(rs.getInt("like_num"));
				dto.setAttached(rs.getString("attached"));
				
				boardList.add(dto);		// ArrayList에 추가.
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			disconnect();
		}
		return boardList;		// 이 메소드를 사용하는 곳으로 ArrayList를 리턴.
	}
	
	// 게시글이 15개면, 다음페이지가 없는 등 페이지 처리를 위한 메소드.
	public boolean nextPage(int pageNum) {	
		connect();

		String sql = "select * from board where orders<?;";
		
		try {
			PreparedStatement pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, getNext() - (pageNum - 1)*15);
			ResultSet rs = pstmt.executeQuery();
		
			if(rs.next()) {
				return true;		// 다음페이지로 넘어갈 수 있다.
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			disconnect();
		}
		return false;		// 다음페이지는 없어도 됨.
	}
	
	

}
