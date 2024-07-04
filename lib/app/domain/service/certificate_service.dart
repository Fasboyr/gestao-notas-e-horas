import 'package:gestao_notas_horas/app/domain/entities/certificate.dart';
import 'package:gestao_notas_horas/app/domain/exception/domain_layer_exception.dart';
import 'package:gestao_notas_horas/app/domain/interfaces/certificate_dao.dart';
import 'package:get_it/get_it.dart';

class CertificateService {
  final _dao = GetIt.I.get<CertificateDAO>();

  save(Certificate certificate) {
    _dao.save(certificate);
  }

  remove(dynamic id) {
    _dao.remove(id);
  }

  Future<List<Certificate>> find() {
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

  validateDescription(String? description) {
    var max = 100;
    if (description == '' || description == null) {
      throw DomainLayerException('A descrição é obrigatória');
    } else if (description.length > max) {
      throw DomainLayerException(
          'A descrição deve possuir no maximo $max caracteres');
    }
  }

  validateGroupName(String? name) {
    var grupos= [
      'Grupo 1 - Ensino',
      'Grupo 2 - Extensão',
      'Grupo 3 - Social'
    ];

    if (name == null || name.isEmpty) {
      throw DomainLayerException('O grupo é obrigatório');
    } else if (!grupos.contains(name)) {
      throw DomainLayerException(
          'O nome do grupo deve ser um dos três: ${grupos.join(', ')}');
    }
  }

  validateHoursCertificate(double? hours) {
    if (hours != null) {
      var min = 0;
      if (hours < min) {
        throw DomainLayerException(
            'A hora certificada deve ser maior que $min');
      }
    } else {
      throw DomainLayerException('A hora é obrigatória');
    }
  }
}
