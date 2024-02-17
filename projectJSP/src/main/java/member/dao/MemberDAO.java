package member.dao;

import java.io.IOException;
import java.io.InputStream;
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
        boolean exist = false;
        try (SqlSession sqlSession = sqlSessionFactory.openSession()) {
            exist = sqlSession.selectOne("memberSQL.isExistID", id) != null;
        }
        return exist;
    }

    public boolean insert(MemberDTO memberDTO) {
        try (SqlSession sqlSession = sqlSessionFactory.openSession()) {
            sqlSession.insert("memberSQL.insert", memberDTO);
            sqlSession.commit();
        }
        return true;
    }

    public MemberDTO login(String id, String pwd) {
        MemberDTO memberDTO = null;
        try (SqlSession sqlSession = sqlSessionFactory.openSession()) {
            memberDTO = sqlSession.selectOne("memberSQL.login", new MemberDTO(id, pwd));
        }
        return memberDTO;
    }
}
