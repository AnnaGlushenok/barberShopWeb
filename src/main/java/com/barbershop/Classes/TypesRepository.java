package com.barbershop.Classes;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Query;
import org.springframework.web.servlet.tags.form.SelectTag;

import java.util.List;

public interface TypesRepository extends JpaRepository<Types, Long> {
    @Query("SELECT name FROM Types t ")
    List<String> getTypes();
}
