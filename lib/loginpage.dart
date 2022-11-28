import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:news/auth.dart';
import 'package:news/dashboard.dart';

class SplashPage extends StatefulWidget{
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return SplashPageState();
  }
}
class SplashPageState extends State<SplashPage>{

  @override
  Widget build(BuildContext context) {
   return StreamBuilder<User?>(
     stream: FirebaseAuth.instance.authStateChanges(),
     builder: (context, snapshot) {
       if (snapshot.hasData) {
         return Dashboard();
       }
       return const Signin();
     },
   );
  }

}

class Signin extends StatefulWidget{
  const Signin({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return SigninState();
  }

}
class SigninState extends State<Signin>{
  String? errorMessage = '';
  bool isLogin = true;

  final TextEditingController controllerEmail = TextEditingController();
  final TextEditingController _controllerPassword = TextEditingController();
  Future<void> signInWithEmailAndPassword() async {
    try {
      await Auth().signInWithEmailAndPassword(
        email: controllerEmail.text,
        password: _controllerPassword.text,
      );
    } on FirebaseAuthException catch (e) {
      setState(() {
        errorMessage = e.message;
      });
    }
  }

  Future<void> createUserWithEmailAndPassword() async {
    try {
      await Auth().createUserWithEmailAndPassword(
        email: controllerEmail.text,
        password: _controllerPassword.text,
      );
    } on FirebaseAuthException catch (e) {
      setState(() {
        errorMessage = e.message;
      });
    }
  }
  Widget _errorMessage() {
    return Text(errorMessage == '' ? '' : 'Humm ? $errorMessage');
  }

  Widget _submitButton() {
    return ElevatedButton(
      onPressed:
      isLogin ? signInWithEmailAndPassword : createUserWithEmailAndPassword,
      child: Text(isLogin ? 'Login' : 'Register'),
    );
  }

  Widget _loginOrRegisterButton() {
    return TextButton(
      onPressed: () {
        setState(() {
          isLogin = !isLogin;
        });
      },
      child: Text(isLogin ? 'Register instead' : 'Login instead'),
    );
  }
  Widget _title() {
    return const Text('Firebase Auth');
  }
  Widget _entryField(
      String title,
      TextEditingController controller,
      ) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: title,
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
   // var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: _title(),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _entryField('email', controllerEmail),
            _entryField('password', _controllerPassword),
            _errorMessage(),
            _submitButton(),
            _loginOrRegisterButton(),
          ],
        ),
      ),
    );
  }
}