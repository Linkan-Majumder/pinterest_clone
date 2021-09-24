import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pinterest_clone/forget_password/forget_password.dart';
import 'package:pinterest_clone/sign_up/signup_screen.dart';
import 'package:pinterest_clone/widgets/account_check.dart';
import 'package:pinterest_clone/widgets/rectangualr_button.dart';
import 'package:pinterest_clone/widgets/rectangular_input_field.dart';

import '../../home_screen.dart';



class Credentials extends StatelessWidget {

  final FirebaseAuth _auth = FirebaseAuth.instance;

  late TextEditingController _emailTextController = TextEditingController(text: '');
  late TextEditingController _passTextController = TextEditingController(text: '');

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(30.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: CircleAvatar(
              radius: 60,
              backgroundImage: AssetImage(
                "assets/logo1.png"
              ),
            ),
          ),
          SizedBox(height: 10,),
          RectangularInputField(
            hintText: 'Enter Email',
            icon: Icons.email_rounded,
            obscureText: false,
            textEditingController: _emailTextController,
          ),
          SizedBox(
            height: 30.0/2,

          ),
          RectangularInputField(
          hintText: 'Enter Password',
          icon: Icons.lock,
          obscureText: true,
          textEditingController: _passTextController,
          ),
          SizedBox(
            height: 30.0/2,

          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              GestureDetector(
                onTap: (){
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => ForgetPasswordScreen(),));
                },
                child: Text(
                  'Forget Password',
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                    fontSize: 17,
                  ),
                ),
              )
            ],
          ),
          RectangularButton(
            text: 'Login',
            colors1: Colors.red,
            colors2: Colors.redAccent,

            press: () async{
              try{
                await _auth.signInWithEmailAndPassword(
                    email: _emailTextController.text.trim().toLowerCase(),
                    password: _passTextController.text.trim()


                );
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => HomeScreen()));
              }catch(error){
                Fluttertoast.showToast(msg: error.toString());
              }
            },


          ),
          AccountCheck(
            login: true,
            press: (){
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => SignUpScreen()));
            },
          ),

        ],
      ),
    );
  }
}
