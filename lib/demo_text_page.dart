import 'dart:developer';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class DemoTextPage extends StatelessWidget {
  const DemoTextPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.all(15.0),
        children: [
          const SizedBox(height: 100),
          const AutoSizeText(
            'This is some long text used only for demo purposes  - auto size text',
            maxLines: 1,
            presetFontSizes: [40, 30, 20],
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 50),
          Container(
            color: Colors.orange,
            height: 200,
            width: 200,
            child: const FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                'Another text - Fitted box',
                style: TextStyle(fontSize: 300),
              ),
            ),
          ),
          const SizedBox(height: 50),
          LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              return Text(
                'And final approach - Layout builder',
                style: TextStyle(fontSize: constraints.maxWidth / 10),
              );
            },
          ),
        ],
      ),
    );
  }
}
