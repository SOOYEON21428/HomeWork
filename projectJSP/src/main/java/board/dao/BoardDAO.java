package board.dao;

import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import board.bean.BoardDTO;

public class BoardDAO {

    private SqlSessionFactory sqlSessionFactory;

    private static BoardDAO boardDAO = new BoardDAO();

    public static BoardDAO getInstance() {
        return boardDAO;
    }

    private BoardDAO() {
        try {
            String resource = "mybatis-config.xml";
            InputStream inputStream = Resources.getResourceAsStream(resource);
            sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    // 게시글 작성
    public void boardWrite(String id, String name, String email, String subject, String content) {
        try (SqlSession sqlSession = sqlSessionFactory.openSession()) {
            sqlSession.insert("boardSQL.boardWrite", new BoardDTO(id, name, email, subject, content));
            sqlSession.commit();
        }
    }

    // 게시물 출력
    public ArrayList<BoardDTO> loadContents(int startNum, int endNum) {
        try (SqlSession sqlSession = sqlSessionFactory.openSession()) {
            return new ArrayList<>(sqlSession.selectList("boardSQL.loadContents", new BoardDTO(startNum, endNum)));
        }
    }

    public int getTotalA() {
        try (SqlSession sqlSession = sqlSessionFactory.openSession()) {
            return sqlSession.selectOne("boardSQL.getTotalA");
        }
    }
}
