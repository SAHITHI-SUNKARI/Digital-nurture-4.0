package com.example.jpa;

import com.example.model.Employee;
import org.springframework.beans.factory.annotation.Autowired;

import jakarta.transaction.Transactional;

public class EmployeeService {

    @Autowired
    private EmployeeRepository repository;

    @Transactional
    public void addEmployee(Employee employee) {
        repository.save(employee);
    }
}
