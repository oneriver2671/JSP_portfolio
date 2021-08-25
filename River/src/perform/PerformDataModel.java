package perform;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.binding.MapperProxy;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import mybatis.SqlMapConfig;
import user.UserDTO;
import vo.MemberLikeInfo;
import vo.PerformSearchInfo;

public class PerformDataModel {
	
	static PerformDataModel model = new PerformDataModel();
	public static PerformDataModel instance() {
		return model;
	}
	
	SqlSessionFactory factory = SqlMapConfig.getSqlSession();
	
	
	/* 공연정보 입력 */
	public int insertPerform(PerformDTO performDTO){
		int result = 0;
		SqlSession sqlSession = factory.openSession();
		result = sqlSession.insert("performInsert", performDTO);
		
		sqlSession.commit();	// select와 다르게 꼭 필요한 ★★★
		sqlSession.close();
		
		return result;
	}
	
	/* 공연 List 출력 */
	public List<PerformDTO> getPerformList(int page){
		List<PerformDTO> performList = null;
		int startrow = 0;
		startrow = (page-1)*15;
		SqlSession sqlSession = factory.openSession();
		performList = sqlSession.selectList("getPerformList", startrow);
		sqlSession.close();
		
		return performList;
	}
	
	/* 공연 List 출력 (날짜 선택 시) */
	public List<PerformDTO> getPerformListByDate(int page, int startDate, int endDate){
		List<PerformDTO> performList = null;
		PerformSearchInfo performSearchInfo = new PerformSearchInfo();
		int startrow = 0;
		startrow = (page-1)*15;
		
		performSearchInfo.setStartrow(startrow);
		performSearchInfo.setStartDate(startDate);
		performSearchInfo.setEndDate(endDate);

		SqlSession sqlSession = factory.openSession();
		performList = sqlSession.selectList("getPerformListByDate", performSearchInfo);
		sqlSession.close();
		
		return performList;
	}
	
	/* 공연 List 출력 (날짜+장소 선택 시) */
	public List<PerformDTO> getPerformListByLocation(int page, int startDate, int endDate, String location){
		List<PerformDTO> performList = null;
		PerformSearchInfo performSearchInfo = new PerformSearchInfo();
		int startrow = 0;
		startrow = (page-1)*15;
		
		performSearchInfo.setStartrow(startrow);
		performSearchInfo.setStartDate(startDate);
		performSearchInfo.setEndDate(endDate);
		performSearchInfo.setLocation(location);
		

		SqlSession sqlSession = factory.openSession();
		performList = sqlSession.selectList("getPerformListByLocation", performSearchInfo);
		sqlSession.close();
		
		return performList;
	}
	
	
	
	
	/* 공연 List 출력 (관리자용) */
	public List<PerformDTO> getPerformListManager(){
		List<PerformDTO> performList = null;
		
		SqlSession sqlSession = factory.openSession();
		performList = sqlSession.selectList("getPerformListManager");
		sqlSession.close();
		
		return performList;
	}
	
	/* 공연 상세페이지 출력 */
	public PerformDTO getPerformDetail(int perform_num){
		PerformDTO performDTO = null;

		SqlSession sqlSession = factory.openSession();
		performDTO = sqlSession.selectOne("getPerformDetail", perform_num);
		sqlSession.close();
		
		return performDTO;
	}	
	
	/* 공연정보 삭제 */
	public int deletePerform(int perform_num){
		int result = 0;
		
		SqlSession sqlSession = factory.openSession();
		result = sqlSession.delete("performDelete", perform_num);
		sqlSession.commit();
		sqlSession.close();
		
		return result;
	}
	
	/* 공연정보 수정 */
	public int updatePerform(PerformDTO performDTO){
		int result = 0;
		
		SqlSession sqlSession = factory.openSession();
		result = sqlSession.update("performUpdate", performDTO);
		sqlSession.commit();	
		sqlSession.close();
		
		return result;
	}
	
	/* 전체 공연 갯수 파악 (for paging처리)  */
	public int getPerformListCount(){
		int result = 0;
		
		SqlSession sqlSession = factory.openSession();
		result = sqlSession.selectOne("performListCount");
		sqlSession.close();
		
		return result;
	}
	
	/* 전체 공연 갯수 파악 (for paging처리 / 날짜 선택 시)  */
	public int getPerformListCountByDate(int startDate, int endDate){
		int result = 0;
		PerformSearchInfo performSearchInfo = new PerformSearchInfo();
		performSearchInfo.setStartDate(startDate);
		performSearchInfo.setEndDate(endDate);
		
		SqlSession sqlSession = factory.openSession();
		result = sqlSession.selectOne("performListCountByDate", performSearchInfo);
		sqlSession.close();
		
		return result;
	}
	
