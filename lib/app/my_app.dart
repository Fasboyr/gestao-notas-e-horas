
import 'package:flutter/material.dart';
import 'package:gestao_notas_horas/app/view/my_home_page.dart';
import 'package:gestao_notas_horas/app/view/subject_form.dart';
import 'package:gestao_notas_horas/app/view/subject_list.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static const HOME = '/';
  static const SUBJECT_LIST = 'subject-list';
  static const SUBJECT_FORM = 'subject-form';

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gestão de Notas e Horas',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routes: {
        HOME : (context) => MyHomePage(),
        SUBJECT_LIST : (context) => SubjectList(),
        SUBJECT_FORM : (context) => SubjectForm()
      },
    );
  }
}