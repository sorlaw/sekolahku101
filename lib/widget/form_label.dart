import 'package:flutter/material.dart';

class FormLabel extends StatelessWidget {
  final String label;
  final Color color;
  FormLabel(this.label,this.color, {Key? key}) :  super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(label,style: TextStyle(color: color),),
    );
  }
}