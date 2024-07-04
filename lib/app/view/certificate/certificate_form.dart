import 'package:flutter/material.dart';
import 'package:gestao_notas_horas/app/view/certificate/certificate_form_back.dart';

class CertificateForm extends StatelessWidget {
  final String groupName;

  CertificateForm([this.groupName = 'Grupo']);
  
  final _form = GlobalKey<FormState>();

  Widget fieldName(CertificateFormBack back) {
    return TextFormField(
        validator: back.validateName,
        onSaved: (newValue) => back.certificate.nome = newValue,
        initialValue: back.certificate.nome,
        decoration: InputDecoration(labelText: 'Nome:'));
  }

  Widget fieldDescription(CertificateFormBack back){
    return TextFormField(
      validator: back.validateDescription,
        onSaved: (newValue) => back.certificate.descricao = newValue,
        initialValue: back.certificate.descricao,
        decoration: InputDecoration(labelText: 'Descrição:'));
  }


   Widget fieldGroupName(CertificateFormBack back, [String? groupName]){
    return TextFormField(
      validator: back.validateGroupName,
        onSaved: (newValue) => back.certificate.grupo = newValue,
        initialValue: groupName,
         decoration: InputDecoration(labelText: 'Grupo:'));
  }

   Widget fieldHoursCertificate(CertificateFormBack back){
    return TextFormField(
      validator:(value){ 
        double? hours = double.tryParse(value ?? '');
        return back.validateHoursCertificate(hours); },
        onSaved: (newValue) => back.certificate.horaCertificada = double.tryParse(newValue!),
        initialValue: back.certificate.horaCertificada != null ? back.certificate.horaCertificada.toString() : '',
         keyboardType: TextInputType.number,
        decoration: InputDecoration(labelText: 'Horas Certificadas:'));
  }

   Widget fieldURLImage(CertificateFormBack back) {
    return TextFormField(
      onSaved: (newValue) => back.certificate.urlAvatar= newValue,
      initialValue: back.certificate.urlAvatar,
      decoration: InputDecoration(
        labelText: 'Endereço Foto:', hintText: 'http://www.site.com'));
  }

  @override
  Widget build(BuildContext context) {
    var _back = CertificateFormBack(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastro de Certificados'),
        actions: [
          IconButton(
              icon: Icon(Icons.save),
              onPressed: () {
                _form.currentState!.validate();
                _form.currentState!.save();
                if (_back.isValid) {
                  _back.save();
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
              fieldDescription(_back),
              if(_back.isNewSubject) ...[
                fieldGroupName(_back, groupName),
              ] else ...[
                fieldGroupName(_back)
              ],
              fieldHoursCertificate(_back),
              fieldURLImage(_back),
            ],
          ),
        ),
      ),
    );
  }
}
