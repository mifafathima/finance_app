import 'package:finance_app/Firebase_Database/firebase_db.dart';
import 'package:finance_app/Screens/Home%20Screen.dart';
import 'package:finance_app/Screens/Login%20Screen.dart';
import 'package:finance_app/Widgets/BottomNavigationBar1.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../utilities/constants.dart';


class Registration extends StatefulWidget {
  const Registration({super.key});

  @override
  State<Registration> createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {

  final  email_controller = TextEditingController();
  final pass_controller = TextEditingController();


  Widget _buildEmailTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Email',
          style: kLabelStyle,
        ),
        const SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 60.0,
          child: TextField(
            controller: email_controller,
            keyboardType: TextInputType.emailAddress,
            style: const TextStyle(
              color: Colors.white,
              fontFamily: 'OpenSans',
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: const EdgeInsets.only(top: 14.0),
              prefixIcon: const Icon(
                Icons.email,
                color: Colors.white,
              ),
              hintText: 'Enter your Email',
              hintStyle: kHintTextStyle,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildPasswordTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Password',
          style: kLabelStyle,
        ),
        const SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 60.0,
          child: TextField(
            controller: pass_controller,
            obscureText: true,
            style: const TextStyle(
              color: Colors.white,
              fontFamily: 'OpenSans',
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: const EdgeInsets.only(top: 14.0),
              prefixIcon: const Icon(
                Icons.lock,
                color: Colors.white,
              ),
              hintText: 'Enter your Password',
              hintStyle: kHintTextStyle,
            ),
          ),
        ),
      ],
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
        Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF73AEF5),
              Color(0xFF61A4F1),
              Color(0xFF478DE0),
              Color(0xFF398AE5),
            ],
            stops: [0.1, 0.4, 0.7, 0.9],
          ),
        ),
      ),
      Container(
          height: double.infinity,
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            padding: const EdgeInsets.symmetric(
              horizontal: 40.0,
              vertical: 120.0,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
            const Center(
            child: Text(
              'Sign Up',
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'OpenSans',
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 30.0),
          _buildEmailTF(),
          const SizedBox(
            height: 30.0,
          ),
          _buildPasswordTF(),
          const SizedBox(
            height: 30,
          ),
          MaterialButton(
            minWidth: 350,
            height: 50,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20)
            ),
            color: Colors.white,
            child: const Text(
              'REGISTER',
              style: TextStyle(
                color: Color(0xFF527DAA),
                letterSpacing: 1.5,
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
                fontFamily: 'OpenSans',
              ),
            ),
            onPressed: () {
              String email = email_controller.text.trim();
              String password1 = pass_controller.text.trim();
              FirebaseHelper().register(useremail : email,password : password1).then((result) {
                if(result == null){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=> const Bottom()));
                }else{
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(result)));
                }
              });
            },
          ),
          const SizedBox(height: 10,),

          TextButton(onPressed: () {

            Navigator.push(context, MaterialPageRoute(builder: (context)=>const Login()));
          },
            child: const Text("Already a User?! SignIn", style: TextStyle(
              color: Colors.white,
              fontSize: 18.0,
              fontWeight: FontWeight.w400,)
            ))

            ],
          )

      ),
    )],
    )
    );
  }
}



