import 'package:flutter/material.dart';
import 'package:gestao_notas_horas/app/domain/entities/subject.dart';
import 'package:gestao_notas_horas/app/domain/service/subject_service.dart';
import 'package:gestao_notas_horas/app/my_app.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';

part 'subject_list_back.g.dart';


class SubjectListBack = _SubjectListBack with _$SubjectListBack;


abstract class _SubjectListBack with Store{
  var _service = GetIt.I.get<SubjectService>();


  @observable
  Future<List<Subject>>? list;

  @action
  refreshList([dynamic value]){
    list = _service.find();
  }

  _SubjectListBack(){
    refreshList();
  }

  goToForm(BuildContext context, [Subject? subject]){
    Navigator.of(context).pushNamed(MyApp.SUBJECT_FORM, arguments: subject,).then(refreshList);
    print('Subject pushed with name: ${subject!.nome}');
  }

  goToDetails(BuildContext context, Subject subject){
    Navigator.of(context).pushNamed(MyApp.SUBJECT_DETAILS, arguments: subject);
  }

  remove(dynamic id) {
    _service.remove(id);
    refreshList();
  }

}