import 'package:flutter/material.dart';
import 'package:sekolahku101/person.dart';

class Coba extends StatelessWidget {
  const Coba({super.key});

  @override
  Widget build(BuildContext context) {
    final String name = "String with final variable";
    // Person ilham = Person(lastName: 'gunawan');
    var firstName = "asep";
    const String lastName = 'isd';
    bool isLegal = true;
    int phoneNum = 123445;
    num nilaiBaru = 76;
    var person = {'age': '17', 'name': 'budi', 'isLegal': false};
    Map person2 = {'name': 'agus', 'age': 20};

    List<String> nama = ["putra", "tomi", "fais"];

    void sayHello() {
      print('Hello World');
    }

    bool isLegally() {
      var age = 18;
      if (age >= 18) {
        return true;
      }
      return false;
    }

    // print(name);
    // print(firstName);
    // print(lastName);
    // print(isLegal);
    // print(person['name']);
    // print(nama[0]);
    // sayHello();
    // isLegally();
    
    return Scaffold(
      appBar: AppBar(
        title: Text("halaman coba"),
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
      ),
      body: Container(
        
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              child: ListView(
                children: [Column(
                  children: [
                    Text("lorem"),
                    Text("lorem"),
                    Text("lorem"),
                    Text("lorem"),
                    Text("lorem"),
                    Text("lorem"),
                    Text("lorem"),
                    Text("lorem"),
                    Text("lorem"),
                    Text("lorem"),
                    Text("lorem"),
                    Text("lorem"),
                    Text("lorem"),
                    Text("lorem"),
                    Text("lorem"),
                    Text("lorem"),
                    Text("lorem"),
                    Text("lorem"),
                    Text("lorem"),
                    Text("lorem"),
                    Text("lorem"),
                    Text("lorem"),
                    Text("lorem"),
                    Text("lorem"),
                    Text("lorem"),
                    Text("lorem"),
                    Text("lorem"),
                    Text("lorem"),
                    Text("lorem"),
                    Text("lorem"),
                    Text("lorem"),
                    Text("lorem"),
                  ],
                )],
              )
            )
          )),
      floatingActionButton: FloatingActionButton.small(onPressed: (){},child: Text("klik"),backgroundColor: Colors.red,)
    );
  }
}
