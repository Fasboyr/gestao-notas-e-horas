import 'package:flutter/material.dart';
import 'package:gestao_notas_horas/app/domain/entities/certificate.dart';
import 'package:gestao_notas_horas/app/domain/service/certificate_service.dart';
import 'package:gestao_notas_horas/app/my_app.dart';
import 'package:gestao_notas_horas/app/view/certificate/DTO/certificate_dto.dart';
import 'package:gestao_notas_horas/app/view/certificate/certificate_form.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';

part 'certificate_list_back.g.dart';

class CertificateListBack = _CertificateListBack with _$CertificateListBack;

abstract class _CertificateListBack with Store {
  var _service = GetIt.I.get<CertificateService>();

  @observable
  Future<List<Certificate>>? list;

  @action
  refreshList([dynamic value]) {
    list = _service.find();
  }

  _CertificateListBack() {
    refreshList();
  }

  goToForm(BuildContext context, [CertificateDTO? dto]){
    Navigator.of(context).pushNamed(MyApp.CERTIFICATE_FORM, arguments: dto,).then(refreshList);
    print('Certificate pushed with name: ${dto?.certificate!.nome}');
    print('Hour pushed with name: ${dto?.hours!.nome}');
  }

/*
  goToDetails(BuildContext context, Certificate certificate){
    Navigator.of(context).pushNamed(MyApp.CONTACT_DETAILS, arguments: certificate);
  }
*/
  remove(dynamic id) {
    _service.remove(id);
    refreshList();
  }
}
