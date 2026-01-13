package service;

import db.DBConnectionProvider;
import model.Rental;

import java.sql.*;
import java.util.List;
import java.util.ArrayList;

import model.Car;
import model.Customer;

public class RentalService {
    private Connection connection = DBConnectionProvider.getInstance().getConnection();

    public void totalPrice(Rental rental) {
        if (rental.getStartDate() != null && rental.getEndDate() != null) {
            long days = (rental.getEndDate().getTime() - rental.getStartDate().getTime()) / (1000 * 60 * 60 * 24);
            if (days < 1) {
                days = 1;
            }
            rental.setTotalPrice(rental.getCar().getDailyRate() * days);
        }
    }

    public void createRental(Rental rental) {
        if (rental.getStartDate() == null || rental.getEndDate() == null) {
            throw new IllegalArgumentException("Invalid dates");
        }
        long now = System.currentTimeMillis();
        if (rental.getEndDate().getTime() < now) {
            throw new IllegalArgumentException("Invalid dates");
        }
        if (rental.getEndDate().before(rental.getStartDate())) {
            throw new IllegalArgumentException("Invalid dates");
        }
        String sql = "INSERT INTO `rental` (car_id, customer_id, start_date, end_date, total_cost, status) VALUES (?, ?, ?, ?, ?, ?)";

        try (PreparedStatement statement = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {
            statement.setInt(1, rental.getCar().getId());
            statement.setInt(2, rental.getCustomer().getId());
            statement.setTimestamp(3, new Timestamp(rental.getStartDate().getTime()));
            statement.setTimestamp(4, new Timestamp(rental.getEndDate().getTime()));
            statement.setDouble(5, rental.getTotalPrice());
            statement.setString(6, rental.getStatus());
            statement.executeUpdate();
            ResultSet rs = statement.getGeneratedKeys();
            if (rs.next()) {
                rental.setId(rs.getInt(1));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public List<Rental> getAllRentals() {
        List<Rental> rentals = new ArrayList<>();
        String sql = "SELECT * FROM `rental`";
        CarService carService = new CarService();
        CustomerService customerService = new CustomerService();

        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                Car car = carService.getCarById(rs.getInt("car_id"));
                Customer customer = customerService.getCustomerById(rs.getInt("customer_id"));

                Rental rental = new Rental();
                rental.setId(rs.getInt("id"));
                rental.setCar(car);
                rental.setCustomer(customer);
                rental.setStartDate(new Date(rs.getTimestamp("start_date").getTime()));
                rental.setEndDate(new Date(rs.getTimestamp("end_date").getTime()));
                rental.setTotalPrice(rs.getDouble("total_cost"));
                rental.setStatus(rs.getString("status"));
                rentals.add(rental);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return rentals;
    }

    public void deleteRental(int id) {
        String sql = "DELETE FROM `rental` WHERE id = ?";
        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setInt(1, id);
            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }


}
