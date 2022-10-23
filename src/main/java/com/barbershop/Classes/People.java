package com.barbershop.Classes;

import javax.persistence.*;

@Entity
@Table(name = "people")
public class People {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id", nullable = false)
    private Long id;
    private String name;
    private String motto;
    private String description;
    private String path;

    public Long getId() {
        return id;
    }

    public String getName() {
        return name;
    }

    public String getMotto() {
        return motto;
    }

    public String getDescription() {
        return description;
    }

    public String getPath() {
        return path;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setMotto(String motto) {
        this.motto = motto;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public void setPath(String path) {
        this.path = path;
    }
}
