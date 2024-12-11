package br.com.gustavgomes.dashapi.services;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.crypto.argon2.Argon2PasswordEncoder;

public class PasswordHashingService {
    private final Argon2PasswordEncoder argon2PasswordEncoder;

    public PasswordHashingService(
            @Value("${security.argon2.memory}") int memory,
            @Value("${security.argon2.iterations}") int iterations,
            @Value("${security.argon2.parallelism}") int parallelism
    ) {
        this.argon2PasswordEncoder = new Argon2PasswordEncoder(
                16,
                32,
                parallelism,
                memory,
                iterations
        );
    }

    public String hashPassword(String rawPassword) {
        return argon2PasswordEncoder.encode(rawPassword);
    }

    public boolean verifyPassword(String rawPassword, String hashedPassword) {
        return argon2PasswordEncoder.matches(rawPassword, hashedPassword);
    }
}
