import 'package:flutter/material.dart';
import 'intro_page.dart';
import 'intro_task.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  static const String id = "home_page";

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MaterialButton(
              onPressed: () {
                Navigator.of(context).pushNamed(IntroPage.id);
              },
              textColor: Colors.green,
              color: Colors.black87,
              shape: StadiumBorder(),
              minWidth: 250,
              child: Text(
                "Intro Page",
                style: TextStyle(fontSize: 20),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            MaterialButton(
              onPressed: () {
                Navigator.of(context).pushNamed(IntroTask.id);
              },
              textColor: Colors.red,
              color: Colors.white,
              shape: StadiumBorder(),
              minWidth: 250,
              child: Text(
                "Intro Task",
                style: TextStyle(fontSize: 20),
              ),
            ),
            SizedBox(
              height: 15,
            ),
          ],
        ),
      ),
    );
  }
}
