import 'package:flutter/material.dart';
import 'package:gestao_notas_horas/app/domain/entities/subject.dart';
import 'package:gestao_notas_horas/app/view/subject/subject_details_back.dart';
import 'package:path/path.dart';

class SubjectDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var _back = SubjectDetailsBack(context);
    Subject subject = _back.subject;
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        var width = constraints.biggest.width;
        var radius = width/4;

        return Scaffold(
          body: ListView(
            children: [
              (Uri.tryParse(subject.urlAvatar as String)!.isAbsolute) ?
                CircleAvatar(
                  backgroundImage: NetworkImage(subject.urlAvatar as String),
                  radius: radius,
                ):
                CircleAvatar(
                  radius: radius,
                  child: Icon(
                    Icons.book,
                    size: width/2,),
                  ),
               Center(
                child: Text('${subject.nome}', style: TextStyle(fontSize: 30),),
              ),
              Card(
                child: ListTile(
                  title: Text('Nota 1º Trimestre'),
                  subtitle: Text('${subject.nota1}'),
                ),
              ),
               Card(
                child: ListTile(
                  title: Text('Nota 2º Trimestre'),
                  subtitle: Text('${subject.nota2}'),
                ),
              ),
              Card(
                child: ListTile(
                  title: Text('Nota 3º Trimestre'),
                  subtitle: Text('${subject.nota3}'),
                ),
              ),
               Card(
                child: ListTile(
                  title: Text('Média:'),
                  subtitle: Text('${subject.media?.toStringAsFixed(1)}'),
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
