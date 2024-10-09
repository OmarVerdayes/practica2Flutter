import 'package:flutter/material.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({super.key});

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  bool _isObcureP = true;
  bool _isObcureCP = true;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  // Función para validar la confirmación de la contraseña
  String? confirmPassword(String? confirmPassword) {
    if (confirmPassword == null || confirmPassword.isEmpty) {
      return 'Por favor, confirme su contraseña';
    } else if (_passwordController.text != confirmPassword) {
      return 'Las contraseñas no coinciden';
    }
    return null;
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Por favor, ingrese su contraseña';
    }
    return null; // Si es válido, no devuelve ningún error
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Inicio de sesión'),
          backgroundColor: Colors.blue,
        ),
        body: Center(
            child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Form(
                    key: _formKey,
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            "assets/logo.png",
                            width: 200,
                            height: 200,
                          ),
                          // Campo de contraseña
                          TextFormField(
                            controller: _passwordController,
                            obscureText: _isObcureP,
                            decoration: InputDecoration(
                                hintText: "Contraseña",
                                label: const Text("Contraseña"),
                                suffixIcon: IconButton(
                                    onPressed: () {
                                      setState(() {
                                        _isObcureP = !_isObcureP;
                                      });
                                    },
                                    icon: Icon(_isObcureP
                                        ? Icons.visibility
                                        : Icons.visibility_off))),
                            validator: validatePassword,
                          ),
                          const SizedBox(
                            height: 32,
                          ),
                          // Campo de confirmación de contraseña
                          TextFormField(
                            controller: _confirmPasswordController,
                            obscureText: _isObcureCP,
                            decoration: InputDecoration(
                                hintText: "Confirmar contraseña",
                                label: const Text("Confirmar contraseña"),
                                suffixIcon: IconButton(
                                    onPressed: () {
                                      setState(() {
                                        _isObcureCP = !_isObcureCP;
                                      });
                                    },
                                    icon: Icon(_isObcureCP
                                        ? Icons.visibility
                                        : Icons.visibility_off))),
                            validator: confirmPassword,
                          ),
                          const SizedBox(
                            height: 64,
                          ),
                          SizedBox(
                            height: 48,
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  Navigator.pushNamed(context, "/");
                                }
                              },
                              style: OutlinedButton.styleFrom(
                                  backgroundColor: Colors.blue,
                                  foregroundColor: Colors.orange[900],
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(16))),
                              child: const Text(
                                "Cambiar contraseña",
                                style: TextStyle(fontSize: 20),
                              ),
                            ),
                          ),
                        ])))));
  }
}
