import 'package:flutter/material.dart';
import 'package:intro_page/utils/string_utils.dart';
import 'home_page.dart';

class IntroPage extends StatefulWidget {
  const IntroPage({Key? key}) : super(key: key);
  static const String id = "intro_page";

  @override
  _IntroPageState createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {

  PageController controller = PageController(initialPage: 0);
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.black87,
        actions: [
          (_selectedIndex != 2)
              ? TextButton(
                  onPressed: () {
                    setState(() {
                      _selectedIndex = 2;
                    });
                  },
                  child: const Text(
                    "Skip",
                    style: TextStyle(color: Colors.green, fontSize: 18),
                  ),
                )
              : TextButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed(HomePage.id);
                  },
                  child: const Text(
                    "Next",
                    style: TextStyle(color: Colors.green, fontSize: 18),
                  ),
                ),
        ],
      ),
      body: Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: [
          PageView(
            controller: controller,
            onPageChanged: (index) {
              setState(() {
                _selectedIndex = index;
              });
            },
            children: [
              makePage(
                  image: "assets/images/image_1.png",
                  title: Strings.stepOneTitle,
                  content: Strings.stepOneContent),
              makePage(
                  image: "assets/images/image_2.png",
                  title: Strings.stepTwoTitle,
                  content: Strings.stepTwoContent),
              makePage(
                  image: "assets/images/image_3.png",
                  title: Strings.stepThreeTitle,
                  content: Strings.stepThreeContent),
            ],
          ),
          indicator(),
        ],
      ),
    );
  }

  Widget makePage({required String image, required title, required content}) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          // #image
          Expanded(
            child: Container(
              alignment: Alignment.bottomCenter,
              child: Image(
                image: AssetImage(image),
                height: 250,
                width: 250,
              ),
            ),
          ),

          // #title #content
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 10,
                ),
                Text(
                  title,
                  style: TextStyle(
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                      fontSize: 30),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 45.0),
                  child: Text(
                    content,
                    style: TextStyle(color: Colors.grey, fontSize: 20),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget elementOfIndicator(int index) {
    return AnimatedContainer(
      margin: EdgeInsets.only(right: 6),
      width: (index == _selectedIndex) ? 30 : 6,
      height: 6,
      duration: Duration(milliseconds: 500),
      decoration: BoxDecoration(
        color: Colors.green,
        borderRadius: BorderRadius.circular(3),
      ),
    );
  }

  Widget indicator() {
    return Container(
      height: 60,
      padding: EdgeInsets.only(right: 0, left: 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          elementOfIndicator(0),
          elementOfIndicator(1),
          elementOfIndicator(2),
        ],
      ),
    );
  }
}
