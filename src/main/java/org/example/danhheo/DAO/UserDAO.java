package org.example.danhheo.DAO;

import org.example.danhheo.model.User;

import java.util.List;

public interface UserDAO {
    User findByUsernameAndPassword(String username, String password);
    void save(User user);
    User findById(Long id);
    List<User> findAll();
    User findByUsername(String username);
}
