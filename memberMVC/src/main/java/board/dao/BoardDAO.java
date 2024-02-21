package board.dao;

import board.bean.BoardDTO;
import org.apache.ibatis.exceptions.PersistenceException;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import java.io.IOException;
import java.io.InputStream;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public class BoardDAO {
    private SqlSessionFactory sqlSessionFactory;

    private static BoardDAO boardDAO = new BoardDAO();
    public static BoardDAO getInstance() { return boardDAO; }

    public BoardDAO(){
        try {
            String resource = "mybatis-config.xml";
            InputStream inputStream = Resources.getResourceAsStream(resource);
            sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
        } catch (IOException e){
            e.printStackTrace();
        }
    }

    public boolean makeBoard(Map<String, String> map){
        try {
            SqlSession sqlSession = sqlSessionFactory.openSession();
            sqlSession.insert("boardSQL.makeBoard", map);
            sqlSession.commit();
            sqlSession.close();
            return true;
        }catch(PersistenceException e){
            e.printStackTrace();
            return false;
        }
    }
}