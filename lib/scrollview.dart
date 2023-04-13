import 'package:flutter/material.dart';

class Scroll extends StatefulWidget {
  const Scroll({Key? key}) : super(key: key);

  @override
  State<Scroll> createState() => _ScrollViewState();
}

class _ScrollViewState extends State<Scroll> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text("Scroll View"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(right: 11),
                      child: Center(child: Text("blue")),
                      height: 200,
                      width: 200,
                      color: Colors.blue,
                    ),
                    Container(
                      margin: EdgeInsets.only(right: 11),
                      child: Center(child: Text("yellow")),
                      height: 200,
                      width: 200,
                      color: Colors.yellow,
                    ),
                    Container(
                      margin: EdgeInsets.only(right: 11),
                      child: Center(child: Text("green")),
                      height: 200,
                      width: 200,
                      color: Colors.green,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 11,
              ),
              Container(
                margin: EdgeInsets.only(bottom: 11),
                height: 200,
                child: Center(child: Text("green")),
                //   width: 200,
                color: Colors.yellow,
              ),
              Container(
                margin: EdgeInsets.only(bottom: 11),
                height: 200,
                child: Center(child: Text("green")),
                //   width: 200,
                color: Colors.green,
              ),
              Container(
                margin: EdgeInsets.only(bottom: 11),
                child: Center(child: Text("green")),
                height: 200,
                //   width: 200,
                color: Colors.blue,
              )
            ],
          ),
        ),
      ),
    );
  }
}
