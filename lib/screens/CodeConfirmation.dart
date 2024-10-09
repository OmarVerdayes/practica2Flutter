import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CodeConfirmation extends StatefulWidget {
  const CodeConfirmation({super.key});

  @override
  State<CodeConfirmation> createState() => _CodeConfirmationState();
}

String? validateCode(String? value) {
  if (value == null || value.isEmpty) {
    return 'Por favor, ingrese su código';
  }

  final int? code = int.tryParse(value);

  if (code == null || code <= 0) {
    return 'Por favor, ingrese un código válido';
  }

  return null; 
}


class _CodeConfirmationState extends State<CodeConfirmation> {
  final TextEditingController _codeController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Confirmación de código'),
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
                TextFormField(
                  decoration: const InputDecoration(labelText: "Ingresa tu código"),
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                  controller: _codeController,
                  validator: validateCode,
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
                        Navigator.pushNamed(context, '/ResetPassword');
                      }
                    },
                    style: OutlinedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      foregroundColor: Colors.orange[900],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    child: const Text(
                      "Confirmar código",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
