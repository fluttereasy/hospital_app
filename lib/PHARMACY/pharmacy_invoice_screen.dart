import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:hospital_app/OPTICAL/optical_bloc.dart';
import 'package:hospital_app/OTP%20Directories/otp_screen.dart';
import 'package:hospital_app/PHARMACY/pharmacy_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

class PharmacyInvoiceScreen extends StatefulWidget {
  final billIndex;
  final pdfID;
  final pdfName;
  final statusOfDelivery;
  const PharmacyInvoiceScreen(
      {Key? key,
      this.billIndex,
      this.pdfName,
      this.pdfID,
      this.statusOfDelivery})
      : super(key: key);

  @override
  State<PharmacyInvoiceScreen> createState() => _PharmacyInvoiceScreenState();
}

class _PharmacyInvoiceScreenState extends State<PharmacyInvoiceScreen> {
  @override
  void initState() {
    super.initState();
  }

  //http://gtech.easysolution.asia:91/api/DownloadSalesOrder?Reciept_NO=KALY/2022-23/OSO-0003831

  Directory? directory;
  String? name;
  String? nameofBill;

  Future<void> _downloadPDF(String url, String name) async {
    // setState(() {
    //   _downloading = true;
    // });
    if (Platform.isAndroid) {
      final status = await Permission.storage.request();
      if (status.isGranted) {
        print(url);
        final directory = await getExternalStorageDirectory();
        print(directory);
        final taskId = await FlutterDownloader.enqueue(
          url: url,
          savedDir: directory!.path.toString(),
          fileName: name,
          showNotification: true,
          openFileFromNotification: true,
        );
        // setState(() {
        //   _downloading = false;
        // });
      } else {
        print('Permission  denied');
      }
    } else if (Platform.isIOS) {
      final iosstatus = await Permission.storage.request();
      final iosDir = await getApplicationDocumentsDirectory();
      if (iosstatus.isGranted) {
        final taskId = await FlutterDownloader.enqueue(
          url: url,
          savedDir: iosDir.path.toString(),
          fileName: name,
          showNotification: true,
          openFileFromNotification: true,
        );
      } else {
        null;
      }
      // setState(() {
      //   _downloading = false;
      // });
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          PharmacyBloc()..add(PharmacyDataFetchEvent(phoneNumer: '9967262400')),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          actions: [
            Container(
                padding: const EdgeInsets.all(10),
                child: IconButton(
                  color: Colors.teal,
                  onPressed: () {
                    _downloadPDF(
                        'http://gtech.easysolution.asia:91/api/DownloadSalesOrder?Reciept_NO=' +
                            widget.pdfID,
                        widget.pdfName.toString().replaceAll(RegExp('/'), ''));
                  },
                  icon: const Icon(Icons.download),
                ))
          ],
          elevation: 0,
          centerTitle: true,
          backgroundColor: Colors.white,
          iconTheme: const IconThemeData(color: Colors.black),
          title: const Text(
            'Pharmacy',
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(25.0),
          child: SingleChildScrollView(
            child: BlocBuilder<PharmacyBloc, PharmacyState>(
              builder: (context, state) {
                if (state is PharmacyDataLoadingState) {
                  return const Center(
                      child: CircularProgressIndicator(
                    color: Colors.teal,
                  ));
                }
                if (state is PharmacyDataLoadedState) {
                  final pharmacyData = state.pharmacyData;
                  print(pharmacyData);
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
                                pharmacyData[widget.billIndex]['reciept_no'],
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
                          Text(pharmacyData[widget.billIndex]['receipt_date'],
                              style: const TextStyle(
                                  color: Color(0xff555555),
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16)),
                          const Text('   |  ',
                              style: TextStyle(
                                  color: Color(0xff555555),
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16)),
                          // Text(pharmacyData[widget.billIndex]['recieptTime'],
                          //     style: const TextStyle(
                          //         color: Color(0xff555555),
                          //         fontWeight: FontWeight.w500,
                          //         fontSize: 16))
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
                                        pharmacyData[widget.billIndex]
                                            ['patient_id'],
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
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text('Name:',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 16)),
                                    Text(
                                        pharmacyData[widget.billIndex]
                                            ['patient_name'],
                                        style: const TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 16))
                                  ],
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                // Row(
                                //   mainAxisAlignment:
                                //       MainAxisAlignment.spaceAround,
                                //   children: [
                                //     const Text('Gender:',
                                //         style: TextStyle(
                                //             color: Colors.black,
                                //             fontWeight: FontWeight.w500,
                                //             fontSize: 16)),
                                //     // Column(
                                //     //   children: [
                                //     //     Row(
                                //     //       children: [
                                //     //         Text(
                                //     //             pharmacyData[widget.billIndex]
                                //     //             ['Gender'],
                                //     //             style: const TextStyle(
                                //     //                 color: Colors.black,
                                //     //                 fontWeight: FontWeight.w500,
                                //     //                 fontSize: 16)),
                                //     //         const SizedBox(width: 10),
                                //     //       ],
                                //     //     ),
                                //     //   ],
                                //     // ),
                                //   ],
                                // ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text('Phone:',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 16)),
                                    Text(
                                        pharmacyData[widget.billIndex]
                                            ['mobile_number'],
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
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text('Patient Type:',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 16)),
                                    Text(
                                        pharmacyData[widget.billIndex]['Ptype'],
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
                                Text(
                                    pharmacyData[widget.billIndex]
                                        ['DoctorName'],
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
                              const SizedBox(width: 10),
                              Text(
                                  pharmacyData[widget.billIndex]['receipt_date']
                                      .toString(),
                                  style: const TextStyle(
                                      color: Color(0xff555555),
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16)),
                              const Text(' | ',
                                  style: TextStyle(
                                      color: Color(0xff555555),
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16)),
                              // Text(pharmacyData[widget.billIndex]['recieptTime'],
                              //     style: const TextStyle(
                              //         color: Color(0xff555555),
                              //         fontWeight: FontWeight.w500,
                              //         fontSize: 16))
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      // Row(
                      //   children: [
                      //     const Text('Status',
                      //         style: TextStyle(
                      //             color: Colors.grey,
                      //             fontWeight: FontWeight.w500,
                      //             fontSize: 16)),
                      //     const SizedBox(width: 8),
                      //     // Row(
                      //     //   children: [
                      //     //     iconColor == 'Pending'
                      //     //         ? const Icon(
                      //     //       Icons.circle,
                      //     //       color: Colors.yellow,
                      //     //       size: 10,
                      //     //     )
                      //     //         : iconColor == 'Delivered'
                      //     //         ? const Icon(
                      //     //       Icons.circle,
                      //     //       color: Colors.green,
                      //     //       size: 10,
                      //     //     )
                      //     //         : const Icon(
                      //     //       Icons.circle,
                      //     //       color: Colors.red,
                      //     //       size: 10,
                      //     //     ),
                      //     //     const SizedBox(width: 10),
                      //     //     Text(
                      //     //         pharmacyData[widget.billIndex]
                      //     //         ['DeliveryStatus'],
                      //     //         style: const TextStyle(
                      //     //             color: Color(0xff555555), fontSize: 16)),
                      //     //   ],
                      //     // ),
                      //   ],
                      // ),
                      const SizedBox(height: 25),
                      const Text('Payment Details',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                              fontSize: 16)),
                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Total Amount : ',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w600),
                          ),
                          Text(
                            'Rs- ' + pharmacyData[widget.billIndex]['amount'],
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.teal,
                                fontSize: 18),
                          )
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