package com.barbershop.Classes;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "service_view")
public class Service {
    @Id
    @Column(name = "id", nullable = false)
    private Long id;
    private String cost;
    private String name;
    private String type;

    public Long getId() {
        return id;
    }

    public String getName() {
        return name;
    }

    public String getCost() {
        return cost;
    }

    public String getType() {
        return type;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setCost(String cost) {
        this.cost = cost;
    }

    public void setType(String type) {
        this.type = type;
    }
}
