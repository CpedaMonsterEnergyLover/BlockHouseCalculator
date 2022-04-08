import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("О приложении"),
        leading: IconButton(
          icon: const Icon(Icons.keyboard_arrow_left),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: ListView(
        children: const [
          Center(
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Text("Приложение разработано студентами ФСПО ИТМО:"),
            ),
          ),
          Padding(
            child: Text("Владимир Ягнаев"),
            padding: EdgeInsets.fromLTRB(80, 8, 80, 8),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(80, 0, 80, 80),
            child: Image(
                image: AssetImage("assets/images/cat.jpg"),
                fit: BoxFit.cover,
                width: double.infinity),
          ),
          Padding(
              child: Text("Максим Юрьевич"),
              padding: EdgeInsets.fromLTRB(80, 8, 80, 8)),
          Padding(
            padding: EdgeInsets.fromLTRB(80, 0, 80, 80),
            child: Image(
              image: AssetImage("assets/images/dog.jpg"),
              fit: BoxFit.cover,
              width: double.infinity,
              //height: ,
            ),
          ),
        ],
      ),
    );
  }
}
