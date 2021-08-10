package perform;

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

}
