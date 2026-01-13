package service;

import db.DBConnectionProvider;
import model.Customer;

import java.sql.*;
import java.util.List;

public class CustomerService {
    private Connection connection = DBConnectionProvider.getInstance().getConnection();

    public void addCustomer(Customer customer) {
        String sql = "INSERT INTO `customer` (name, surname, license_number, phone, email) VALUES (?, ?, ?, ?, ?)";

        try(PreparedStatement statement = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {
            statement.setString(1, customer.getName());
            statement.setString(2, customer.getSurname());
            statement.setString(3, customer.getLicenseNumber());
            statement.setString(4, customer.getPhone());
            statement.setString(5, customer.getEmail());
            statement.executeUpdate();
            ResultSet rs = statement.getGeneratedKeys();
            if(rs.next()) {
                customer.setId(rs.getInt(1));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void deleteCustomer(int id) {
        String sql = "DELETE FROM `customer` WHERE id = ?";
        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setInt(1, id);
            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public Customer getCustomerById(int id){
        String sql = "SELECT * FROM `customer` WHERE id = ?";
        try(PreparedStatement statement = connection.prepareStatement(sql)){
            statement.setInt(1, id);
            ResultSet rs = statement.executeQuery();
            if(rs.next()) {
                return new Customer(rs.getInt("id"), rs.getString("name"), rs.getString("surname"), rs.getString("license_number"), rs.getString("phone"), rs.getString("email"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public List<Customer> getAllCustomers(){
        List<Customer> customers = new java.util.ArrayList<>();
        String sql = "SELECT * FROM `customer`";
        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                customers.add(new Customer(rs.getInt("id"), rs.getString("name"), rs.getString("surname"), rs.getString("license_number"), rs.getString("phone"), rs.getString("email")));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return customers;
    }

    public void updateCustomer(Customer customer) {
        String sql = "UPDATE `customer` SET name = ?, surname = ?, license_number = ?, phone = ?, email = ? WHERE id = ?";
        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setString(1, customer.getName());
            statement.setString(2, customer.getSurname());
            statement.setString(3, customer.getLicenseNumber());
            statement.setString(4, customer.getPhone());
            statement.setString(5, customer.getEmail());
            statement.setInt(6, customer.getId());
            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