	/* 전체 공연 갯수 파악 (for paging처리 / 날짜 + 장소 선택 시)  */
	public int getPerformListCountByLocation(int startDate, int endDate, String location){
		int result = 0;
		PerformSearchInfo performSearchInfo = new PerformSearchInfo();
		performSearchInfo.setStartDate(startDate);
		performSearchInfo.setEndDate(endDate);
		performSearchInfo.setLocation(location);
		
		SqlSession sqlSession = factory.openSession();
		result = sqlSession.selectOne("performListCountByLocation", performSearchInfo);
		sqlSession.close();
		
		return result;
	}
	
	
	/* 멤버-공연 좋아요 정보 추가 */
	public int insertPerformLikeInfo (String member_id, int perform_num){
		int result = 0;
		MemberLikeInfo memberLikeInfo = new MemberLikeInfo();
		memberLikeInfo.setMember_id(member_id);
		memberLikeInfo.setPerform_num(perform_num);
		
		SqlSession sqlSession = factory.openSession();
		result = sqlSession.insert("performLikeInsert", memberLikeInfo);
		sqlSession.commit();	
		sqlSession.close();
		
		return result;
	}
	
	/* 공연정보 좋아요 갯수 증가 */
	public int addPerformLike(int perform_num){
		int result = 0;
		
		SqlSession sqlSession = factory.openSession();
		result = sqlSession.update("performLikeAdd", perform_num);
		sqlSession.commit();	
		sqlSession.close();
		
		return result;
	}
	
	/* 멤버-공연 좋아요 정보 제거 */
	public int deletePerformLikeInfo (String member_id, int perform_num){
		int result = 0;
		MemberLikeInfo memberLikeInfo = new MemberLikeInfo();
		memberLikeInfo.setMember_id(member_id);
		memberLikeInfo.setPerform_num(perform_num);
		
		SqlSession sqlSession = factory.openSession();
		result = sqlSession.delete("performLikeDelete", memberLikeInfo);
		sqlSession.commit();	
		sqlSession.close();
		
		return result;
	}
	
	/* 공연정보 좋아요 갯수 감소 */
	public int reducePerformLike(int perform_num){
		int result = 0;
		
		SqlSession sqlSession = factory.openSession();
		result = sqlSession.update("performLikeReduce", perform_num);
		sqlSession.commit();	
		sqlSession.close();
		
		return result;
	}
	
	/* 회원이 누른 좋아요 공연정보 확인용 */
	public boolean getPerformLikeNum(String member_id, int perform_num){
		
		boolean result = false;
		MemberLikeInfo memberLikeInfo = new MemberLikeInfo();
		memberLikeInfo.setMember_id(member_id);
		memberLikeInfo.setPerform_num(perform_num);
		
		SqlSession sqlSession = factory.openSession();
		if(sqlSession.selectOne("performLikeInfo", memberLikeInfo) != null) {	
			result =true;
		}
		sqlSession.close();
		
		return result;
	}
	
	/* (티켓예매) 좌석정보 뽑아오기 */
	public PerformSeatDTO selectPerformSeat(int perform_num){
		PerformSeatDTO performSeatDTO = null;
		
		SqlSession sqlSession = factory.openSession();
		performSeatDTO = sqlSession.selectOne("selectPerformSeat", perform_num);	
		sqlSession.close();
		
		return performSeatDTO;
	}
	
	/* (티켓예매) 좌석정보 수정 */
	public int updatePerformSeat(PerformSeatDTO performSeatDTO){
		int result = 0;
		
		SqlSession sqlSession = factory.openSession();
		result = sqlSession.update("performBookUpdate", performSeatDTO);
		sqlSession.commit();	
		sqlSession.close();
		
		return result;
	}
	
	/* (티켓예매) 예약정보 입력 */
	public int insertPerformBook(PerformBookDTO performBookDTO){
		int result = 0;
		
		
		SqlSession sqlSession = factory.openSession();
		result = sqlSession.insert("performBookInsert", performBookDTO);	
		sqlSession.commit();
		sqlSession.close();
		
		return result;
	}
	
	/* (티켓예매) 회원정보 가져오기 */
	public UserDTO selectBookMemberInfo(String memberId){
		UserDTO userDTO = null;
		
		SqlSession sqlSession = factory.openSession();
		userDTO = sqlSession.selectOne("selectBookMemberInfo", memberId);	
		sqlSession.close();
		
		return userDTO;
	}
	
	

	
}
