import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:step/screens/select_interests.dart';
import 'package:firebase_database/firebase_database.dart';


class SignUpScreen extends StatefulWidget {

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}


class _SignUpScreenState extends State<SignUpScreen> {

  TextEditingController nameController = TextEditingController();
  TextEditingController surnameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(top: height * 0.05, left: width * 0.03),
            child: Text('Регистрация', style: GoogleFonts.jost(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 34),),
          ),
          Container(
            margin: EdgeInsets.only(left: width * 0.2, right: width * 0.2, top: height * 0.05),
            child: TextField(
              controller: nameController,
              keyboardType: TextInputType.text,
              cursorColor: Colors.black,
              style: GoogleFonts.jost(color: Colors.black),
              decoration: InputDecoration(
                contentPadding: EdgeInsets.only(left: width * 0.03, top: 14, bottom: 14),
                hintText: 'Имя',
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
            margin: EdgeInsets.only(left: width * 0.2, right: width * 0.2, top: height * 0.03),
            child: TextField(
              controller: surnameController,
              keyboardType: TextInputType.text,
              cursorColor: Colors.black,
              style: GoogleFonts.jost(color: Colors.black),
              decoration: InputDecoration(
                contentPadding: EdgeInsets.only(left: width * 0.03, top: 14, bottom: 14),
                hintText: 'Фамилия',
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
            margin: EdgeInsets.only(left: width * 0.2, right: width * 0.2, top: height * 0.03),
            child: TextField(
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
              cursorColor: Colors.black,
              style: GoogleFonts.jost(color: Colors.black),
              decoration: InputDecoration(
                contentPadding: EdgeInsets.only(left: width * 0.03, top: 14, bottom: 14),
                hintText: 'Почта',
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
            margin: EdgeInsets.only(left: width * 0.2, right: width * 0.2, top: height * 0.03),
            child: TextField(
              controller: phoneController,
              keyboardType: TextInputType.phone,
              cursorColor: Colors.black,
              style: GoogleFonts.jost(color: Colors.black),
              decoration: InputDecoration(
                contentPadding: EdgeInsets.only(left: width * 0.03, top: 14, bottom: 14),
                hintText: 'Телефон',
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
          GestureDetector(
            child: Container(
              margin: EdgeInsets.only(left: width * 0.2),
              child: Text('Отправить код подтверждения', style: GoogleFonts.jost(color: Colors.black, fontSize: 16, fontWeight: FontWeight.w500),),
            ),
            onTap: () {},
          ),
          Container(
            margin: EdgeInsets.only(left: width * 0.2, right: width * 0.2, top: height * 0.03),
            child: TextField(
              keyboardType: TextInputType.number,
              cursorColor: Colors.black,
              style: GoogleFonts.jost(color: Colors.black),
              decoration: InputDecoration(
                contentPadding: EdgeInsets.only(left: width * 0.03, top: 14, bottom: 14),
                hintText: 'Код подтверждения',
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
            margin: EdgeInsets.only(left: width * 0.2, right: width * 0.2, top: height * 0.03),
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
            margin: EdgeInsets.only(top: height * 0.05),
            alignment: Alignment.topCenter,
            child: ElevatedButton(
              child: Text('Зарегистрироваться', style: GoogleFonts.jost(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),),
              onPressed: () {
                signUp();
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF2C2C2C)
              ),
            ),
          ),
        ],
      ),
    );
  }


  void signUp() async {
    try {
      final snapshot = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      User? user = snapshot.user;
      DatabaseReference reference = FirebaseDatabase.instance.ref().child('users/' + user!.uid);
      await reference.set({'name': nameController.text, 'surname': surnameController.text, 'phone': phoneController.text, 'email': emailController.text});
      Navigator.of(context).push(MaterialPageRoute(builder: (context) => SelectInterestsScreen()));
    } catch (e) {
      print(e);
    }
  }
}