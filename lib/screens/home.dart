import 'package:flutter/material.dart';
import 'package:sekolahku101/databases/siswa_database.dart';
import 'package:sekolahku101/screens/detail_siswa.dart';
import 'package:sekolahku101/screens/tambah_siswa.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List siswa = [];
  bool showSearch = false;
  String? name;

  @override
  void initState() {
    // TODO: implement initState
    loadData();
    super.initState();
  }

  void loadData() async {
    SiswaDatabase db = SiswaDatabase();
    siswa = await db.getAllSiswa();
    // print(siswa.toList());
    setState(() {});
  }

  getByName() async {
    SiswaDatabase db = SiswaDatabase();
    siswa = await db.getSiswaByName(name: name ?? "");
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: showSearch
            ? TextField(
                decoration: const InputDecoration(
                    hintText: "Cari siswa",
                    filled: true,
                    fillColor: Colors.white),
                onSubmitted: (value) {
                  name = value;
                  getByName();
                },
              )
            : Text("SekolahKu"),
        backgroundColor: Colors.blue[700],
        foregroundColor: Colors.white,
        actions: [
          IconButton(
              onPressed: () {
                setState(() {
                  showSearch = !showSearch;
                  if (showSearch == false) {
                    loadData();
                  }
                });
              },
              icon: Icon(showSearch ? Icons.close : Icons.search))
        ],
      ),
      body: siswa.isNotEmpty
          ? ListView.separated(
              itemCount: siswa!.length,
              itemBuilder: (context, index) => ListTile(
                onTap: () async{
                  await Navigator.push(context, MaterialPageRoute(builder: (ctx) {
                    return DetailSiswa(
                      mobile_phone: siswa![index]['mobile_phone'],
                      address: siswa![index]['address'],
                      gender: siswa![index]['gender'],
                      grade: siswa![index]['grade'],
                      hobbies: siswa![index]['hobbies'],
                      id: siswa![index]['id_siswa'],
                      firstName: siswa![index]['first_name'],
                      lastName: siswa![index]['last_name']
                    );
                  }));
                    loadData();
                  
                },
                leading: siswa![index]['gender'] == 'pria'
                    ? Image.asset(
                        'lib/images/pria.png',
                        width: 50,
                        height: 50,
                      )
                    : Image.asset(
                        'lib/images/wanita.png',
                        width: 50,
                        height: 50,
                      ),
                title: Text(siswa![index]['first_name'] +' '+siswa![index]['last_name']),
                subtitle: Text(siswa![index]['gender']),
                trailing: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(siswa![index]['grade']),
                    Text(siswa![index]['mobile_phone'])
                  ],
                ),
              ),
              separatorBuilder: (context, index) {
                return Divider();
              },
            )
          : Center(
              child: CircularProgressIndicator(),
            ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async{
          // untuk menumpuk halaman dan menahan kode dibawah await
          await Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => TambahSiswa(),
              ));
          loadData();
          
        },
        label: Text("Tambah Siswa"),
        icon: Icon(Icons.add),
      ),
    );
  }
}
