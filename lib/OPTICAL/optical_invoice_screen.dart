import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hospital_app/OPTICAL/optical_bloc.dart';
import 'package:hospital_app/OTP%20Directories/otp_screen.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

class OpticalInvoiceScreen extends StatefulWidget {
  final billIndex;
  final pdfID;
  final pdfName;
  const OpticalInvoiceScreen(
      {Key? key, this.billIndex, this.pdfName, this.pdfID})
      : super(key: key);

  @override
  State<OpticalInvoiceScreen> createState() => _OpticalInvoiceScreenState();
}

class _OpticalInvoiceScreenState extends State<OpticalInvoiceScreen> {
  @override
  void initState() {
    super.initState();
  }

  bool _downloading = false;
  Directory? directory;
  String? name;
  String? nameofBill;

  //getting Storage permission for downloading Invoice pdf
  Future<bool> requestPermission(Permission permission) async {
    if (await permission.isGranted) {
      return true;
    } else {
      var result = await permission.request();
      if (result == PermissionStatus.granted) {
        return true;
      } else {
        return false;
      }
    }
  }

  // function to download invoice PDF
  Future<bool> _downloadFile(String url, String fileName) async {
    setState(() {
      _downloading = true;
    });
    if (Platform.isAndroid) {
      await requestPermission(Permission.storage);

      try {
        final response = await http.get(Uri.parse(
            'http://gtech.easysolution.asia:91/api/DownloadFile?Reciept_NO=$url'));

        final bytes = response.bodyBytes;

        directory = await getExternalStorageDirectory();
        print(directory!.path);

        final file = File('${directory!.path}/${fileName}');

        await file.writeAsBytes(bytes);
        setState(() {
          _downloading = false;
        });
      } catch (e) {}
    } else {
      if (await requestPermission(Permission.storage)) {
        directory = await getApplicationDocumentsDirectory();
        try {
          final response = await http.get(Uri.parse(
              'http://gtech.easysolution.asia:91/api/DownloadFile?Reciept_NO=$url'));
          final bytes = response.bodyBytes;

          directory = await getApplicationDocumentsDirectory();
          print(directory!.path);

          final file = File('${directory!.path}/${widget.pdfName} ,$fileName');

          await file.writeAsBytes(bytes);
          setState(() {
            _downloading = false;
          });
          print('downloaded');
          setState(() {
            _downloading = false;
          });
          return true;
        } catch (e) {
          print(e.toString());
        }
      } else {
        print('Downloaded failed');
        return false;
      }
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OpticalBloc()
        ..add(OpticalBillFetchEvent(
            phoneNumber: OtpScreen.numberForProfileScreen)),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          actions: [
            Container(
                padding: const EdgeInsets.all(10),
                child: _downloading == true
                    ? const CircularProgressIndicator()
                    : IconButton(
                        color: Colors.teal,
                        onPressed: () {
                          _downloadFile(
                              widget.pdfID,
                              widget.pdfName
                                  .toString()
                                  .replaceAll(RegExp('/'), ''));
                        },
                        icon: const Icon(Icons.download),
                      ))
          ],
          elevation: 0,
          centerTitle: true,
          backgroundColor: Colors.white,
          iconTheme: const IconThemeData(color: Colors.black),
          title: const Text(
            'Sales Order',
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(25.0),
          child: SingleChildScrollView(
            child: BlocBuilder<OpticalBloc, OpticalState>(
              builder: (context, state) {
                if (state is OpticalBillLoadingState) {
                  return const Center(
                      child: CircularProgressIndicator(
                    color: Colors.teal,
                  ));
                }
                if (state is OpticalBillLoadedState) {
                  final opticalData = state.opticalData;
                  final iconColor = opticalData[widget.billIndex]
                          ['DeliveryStatus']
                      .toString();
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              const Text(
                                'Reciept NO.',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16),
                              ),
                              Text(
                                opticalData[widget.billIndex]['RecieptNo'],
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16),
                              )
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                              height: 25,
                              width: 25,
                              decoration: BoxDecoration(
                                  color: Colors.grey[200],
                                  borderRadius: BorderRadius.circular(10)),
                              child: const Icon(
                                Icons.calendar_month_sharp,
                                color: Colors.teal,
                                size: 17,
                              )),
                          const SizedBox(width: 10),
                          const Text('Wednesday , ',
                              style: TextStyle(
                                  color: Color(0xff555555),
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16)),
                          Text(opticalData[widget.billIndex]['RecieptDate'],
                              style: const TextStyle(
                                  color: Color(0xff555555),
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16)),
                          const Text('   |  ',
                              style: TextStyle(
                                  color: Color(0xff555555),
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16)),
                          Text(opticalData[widget.billIndex]['recieptTime'],
                              style: const TextStyle(
                                  color: Color(0xff555555),
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16))
                        ],
                      ),
                      const SizedBox(height: 20),
                      Container(
                        padding: const EdgeInsets.all(15),
                        height: 130,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey.shade300),
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10.0)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    const Text('ID: ',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 14)),
                                    Text(
                                        opticalData[widget.billIndex]
                                            ['PatientId'],
                                        style: const TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 14))
                                  ],
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    const Text('Name:',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 16)),
                                    Text(
                                        opticalData[widget.billIndex]
                                            ['PatientName'],
                                        style: const TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 16))
                                  ],
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    const Text('Gender:',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 16)),
                                    Column(
                                      children: [
                                        Row(
                                          children: [
                                            Text(
                                                opticalData[widget.billIndex]
                                                    ['Gender'],
                                                style: const TextStyle(
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 16)),
                                            const SizedBox(width: 10),
                                            Container(
                                              height: 20,
                                              width: 30,
                                              decoration: BoxDecoration(
                                                  color: Colors.cyan[100],
                                                  borderRadius:
                                                      BorderRadius.circular(5)),
                                              child: Center(
                                                  child: Text(
                                                opticalData[widget.billIndex]
                                                    ['Age'],
                                                style: const TextStyle(
                                                    color: Colors.teal,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              )),
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    const Text('Phone:',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 16)),
                                    Text(
                                        opticalData[widget.billIndex]
                                            ['MobileNumber'],
                                        style: const TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 16))
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 10),
                      const Text('OPTOM',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                              fontSize: 16)),
                      const SizedBox(height: 10),
                      Material(
                        elevation: 0.2,
                        child: Container(
                          height: 60,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(color: Colors.white)),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Container(
                                  height: 40,
                                  width: 40,
                                  padding: const EdgeInsets.all(2.0),
                                  decoration: BoxDecoration(
                                      color: Colors.grey[200],
                                      borderRadius: BorderRadius.circular(20)),
                                  child: Container(
                                      margin: const EdgeInsets.all(8),
                                      height: 10,
                                      width: 10,
                                      decoration: BoxDecoration(
                                          gradient: const LinearGradient(
                                              colors: [
                                                Colors.lightBlue,
                                                Color(0xff21d4fe)
                                              ]),
                                          borderRadius:
                                              BorderRadius.circular(40)),
                                      child: const Center(
                                          child: Icon(
                                        Icons.person_outline,
                                        color: Colors.white,
                                        size: 20,
                                      ))),
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
                                Text(opticalData[widget.billIndex]['OptomName'],
                                    style: const TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 16)),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      const Text('Delivery',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                              fontSize: 16)),
                      const SizedBox(height: 16),
                      Row(
                        children: [
                          const Text('Date',
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              )),
                          const SizedBox(width: 10),
                          Row(
                            children: [
                              Container(
                                  height: 25,
                                  width: 25,
                                  decoration: BoxDecoration(
                                      color: Colors.grey[200],
                                      borderRadius: BorderRadius.circular(10)),
                                  child: const Icon(
                                    Icons.calendar_month_sharp,
                                    color: Colors.teal,
                                    size: 17,
                                  )),
                              const SizedBox(width: 10),
                              const Text('Wed , ',
                                  style: TextStyle(
                                      color: Color(0xff555555),
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16)),
                              Text(opticalData[widget.billIndex]['RecieptDate'],
                                  style: const TextStyle(
                                      color: Color(0xff555555),
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16)),
                              const Text(' | ',
                                  style: TextStyle(
                                      color: Color(0xff555555),
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16)),
                              Text(opticalData[widget.billIndex]['recieptTime'],
                                  style: const TextStyle(
                                      color: Color(0xff555555),
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16))
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          const Text('Status',
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16)),
                          const SizedBox(width: 8),
                          Row(
                            children: [
                              iconColor == 'Pending'
                                  ? const Icon(
                                      Icons.circle,
                                      color: Colors.yellow,
                                      size: 10,
                                    )
                                  : iconColor == 'Delivered'
                                      ? const Icon(
                                          Icons.circle,
                                          color: Colors.green,
                                          size: 10,
                                        )
                                      : const Icon(
                                          Icons.circle,
                                          color: Colors.red,
                                          size: 10,
                                        ),
                              const SizedBox(width: 10),
                              Text(
                                  opticalData[widget.billIndex]
                                      ['DeliveryStatus'],
                                  style: const TextStyle(
                                      color: Color(0xff555555), fontSize: 16)),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 25),
                      const Text('Payment Details',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                              fontSize: 16)),
                      const SizedBox(height: 25),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('Advance',
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16)),
                          Text(opticalData[widget.billIndex]['Advance'])
                        ],
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('Balance',
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16)),
                          Text(opticalData[widget.billIndex]['Balance'])
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Material(
                        elevation: 0.2,
                        child: Container(
                          height: 40,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(color: Colors.white)),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text('TOTAL',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16)),
                                Text(
                                    opticalData[widget.billIndex]
                                        ['TotalAmount'],
                                    style: const TextStyle(
                                        color: Colors.teal,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16))
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              const Text('Total',
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16)),
                              Text(
                                  opticalData[widget.billIndex]['Balance'] ??
                                      opticalData[widget.billIndex]['Balance'],
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 18))
                            ],
                          ),
                          SizedBox(
                              height: 50,
                              width: 180,
                              child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.teal,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(60))),
                                  onPressed: () {},
                                  child: const Text(
                                    'PAY NOW',
                                    style: TextStyle(fontSize: 18),
                                  )))
                        ],
                      )
                    ],
                  );
                }
                return const Text(
                  'There are no orders for you right now',
                  textAlign: TextAlign.center,
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

//  Future<void> _downloadFile() async {
//     setState(() {
//       _downloading = true;
//       _message = 'Downloading';
//     });
//
//     try {
//       final response = await http.get(Uri.parse(
//           'http://gtech.easysolution.asia:91/api/DownloadFile?Reciept_NO=KALY/2022-23/OSO-0003859'));
//       final bytes = response.bodyBytes;
//       directory = await getExternalStorageDirectory();
//       final file = File('${directory!.path}/${'sawan.pdf'}');
//       await file.writeAsBytes(bytes);
//
//       setState(() {
//         _downloading = false;
//         _message = 'PDF file downloaded to ${file.path}';
//       });
//     } catch (e) {
//       print(e.toString());
//     }
//   }
