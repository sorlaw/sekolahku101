import 'package:flutter/material.dart';
import 'package:sekolahku101/databases/siswa_database.dart';
import 'package:sekolahku101/widget/form_label.dart';

class UpdateSiswa extends StatefulWidget {
  final String firstName, lastName;
  final String mobile_phone;
  final String gender;
  final String grade;
  final String address;
  final String hobbies;
  final int id;
  const UpdateSiswa({super.key, required this.mobile_phone, required this.gender, required this.address,required this.hobbies,required this.id, required this.firstName,required this.lastName,required this.grade});

  @override
  State<UpdateSiswa> createState() => _UpdateSiswaState();
}

class _UpdateSiswaState extends State<UpdateSiswa> {
  String jk = '';
  String jenjang = '';
  String hobbies = '';
  Map hobi = {'membaca': false, 'menulis': false, 'menggambar': false};
  TextEditingController _inputFirstNameController = TextEditingController();
  TextEditingController _inputLastNameController = TextEditingController();
  TextEditingController _inputMobilePhoneController = TextEditingController();
  TextEditingController _inputAddressNameController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    _inputFirstNameController.text = widget.firstName;
    _inputLastNameController.text = widget.lastName;
    _inputMobilePhoneController.text = widget.mobile_phone;
    _inputAddressNameController.text = widget.address;
    jk = widget.gender;
    jenjang = widget.grade;
    if (widget.hobbies.contains("membaca")) {
      hobi['membaca'] = true;
    }
    if (widget.hobbies.contains("menulis")) {
      hobi['menulis'] = true;
    }
    if (widget.hobbies.contains("menggambar")) {
      hobi['menggambar'] = true;
    }
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    List newHobi = hobbies.split(",");
    updateSiswa() async{
      SiswaDatabase db = SiswaDatabase();
      List a = [];
      hobi.forEach((key, value) {
        if (value == true) {
          a.add(key);
        }
      });

      await db.updateSiswa(first_name: _inputFirstNameController.text, last_name: _inputLastNameController.text, mobile_phone: _inputMobilePhoneController.text, gender: jk, grade: jenjang, hobbies: a.join(","), address: _inputAddressNameController.text, id: widget.id);
      Navigator.pop(context);
    }
     return Scaffold(
      appBar: AppBar(
        title: Text("Update Siswa"),
        backgroundColor: Colors.blue[700],
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: ListView(
          children: [
            Row(
              children: [
                Expanded(
                    child: TextField(
                  controller: _inputFirstNameController,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), labelText: "Nama Depan"),
                )),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                    child: TextField(
                  controller: _inputLastNameController,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), labelText: "Nama Belakang"),
                ))
              ],
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              controller: _inputMobilePhoneController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), labelText: "No hp"),
            ),
            SizedBox(
              height: 10,
            ),
            FormLabel('Jenis kelamin', Colors.green),
            Row(
              children: [
                Radio(
                    value: 'pria',
                    groupValue: jk,
                    onChanged: (val) {
                      setState(() {
                        jk = val!;
                        print(val);
                      });
                    }),
                Text("Pria"),
                Radio(
                    value: 'wanita',
                    groupValue: jk,
                    onChanged: (val) {
                      setState(() {
                        jk = val!;
                        print(val);
                      });
                    }),
                Text("Wanita")
              ],
            ),
            FormLabel('Jenjang', Colors.green),
            DropdownButtonFormField(
              value: jenjang,
              items: [
                DropdownMenuItem(
                  child: Text("TK"),
                  value: 'tk',
                  onTap: () {
                    jenjang = 'tk';
                  },
                ),
                DropdownMenuItem(
                  child: Text("SD"),
                  value: 'sd',
                  onTap: () {
                    jenjang = 'sd';
                  },
                ),
                DropdownMenuItem(
                  child: Text("SMP"),
                  value: 'smp',
                  onTap: () {
                    jenjang = 'smp';
                  },
                ),
                DropdownMenuItem(
                  child: Text("SMA"),
                  value: 'sma',
                  onTap: () {
                    jenjang = 'sma';
                  },
                )
              ],
              onChanged: (value) {},
            ),
            FormLabel('Hobi', Colors.green),
            Column(
              children: [
                Row(
                  children: [
                    Checkbox(value: hobi['membaca'], onChanged: (val){
                      setState(() {
                        hobi['membaca'] = val;
                      });
                    }),
                    Text("Membaca")
                  ],
                ),
                Row(
                  children: [
                    Checkbox(value: hobi['menulis'], onChanged: (val){
                      setState(() {
                        hobi['menulis'] = val;

                      });
                    }),
                    Text("Menulis")
                  ],
                ),
                Row(children: [
                  Checkbox(value: hobi['menggambar'], onChanged: (val) {
                    setState(() {
                      hobi['menggambar'] = val;
                    });
                  },),
                  Text("Menggambar")
                ],)
              ],
            ),
            SizedBox(height: 10,),
            TextField(
              controller: _inputAddressNameController,
              maxLines: 2,
              decoration: InputDecoration(border: OutlineInputBorder(), labelText: 'Alamat'),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(onPressed: updateSiswa, label: Icon(Icons.edit)),
    );
  }
}