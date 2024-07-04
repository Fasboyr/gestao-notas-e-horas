import 'package:flutter/material.dart';
import 'package:gestao_notas_horas/app/domain/entities/hours.dart';
import 'package:gestao_notas_horas/app/domain/service/hours_service.dart';
import 'package:gestao_notas_horas/app/view/certificate/certificate_list.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';

part 'hours_list_back.g.dart';


class HoursListBack = _HoursListBack with _$HoursListBack;


abstract class _HoursListBack with Store{
  var _service = GetIt.I.get<HoursService>();


  @observable
  Future<List<Hours>>? list;

  @action
  refreshList([dynamic value]){
    list = _service.find();
  }

  _HoursListBack(){
    refreshList();
  }

  goToList(BuildContext context, [Hours? hours]){
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => CertificateList(groupName: hours!.nome as String)));
  }

/*
  goToDetails(BuildContext context, Hours Hours){
    Navigator.of(context).pushNamed(MyApp.CONTACT_DETAILS, arguments: Hours);
  }
*/

}