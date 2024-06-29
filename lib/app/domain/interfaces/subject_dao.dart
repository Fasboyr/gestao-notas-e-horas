
import 'package:gestao_notas_horas/app/domain/entities/subject.dart';

abstract class SubjectDAO{

  save(Subject subject);

  remove(int id);

  Future<List<Subject>> find();
}