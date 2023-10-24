import 'package:flutter/material.dart';
import 'package:sekolahku101/screens/home.dart';

class FormLogin extends StatefulWidget {
  const FormLogin({super.key});

  @override
  State<FormLogin> createState() => _FormLoginState();
}

class _FormLoginState extends State<FormLogin> {
  String username = '';
  String password = '';
  bool _obscureText = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: ListView(
          children: [
            SizedBox(
              height: 50,
            ),
            Image.asset(
              'lib/images/sekolah.png',
              height: 150,
            ),
            SizedBox(
              height: 30,
            ),
            TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(), label: Text("Username")),
              onChanged: (value) {
                username = value;
                setState(() {});
              },
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              decoration: InputDecoration(
                suffixIcon: IconButton(onPressed: (){
                  setState(() {
                    _obscureText = !_obscureText;
                  });
                }, icon: Icon(_obscureText ? Icons.visibility_off : Icons.visibility)),
                  border: OutlineInputBorder(), label: Text("Password")),
              onChanged: (value) {
                password = value;
                setState(() {});
              },
              obscureText: _obscureText,
            ),
            SizedBox(
              height: 30,
            ),
            ElevatedButton(
                onPressed: () {
                  if (username == 'admin' && password == 'admin') {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Home(),
                        ));
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Maaf kamu tidak bisa masuk')));
                  }
                },
                child: Text("Login"))
          ],
        ),
      ),
    );
  }
}
