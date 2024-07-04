import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:gestao_notas_horas/app/domain/entities/hours.dart';
import 'package:gestao_notas_horas/app/view/hours/hours_list_back.dart';

class HoursList extends StatelessWidget {
  final _back = HoursListBack();

  CircleAvatar circleAvatar(String? url) {
    if (url != null &&
        Uri.tryParse(url) != null &&
        Uri.tryParse(url)!.isAbsolute) {
      return CircleAvatar(backgroundImage: NetworkImage(url));
    } else {
      return CircleAvatar(child: Icon(Icons.hourglass_bottom));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Horas Complementares'),
        ),
        body: Observer(builder: (context) {
          return FutureBuilder(
              future: _back.list,
              builder: (context, futuro) {
                if (!futuro.hasData) {
                  return CircularProgressIndicator();
                } else {
                  List<Hours>? lista = futuro.data;
                  return ListView.builder(
                    itemCount: lista!.length,
                    itemBuilder: (context, i) {
                      var horas = lista[i];
                      return ListTile(
                        leading: circleAvatar(horas.urlAvatar),
                        title: Text(horas.nome!),
                        subtitle:
                            Text('Horas Registradas: ${horas.horaRegistrada!.toStringAsFixed(1)}'),
                        onTap: () {
                          _back.goToList(context, horas);
                        },
                      );
                    },
                  );
                }
              });
        }));
  }
}

