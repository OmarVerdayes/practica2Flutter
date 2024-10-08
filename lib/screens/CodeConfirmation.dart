import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CodeConfirmation extends StatefulWidget {
  const CodeConfirmation({super.key});

  @override
  State<CodeConfirmation> createState() => _CodeConfirmationState();
}

    String ? validateEmail(double? value) {
        // Expresión regular para validar un correo electrónico
        if (value == null) {
            return 'Por favor, ingrese su correo electrónico';
        } else if (value <= 0) {
            return 'Por favor, ingrese un codigo válido';
        }
        return null; // Si es válido, no devuelve ningún error
    }

class _CodeConfirmationState extends State<CodeConfirmation> {
    final TextEditingController _codeController = TextEditingController();
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

    @override
    Widget build(BuildContext context) {
        return Scaffold(
        appBar: AppBar(
            title: const Text('Confirmacion de codigo'),
            backgroundColor: Colors.blue,
        ),
        body: Center(
            child:Padding(
                padding: const EdgeInsets.all(16.0),
                child:Form(
                    key: _formKey,
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children:[
                            Image.asset(
                                "assets/logo.png",
                                width: 200,
                                height: 200,
                            ),
                            TextFormField(
                                decoration: new InputDecoration(labelText: "Ingresa ru codigo"),
                                keyboardType: TextInputType.number,
                                inputFormatters: <TextInputFormatter>[
                                    FilteringTextInputFormatter.digitsOnly
                                ], 
                                 controller: _codeController, 
                                 validator: validateCode,
                            )
                            const SizedBox(
                                height: 64,
                            ),
                            SizedBox(
                                height: 48,
                                width: double.infinity,
                                child: ElevatedButton(
                                    onPressed: () {
                                        if (_formKey.currentState!.validate()) {
                                            Navigator.pushNamed(context,'/');
                                        }
                                    },
                                    style: OutlinedButton.styleFrom(
                                        backgroundColor: Colors.blue,
                                        foregroundColor: Colors.orange[900],
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(16))),
                                    child: const Text(
                                    "Confirmar codigo",
                                    style: TextStyle(fontSize: 20),
                                    ),
                                ),
                            ),
                        ]
                    )
                )
            )
        )
        );
    }
}
