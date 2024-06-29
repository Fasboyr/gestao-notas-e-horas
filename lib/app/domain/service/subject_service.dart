import 'package:gestao_notas_horas/app/domain/entities/subject.dart';
import 'package:gestao_notas_horas/app/domain/exception/domain_layer_exception.dart';
import 'package:gestao_notas_horas/app/domain/interfaces/subject_dao.dart';
import 'package:get_it/get_it.dart';

class SubjectService {
  var _dao = GetIt.I.get<SubjectDAO>();

  saveCreation(Subject subject) {
    validateName(subject.nome);
    _dao.save(subject);
  }

  saveUpdateNote(Subject subject){
    validateNota1(subject.nota1);
    validateNota2(subject.nota2, subject.nota1);
    validateNota3(subject.nota3, subject.nota2, subject.nota1);
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

  validateNota1(double? nota1) {
    validateNota(nota1);
  }

  validateNota2(double? nota2, double? nota1) {
    if (nota2 != null) {
      if (nota1 == null) {
        throw DomainLayerException(
            'É necessário preencher a nota do primeiro trimestre antes de inserir a nota do segundo trimestre');
      }
      validateNota(nota2);
    }
  }

  validateNota3(double? nota3, double? nota2, double? nota1) {
    if (nota3 != null) {
      if (nota1 == null || nota2 == null) {
        throw DomainLayerException(
            'É necessário preencher as notas do primeiro e segundo trimestre antes de inserir a nota do terceiro trimestre');
      }
      validateNota(nota3);
    }
  }

  void validateNota(double? nota) {
    var min = 0;
    var max = 100;
    if (nota! < min || nota > max) {
      throw DomainLayerException('A nota deve ser apenas entre 0 e 100');
    }
  }
}
