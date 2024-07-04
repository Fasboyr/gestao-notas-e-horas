import 'package:flutter/material.dart';
import 'package:gestao_notas_horas/app/domain/entities/certificate.dart';
import 'package:gestao_notas_horas/app/domain/exception/domain_layer_exception.dart';
import 'package:gestao_notas_horas/app/domain/service/certificate_service.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';

part 'certificate_form_back.g.dart';

class CertificateFormBack = _CertificateFormBack with _$CertificateFormBack;

abstract class _CertificateFormBack with Store {
  late Certificate certificate;
  var _service = GetIt.I.get<CertificateService>();
  late bool _nameIsValid;
  late bool _descriptionIsValid;
  late bool _groupNameIsValid;
  late bool _hoursIsValid;
  late bool isNewSubject;

  bool get isValid => _nameIsValid && _descriptionIsValid && _groupNameIsValid && _hoursIsValid;

   _CertificateFormBack(BuildContext context) {
    var parameter = ModalRoute.of(context)!.settings.arguments;
    certificate = (parameter == null) ? Certificate() : parameter as Certificate;
    isNewSubject = (parameter == null);
  }

  save() async{
    await _service.save(certificate);
  }

  String? validateName(String? name){
    try{
      _service.validateName(name);
      _nameIsValid = true;
      return null;
    }catch(e){
      _nameIsValid = false;
      if (e is DomainLayerException) {
      return e.cause;
      }
      return 'Erro: Dados Inválidos';
    }
  }

  String? validateDescription(String? description){
    try{
      _service.validateDescription(description);
      _descriptionIsValid = true;
      return null;
    }catch(e){
      _descriptionIsValid = false;
      if (e is DomainLayerException) {
      return e.cause;
      }
      return 'Erro: Dados Inválidos';
    }
  }

  String? validateGroupName(String? name){
    try{
      _service.validateGroupName(name);
      _groupNameIsValid = true;
      return null;
    }catch(e){
      _groupNameIsValid = false;
      if (e is DomainLayerException) {
      return e.cause;
      }
      return 'Erro: Dados Inválidos';
    }
  }


  String? validateHoursCertificate(double? hours){
    try{
      _service.validateHoursCertificate(hours);
      _hoursIsValid = true;
      return null;
    }catch(e){
      _hoursIsValid = false;
      if (e is DomainLayerException) {
      return e.cause;
      }
      return 'Erro: Dados Inválidos';
    }
  }
}