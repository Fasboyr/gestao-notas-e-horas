import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:gestao_notas_horas/app/domain/entities/certificate.dart';
import 'package:gestao_notas_horas/app/my_app.dart';
import 'package:gestao_notas_horas/app/view/certificate/certificate_form.dart';
import 'package:gestao_notas_horas/app/view/certificate/certificate_list_back.dart';

class CertificateList extends StatelessWidget {
  final _back = CertificateListBack();
  final String groupName;

  CertificateList({required this.groupName});

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


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Lista de Certificados'),
          actions: [
            IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => CertificateForm(groupName)));
              },
            )
          ],
        ),
        body:  Observer(builder: (context) {
          return FutureBuilder(
              future: _back.list,
              builder: (context, futuro) {
                if (!futuro.hasData) {
                  return Center(child: CircularProgressIndicator());
                } else {
                  List<Certificate>? lista = futuro.data;
                  var filteredList =lista!.where((certificate) => certificate.grupo == groupName).toList();

                  return ListView.builder(
                    itemCount: filteredList?.length,
                    itemBuilder: (context, i) {
                      var certificado = filteredList![i];
                      
                      return ListTile(
                        leading: circleAvatar(certificado.urlAvatar),
                        title: Text(certificado.nome!),
                       subtitle: Text('Horas certificadas: ${certificado.horaCertificada?.toStringAsFixed(1)}'),
                        trailing: SizedBox(
                          width: 100,
                          child: Row(
                            children: [
                              iconEditButton((){
                                _back.goToForm(context,certificado);
                              }),
                              iconRemoveButton(context, () {
                                _back.remove(certificado.id!);
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

