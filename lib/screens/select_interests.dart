import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class SelectInterestsScreen extends StatefulWidget {

  @override
  _SelectInterestsScreenState createState() => _SelectInterestsScreenState();
}


class _SelectInterestsScreenState extends State<SelectInterestsScreen> {


  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(top: height * 0.05, left: width * 0.03),
            child: Text('Выберите любимые категории', style: GoogleFonts.jost(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 26),),
          ),
          Container(
            margin: EdgeInsets.only(top: height * 0.05),
            alignment: Alignment.topCenter,
            child: ElevatedButton(
              child: Text('Далее', style: GoogleFonts.jost(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),),
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF2C2C2C)
              ),
            ),
          ),
        ],
      ),
    );
  }
}