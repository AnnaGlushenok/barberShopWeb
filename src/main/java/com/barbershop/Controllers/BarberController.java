package com.barbershop.Controllers;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class BarberController {
    @GetMapping("/main")
    public String main(@RequestParam(name = "name", required = false, defaultValue = "привет") String name, Model model) {
        model.addAttribute("name", name);
        return "main";
    }

    @GetMapping("/home")
    public String home(@RequestParam(name = "name", required = false, defaultValue = "orl") String name, Model model) {
        model.addAttribute("name", "home");
        return "home";
    }
}
