import 'package:flutter/material.dart';
import 'package:gestao_notas_horas/app/my_app.dart';

class SubjectList extends StatelessWidget {
  final lista = [
    {'nome': 'Português', 'nota1' : '8','nota2' : '7.2','nota3' : '5.0', 'media' : '6,7', 'avatar': 'https://media.istockphoto.com/id/1198222830/pt/vetorial/open-textbook-drawing.jpg?s=2048x2048&w=is&k=20&c=Ej3_neMpr5mfF6kAzBvy3S92x5zI4Ypdum-nRqh-1W0='}, 
    {'nome': 'Matemática', 'nota1' : '9','nota2' : '6.2','nota3' : '7.0', 'media' : '7,4', 'avatar': 'https://cdn.pixabay.com/photo/2017/01/30/14/20/time-2020934_1280.png'}, 
    {'nome': 'Química', 'nota1' : '6','nota2' : '7.8','nota3' : '8.0', 'media' : '7,2', 'avatar': 'https://cdn.pixabay.com/photo/2017/01/31/00/14/bubble-2022490_1280.png'}, 
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Matérias'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: (){
              Navigator.of(context).pushNamed(MyApp.SUBJECT_FORM);
            },
          ) 
        ],
      ),
      body: ListView.builder(
        itemCount: lista.length,
        itemBuilder: (context, i){
          var materia = lista[i];
          var avatar = CircleAvatar(backgroundImage: NetworkImage(materia['avatar']!),);
          return ListTile(
            leading: avatar,
            title: Text(materia['nome']!),
            subtitle: Text('Média de Notas: ${materia['media']}'),
            trailing: Container(
              width: 100 ,
              child: Row(
                children: [
                  IconButton(onPressed: null, icon: Icon(Icons.edit)),
                  IconButton(onPressed: null, icon: Icon(Icons.delete))
                ],),),
          );
        },
      )
    );
  }
}