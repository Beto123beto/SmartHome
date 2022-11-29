import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'login.dart';

class RegisterPage extends StatefulWidget {
  final VoidCallback showLoginPage;
  const RegisterPage({Key? key, required this.showLoginPage}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();

}

class _RegisterPageState extends State<RegisterPage>{
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  @override
  void dispose(){
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();

    super.dispose();
  }

  Future signUp() async {
    if (passwordConfirmed()) {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: _emailController.text.trim(),
          password: _passwordController.text.trim()
      );
    }
  }

  bool passwordConfirmed() {
    if(
    _passwordController.text.trim() ==
        _confirmPasswordController.text.trim()
    ){
      return true;

    } else{
      return false;
    }

  }

  @override
  Widget build(BuildContext context){
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
                    'Register Below with your Details  ',
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
                      child: TextField(
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
                      child: TextField(
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

                  Padding(padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: Container(
                      padding: const EdgeInsets.only(left: 25.0),
                      decoration: BoxDecoration(
                        color: Colors.grey[280],
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: TextField(
                        controller: _confirmPasswordController,
                        obscureText: true,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: "Confirm Password",

                        ),
                      ),

                    ),
                  ),
                  const SizedBox(height: 14),



                  // SIGN IN BUTTON STARTS FROM THIS SECTION/


                  Padding(padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: TextButton(
                        onPressed: (){
                          signUp;
                          Navigator.of(context).push(MaterialPageRoute(builder: (context)=>LoginPage()));
                        },
                        child: Container(
                          padding: const EdgeInsets.all(20),
                          decoration: BoxDecoration(color: Colors.deepPurple,
                              borderRadius: BorderRadius.circular(12)),
                          child: const Center(
                            child: Text('Sign Up',
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
                        "Already have an Account?  ",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                        ),
                      ),

                      TextButton(
                          onPressed: (){
                            Navigator.of(context).push(MaterialPageRoute(builder: (context)=>LoginPage()));
                          },
                          child:  const Text(
                            "Login",
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
