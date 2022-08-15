package com.barbershop.Controllers;

import com.barbershop.Classes.Service;
import com.barbershop.Classes.ServicesRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

@Controller
public class BarberController {
    @Autowired
    private ServicesRepository servicesRepository;

    @GetMapping("/main")
    public String main(Model model) {
        Iterable<Service> services = servicesRepository.findAll();
        model.addAttribute("services", services);
        return "main";
    }

    @GetMapping("/home")
    public String home(@RequestParam(name = "name", required = false, defaultValue = "orl") String name, Model model) {
        model.addAttribute("name", "home");
        return "home";
    }
}
