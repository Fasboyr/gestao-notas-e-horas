
import 'package:gestao_notas_horas/app/database/sqlite/dao/certificate_dao_impl.dart';
import 'package:gestao_notas_horas/app/database/sqlite/dao/hours_dao_impl.dart';
import 'package:gestao_notas_horas/app/database/sqlite/dao/subject_dao_impl.dart';
import 'package:gestao_notas_horas/app/domain/interfaces/certificate_dao.dart';
import 'package:gestao_notas_horas/app/domain/interfaces/hours_dao.dart';
import 'package:gestao_notas_horas/app/domain/interfaces/subject_dao.dart';
import 'package:gestao_notas_horas/app/domain/service/certificate_service.dart';
import 'package:gestao_notas_horas/app/domain/service/hours_service.dart';
import 'package:gestao_notas_horas/app/domain/service/subject_service.dart';
import 'package:get_it/get_it.dart';

setupInjection(){
  GetIt getIt = GetIt.I;

  getIt.registerSingleton<SubjectDAO>(SubjectDAOImpl());
  getIt.registerSingleton<SubjectService>(SubjectService());

  getIt.registerSingleton<HoursDAO>(HoursDAOImpl());
  getIt.registerSingleton<HoursService>(HoursService());

  getIt.registerSingleton<CertificateDAO>(CertificateDAOImpl());
  getIt.registerSingleton<CertificateService>(CertificateService());
}