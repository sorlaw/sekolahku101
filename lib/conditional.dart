import 'package:flutter/material.dart';

class Conditional extends StatelessWidget {
  const Conditional({super.key});

  @override
  Widget build(BuildContext context) {
    String username = 'admink';
    String password = 'admin';
    int age = 19;
    if (age > 18) {
      print('legal');
    }else{
      print('illegal');
    }
    username == 'admin' && password == 'admin' ? print('halo admin') : print('Maaf kamu bukan admin');
    
    return const Placeholder();
  }
}