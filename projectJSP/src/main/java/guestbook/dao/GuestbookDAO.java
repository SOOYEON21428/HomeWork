package guestbook.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import guestbook.bean.GuestbookDTO;

public class GuestbookDAO {
    private Connection conn;
    private PreparedStatement pstmt;
    private ResultSet rs;

    private String driver = "oracle.jdbc.driver.OracleDriver";
    private String url = "jdbc:oracle:thin:@localhost:1521:xe";
    private String username = "C##JAVA";
    private String password = "1234";

    private static GuestbookDAO guestbookDAO = new GuestbookDAO();

    public static GuestbookDAO getInstance() {
        return guestbookDAO;
    }

    private GuestbookDAO() {
        try {
            Class.forName(driver);
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    public void getConnection() {
        try {
            conn = DriverManager.getConnection(url, username, password);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void close() {
        try {
            if (rs != null) rs.close();
            if (pstmt != null) pstmt.close();
            if (conn != null) conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public List<GuestbookDTO> getGuestbookList() {
        getConnection();
        List<GuestbookDTO> guestbookList = new ArrayList<>();
        String sql = "SELECT * FROM guestbook ORDER BY seq DESC";

        try {
            pstmt = conn.prepareStatement(sql);
            rs = pstmt.executeQuery();

            while (rs.next()) {
                GuestbookDTO guestbookDTO = new GuestbookDTO();
                guestbookDTO.setSeq(rs.getInt("seq"));
                guestbookDTO.setWriter(rs.getString("writer"));
                guestbookDTO.setEmail(rs.getString("email"));
                guestbookDTO.setHomepage(rs.getString("homepage"));
                guestbookDTO.setTitle(rs.getString("title"));
                guestbookDTO.setContent(rs.getString("content"));
                guestbookDTO.setLogtime(rs.getDate("logtime"));

                guestbookList.add(guestbookDTO);
            }

            // 로그 추가
            for (GuestbookDTO entry : guestbookList) {
                System.out.println(entry.toString());
            }

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            close();
        }

        return guestbookList;
    }

    public void writeGuestbook(GuestbookDTO guestbookDTO) {
        getConnection();
        String sql = "INSERT INTO guestbook VALUES (seq_guestbook.NEXTVAL, ?, ?, ?, ?, ?, SYSDATE)";
        
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, guestbookDTO.getWriter());
            pstmt.setString(2, guestbookDTO.getEmail());
            pstmt.setString(3, guestbookDTO.getHomepage());
            pstmt.setString(4, guestbookDTO.getTitle() != null ? guestbookDTO.getTitle() : "");
            pstmt.setString(5, guestbookDTO.getContent() != null ? guestbookDTO.getContent() : "");

            pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            close();
        }
    }
}
