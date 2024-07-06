import 'package:flutter/material.dart';
import 'package:gestao_notas_horas/app/domain/entities/certificate.dart';
import 'package:gestao_notas_horas/app/view/certificate/DTO/certificate_dto.dart';
import 'package:gestao_notas_horas/app/view/certificate/certificate_form_back.dart';

class CertificateForm extends StatelessWidget {

  final _form = GlobalKey<FormState>();

  Widget fieldName(CertificateFormBack back) {
    return TextFormField(
        validator: back.validateName,
        onSaved: (newValue) => back.certificateDTO.certificate?.nome = newValue,
        initialValue: back.certificateDTO.certificate?.nome,
        decoration: InputDecoration(labelText: 'Nome:'));
  }

  Widget fieldDescription(CertificateFormBack back){
    return TextFormField(
      validator: back.validateDescription,
        onSaved: (newValue) => back.certificateDTO.certificate?.descricao = newValue,
        initialValue: back.certificateDTO.certificate?.descricao,
        decoration: InputDecoration(labelText: 'Descrição:'));
  }


   Widget fieldGroupName(CertificateFormBack back){
    return TextFormField(
      validator: back.validateGroupName,
        onSaved: (newValue) => back.certificateDTO.certificate?.grupo = back.certificateDTO.hours?.nome ?? newValue,
        initialValue: back.certificateDTO.hours?.nome,
         decoration: InputDecoration(labelText: 'Grupo:'));
  }

   Widget fieldHoursCertificate(CertificateFormBack back){
    return TextFormField(
      validator:(value){
        double? newHours = double.tryParse(value ?? ' ');
        if(back.isNewCertificate){
           return back.validateHoursCertificate(newHours);
        } else{
           return back.validateHoursCertificate(newHours, back.certificateDTO.certificate!.horaCertificada);
          }
        },
        onSaved: (newValue) => back.certificateDTO.certificate?.horaCertificada = double.tryParse(newValue!),
        initialValue: back.certificateDTO.certificate?.horaCertificada != null ? back.certificateDTO.certificate?.horaCertificada.toString() : ' ',
         keyboardType: TextInputType.number,
        decoration: InputDecoration(labelText: 'Horas Certificadas:'));
  }

   Widget fieldURLImage(CertificateFormBack back) {
    return TextFormField(
      onSaved: (newValue) => back.certificateDTO.certificate?.urlAvatar = newValue ?? '',
      initialValue: back.certificateDTO.certificate?.urlAvatar ?? '' ,
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
              fieldGroupName(_back),          
              fieldHoursCertificate(_back),
              fieldURLImage(_back),
            ],
          ),
        ),
      ),
    );
  }
}
