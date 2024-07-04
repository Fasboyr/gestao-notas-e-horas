
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

  validateHours(String? groupName, double? newHours, double? hoursRegistered){
    var totalHours = newHours! + hoursRegistered!;
    if(groupName == 'Grupo 1 - Ensino'){
      if(hoursRegistered == 150){
        throw DomainLayerException('Horas necessárias atingidas, impossível registrar mais');
      }else if(totalHours >= 150){
        totalHours = 150;
      }
      return totalHours;
    }else if(groupName == 'Grupo 2 - Extensão' || groupName == 'Grupo 3 - Social'){
      if(hoursRegistered == 40){
        throw DomainLayerException('Horas necessárias atingidas, impossível registrar mais');
      }else if(totalHours > 40){
        totalHours = 40;
      }
      return totalHours;
    }else{
      throw DomainLayerException('Nome do grupo inválido');
    }
  }
}