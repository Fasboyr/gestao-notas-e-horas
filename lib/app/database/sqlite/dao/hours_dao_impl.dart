import 'package:gestao_notas_horas/app/database/sqlite/connection.dart';
import 'package:gestao_notas_horas/app/domain/entities/hours.dart';
import 'package:gestao_notas_horas/app/domain/interfaces/hours_dao.dart';
import 'package:sqflite/sqflite.dart';

class HoursDAOImpl implements HoursDAO{
  Database? _db;
  
  Future<List<Hours>> find() async {
    _db = (await Connection.get())!;
    List<Map<String, dynamic>> resultado = await _db!.query('hours');
    List<Hours> lista = List.generate(resultado.length, (i) {
      var linha = resultado[i];
      return Hours(
        id: linha['id'] as int? ?? 0,
        nome: linha['nome'] as String? ?? 'Nome não disponível',
        horaNecessario: linha['hora_necessaria'] as int? ?? 0,
        horaRegistrada: linha['hora_registrada'] as double? ?? 0.0,
        urlAvatar: linha['url_avatar'] as String? ?? '',
      );
    });

    return lista;
  }

  @override
  Future<void> updateHours(Hours hours) async {
    _db = (await Connection.get())!;
    var sql = 'UPDATE hours SET hora_registrada = ? WHERE nome = ?';
    await _db!.rawUpdate(sql, [hours.horaRegistrada, hours.nome]);
  }
}