import 'package:flutter/material.dart';
import 'package:gestao_notas_horas/app/domain/entities/certificate.dart';
import 'package:gestao_notas_horas/app/domain/entities/hours.dart';
import 'package:gestao_notas_horas/app/domain/exception/domain_layer_exception.dart';
import 'package:gestao_notas_horas/app/domain/service/certificate_service.dart';
import 'package:gestao_notas_horas/app/domain/service/hours_service.dart';
import 'package:gestao_notas_horas/app/view/certificate/DTO/certificate_dto.dart';
import 'package:get_it/get_it.dart';


class CertificateFormBack{
  late CertificateDTO certificateDTO;
  var _serviceCertificate = GetIt.I.get<CertificateService>();
  var _serviceHours = GetIt.I.get<HoursService>();
  late double registeredHour;
  late String groupName;
  late bool _nameIsValid;
  late bool _descriptionIsValid;
  late bool _groupNameIsValid;
  late bool _certificateHoursIsValid;
  late bool _groupHoursIsValid;
  late bool isNewCertificate;

  bool get isValid => _nameIsValid && _descriptionIsValid && _groupNameIsValid && _certificateHoursIsValid && _groupHoursIsValid;

   CertificateFormBack(BuildContext context) {
    var parameter = ModalRoute.of(context)!.settings.arguments;
    certificateDTO = parameter as CertificateDTO;

    if(certificateDTO.certificate == null){
      certificateDTO.certificate = Certificate();
      isNewCertificate = true;
    }else{
      isNewCertificate = false;
    }
  }

  save() async {
    await _serviceCertificate.save(certificateDTO.certificate!);
    await _serviceHours.updateHour(certificateDTO.hours!);
}


  String? validateName(String? name){
    try{
      _serviceCertificate.validateName(name);
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
      _serviceCertificate.validateDescription(description);
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
      _serviceCertificate.validateGroupName(name);
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


  String? validateHoursCertificate(double? newHours, [double? originalHours]){
    try{
      _serviceCertificate.validateHoursCertificate(newHours);
      _certificateHoursIsValid = true;
      if(_certificateHoursIsValid && originalHours != null){
         List<double> result = _serviceHours.validateHours(certificateDTO.hours as Hours, newHours, originalHours);
         certificateDTO.hours?.horaRegistrada = result[0];
         certificateDTO.certificate?.horaCertificada = result[1];
      } else{
         List<double> result= _serviceHours.validateHours(certificateDTO.hours as Hours, newHours);
         certificateDTO.hours?.horaRegistrada = result[0];
         certificateDTO.certificate?.horaCertificada = result[1];
      }
      _groupHoursIsValid = true;
      return null;
    }catch(e){
      _certificateHoursIsValid = false;
      _groupHoursIsValid = false;
      if (e is DomainLayerException) {
      return e.cause;
      }
      return 'Erro: Dados Inválidos';
    }
  }
}