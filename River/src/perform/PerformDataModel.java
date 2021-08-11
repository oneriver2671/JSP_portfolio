package perform;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import mybatis.SqlMapConfig;

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
	public List<PerformDTO> getPerformList(){
		List<PerformDTO> performList = null;
		
		SqlSession sqlSession = factory.openSession();
		performList = sqlSession.selectList("getPerformList");
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
		sqlSession.selectList("getPerformList");
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
	
}
