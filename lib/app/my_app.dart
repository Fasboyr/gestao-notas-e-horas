import 'package:flutter/material.dart';
import 'package:gestao_notas_horas/app/domain/entities/certificate.dart';
import 'package:gestao_notas_horas/app/view/certificate/certificate_details.dart';
import 'package:gestao_notas_horas/app/view/certificate/certificate_form.dart';
import 'package:gestao_notas_horas/app/view/certificate/certificate_list.dart';
import 'package:gestao_notas_horas/app/view/hours/hours_list.dart';
import 'package:gestao_notas_horas/app/view/my_home_page.dart';
import 'package:gestao_notas_horas/app/view/subject/subject_details.dart';
import 'package:gestao_notas_horas/app/view/subject/subject_form.dart';
import 'package:gestao_notas_horas/app/view/subject/subject_list.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static const HOME = '/';
  static const SUBJECT_LIST = 'subject-list';
  static const SUBJECT_FORM = 'subject-form';
  static const SUBJECT_DETAILS = 'subject-details';
  static const HOURS_LIST = 'hours-list';
  static const CERTIFICATE_LIST = 'certificate-list';
  static const CERTIFICATE_FORM = 'certificate-form';
  static const CERTIFICATE_DETAILS = 'certificate-details';

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gestão de Notas e Horas',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routes: {
        HOME: (context) => MyHomePage(),
        SUBJECT_LIST: (context) => SubjectList(),
        SUBJECT_FORM: (context) => SubjectForm(),
        SUBJECT_DETAILS: (context) => SubjectDetails(),
        HOURS_LIST: (context) => HoursList(),
        CERTIFICATE_LIST: (context) => CertificateList(),
        CERTIFICATE_FORM: (context) => CertificateForm(),
        CERTIFICATE_DETAILS: (context) => CertificateDetails(),
        
      },
      /*
      onGenerateRoute: (settings) {
        if (settings.name == CERTIFICATE_LIST) {
          final args = settings.arguments as Map<String, String>;
          return MaterialPageRoute(
            builder: (context) {
              return CertificateList(hours: args['groupName']!);
            },
          );
        } else if (settings.name == CERTIFICATE_FORM) {
          final args = settings.arguments as Map<String, String>;
          final Certificate? certificate = args['subject'] as Certificate?;
          final String? groupName = args['groupName'] as String?;
          return MaterialPageRoute(
            builder: (context) =>
                CertificateForm(groupName: groupName as String, certificate: certificate,),
          );
        }
      },*/
    );
  }
}
