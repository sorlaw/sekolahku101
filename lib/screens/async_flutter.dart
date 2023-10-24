import 'package:flutter/material.dart';

class AsyncFlutter extends StatelessWidget {
  const AsyncFlutter({super.key});


  @override
  Widget build(BuildContext context) {
    Future<String> fetchValue() async{
      print('memesan');
      await Future.delayed(Duration(seconds: 5));
      print('pesanan siap');

      return Future.value('my_value');
    }

    fetchValue();

    return Scaffold(
      body: Center(
        child: Text("HELLO ASYNC"),
      ),
    );
  }
}