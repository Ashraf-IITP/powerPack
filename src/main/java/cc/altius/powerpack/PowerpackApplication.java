package cc.altius.powerpack;

import cc.altius.utils.DateUtils;
import java.util.Date;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

@SpringBootApplication
public class PowerpackApplication {

    public static void main(String[] args) {
        SpringApplication.run(PowerpackApplication.class, args);
            String rawPassword = "password";
            System.out.println("Password: " + new BCryptPasswordEncoder().encode(rawPassword));
    }

}
