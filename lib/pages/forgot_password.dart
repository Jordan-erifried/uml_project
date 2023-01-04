import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../components/my_textfield.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final emailController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  Future passwordReset() async {
    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: emailController.text.trim());
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              content: Text(
                  'Le lien de restauration de votre mot de passe vous a été envoyer! Vérifiez vos mail!'),
            );
          });
    } on FirebaseAuthException catch (e) {
      print(e);
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              content: Text(e.message.toString()),
            );
          });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF07996D),
        elevation: 0,
        // 0xFF07996D
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Text(
              'Entrez votre mail et nous vous enverrons un mot de passe',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20),
            ),
          ),

          SizedBox(height: 10),

          // email textfield
          MyTextField(
            controller: emailController,
            hintText: 'Email',
            obscureText: false,
          ),
          MaterialButton(
            onPressed: passwordReset,
            child: Text('Restaurer mot de passe'),
            color: Color(0xFF07996D),
          )
        ],
      ),
    );
  }
}
