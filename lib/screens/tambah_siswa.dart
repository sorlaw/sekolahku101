import 'package:flutter/material.dart';
import 'package:sekolahku101/databases/siswa_database.dart';
import 'package:sekolahku101/widget/form_label.dart';

class TambahSiswa extends StatefulWidget {
  const TambahSiswa({super.key});

  @override
  State<TambahSiswa> createState() => _TambahSiswaState();
}

class _TambahSiswaState extends State<TambahSiswa> {
  String jk = 'pria';
  String jenjang = 'tk';
  Map hobi = {'membaca': false, 'menulis': false, 'menggambar': false};
  TextEditingController _inputFirstNameController = TextEditingController();
  TextEditingController _inputLastNameController = TextEditingController();
  TextEditingController _inputMobilePhoneController = TextEditingController();
  TextEditingController _inputAddressNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tambah Siswa"),
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
      floatingActionButton: FloatingActionButton.extended(onPressed: saveSiswa, label: Icon(Icons.save)),
    );
  }
  saveSiswa() async{
    if (_inputFirstNameController.text == '' || _inputLastNameController.text == '' || _inputMobilePhoneController.text == '' || _inputAddressNameController.text == '') {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Semua data wajib diisi kecuali hobi")));
    }
    SiswaDatabase db = SiswaDatabase();
    List a = [];
    hobi.forEach((key, value) {
      if (value == true) {
        a.add(key);
      }
    });

    await db.saveSiswa(first_name: _inputFirstNameController.text, last_name: _inputLastNameController.text, mobile_phone: _inputMobilePhoneController.text, gender: jk, grade: jenjang, hobbies: a.join(","), address: _inputAddressNameController.text);
    Navigator.pop(context);
  }
}
