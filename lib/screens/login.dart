import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/svg.dart';
import 'package:firebase_auth/firebase_auth.dart';


class LoginScreen extends StatefulWidget {

  @override
  _LoginScreenState createState() => _LoginScreenState();
}


class _LoginScreenState extends State<LoginScreen> {


  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: height * 0.3),
            alignment: Alignment.topCenter,
            child: Text('Step', style: GoogleFonts.jost(fontSize: 40, fontWeight: FontWeight.bold),),
          ),
          Container(
            alignment: Alignment.topCenter,
            child: Text('Получайте знания бесплатно', style: GoogleFonts.jost(fontSize: 14, fontWeight: FontWeight.normal),),
          ),
          Container(
            margin: EdgeInsets.only(left: width * 0.2, right: width * 0.2, top: height * 0.15),
            child: TextField(
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
              cursorColor: Colors.black,
              style: GoogleFonts.jost(color: Colors.black),
              decoration: InputDecoration(
                contentPadding: EdgeInsets.only(left: width * 0.03, top: 14, bottom: 14),
                hintText: 'Логин',
                hintStyle: GoogleFonts.jost(color: Colors.black),
                filled: true,
                fillColor: Color(0xFFF0F0F0),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(20)
                ),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(20)
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: width * 0.2, right: width * 0.2, top: height * 0.02),
            child: TextField(
              controller: passwordController,
              keyboardType: TextInputType.visiblePassword,
              obscureText: true,
              cursorColor: Colors.black,
              style: GoogleFonts.jost(color: Colors.black),
              decoration: InputDecoration(
                contentPadding: EdgeInsets.only(left: width * 0.03, top: 14, bottom: 14),
                hintText: 'Пароль',
                hintStyle: GoogleFonts.jost(color: Colors.black),
                filled: true,
                fillColor: Color(0xFFF0F0F0),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(20)
                ),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(20)
                ),
              ),
            ),
          ),
          Container(
            width: width * 0.2,
            margin: EdgeInsets.only(top: height * 0.05),
            child: ElevatedButton(
              child: Text('Войти', style: GoogleFonts.jost(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),),
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF2C2C2C)
              ),
            ),
          ),
          GestureDetector(
            child: Text('Зарегистрироваться', style: GoogleFonts.jost(color: Colors.black, fontSize: 12, fontWeight: FontWeight.bold),)
          ),
          Container(
            margin: EdgeInsets.only(top: height * 0.1),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset('assets/facebook.svg', height: height * 0.04,),
                SizedBox(
                  width: width * 0.01,
                ),
                SvgPicture.asset('assets/apple.svg', height: height * 0.04,),
                SizedBox(
                  width: width * 0.01,
                ),
                SvgPicture.asset('assets/vk.svg', height: height * 0.04,)
              ],
            ),
          )
        ],
      ),
    );
  }


  void signIn() async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text
      );
    } catch (e) {
      print(e);
    }
  }
}