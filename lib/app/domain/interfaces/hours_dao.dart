import 'package:gestao_notas_horas/app/domain/entities/hours.dart';

abstract class HoursDAO{

  updateHours(Hours hours);

  Future<List<Hours>> find();

}