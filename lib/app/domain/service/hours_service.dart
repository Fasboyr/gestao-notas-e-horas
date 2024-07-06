
import 'package:gestao_notas_horas/app/domain/entities/hours.dart';
import 'package:gestao_notas_horas/app/domain/exception/domain_layer_exception.dart';
import 'package:gestao_notas_horas/app/domain/interfaces/hours_dao.dart';
import 'package:get_it/get_it.dart';

class HoursService{
  final _dao = GetIt.I.get<HoursDAO>();

  updateHour(Hours hours){

    _dao.updateHours(hours);
  }

  Future<List<Hours>> find() {
    return _dao.find();
  }

  validateHours(Hours hours, double? newHours,[double? originalHours]){
    double totalHours;
    if(originalHours == null){
      totalHours = newHours! + hours.horaRegistrada!; // se for o primeiro cadastro de horas, apenas adiciona ao total de horas registradas
    }else{
      if(originalHours > newHours!){
        newHours = originalHours - newHours; // ex original = 5 e novo = 3, reduz a hora registrada em 2
        totalHours = (hours.horaRegistrada! - newHours);
      }else{
        newHours = newHours - originalHours; // ex: novo = 5 e original = 3, aumenta a hora registrada em 2
        totalHours = (hours.horaRegistrada! + newHours);
      }
    }
    double aboveLimitHour;
    double adjusteCertificatedHours;
    if(hours.nome == 'Grupo 1 - Ensino'){
      if(hours.horaRegistrada == 150){
        throw DomainLayerException('Horas necessárias atingidas, impossível registrar mais');
      }else if(totalHours >= 150){
        aboveLimitHour = totalHours - 150; //Ex: a hora está a 140, adiciona um certificado de 15 horas, reduz a hora total pelo limite permitido para saber o quanto passou do limite;
        adjusteCertificatedHours = newHours - aboveLimitHour; // Ex: passou do limite por 5, então reduz a nova hora para 10, depois retorna o total de horas e o novo valor do certificado.
        totalHours = 150;
        return [totalHours, adjusteCertificatedHours];
      }
    }else if(hours.nome == 'Grupo 2 - Extensão' || hours.nome == 'Grupo 3 - Social'){
      if(hours.horaRegistrada == 40){
        throw DomainLayerException('Horas necessárias atingidas, impossível registrar mais');
      }else if(totalHours > 40){
        aboveLimitHour = totalHours - 40;
        adjusteCertificatedHours = newHours - aboveLimitHour;
        totalHours = 40;
        return [totalHours, adjusteCertificatedHours];
      }

    }else{
      throw DomainLayerException('Nome do grupo inválido');
    }
  }
}