import 'package:flutter/material.dart';
import 'package:sekolahku101/widget/form_label.dart';

class Challenge2 extends StatelessWidget {
  const Challenge2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(children: [
          FormLabel("Name", Colors.purple),
          TextField(),
          SizedBox(height: 10,),
          FormLabel("Age", Colors.blue),
          TextField()
        ]),
      ),
    );
  }
}