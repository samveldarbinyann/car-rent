package service;

import db.DBConnectionProvider;
import model.User;
import model.UserRole;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class UserService {
    private Connection connection = DBConnectionProvider.getInstance().getConnection();

    public void addUser(User user) {
        String sql = "INSERT INTO `user` (name, surname, username, password, role) VALUES (?, ?, ?, ?, ?)";
        try(PreparedStatement statement = connection.prepareStatement(sql)){
            statement.setString(1, user.getName());
            statement.setString(2, user.getSurname());
            statement.setString(3, user.getUsername());
            statement.setString(4, user.getPassword());
            statement.setString(5, user.getRole().name());
            statement.executeUpdate();
            ResultSet rs = statement.getGeneratedKeys();
            if(rs.next()) {
                user.setId(rs.getInt(1));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public User getUserByUsernameAndPassword(String username, String password){
        String sql = "SELECT * FROM `user` WHERE username = ? AND password = ?";
        try(PreparedStatement statement = connection.prepareStatement(sql)){
            statement.setString(1, username);
            statement.setString(2, password);
            ResultSet rs = statement.executeQuery();
            if(rs.next()) {
                return new User(rs.getInt("id"), rs.getString("name"), rs.getString("surname"), rs.getString("username"), rs.getString("password"), UserRole.valueOf(rs.getString("role")));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
    public User getUserByUsername(String username){
        String sql = "SELECT * FROM `user` WHERE username = ?";
        try(PreparedStatement statement = connection.prepareStatement(sql)){
            statement.setString(1, username);
            ResultSet rs = statement.executeQuery();
            if(rs.next()) {
                return new User(rs.getInt("id"), rs.getString("name"), rs.getString("surname"), rs.getString("username"), rs.getString("password"), UserRole.valueOf(rs.getString("role")));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
}
