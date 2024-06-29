import 'package:flutter/material.dart';
import 'package:gestao_notas_horas/app/database/sqlite/dao/hours_dao_impl.dart';
import 'package:gestao_notas_horas/app/domain/entities/hours.dart';
import 'package:gestao_notas_horas/app/view/certificate_list.dart';

class HoursList extends StatelessWidget {

  Future<List<Hours>> _search() async {
    return HoursDAOImpl().find();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _search(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Scaffold(
            appBar: AppBar(
              title: Text('Horas Complementares'),
            ),
            body: Center(child: CircularProgressIndicator()),
          );
        } else if (snapshot.hasError) {
          return Scaffold(
            appBar: AppBar(
              title: Text('Horas Complementares'),
            ),
            body: Center(child: Text('Erro: ${snapshot.error}')),
          );
        } else if (snapshot.hasData && snapshot.data != null) {
          List<Hours> lista = snapshot.data as List<Hours>;
          return Scaffold(
            appBar: AppBar(
              title: Text('Horas Complementares'),
            ),
            body: ListView.builder(
              itemCount: lista.length,
              itemBuilder: (context, i) {
                var horas = lista[i];
                var avatarUrl = horas.urlAvatar!.isNotEmpty ? horas.urlAvatar : '';
                var avatar = CircleAvatar(
                  backgroundImage:
                      avatarUrl!.isNotEmpty ? NetworkImage(avatarUrl) : null,
                );
                return ListTile(
                  leading: avatar,
                  title: Text(horas.nome as String),
                  subtitle: Text('Horas Registradas: ${horas.horaRegistrada}'),
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => CertificateList(
                          groupName: horas.nome as String,
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          );
        } else {
          return Scaffold(
            appBar: AppBar(
              title: Text('Horas Complementares'),
            ),
            body: Center(child: Text('Nenhum dado disponível')),
          );
        }
      },
    );
  }
}
