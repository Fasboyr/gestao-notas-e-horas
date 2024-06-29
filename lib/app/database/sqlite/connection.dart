import 'package:gestao_notas_horas/app/database/script.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class Connection {
  static Database? _db;

  static Future<Database?> get() async {
    if (_db == null) {
  
      var path = join(await getDatabasesPath(), 'banco_horas_e_notas');
      deleteDatabase(path);
      _db = await openDatabase(
        path,
        version: 1,
        onCreate: (db, v) {
          db.execute(createTableSubject);
          db.execute(insertSubject1);
          db.execute(insertSubject2);
          db.execute(insertSubject3);

          db.execute(createTableHours);
          db.execute(insertHour1);
          db.execute(insertHour2);
          db.execute(insertHour3);

          db.execute(createTableCertificate);
          db.execute(insertCertificate1);
          db.execute(insertCertificate2);
          db.execute(insertCertificate3);

        },
      );
    }
    return _db;
  }
}
