package com.example;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

import com.example.model.Employee;

public class HibernateTest {
    public static void main(String[] args) {
        SessionFactory factory = new Configuration().configure().buildSessionFactory();
        Session session = factory.openSession();

        Employee emp = new Employee();
        emp.setId(1);
        emp.setName("John Doe");
        emp.setDepartment("IT");

        session.beginTransaction();
        session.save(emp);
        session.getTransaction().commit();
        session.close();
        factory.close();

        System.out.println("Employee inserted successfully.");
    }
}
