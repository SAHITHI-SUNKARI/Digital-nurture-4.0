package com.cognizant.ormlearn.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity                         // Marks this as a JPA entity
@Table(name = "country")        // Maps this class to 'country' table
public class Country {

    @Id                         // Marks 'code' as the primary key
    @Column(name = "co_code")   // Maps to 'co_code' column in table
    private String code;

    @Column(name = "co_name")   // Maps to 'co_name' column in table
    private String name;

    // Getters
    public String getCode() {
        return code;
    }

    public String getName() {
        return name;
    }

    // Setters
    public void setCode(String code) {
        this.code = code;
    }

    public void setName(String name) {
        this.name = name;
    }

    // toString()
    @Override
    public String toString() {
        return "Country [code=" + code + ", name=" + name + "]";
    }
}
