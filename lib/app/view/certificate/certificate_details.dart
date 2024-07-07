import 'package:flutter/material.dart';
import 'package:gestao_notas_horas/app/domain/entities/certificate.dart';
import 'package:gestao_notas_horas/app/view/certificate/certificate_details_back.dart';

class CertificateDetails extends StatelessWidget {
  @override
   Widget build(BuildContext context) {
    var _back = CertificateDetailsBack(context);
    Certificate certificate = _back.certificate;
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        var width = constraints.biggest.width;
        var radius = width/4;

        return Scaffold(
          body: ListView(
            children: [
              (Uri.tryParse(certificate.urlAvatar as String)!.isAbsolute) ?
                CircleAvatar(
                  backgroundImage: NetworkImage(certificate.urlAvatar as String),
                  radius: radius,
                ):
                CircleAvatar(
                  radius: radius,
                  child: Icon(
                    Icons.insert_drive_file,
                    size: width/2,),
                  ),
               Center(
                child: Text('${certificate.nome}', style: TextStyle(fontSize: 30),),
              ),
              Card(
                child: ListTile(
                  title: Text('Descrição do certificado'),
                  subtitle: Text('${certificate.descricao}'),
                ),
              ),
               Card(
                child: ListTile(
                  title: Text('Grupo de Horas'),
                  subtitle: Text('${certificate.grupo}'),
                ),
              ),
              Card(
                child: ListTile(
                  title: Text('Horas Certificadas'),
                  subtitle: Text('${certificate.horaCertificada?.toStringAsFixed(1)}'),
                ),
              ),
            ],
          ),
          floatingActionButton: FloatingActionButton(
            child: Icon(Icons.arrow_back),
            onPressed: (){
              _back.goToBack();
            },
          ),
        );
      },
    );
  }
}