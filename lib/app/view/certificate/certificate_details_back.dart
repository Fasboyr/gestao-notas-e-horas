import 'package:flutter/material.dart';
import 'package:gestao_notas_horas/app/domain/entities/certificate.dart';

class CertificateDetailsBack{
  BuildContext context;
  late Certificate certificate;

  CertificateDetailsBack(this.context){
    certificate = ModalRoute.of(context)!.settings.arguments as Certificate;
  }

  goToBack(){
    Navigator.of(context).pop();
  }
}