import 'package:gestao_notas_horas/app/domain/entities/certificate.dart';
import 'package:gestao_notas_horas/app/domain/interfaces/certificate_dao.dart';
import 'package:sqflite/sqflite.dart';

import '../connection.dart';

class CertificateDAOImpl implements CertificateDAO{
   Database? _db;

  Future<List<Certificate>> find() async {
    _db = (await Connection.get())!;
    List<Map<String, dynamic>> resultado = await _db!.query('subject');
    List<Certificate> lista = List.generate(resultado.length, (i) {
      var linha = resultado[i];
      return Certificate(
        id: linha['id'] as int? ?? 0, 
        nome: linha['nome'] as String,
        descricao: linha['descricao'] as String,
        horaCertificada: linha['hora_certificada'] as double,
        grupo: linha['grupo'] as String,
        urlAvatar: linha['url_avatar'] as String,
      );
    });
    return lista;
  }

  Future<void> remove(dynamic id) async {
    _db = (await Connection.get())!;
    var sql = 'DELETE FROM certificate WHERE id = ?';
    await _db!.rawDelete(sql, [id]); 
  }

  Future<void> save(Certificate certificate) async {
    _db = (await Connection.get())!;
    var sql;
    if (certificate.id == null) {
      sql = 'INSERT INTO subject (nome, descricao, hora_certificada, grupo, url_avatar) VALUES (?,?,?,?,?)';
      await _db!.rawInsert(sql, [certificate.nome, certificate.descricao, certificate.horaCertificada, certificate.grupo, certificate.urlAvatar]);
    } else {
      sql = 'UPDATE subject SET nome = ?, descricao = ?, hora_certificada = ?, grupo = ?, url_avatar = ? WHERE id = ?';
      await _db!.rawUpdate(sql, [certificate.nome, certificate.descricao, certificate.horaCertificada, certificate.grupo, certificate.urlAvatar, certificate.id]);
    }
  }

}