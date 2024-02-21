package member.dao;
import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import member.bean.MemberDTO;

    public class MemberDAO {
        private SqlSessionFactory sqlSessionFactory;

        private static MemberDAO memberDAO = new MemberDAO();

        public static MemberDAO getInstance() {
            return memberDAO;
        }

        public MemberDTO(String id, String pwd) {
        	MemberDTO memberDTO = null;
        	Map<String, String> map = new HashMap<String, String>();
        	map.put("id",id);
        	map.put("pwd", pwd);
        	
        	SqlSession sqlSession = sqlSessionFactory.openSession();
        	sqlSession.selectOne("", map);
        	sqlSession.close();
        	
        	return memberDTO;
        }