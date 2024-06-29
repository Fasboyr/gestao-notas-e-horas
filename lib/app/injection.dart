
import 'package:gestao_notas_horas/app/database/sqlite/dao/certificate_dao_impl.dart';
import 'package:gestao_notas_horas/app/database/sqlite/dao/hours_dao_impl.dart';
import 'package:gestao_notas_horas/app/database/sqlite/dao/subject_dao_impl.dart';
import 'package:gestao_notas_horas/app/domain/interfaces/certificate_dao.dart';
import 'package:gestao_notas_horas/app/domain/interfaces/hours_dao.dart';
import 'package:gestao_notas_horas/app/domain/interfaces/subject_dao.dart';
import 'package:get_it/get_it.dart';

setupInjection(){
  GetIt getIt = GetIt.I;

  getIt.registerSingleton<SubjectDAO>(SubjectDAOImpl());
  getIt.registerSingleton<HoursDAO>(HoursDAOImpl());
  getIt.registerSingleton<CertificateDAO>(CertificateDAOImpl());
}