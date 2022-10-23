package com.barbershop.Classes;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ServicesRepository extends JpaRepository<Service, Long> {
    @Query("SELECT new com.barbershop.Classes(services.name, cost) FROM services join types on id_type= types.id")
    List<ServiceResponse> getNameCostService(String name);
}
