import 'package:gestao_notas_horas/app/domain/entities/subject.dart';
import 'package:gestao_notas_horas/app/domain/interfaces/subject_dao.dart';
import 'package:sqflite/sqflite.dart';

import '../connection.dart';

class SubjectDAOImpl implements SubjectDAO{
  Database? _db;

  Future<List<Subject>> find() async {
    _db = (await Connection.get())!;
    List<Map<String, dynamic>> resultado = await _db!.query('subject');
    List<Subject> lista = List.generate(resultado.length, (i) {
      var linha = resultado[i];
      return Subject(
        id: linha['id'] as int? ?? 0, 
        nome: linha['nome'] as String,
        nota1: linha['nota1'] as double,
        nota2: linha['nota2'] as double,
        nota3: linha['nota3'] as double,
        media: linha['media'] as double,
        urlAvatar: linha['url_avatar'] as String,
      );
    });

    return lista;
  }

  Future<void> remove(dynamic id) async {
    _db = (await Connection.get())!;
    var sql = 'DELETE FROM subject WHERE id = ?';
    await _db!.rawDelete(sql, [id]); 
  }

  Future<void> save(Subject subject) async {
    _db = (await Connection.get())!;
    var sql;
    if (subject.id == null) {
      sql = 'INSERT INTO subject (nome,url_avatar) VALUES (?,?)';
      await _db!.rawInsert(sql, [subject.nome,subject.urlAvatar]);
    } else {
      sql = 'UPDATE subject SET nome = ?, nota1 = ?, nota2 = ?, nota3 = ?, media = ?, url_avatar = ? WHERE id = ?';
      await _db!.rawUpdate(sql, [subject.nome, subject.nota1, subject.nota2, subject.nota3, subject.media, subject.urlAvatar, subject.id]);
    }
  }

}