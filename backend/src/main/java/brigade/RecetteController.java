package brigade;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.CrossOrigin;

import java.util.List;

@RestController
@CrossOrigin(origins = "*")
public class RecetteController {

    public record Recette(String nom, String region, String difficulte) {}

    public record HealthResponse(String status, String env) {}

    private static final List<Recette> RECETTES = List.of(
        new Recette("Bouillabaisse",  "Provence",     "difficile"),
        new Recette("Ratatouille",    "Provence",     "facile"),
        new Recette("Coq au Vin",     "Bourgogne",    "moyen"),
        new Recette("Tarte Tatin",    "Val de Loire", "facile"),
        new Recette("Creme Brulee",   "National",     "moyen"),
        new Recette("Croissant",      "Paris",        "difficile")
    );

    @GetMapping("/recettes")
    public List<Recette> getRecettes() {
        return RECETTES;
    }

    @GetMapping("/health")
    public HealthResponse health() {
        return new HealthResponse("UP", System.getenv("APP_ENV"));
    }
}
