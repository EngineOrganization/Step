import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_fonts/google_fonts.dart';

class CourseScreen extends StatefulWidget {

  final User user;
  final int courseId;

  CourseScreen({Key? key, required this.user, required this.courseId}) : super(key: key);

  @override
  _CourseScreenState createState() => _CourseScreenState(user: user, courseId: courseId);
}


class _CourseScreenState extends State<CourseScreen> {

  final User user;
  final int courseId;

  String? courseName;
  int? finished;
  int? pass;
  String? category;

  bool isLoaded = false;

  _CourseScreenState({Key? key, required this.user, required this.courseId});

  bool isAuthor = false;

  List<String> authors = [];

  @override
  void initState() {
    super.initState();
    getCourse();
  }


  void getCourse() async {
    DatabaseReference reference = FirebaseDatabase.instance.ref().child('courses/' + courseId.toString());
    reference.onValue.listen((DatabaseEvent event) {
      final snapshot = event.snapshot;
      int authorsLength = snapshot.child('authors').children.length;
      for (int i = 0; i < authorsLength; i++) {
        DataSnapshot author = snapshot.child('authors').child(i.toString());
        String? uid = author.value.toString();
        authors.add(uid);
        if (uid == user.uid) {
          isAuthor = true;
        }
      }
      courseName = snapshot.child('name').value.toString();
      finished = int.parse(snapshot.child('finished').value.toString());
      pass = int.parse(snapshot.child('pass').value.toString());
      category = snapshot.child('category').value.toString();
      isLoaded = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: isLoaded ? Column(
        children: [
          Container(
            height: height * 0.3,
            width: width,
            decoration: BoxDecoration(
                color: Color(0xFF2C2C2C),
                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(45), bottomRight: Radius.circular(45))
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(left: width * 0.05, top: height * 0.05),
                  child: Text(courseName!, style: GoogleFonts.jost(color: Colors.white, fontSize: 32, fontWeight: FontWeight.bold),),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: width * 0.05, top: height * 0.02),
                      child: Text('Обучающихся: ' + pass.toString(), style: GoogleFonts.jost(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w500),),
                    ),
                    Container(
                      margin: EdgeInsets.only(right: width * 0.1, top: height * 0.02),
                      child: Text('Категория: ' + category!, style: GoogleFonts.jost(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w500),),
                    ),
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(left: width * 0.05, top: height * 0.01),
                  child: Text('Окончили курс: ' + finished.toString(), style: GoogleFonts.jost(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w500),),
                ),
                Container(
                  margin: EdgeInsets.only(left: width * 0.05, top: height * 0.05),
                  child: Text('Авторы', style: GoogleFonts.jost(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w500),),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: width * 0.05, top: height * 0.01),
                      child: Row(
                        children: [
                          Container(
                            margin: EdgeInsets.only(right: width * 0.01),
                            child: CircleAvatar(
                              radius: 20,
                              backgroundColor: Colors.white,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(right: width * 0.01),
                            child: CircleAvatar(
                              radius: 20,
                              backgroundColor: Colors.white,
                            ),
                          ),
                          Container(
                            child: CircleAvatar(
                              radius: 20,
                              backgroundColor: Colors.white,
                            ),
                          )
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          margin: EdgeInsets.only(right: isAuthor ? width * 0.02 : width * 0.1),
                          child: ElevatedButton(
                            child: Text(isAuthor ? 'Открыть курс' : 'Обучаться', style: GoogleFonts.jost(color: Colors.black, fontWeight: FontWeight.normal, fontSize: 16),),
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.only(left: width * 0.1, right: width * 0.1, top: 14, bottom: 14),
                              backgroundColor: Colors.white,
                            ),
                          ),
                        ),
                        isAuthor ? Container(
                          margin: EdgeInsets.only(right: width * 0.02),
                          child: ElevatedButton(
                            child: Text('Аналитика', style: GoogleFonts.jost(color: Colors.black, fontWeight: FontWeight.normal, fontSize: 16),),
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.only(left: width * 0.1, right: width * 0.1, top: 14, bottom: 14),
                              backgroundColor: Colors.white,
                            ),
                          ),
                        ) : Container()
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
          Container(
            alignment: Alignment.topLeft,
            margin: EdgeInsets.only(left: width * 0.03),
            child: Text('Добавить раздел', style: GoogleFonts.jost(color: Colors.black, fontSize: 28, fontWeight: FontWeight.normal),),
          ),
        ],
      ) : Center(
        child: CircularProgressIndicator(color: Color(0xFF2C2C2C),),
      )
    );
  }
}