import 'package:flutter/material.dart';

class DemoLayoutBuilder extends StatelessWidget {
  const DemoLayoutBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(50),
        child: LayoutBuilder( builder: (BuildContext context, BoxConstraints constraints) {
            if (constraints.maxWidth < 450) {
              return Container(color: Colors.lightBlueAccent,child: const Text('Environment : phone',style:  TextStyle(fontSize: 20),),);
            } else if (constraints.maxWidth < 800) {
              return Container(color: Colors.blueAccent,child: const Text('Environment : tablet',style:  TextStyle(fontSize: 40),),);
            } else if (constraints.maxWidth < 1920) {
              return Container(color: Colors.blueGrey,
                child: const Text('Environment : web',style:  TextStyle(fontSize: 80),));
            } else {
              return Container(color: Colors.lightBlueAccent,
                child: const Text('Environment : 4K'),);
            }
          }),
      ),
    );
  }
}
