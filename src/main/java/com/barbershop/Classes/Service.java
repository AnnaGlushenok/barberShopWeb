package com.barbershop.Classes;

import javax.persistence.*;

@Entity
@Table(name = "services")
public class Service {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;
    private Integer idType;
    private String cost;
    private String name;

    public Long getId() {
        return id;
    }

    public Integer getIdType() {
        return idType;
    }

    public String getName() {
        return name;
    }

    public String getCost() {
        return cost;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public void setIdType(Integer idType) {
        this.idType = idType;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setCost(String cost) {
        this.cost = cost;
    }
}
