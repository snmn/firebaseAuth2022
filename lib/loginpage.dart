import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:news/custombutton.dart';
import 'package:news/dashboard.dart';
import 'package:news/inputs.dart';

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
    // TODO: implement createState
    return SigninState();
  }

}
class SigninState extends State<Signin>{
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
   return Scaffold(
     backgroundColor:Colors.white,
     body: SingleChildScrollView(
       child: SizedBox(
         height: size.height,
         width: size.width,
         child: Column(
           mainAxisAlignment: MainAxisAlignment.center,
           children: [
             Container(
               padding: const EdgeInsets.only(bottom: 25.0),
               color: Colors.white,
               child: Center(
                   child: Image.asset('images/logo.png', width: 180,)
               ),
             ),
             Container(
               margin: const EdgeInsets.all(20.0),
               padding: const EdgeInsets.all(25.0),
               height: size.height/1.7,
               width: double.infinity,
               decoration: const BoxDecoration(
                   borderRadius: BorderRadius.all( Radius.circular(30),),
                   color: Color(0xffFBAF43)
               ),
               child: Column(
                 children: [
                   Container(
                     width: double.infinity,
                     padding: const EdgeInsets.symmetric(vertical: 8.0),
                     child: const Text(
                       'Sign In',
                       style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),
                     ),
                   ),
                   const AppInputField("Email"),
                   const AppInputField("Password"),
                   OrangeButton(
                     title: 'Sign In', onTap: (){

                     Navigator.push(context,
                         MaterialPageRoute(builder: (context)=>
                         Dashboard()));
                   },
                   ),
                   Row(
                     mainAxisAlignment: MainAxisAlignment.center,
                     children: [

                       GestureDetector(
                         onTap: ()=> {},
                             // Navigator.push(context,
                             // MaterialPageRoute(builder: (context)=>
                             // const WebView())),
                         child: const Padding(
                           padding: EdgeInsets.all(5.0),
                           child: Text('SignUp', style: TextStyle(fontSize: 12,fontWeight: FontWeight.normal),
                           ),

                         ),
                       ),
                       Text(' | ', style: Theme.of(context).textTheme.bodyText1),
                       const Padding(
                         padding: EdgeInsets.all(5.0),
                         child: Text('Forgot Password?', style: TextStyle(fontSize: 12,fontWeight: FontWeight.normal),),
                       ),


                     ],
                   )
                 ],
               ),
             )
           ],
         ),
       ),
     ),
   );
  }
}