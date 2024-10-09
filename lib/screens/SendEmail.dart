import 'package:flutter/material.dart';

class SendEmail extends StatefulWidget {
  const SendEmail({super.key});

  @override
  State<SendEmail> createState() => _SendEmailState();
}

    String? validateEmail(String? value) {
        // Expresión regular para validar un correo electrónico
        final RegExp emailRegExp = RegExp(
        r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
        );

        if (value == null || value.isEmpty) {
            return 'Por favor, ingrese su correo electrónico';
        } else if (!emailRegExp.hasMatch(value)) {
            return 'Por favor, ingrese un correo electrónico válido';
        }
        return null; // Si es válido, no devuelve ningún error
    }

class _SendEmailState extends State<SendEmail> {
    final TextEditingController _emailController = TextEditingController();
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

    @override
    Widget build(BuildContext context) {
        return Scaffold(
        appBar: AppBar(
            title: const Text('Verficicacion de correo'),
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
                                controller: _emailController,
                                decoration: const InputDecoration(
                                    hintText: "Correo electronico",
                                    label: Text("Correo electronico"),
                                ),
                                keyboardType: TextInputType.emailAddress,
                                validator: validateEmail,
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
                                         Navigator.pushNamed(context,'/CodeConfirmation');
                                    }
                                    },
                                    style: OutlinedButton.styleFrom(
                                        backgroundColor: Colors.blue,
                                        foregroundColor: Colors.orange[900],
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(16))),
                                    child: const Text(
                                    "Enviar correo",
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
