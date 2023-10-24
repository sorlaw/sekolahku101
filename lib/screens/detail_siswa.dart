import 'package:flutter/material.dart';
import 'package:sekolahku101/databases/siswa_database.dart';
import 'package:sekolahku101/screens/update_siswa.dart';

class DetailSiswa extends StatelessWidget {
  final String firstName, lastName;
  final String mobile_phone;
  final String gender;
  final String grade;
  final String address;
  final String hobbies;
  final int id;

  DetailSiswa(
      {super.key,
      required this.mobile_phone,
      required this.gender,
      required this.grade,
      required this.address,
      required this.hobbies,
      required this.id,
      required this.firstName,
      required this.lastName});

  @override
  Widget build(BuildContext context) {
    deleteSiswa({required int id}) async{
      SiswaDatabase db = SiswaDatabase();
      await db.deleteSiswa(id: id);
      Navigator.pop(context);
    }
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return UpdateSiswa(
                      firstName: firstName,
                      lastName: lastName,
                      gender: gender,
                      address: address,
                      grade: grade,
                      hobbies: hobbies,
                      id: id,
                      mobile_phone: mobile_phone
                    );
                  },
                ));
              },
              icon: Icon(Icons.edit)),
          IconButton(onPressed: () {
            deleteSiswa(id: id);
          }, icon: Icon(Icons.delete))
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Center(
          child: ListView(
            children: [
              Image.asset(
                'lib/images/$gender.png',
                width: 150,
                height: 150,
              ),
              Divider(),
              ListTile(
                leading: Icon(Icons.account_box),
                title: Text('$firstName $lastName'),
                subtitle: Text("Name"),
              ),
              Divider(),
              ListTile(
                leading: Icon(Icons.phone),
                title: Text(mobile_phone),
                subtitle: Text("No hp"),
              ),
              Divider(),
              ListTile(
                leading: Icon(Icons.label),
                title: Text(gender),
                subtitle: Text("Jenis Kelamin"),
              ),
              Divider(),
              ListTile(
                leading: Icon(Icons.school),
                title: Text(grade),
                subtitle: Text("Jenjang"),
              ),
              Divider(),
              ListTile(
                leading: Icon(Icons.location_on),
                title: Text(address),
                subtitle: Text("Alamat"),
              ),
              Divider(),
              ListTile(
                leading: Icon(Icons.favorite),
                title: Text(hobbies),
                subtitle: Text("hobi"),
              ),
              Divider()
            ],
          ),
        ),
      ),
    );
  }
}
