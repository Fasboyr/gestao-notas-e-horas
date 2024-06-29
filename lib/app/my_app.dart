import 'package:flutter/material.dart';
import 'package:gestao_notas_horas/app/view/certificate_form.dart';
import 'package:gestao_notas_horas/app/view/certificate_list.dart';
import 'package:gestao_notas_horas/app/view/hours_list.dart';
import 'package:gestao_notas_horas/app/view/my_home_page.dart';
import 'package:gestao_notas_horas/app/view/subject_form.dart';
import 'package:gestao_notas_horas/app/view/subject_list.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static const HOME = '/';
  static const SUBJECT_LIST = 'subject-list';
  static const SUBJECT_FORM = 'subject-form';
  static const HOURS_LIST = 'hours-list';
  static const CERTIFICATE_LIST = 'certificate-list';
  static const CERTIFICATE_FORM = 'certificate-form';

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gestão de Notas e Horas',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      onGenerateRoute: (settings) {
        if (settings.name == CERTIFICATE_LIST) {
          final args = settings.arguments as Map<String, String>;
          return MaterialPageRoute(
            builder: (context) {
              return CertificateList(groupName: args['groupName']!);
            },
          );
        }
        switch (settings.name) {
          case HOME:
            return MaterialPageRoute(builder: (context) => MyHomePage());
          case SUBJECT_LIST:
            return MaterialPageRoute(builder: (context) => SubjectList());
          case SUBJECT_FORM:
            return MaterialPageRoute(builder: (context) => SubjectForm());
          case HOURS_LIST:
            return MaterialPageRoute(builder: (context) => HoursList());
          case CERTIFICATE_FORM:
            return MaterialPageRoute(builder: (context) => CertificateForm());
          default:
            return null;
        }
      },
    );
  }
}
