import 'package:flutter/material.dart';
import 'package:gestao_notas_horas/app/view/subject_form_back.dart';
import 'package:path/path.dart';

class SubjectForm extends StatelessWidget {
  final _form = GlobalKey<FormState>();

  Widget fieldName(SubjectFormBack back) {
    return TextFormField(
        validator: back.validateName,
        onSaved: (newValue) => back.subject.nome = newValue,
        initialValue: back.subject.nome,
        decoration: InputDecoration(labelText: 'Nome:'));
  }

  Widget fieldNota1(SubjectFormBack back) {
    return TextFormField(
        validator: back.validateNote1,
        onSaved: (newValue) => back.subject.nota1 = double.tryParse(newValue!),
        initialValue: back.subject.nota1.toString(),
        keyboardType: TextInputType.number,
        decoration: InputDecoration(labelText: 'Nota 1º Trimestre:'));
  }

  Widget fieldNota2(SubjectFormBack back) {
    return TextFormField(
        validator: (value) {
          return back.validateNote2(value);
        },
        onSaved: (newValue) {
          back.subject.nota2 = double.tryParse(newValue!);
        },
        initialValue: back.subject.nota2.toString(),
        keyboardType: TextInputType.number,
        decoration: InputDecoration(labelText: 'Nota 2º Trimestre:'));
  }

  Widget fieldNota3(SubjectFormBack back) {
    return TextFormField(
        validator: (value) => back.validateNote3(value),
        onSaved: (newValue) => back.subject.nota3 = double.tryParse(newValue!),
        initialValue: back.subject.nota3.toString(),
        keyboardType: TextInputType.number,
        decoration: InputDecoration(labelText: 'Nota 3º Trimestre:'));
  }

  Widget fieldURLImage(SubjectFormBack back) {
    return TextFormField(
        /*onSaved: (newValue) => back.contact.urlAvatar= newValue,
      initialValue: back.contact.urlAvatar,*/
        initialValue: back.subject.urlAvatar,
        decoration: InputDecoration(
            labelText: 'Endereço Foto:', hintText: 'http://www.site.com'));
  }

  @override
  Widget build(BuildContext context) {
    print('Received context in Form: $context');
    var _back = SubjectFormBack(context);
    print('Building form with subject name: ${_back.subject.nome}');
    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastro de Matérias'),
        actions: [
          IconButton(
              icon: Icon(Icons.save),
              onPressed: () {
                _form.currentState!.validate();
                _form.currentState!.save();
                if (_back.isCreationValid && _back.isNewSubject) {
                  _back.saveCreation();
                  Navigator.of(context).pop();
                } else if (_back.isEditionValid && !_back.isNewSubject) {
                  _back.saveEdition();
                  Navigator.of(context).pop();
                }
              })
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Form(
          key: _form,
          child: Column(
            children: [
              fieldName(_back),
              fieldURLImage(_back),
              if (!_back.isNewSubject) ...[
                fieldNota1(_back),
                fieldNota2(_back),
                fieldNota3(_back),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
