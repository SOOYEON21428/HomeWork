    package member.dao;

    import java.io.IOException;
import java.io.InputStream;
import java.util.HashMap;
    import java.util.Map;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
    import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import member.bean.MemberDTO;

    public class MemberDAO {
        private SqlSessionFactory sqlSessionFactory;

        private static MemberDAO memberDAO = new MemberDAO();

        public static MemberDAO getInstance() {
            return memberDAO;
        }

        private MemberDAO() {
        	try {
                String resource = "mybatis-config.xml";
                InputStream inputStream = Resources.getResourceAsStream(resource);
                sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
            } catch (IOException e) {
                e.printStackTrace();
            }
        
        }

        public boolean isExistID(String id) {
            try (SqlSession sqlSession = sqlSessionFactory.openSession()) {
                return sqlSession.selectOne("memberSQL.isExistID", id);
            }
        }

        public boolean insert(MemberDTO memberDTO) {
            try (SqlSession sqlSession = sqlSessionFactory.openSession()) {
                sqlSession.insert("memberSQL.insert", memberDTO);
                sqlSession.commit();
                return true;
            }
        }

        public MemberDTO login(String id, String pwd) {
            try (SqlSession sqlSession = sqlSessionFactory.openSession()) {
                Map<String, String> map = new HashMap<>();
                map.put("id", id);
                map.put("password", pwd);
                return sqlSession.selectOne("memberSQL.login", map);
            }
        }
    }
