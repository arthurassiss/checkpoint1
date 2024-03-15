package controller;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class PingController {

    @Value("${spring.profiles.active}")
    private String activeProfile;

    @GetMapping("/ping")
    public String ping() {
        return "Pong em " + activeProfile;
    }
}	
