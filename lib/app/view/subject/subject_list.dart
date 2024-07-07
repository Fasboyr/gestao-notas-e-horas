import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:gestao_notas_horas/app/domain/entities/subject.dart';
import 'package:gestao_notas_horas/app/my_app.dart';
import 'package:gestao_notas_horas/app/view/subject/subject_list_back.dart';

class SubjectList extends StatelessWidget {
  final _back = SubjectListBack();


   CircleAvatar circleAvatar(String? url) {
    if (url != null && Uri.tryParse(url) != null && Uri.tryParse(url)!.isAbsolute) {
      return CircleAvatar(backgroundImage: NetworkImage(url));
    } else {
      return CircleAvatar(child: Icon(Icons.book));
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
          title: Text('Lista de Matérias'),
          actions: [
            IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                _back.goToForm(context);
              },
            )
          ],
        ),
        body: Observer(builder: (context) {
          return FutureBuilder(
              future: _back.list,
              builder: (context, futuro) {
                if (!futuro.hasData) {
                  return CircularProgressIndicator();
                } else {
                  List<Subject>? lista = futuro.data;
                  return ListView.builder(
                    itemCount: lista?.length,
                    itemBuilder: (context, i) {
                      var materia = lista![i];
                      
                      return ListTile(
                        leading: circleAvatar(materia.urlAvatar),
                        title: Text(materia.nome!),
                        onTap: (){
                         _back.goToDetails(context, materia);
                        },
                       subtitle: Text('Média de Notas: ${materia.media?.toStringAsFixed(1)}'),
                        trailing: SizedBox(
                          width: 100,
                          child: Row(
                            children: [
                              iconEditButton((){
                                _back.goToForm(context, materia);
                              }),
                              iconRemoveButton(context, () {
                                _back.remove(materia.id!);
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
