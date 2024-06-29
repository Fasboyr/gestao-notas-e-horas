import 'package:flutter/material.dart';
import 'package:gestao_notas_horas/app/database/sqlite/dao/subject_dao_impl.dart';
import 'package:gestao_notas_horas/app/domain/entities/subject.dart';
import 'package:gestao_notas_horas/app/my_app.dart';

class SubjectList extends StatelessWidget {
  Future<List<Subject>> _search() async {
    return SubjectDAOImpl().find();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _search(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Scaffold(
            appBar: AppBar(
              title: Text('Lista de Matérias'),
              actions: [
                IconButton(
                  icon: Icon(Icons.add),
                  onPressed: () {
                    Navigator.of(context).pushNamed(MyApp.SUBJECT_FORM);
                  },
                )
              ],
            ),
            body: Center(child: CircularProgressIndicator()),
          );
        } else if (snapshot.hasError) {
          return Scaffold(
            appBar: AppBar(
              title: Text('Lista de Matérias'),
              actions: [
                IconButton(
                  icon: Icon(Icons.add),
                  onPressed: () {
                    Navigator.of(context).pushNamed(MyApp.SUBJECT_FORM);
                  },
                )
              ],
            ),
            body: Center(child: Text('Erro: ${snapshot.error}')),
          );
        } else if (snapshot.hasData) {
          List<Subject> lista = snapshot.data as List<Subject>;
          return Scaffold(
            appBar: AppBar(
              title: Text('Lista de Matérias'),
              actions: [
                IconButton(
                  icon: Icon(Icons.add),
                  onPressed: () {
                    Navigator.of(context).pushNamed(MyApp.SUBJECT_FORM);
                  },
                )
              ],
            ),
            body: ListView.builder(
              itemCount: lista.length,
              itemBuilder: (context, i) {
                var materia = lista[i];
                var avatar = CircleAvatar(
                  backgroundImage: NetworkImage(materia.urlAvatar!),
                );
                return ListTile(
                  leading: avatar,
                  title: Text(materia.nome!),
                  subtitle: Text('Média de Notas: ${materia.media}'),
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
              },
            ),
          );
        } else {
          return Scaffold(
            appBar: AppBar(
              title: Text('Lista de Matérias'),
              actions: [
                IconButton(
                  icon: Icon(Icons.add),
                  onPressed: () {
                    Navigator.of(context).pushNamed(MyApp.SUBJECT_FORM);
                  },
                )
              ],
            ),
            body: Center(child: Text('Nenhum dado disponível')),
          );
        }
      },
    );
  }
}


