package user;

import java.sql.Connection;
import java.sql.PreparedStatement;
import util.DatabaseUtil;

public class UserDAO {

    public int join(String userID, String userPassword, String userName, String userPhone, String userEmail) {
        String SQL = "INSERT INTO user (userID, userPassword, userName, userPhone, userEmail) VALUES (?, ?, ?, ?, ?)";
        try (Connection conn = DatabaseUtil.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(SQL)) {
            pstmt.setString(1, userID);
            pstmt.setString(2, userPassword);
            pstmt.setString(3, userName);
            pstmt.setString(4, userPhone);
            pstmt.setString(5, userEmail);
            return pstmt.executeUpdate(); // 성공 시 1 반환
        } catch (Exception e) {
            e.printStackTrace();
            return -1; // 실패 시 -1 반환
        }
    }
}
