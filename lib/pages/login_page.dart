import 'package:flutter/material.dart';
import 'package:uml_project/components/my_textfield.dart';
import 'package:uml_project/components/square_tile.dart';
import 'package:uml_project/pages/register_page.dart';
import 'package:uml_project/utils/colour/global_color.dart';

import '../components/logo_tile.dart';
import '../components/my_button.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key, required this.onTap}) : super(key: key);
  final Function()? onTap;

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //Controller
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  //sign user method
  void signUserIn() async {
    showDialog(
        context: context,
        builder: (context) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GlobalColors.backgroundColor,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 50),

            // logo
            LogoTile(
              imagePath: 'assets/logo.png',
            ),
            const SizedBox(height: 50),
            //welcome
            Text(
              'Bienvenue cher étudiant connectez vous !',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
            const SizedBox(height: 25),

            //password & email
            MyTextField(
              controller: emailController,
              hintText: 'Email',
              obscureText: false,
            ),
            const SizedBox(height: 10),
            MyTextField(
              controller: passwordController,
              hintText: 'Mot de passe',
              obscureText: false,
            ),
            const SizedBox(height: 10),
            //mot de passe oublié
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'Mot de passe oublié ?',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 25),
            MyButton(
              text: 'Connexion',
              onTap: signUserIn,
            ),

            const SizedBox(height: 50),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Row(
                children: [
                  Expanded(
                    child: Divider(
                      thickness: 1.5,
                      color: Colors.grey[400],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text(
                      'Ou continuez avec :',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Divider(
                      thickness: 1.5,
                      color: Colors.grey[400],
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                SquareTile(imagePath: 'assets/google.png'),
                SizedBox(width: 25),
                SquareTile(imagePath: 'assets/apple.png'),
              ],
            ),
            const SizedBox(height: 50),

            //pas un membre ?
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Pas encore inscrit ?',
                  style: TextStyle(color: Colors.grey[700]),
                ),
                const SizedBox(width: 4),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) =>RegisterPage(onTap: widget.onTap))
                    );
                  },
                  child: const Text(
                    'Inscrivez-vous',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
