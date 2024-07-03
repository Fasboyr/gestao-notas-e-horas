import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gestao_notas_horas/app/domain/entities/subject.dart';
import 'package:gestao_notas_horas/app/domain/exception/domain_layer_exception.dart';
import 'package:gestao_notas_horas/app/domain/interfaces/subject_dao.dart';
import 'package:get_it/get_it.dart';

class SubjectService {
  final _dao = GetIt.I.get<SubjectDAO>();
  bool isNote3Valid = false;

  saveCreation(Subject subject) {
    validateName(subject.nome);
    _dao.save(subject);
  }

  saveEdition(Subject subject) {
    validateName(subject.nome);
    validateNota(subject.nota1.toString());
    validateNota(subject.nota2.toString());
    validateNota(subject.nota3.toString());
    subject.media = validateMedia(subject);
    _dao.save(subject);
  }

  remove(dynamic id) {
    _dao.remove(id);
  }

  Future<List<Subject>> find() {
    return _dao.find();
  }

  validateName(String? name) {
    var max = 50;
    if (name == '' || name == null) {
      throw DomainLayerException('O nome é obrigatório');
    } else if (name.length > max) {
      throw DomainLayerException(
          'O nome deve possuir no maximo $max caracteres');
    }
  }

  validateNota(String? nota) {
    if (nota != null) {
      double? noteValue = double.tryParse(nota!);
      if (noteValue != null) {
        var min = 0;
        var max = 10;
        if (noteValue < min || noteValue > max) {
          throw DomainLayerException('A nota deve ser apenas entre $min e $max');
        }
      }
    }
  }


  double? validateMedia(Subject subject) {
    if ((subject.nota1 == null || subject.nota1 == 0) ||
        (subject.nota2 == null || subject.nota2 == 0) ||
        (subject.nota3 == null || subject.nota3 == 0)) {
      return 0;
    } else {
      var average = (subject.nota1! + subject.nota2! + subject.nota3!) / 3;

      return average;
    }
  }


}
