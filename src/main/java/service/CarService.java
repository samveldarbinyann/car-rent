package service;

import db.DBConnectionProvider;
import model.Car;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class CarService {

    private Connection connection = DBConnectionProvider.getInstance().getConnection();

    public void addCar(Car car) {
        String sql = "INSERT INTO `car` (brand, model, year, daily_rate, status) VALUES (?, ?, ?, ?, ?)";

        try (PreparedStatement statement = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {
            statement.setString(1, car.getBrand());
            statement.setString(2, car.getModel());
            statement.setInt(3, car.getYear());
            statement.setDouble(4, car.getDailyRate());
            statement.setString(5, car.getStatus());
            statement.executeUpdate();
            ResultSet rs = statement.getGeneratedKeys();
            if(rs.next()) {
                car.setId(rs.getInt(1));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void deleteCar(int id) {
        String sql = "DELETE FROM `car` WHERE id = ?";
        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setInt(1, id);
            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public Car getCarById(int id) {
        String sql = "SELECT * FROM `car` WHERE id = ?";
        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setInt(1, id);
            ResultSet rs = statement.executeQuery();
            if(rs.next()) {
                return new Car(rs.getInt("id"), rs.getString("brand"), rs.getString("model"), rs.getInt("year"), rs.getDouble("daily_rate"), rs.getString("status"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public void updateCar(Car car) {
        String sql = "UPDATE `car` SET brand = ?, model = ?, year = ?, daily_rate = ?, status = ? WHERE id = ?";
        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setString(1, car.getBrand());
            statement.setString(2, car.getModel());
            statement.setInt(3, car.getYear());
            statement.setDouble(4, car.getDailyRate());
            statement.setString(5, car.getStatus());
            statement.setInt(6, car.getId());
            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public List<Car> getAllCars() {
        List<Car> cars = new ArrayList<>();
        String sql = "SELECT * FROM `car`";
        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                cars.add(new Car(rs.getInt("id"), rs.getString("brand"), rs.getString("model"), rs.getInt("year"), rs.getDouble("daily_rate"), rs.getString("status")));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return cars;
    }

    public List<Car> searchAvailableCars() {
        String sql = "SELECT * FROM `car` WHERE status = 'available'";
        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            ResultSet rs = statement.executeQuery();
            List<Car> cars = new ArrayList<>();
            while (rs.next()) {
                cars.add(new Car(rs.getInt("id"), rs.getString("brand"), rs.getString("model"), rs.getInt("year"), rs.getDouble("daily_rate"), rs.getString("status")));
            }
            return cars;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return new ArrayList<>();
    }
}