import 'package:gestao_notas_horas/app/domain/entities/certificate.dart';
import 'package:gestao_notas_horas/app/domain/entities/hours.dart';

class CertificateDTO {
  Certificate? certificate;
  Hours? hours;

  CertificateDTO({this.certificate, this.hours});
}
