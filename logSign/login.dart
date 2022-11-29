import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:smart_home/logSign/signup.dart';

import '../homepage.dart';
import '../mainpage.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);


  @override
  State<LoginPage> createState() => _LoginPageState();
}
class _LoginPageState extends State<LoginPage> {

  //CREATING THE TEXT CONTROLLERS

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();


  Future signIn() async{
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: _emailController.text.trim(),
      password: _passwordController.text.trim()


    );

  }
  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[380],
      body: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.account_circle,
                    color: Colors.deepPurple,
                    size: 150,

                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Welcome Back',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 28,
                    ),
                  ),
                  const SizedBox(height: 20,),
                  const Text(
                    'INTERNET OF THINGS',
                    style: TextStyle(
                      fontWeight: FontWeight.w200,
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(height: 19,),


//THIS IS THE EMAIL SECTION


                  Padding(padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: Container(
                      padding: const EdgeInsets.only(left: 25.0),
                      decoration: BoxDecoration(
                        color: Colors.grey[280],
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        controller: _emailController,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: "Email",


                        ),
                      ),

                    ),
                  ),
                  const SizedBox(height: 10),


                  //THIS IS THE PASSWORD SECTION//


                  Padding(padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: Container(
                      padding: const EdgeInsets.only(left: 25.0),
                      decoration: BoxDecoration(
                        color: Colors.grey[280],
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: TextFormField(
                        controller: _passwordController,
                        obscureText: true,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: "Password",

                        ),
                      ),

                    ),
                  ),
                  const SizedBox(height: 14),


                  // SIGN IN BUTTON STARTS FROM THIS SECTION/


                  Padding(padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: TextButton(
                        onPressed: (){
                          signIn;
                          Navigator.of(context).push(MaterialPageRoute(builder: (context)=>HomePage()));                                                  },
                        child: Container(
                          padding: const EdgeInsets.all(20),
                          decoration: BoxDecoration(color: Colors.deepPurple,
                              borderRadius: BorderRadius.circular(12)),
                          child: const Center(
                            child: Text('Login',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                          ),
                        )
                    ),
                  ),

                  const SizedBox(height: 25),


                  //REGISTER BUTTON STARTS HERE//

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children:  [
                      const Text(
                        "Not Registered? ",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                        ),
                      ),

                      TextButton(
                          onPressed: (){
                            signIn;
                            Navigator.of(context).push(MaterialPageRoute(builder: (context)=>RegisterPage(showLoginPage: () {  },)));
                          },
                          child:  const Text(
                            "Register Now",
                            style: TextStyle(
                              color: Colors.blue,
                              fontWeight: FontWeight.bold,
                              fontSize: 17,
                            ),

                          )
                      )
                    ],
                  )

                ],


              ),


            ),
          )
      ),
    );
  }
}