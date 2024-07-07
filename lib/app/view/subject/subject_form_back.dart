import 'package:flutter/material.dart';
import 'package:gestao_notas_horas/app/domain/entities/subject.dart';
import 'package:gestao_notas_horas/app/domain/exception/domain_layer_exception.dart';
import 'package:gestao_notas_horas/app/domain/service/subject_service.dart';
import 'package:get_it/get_it.dart';


class SubjectFormBack {
  late Subject subject;
  var _service = GetIt.I.get<SubjectService>();
  late bool _nameIsValid;
  late bool _note1IsValid;
  late bool _note2IsValid;
  late bool _note3IsValid;
  late bool isNewSubject;

  bool get isCreationValid => _nameIsValid;
  bool get isEditionValid => _nameIsValid && _note1IsValid && _note2IsValid && _note3IsValid;

  SubjectFormBack(BuildContext context) {
    var parameter = ModalRoute.of(context)!.settings.arguments;
    subject = (parameter == null) ? Subject() : parameter as Subject;
    isNewSubject = (parameter == null);
  }

  saveCreation() async {
    print("Executando o save do back");
    await _service.saveCreation(subject);
  }

  saveEdition() async {
    print("Executando o save do back");
    await _service.saveEdition(subject);
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

  String? validateNote1(String? note1){
     try{
      _service.validateNota(note1);
      _note1IsValid = true;
      return null;
    }catch(e){
      _note1IsValid = false;
      if (e is DomainLayerException) {
      return e.cause;
      }
      return 'Erro: Dados Inválidos';
    }
  }

   String? validateNote2(String? note2){
     try{
      _service.validateNota(note2);
      _note2IsValid = true;
      return null;
    }catch(e){
      _note2IsValid = false;
      if (e is DomainLayerException) {
      return e.cause;
      }
      return 'Erro: Dados Inválidos';
    }
  }

   String? validateNote3(String? note3){
     try{
      _service.validateNota(note3);
      _note3IsValid = true;
      return null;
    }catch(e){
      _note3IsValid = false;
      if (e is DomainLayerException) {
      return e.cause;
      }
      return 'Erro: Dados Inválidos';
    }
  }
}
