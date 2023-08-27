
import 'dart:convert';
import 'dart:typed_data';


import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:intl/intl.dart';
import 'package:labial/app/domain/app/util/bd_key_constraints.dart';
import 'package:labial/app/modules/question_module/data/datasource/question_datasource_impl.dart';
import 'package:labial/generated/assets.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:signature/signature.dart';

import '../../../modules/question_module/data/model/question_model.dart';
import '../datasource/bd_helper.dart';

class GeneratePdf {
  GeneratePdf._();

  static Future<Uint8List> generatePdf(
      ) async {
    final pdf = pw.Document();
    final imageLogo = pw.MemoryImage(
        (await rootBundle.load(Assets.assetsLogoColorido))
            .buffer
            .asUint8List());
  var userName=await BdHelper.getData(key: BdKeyConstraints.userName);
  var multIple=await BdHelper.getData(key: BdKeyConstraints.multipleAnswer);
  var single=await BdHelper.getData(key: BdKeyConstraints.singleAnswer);
  var medicalSingature=await BdHelper.getData(key: BdKeyConstraints.medicalSingatue);
  var patientSinagute=await BdHelper.getData(key: BdKeyConstraints.userSingature);


    List<QuestionModel>questions=await QuestionDatasourceImpl().getAll();
    List<String> filtredSingleAnswer = List.from(jsonDecode(single!));
    List<String> filtredAnswerMultple =  List.from(jsonDecode(multIple!));
    pdf.addPage(
      pw.Page(
        pageFormat: PdfPageFormat.a4,
        build: (pw.Context context) {


          return pw.Column(
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: [
                pw.SizedBox(
                  width: 80,
                  height: 80,
                  child: pw.Image(imageLogo),
                ),
                pw.SizedBox(height: 10),
               pw.Row(
                 mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                 children:
                 [
                   pw.Text("Paciente: $userName"),

                   pw.Text(DateFormat(" d 'de' MMMM 'de' y", "pt_BR").format(DateTime.now())
                   ),
                 ]
               ),
                pw.SizedBox(height: 10),
                ...questions.map((question) {
                  return pw.Column(
                    crossAxisAlignment: pw.CrossAxisAlignment.start,
                    children: [
                      pw.Text(question.title!,
                          style: pw.TextStyle(
                              fontSize: 11, fontWeight: pw.FontWeight.bold)),
                      pw.SizedBox(height: 1),
                      question.id == 1
                          ? pw.Column(
                              crossAxisAlignment: pw.CrossAxisAlignment.start,
                              children: filtredAnswerMultple.map((e) {
                                return pw.Text(e,
                                    style: const pw.TextStyle(
                                        color: PdfColors.red));
                              }).toList(),
                            )
                          : pw.Container(
                        constraints: const pw.BoxConstraints(
                          minHeight: 20,
                          maxHeight: 22
                        ),

                              child: pw.Column(
                                crossAxisAlignment: pw.CrossAxisAlignment.start,
                                children: [
                                 pw.Text(filtredSingleAnswer[indexCOnverter(question.id!)],style: const pw.TextStyle(
                                     color: PdfColors.red))
                                ],
                              )),

                    ],
                  );
                }).toList(),
                pw.SizedBox(height: 15),
                pw.Text("Quantidade de ml Recomendado:____",style: pw.TextStyle(
                    fontSize: 14, fontWeight: pw.FontWeight.bold)),
                pw.SizedBox(height: 80),

                pw.Row(
                    mainAxisAlignment: pw.MainAxisAlignment.spaceEvenly,

                    children: [
                   pw.Column(
                     children: [

                       pw.SizedBox(
                         width: 80,
                         height: 80,
                         child: pw.Image(pw.MemoryImage(base64Decode(medicalSingature!))),
                       ),
                       pw.SizedBox(height: 15),

                       pw.Text("Assinatura Profissional"),
                     ]
                   ),
                      pw.Column(
                          children: [

                            pw.SizedBox(
                              width: 80,
                              height: 80,
                              child: pw.Image(pw.MemoryImage(base64Decode(patientSinagute!))),
                            ),
                            pw.SizedBox(height: 15),

                            pw.Text("Assinatura Paciente"),
                          ]
                      ),
                  ]
                )
              ]
          
          );
        },
      ),
    ); // Page

    return pdf.save();
  }
}

int indexCOnverter(int index){
  int newIndex=0;
  if(index==2){
    newIndex=0;
  }else{
    newIndex=index-2;
  }




  return newIndex;
}
PdfColor selectedAnswer(
    QuestionModel question, List<String> options, String answ) {
  PdfColor color = PdfColors.black;

  if (question.id! > 1) {


    if (options.contains(answ)) {
      return PdfColors.red;
    }
  }

  return color;
}
Future<Uint8List> getSignature(
    SignatureController signatureController) async {
  SignatureController testas = SignatureController(
      penStrokeWidth: 2,
      penColor: Colors.black,
      exportBackgroundColor: Colors.white,
      points: signatureController.points);
  var alo = await testas.toPngBytes();
  return alo!;
}