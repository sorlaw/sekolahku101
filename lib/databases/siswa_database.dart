import 'package:sqflite/sqflite.dart';

class SiswaDatabase {
  Database? db;

  Future<Database> getDatabase() async {
    if (db == null) {
      var databasePath = await getDatabasesPath();
      String path = databasePath + 'siswa.db';

      Database database = await openDatabase(path, version: 1,
          onCreate: (Database db, int version) async {
        await db.execute('''CREATE TABLE IF NOT EXISTS siswa (
          id_siswa INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
          first_name TEXT(20),
          last_name TEXT(20),
          gender TEXT(20),
          grade TEXT(3),
          address TEXT(45),
          mobile_phone TEXT(13),
          hobbies TEXT
        )''');
      });
      db = database;
      return database;
    }
    return db!;
  }

  // Untuk get semua siswa
  Future<List<Map>> getAllSiswa() async{
    Database myDb = await getDatabase();
    List<Map> list = await myDb.rawQuery("SELECT * FROM siswa");
    return list;
  }

  Future<List<Map>> getSiswaByName({required String name}) async{
    Database myDb = await getDatabase();
    List<Map> list = await myDb.rawQuery(
      "SELECT * FROM siswa WHERE first_name LIKE '%${name}%' OR last_name LIKE '%${name}%'"
    );
    return list;
  }

  Future<bool> deleteSiswa({required int id}) async {
    Database myDb = await getDatabase();
    int id2 = await myDb.rawDelete("DELETE FROM siswa WHERE id_siswa = ?", [id]);
    print(id2);
  return true;
  }

  Future<bool> updateSiswa({
    required String first_name,
    required String last_name,
    required String mobile_phone,
    required String gender,
    required String grade,
    required String hobbies,
    required String address,
    required int id
  }) async {
      Database myDb = await getDatabase();

      int count = await myDb.rawUpdate('UPDATE siswa SET first_name = ?, last_name = ?, gender = ?, grade = ?, address = ?, mobile_phone = ?, hobbies = ? WHERE id_siswa = ?',[first_name,last_name,gender,grade,address,mobile_phone,hobbies,id]);

      return true;
  }

  Future<bool> saveSiswa({
    required String first_name,
    required String last_name,
    required String mobile_phone,
    required String gender,
    required String grade,
    required String hobbies,
    required String address
  }) async {
    Database myDb = await getDatabase();
    await myDb.transaction((txn) async {
      int id2 = await txn.rawInsert(
        'INSERT INTO siswa(first_name,last_name,gender,grade,address,mobile_phone,hobbies) VALUES (?,?,?,?,?,?,?)',[
          first_name,
          last_name,
          gender,
          grade,
          address,
          mobile_phone,
          hobbies
        ]
      );
      print('inserted: $id2');
    });
    return true;
  }
}
