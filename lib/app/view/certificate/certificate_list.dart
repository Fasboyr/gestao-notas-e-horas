import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:gestao_notas_horas/app/domain/entities/certificate.dart';
import 'package:gestao_notas_horas/app/domain/entities/hours.dart';
import 'package:gestao_notas_horas/app/domain/service/hours_service.dart';
import 'package:gestao_notas_horas/app/my_app.dart';
import 'package:gestao_notas_horas/app/view/certificate/DTO/certificate_dto.dart';
import 'package:gestao_notas_horas/app/view/certificate/certificate_list_back.dart';
import 'package:gestao_notas_horas/app/view/hours/hours_list_back.dart';

class CertificateList extends StatelessWidget {
  final _back = CertificateListBack();

  CircleAvatar circleAvatar(String? url) {
    if (url != null && Uri.tryParse(url)?.isAbsolute == true) {
      return CircleAvatar(backgroundImage: NetworkImage(url));
    } else {
      return CircleAvatar(child: Icon(Icons.insert_drive_file));
    }
  }

  Widget iconEditButton(void Function()? onPressed) {
    return IconButton(
        icon: Icon(Icons.edit), color: Colors.orange, onPressed: onPressed);
  }

  Widget iconRemoveButton(BuildContext context, void Function()? remove) {
    return IconButton(
        icon: Icon(Icons.delete),
        color: Colors.red,
        onPressed: () {
          showDialog(
              context: context,
              builder: (context) => AlertDialog(
                    title: Text('Excluir'),
                    content: Text('Confirma a Exclusão?'),
                    actions: [
                      TextButton(
                        child: Text('Não'),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                      TextButton(
                        child: Text('Sim'),
                        onPressed: remove,
                      ),
                    ],
                  ));
        });
  }

  Widget iconAddButton(BuildContext context, Hours horas) {
    return IconButton(
      icon: Icon(Icons.add),
      onPressed: () {
        if ((horas.nome == 'Grupo 1 - Ensino' && horas.horaRegistrada! >= 150) ||
            ((horas.nome == 'Grupo 2 - Extensão' ||
                    horas.nome == 'Grupo 3 - Social') &&
                horas.horaRegistrada! >= 40)) {
          showDialog(
              context: context,
              builder: (context) => AlertDialog(
                    title: Text('Limite Alcançado'),
                    content: Text(
                        'Você atingiu o limite máximo de horas para esse grupo'),
                    actions: [
                      TextButton(
                        child: Text('Entendido'),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  ));
        } else {
          var dtoNew = CertificateDTO(hours: horas);
          _back.goToForm(context, dtoNew);
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    var parameter = ModalRoute.of(context)!.settings.arguments;
    var horas = parameter as Hours;
    return Scaffold(
        appBar: AppBar(
          title: Text('Lista de Certificados'),
          actions: [
            iconAddButton(context, horas),
          ],
        ),
        body: Observer(builder: (context) {
          return FutureBuilder(
              future: _back.list,
              builder: (context, futuro) {
                if (!futuro.hasData) {
                  return Center(child: CircularProgressIndicator());
                } else {
                  List<Certificate>? lista = futuro.data;
                  var filteredList = lista!
                      .where((certificate) => certificate.grupo == horas.nome)
                      .toList();
                  double totalHorasCertificadas = 0.0;
                  for (var certificado in filteredList) {
                    totalHorasCertificadas += certificado.horaCertificada!;
                  }
                  horas.horaRegistrada = totalHorasCertificadas;

                  return ListView.builder(
                    itemCount: filteredList?.length,
                    itemBuilder: (context, i) {
                      var certificado = filteredList![i];

                      return ListTile(
                        leading: circleAvatar(certificado.urlAvatar),
                        title: Text(certificado.nome!),
                         onTap: (){
                          _back.goToDetails(context, certificado);
                        },
                        subtitle: Text(
                            'Horas certificadas: ${certificado.horaCertificada?.toStringAsFixed(1)}'),
                        trailing: SizedBox(
                          width: 100,
                          child: Row(
                            children: [
                              iconEditButton(() {
                                var dto = CertificateDTO(
                                    certificate: certificado, hours: horas);
                                _back.goToForm(context, dto);
                              }),
                              iconRemoveButton(context, () {
                                horas.horaRegistrada = (horas.horaRegistrada! -
                                    certificado.horaCertificada!);
                                _back.remove(certificado.id!);
                                var hourBack = HoursService();
                                hourBack.updateHour(horas);
                                Navigator.of(context).pop();
                              })
                            ],
                          ),
                        ),
                      );
                    },
                  );
                }
              });
        }));
  }
}
