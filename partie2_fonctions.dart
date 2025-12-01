// fichier: partie2_fonctions.dart
// Partie 2 : Fonctions en Dart

void main() {

  // ------------ Exercice 1 ------------
  int resultat = calculerSomme(10, 20);
  print("Somme = $resultat");

  // ------------ Exercice 2 ------------
  afficherInfos("Youssef", age: 22);
  afficherInfos("Salma", age: 19, ville: "Casablanca");

  // ------------ Exercice 3 ------------
  print(creerUtilisateur("Hassan"));
  print(creerUtilisateur("Amina", "administrateur"));

  // ------------ Exercice 4 ------------
  print(carre(5));
  print(estMajeur(20));
  print(saluer("Othmane"));
}

// Exercice 1
int calculerSomme(int a, int b) => a + b;

// Exercice 2
void afficherInfos(String nom, {int? age, String? ville}) {
  print("Nom: $nom, Age: ${age ?? "---"}, Ville: ${ville ?? "---"}");
}

// Exercice 3
String creerUtilisateur(String nom, [String role = "utilisateur"]) {
  return "Bienvenue $nom, votre rôle est : $role";
}

// Exercice 4
int carre(int n) => n * n;
bool estMajeur(int age) => age >= 18;
String saluer(String nom) => "Bonjour $nom";
