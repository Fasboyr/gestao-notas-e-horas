import 'package:gestao_notas_horas/app/domain/entities/hours.dart';

abstract class HoursDAO{

  updateHours(String groupName, double newHours);

  Future<List<Hours>> find();

}