import 'package:flutter/material.dart';
import 'package:gestao_notas_horas/app/my_app.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pagina Inicial'),
        actions: [
          IconButton(
            icon: Icon(Icons.arrow_forward),
            onPressed: () {
              Navigator.of(context).pushNamed('subject-list');
            },
          )
        ],
      ),
      body: Column(
        children: [
          SizedBox(height: 80),
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, MyApp.SUBJECT_LIST);
            },
            child: Container(
              color: Colors.blue,
              padding: EdgeInsets.all(16.0),
              margin: EdgeInsets.all(8.0),
              child: Center(
                child: Text(
                  'Matérias, Médias & Notas Trimestrais',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
            ),
          ),
          SizedBox(height: 30),
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, '/option2');
            },
            child: Container(
              color: Colors.blue,
              padding: EdgeInsets.all(16.0),
              margin: EdgeInsets.all(8.0),
              child: Center(
                child: Text(
                  'Horas Complementares',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
