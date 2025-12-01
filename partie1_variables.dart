// fichier: partie1_variables.dart
// Partie 1 : Types de Variables en Dart

void main() {
  // ---------------- Exercice 1 ----------------
  String nom = "Ahmed";
  int age = 20;
  double moyenne = 15.5;
  bool inscrit = true;

  dynamic variableChange = "Bonjour";
  variableChange = 99;

  print("Exercice 1:");
  print("Nom: $nom, Age: $age, Moyenne: $moyenne, Inscrit: $inscrit");
  print("dynamic devient: $variableChange");

  // ---------------- Exercice 2 ----------------
  String? email;
  int id = 101;

  String emailDefaut = email ?? "email@example.com";
  int? longueur = email?.length;

  print("\nExercice 2:");
  print("email par défaut = $emailDefaut");
  print("longueur sécurisée = $longueur");

  // Différences :
  // String  : ne peut pas être null
  // String? : peut être null (Nullable)
  //
  // ?. permet d'éviter les erreurs si la variable est null

  // ---------------- Exercice 3 ----------------
  List<String> prenoms = ["Ahmed", "Fatima", "Youssef", "Amina", "Hassan"];
  prenoms.add("Salma");

  Map<String, int> ages = {
    "Ahmed": 20,
    "Youssef": 24,
    "Salma": 19
  };

  print("\nExercice 3:");
  print("2e prénom = ${prenoms[1]}");

  ages.forEach((k, v) => print("$k -> $v"));

  // ---------------- Exercice 4 ----------------

  // var     : modifiable
  // final   : valeur fixe après assignation
  // const   : valeur fixe dès compilation

  var compteur = 0;
  compteur = 4;

  final date = DateTime.now();
  const pi = 3.14;

  print("\nExercice 4:");
  print("Compteur = $compteur");
  print("Date inscription = $date");
  print("Pi = $pi");

  // final ne peut pas être modifié :
  // date = DateTime.now();  // Erreur !
}
