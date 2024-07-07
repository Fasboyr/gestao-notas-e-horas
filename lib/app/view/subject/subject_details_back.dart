import 'package:flutter/material.dart';
import 'package:gestao_notas_horas/app/domain/entities/subject.dart';

class SubjectDetailsBack{
  BuildContext context;
  late Subject subject;

  SubjectDetailsBack(this.context){
    subject = ModalRoute.of(context)!.settings.arguments as Subject;
  }

  goToBack(){
    Navigator.of(context).pop();
  }
}