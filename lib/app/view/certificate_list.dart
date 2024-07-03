import 'package:flutter/material.dart';
import 'package:gestao_notas_horas/app/my_app.dart';

class CertificateList extends StatelessWidget {
  final String groupName;

  CertificateList({required this.groupName});

  final lista = [
    {
      'nome': 'Certificado 1',
      'descricao': 'Descrição 1',
      'hora_certificada': '10',
      'avatar':
          '',
      'grupo': 'Grupo 1 - Ensino'
    },
    {
      'nome': 'Certificado 2',
      'descricao': 'Descrição 2',
      'hora_certificada': '5',
      'avatar':
          '',
      'grupo': 'Grupo 2 - Extensão'
    },
    {
      'nome': 'Certificado 3',
      'descricao': 'Descrição 3',
      'hora_certificada': '8',
      'avatar':
          '',
      'grupo': 'Grupo 3 - Social'
    },
  ];

  @override
  Widget build(BuildContext context) {
    var filteredList =
        lista.where((certificate) => certificate['grupo'] == groupName).toList();

    return Scaffold(
        appBar: AppBar(
          title: Text('Lista de Certificados'),
          actions: [
            IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                Navigator.of(context).pushNamed(MyApp.CERTIFICATE_FORM);
              },
            )
          ],
        ),
        body: ListView.builder(
            itemCount: filteredList.length,
            itemBuilder: (context, i) {
              var certificate = filteredList[i];
              var avatar = CircleAvatar(
                backgroundImage: NetworkImage(certificate['avatar']!),
              );
              return ListTile(
                leading: avatar,
                title: Text(certificate['nome']!),
                subtitle: Text(
                    'Horas Certificadas: ${certificate['hora_certificada']}'),
                trailing: Container(
                  width: 100,
                  child: Row(
                    children: [
                      IconButton(onPressed: null, icon: Icon(Icons.edit)),
                      IconButton(onPressed: null, icon: Icon(Icons.delete))
                    ],
                  ),
                ),
              );
            }));
  }
}