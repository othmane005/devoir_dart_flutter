import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const RegisterPage(),
    );
  }
}

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();

  final nom = TextEditingController();
  final email = TextEditingController();
  final tel = TextEditingController();
  final pass = TextEditingController();
  final pass2 = TextEditingController();

  bool hide1 = true;
  bool hide2 = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(20),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xffe3f2fd), Color(0xffbbdefb)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [

                const SizedBox(height: 30),

                const Icon(Icons.person_add,
                    size: 100, color: Colors.indigo),

                const SizedBox(height: 25),

                // NOM de COMPLET
                TextFormField(
                  controller: nom,
                  validator: (v) =>
                      v!.isEmpty ? "Nom requis" : null,
                  decoration: deco("Nom complet", Icons.person),
                ),

                const SizedBox(height: 15),

                // EMAIL
                TextFormField(
                  controller: email,
                  validator: (v) => v!.contains("@")
                      ? null
                      : "Email invalide",
                  keyboardType: TextInputType.emailAddress,
                  decoration: deco("Email", Icons.email),
                ),

                const SizedBox(height: 15),

                // TELEPHONE
                TextFormField(
                  controller: tel,
                  validator: (v) =>
                      v!.length < 8 ? "Numéro invalide" : null,
                  keyboardType: TextInputType.phone,
                  decoration: deco("Téléphone", Icons.phone),
                ),

                const SizedBox(height: 15),

                // MOT DE PASSE
                TextFormField(
                  controller: pass,
                  obscureText: hide1,
                  validator: (v) =>
                      v!.length < 8 ? "Min 8 caractères" : null,
                  decoration: decoPassword(
                    "Mot de passe",
                    Icons.lock,
                    hide1,
                    () => setState(() => hide1 = !hide1),
                  ),
                ),

                const SizedBox(height: 15),

                // CONFIRMATION
                TextFormField(
                  controller: pass2,
                  obscureText: hide2,
                  validator: (v) =>
                      v != pass.text ? "Mot de passe différent" : null,
                  decoration: decoPassword(
                    "Confirmer mot de passe",
                    Icons.lock_outline,
                    hide2,
                    () => setState(() => hide2 = !hide2),
                  ),
                ),

                const SizedBox(height: 25),

                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.indigo,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("Inscription réussie !"),
                            backgroundColor: Colors.green,
                          ),
                        );
                      }
                    },
                    child: const Text("S'inscrire",
                        style: TextStyle(fontSize: 18)),
                  ),
                ),

                const SizedBox(height: 10),

                TextButton(
                  onPressed: () => print("Déjà inscrit ?"),
                  child: const Text("Déjà inscrit ? Se connecter"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  InputDecoration deco(String label, IconData icon) {
    return InputDecoration(
      labelText: label,
      prefixIcon: Icon(icon),
      filled: true,
      fillColor: Colors.white,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }

  InputDecoration decoPassword(
      String label, IconData icon, bool hide, VoidCallback toggle) {
    return InputDecoration(
      labelText: label,
      prefixIcon: Icon(icon),
      suffixIcon: IconButton(
        icon: Icon(hide ? Icons.visibility_off : Icons.visibility),
        onPressed: toggle,
      ),
      filled: true,
      fillColor: Colors.white,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}
