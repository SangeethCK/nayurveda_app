
import 'dart:developer';
import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/services.dart';
import 'package:nayurveda_app/domain/models/rgeister/register_request.dart';
import 'package:open_file_plus/open_file_plus.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:path_provider/path_provider.dart';

PdfColor primaryLite = const PdfColor.fromInt(0XFF00A64F);
PdfColor kblack = const PdfColor.fromInt(0xff000000);

Future<void> generatePDF(RegisterRequest registerRequest) async {
  final pdf = pw.Document();
  final Uint8List logoImage =
      (await rootBundle.load('assets/images/Asset 1 2.png'))
          .buffer
          .asUint8List();

  pdf.addPage(
    pw.Page(
      build: (pw.Context context) {
        return pw.Column(
          crossAxisAlignment: pw.CrossAxisAlignment.start,
          children: [
            pw.Row(
              children: [
                pw.Container(
                  width: 100,
                  height: 100,
                  margin: const pw.EdgeInsets.only(bottom: 20.0),
                  child: pw.Image(
                    pw.MemoryImage(logoImage),
                  ),
                ),
                pw.Spacer(),
                pw.Column(children: [
                  pw.RichText(
                    text: pw.TextSpan(
                      text: 'KUMARAKOM\n',
                      style: pw.TextStyle(
                        fontWeight: pw.FontWeight.bold,
                        color: PdfColors.black,
                      ),
                      children: const [
                        pw.TextSpan(
                          text:
                              'Cheepunkal P.O. Kumarakom, kottayam, Kerala - 686563\n',
                          style: pw.TextStyle(color: PdfColors.grey),
                        ),
                        pw.TextSpan(
                          text: 'e-mail: unknown@gmail.com\n',
                          style: pw.TextStyle(color: PdfColors.grey),
                        ),
                        pw.TextSpan(
                          text: 'Mob: +91 9876543210 | +91 9786543210',
                          style: pw.TextStyle(color: PdfColors.grey),
                        ),
                      ],
                    ),
                  ),
                ]),
              ],
            ),
            pw.Column(
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: [
                pw.Divider(color: PdfColors.grey),
                pw.Text('Patient Details',
                    style: pw.TextStyle(color: primaryLite)),
                pw.SizedBox(height: 20),
                pw.Row(
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  mainAxisAlignment: pw.MainAxisAlignment.spaceAround,
                  children: [
                    pw.Table(children: [
                      pw.TableRow(children: [
                        pw.Text('Name:',
                            style: pw.TextStyle(
                                color: kblack,
                                fontWeight: pw.FontWeight.normal)),
                        pw.SizedBox(width: 20),
                        pw.Text(
                          registerRequest.name ?? '',
                          style: const pw.TextStyle(color: PdfColors.grey),
                        ),
                      ]),
                      pw.TableRow(children: [
                        pw.Text('Address:',
                            style: pw.TextStyle(
                                color: kblack,
                                fontWeight: pw.FontWeight.normal)),
                        pw.SizedBox(width: 20),
                        pw.Text(
                          registerRequest.address ?? '',
                          style: const pw.TextStyle(color: PdfColors.grey),
                        ),
                      ]),
                      pw.TableRow(children: [
                        pw.Text('Phone:',
                            style: pw.TextStyle(
                                color: kblack,
                                fontWeight: pw.FontWeight.normal)),
                        pw.SizedBox(width: 20),
                        pw.Text(
                          registerRequest.phone ?? '',
                          style: const pw.TextStyle(color: PdfColors.grey),
                        ),
                      ]),
                    ]),
                    pw.SizedBox(width: 20),
                    pw.Table(children: [
                      pw.TableRow(children: [
                        pw.Text('Booked On:',
                            style: pw.TextStyle(
                                color: kblack,
                                fontWeight: pw.FontWeight.normal)),
                        pw.SizedBox(width: 20),
                        pw.Text(
                          registerRequest.dateNdTime ?? '',
                          style: const pw.TextStyle(color: PdfColors.grey),
                        ),
                      ]),
                      pw.TableRow(children: [
                        pw.Text('Treatment Date:',
                            style: pw.TextStyle(
                                color: kblack,
                                fontWeight: pw.FontWeight.normal)),
                        pw.SizedBox(width: 20),
                        pw.Text(
                          registerRequest.dateNdTime ?? '',
                          style: const pw.TextStyle(color: PdfColors.grey),
                        ),
                      ]),
                      pw.TableRow(children: [
                        pw.Text('Treatment Time:',
                            style: pw.TextStyle(
                                color: kblack,
                                fontWeight: pw.FontWeight.normal)),
                        pw.SizedBox(width: 20),
                        pw.Text(
                          registerRequest.dateNdTime ?? '',
                          style: const pw.TextStyle(color: PdfColors.grey),
                        ),
                      ]),
                    ]),
                  ],
                ),
                pw.SizedBox(height: 25),
                pw.Text('Details Details',
                    style: pw.TextStyle(color: primaryLite)),
                pw.SizedBox(height: 25),
                pw.Table(
                  children: [
                    // Table header
                    pw.TableRow(children: [
                      pw.Text('Treatment'),
                      pw.Text('Price'),
                      pw.Text('Male'),
                      pw.Text('Female'),
                      pw.Text('Total'),
                    ]),
                    // Table data
                    pw.TableRow(children: [
                      pw.Text(registerRequest.treatments.toString()),
                      pw.Text(registerRequest.totalAmount.toString()),
                      pw.Text(registerRequest.male.toString()),
                      pw.Text(registerRequest.female.toString()),
                      pw.Text(registerRequest.totalAmount.toString()),
                    ]),
                  ],
                ),
              ],
            ),
          ],
        );
      },
    ),
  );

  try {
    // Save the PDF to a file
    final directory = await getApplicationDocumentsDirectory();
    final file = File('${directory.path}/example.pdf');
    await file.writeAsBytes(await pdf.save());
    await openFile(file);
    print('PDF saved successfully');
  } catch (e) {
    print('Error saving PDF: $e');
  }
}

Future<void> openFile(File file) async {
  final url = file.path;
  try {
    log('URL: $url');
    await OpenFile.open(url);
    log('File opened successfully');
  } catch (e, s) {
    log('Error opening file: $e', stackTrace: s);
  }
}
