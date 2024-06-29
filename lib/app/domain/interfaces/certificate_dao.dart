import 'package:gestao_notas_horas/app/domain/entities/certificate.dart';

abstract class CertificateDAO{

  save(Certificate certificate);

  remove(int id);
  
  Future<List<Certificate>> find();
}