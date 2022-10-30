package com.barbershop.Controllers;

import com.barbershop.Classes.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.List;

@Controller
public class BarberController {
    @Autowired
    private ServiceRepository servicesRepository;
    @Autowired
    private TypesRepository typesRepository;
    @Autowired
    private PeopleRepository peopleRepository;

    @GetMapping("/main")
    public void main(Model model) {
        fillTable(model);
        fillTeam(model);
    }

    public void fillTable(Model model) {
        List<String> types = typesRepository.getTypes();
        List<Service> hair = servicesRepository.findByType(types.get(0));
        List<Service> beard = servicesRepository.findByType(types.get(1));
        List<Service> complex = servicesRepository.findByType(types.get(2));
        model.addAttribute("hair", hair);
        model.addAttribute("beard", beard);
        model.addAttribute("complex", complex);
    }

    public void fillTeam(Model model) {
        List<People> people = peopleRepository.findAll();
        model.addAttribute("people", people);
    }
}
