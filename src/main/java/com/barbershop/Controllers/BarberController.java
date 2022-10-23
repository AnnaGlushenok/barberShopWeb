package com.barbershop.Controllers;

import com.barbershop.Classes.Service;
import com.barbershop.Classes.ServiceResponse;
import com.barbershop.Classes.ServicesRepository;
import com.barbershop.Classes.Types;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import java.util.List;

@Controller
public class BarberController {
    @Autowired
    private ServicesRepository servicesRepository;
    @PersistenceContext
    private EntityManager em;


    @GetMapping("/main")
    public String main(Model model) {
        List<Service> services = servicesRepository.findAll();
        //List<ServiceResponse> services1 = getService((new Types()).getName());

        //  services.stream().filter(el -> el.getName().equals(""));
        model.addAttribute("services", services);
        return "main";
    }

//    @GetMapping("/a:{name}")
//    public List<ServiceResponse> getService(String name) {
//        return servicesRepository.getNameCostService(name);
//    }
}
