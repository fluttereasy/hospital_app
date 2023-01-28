import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:hospital_app/Screens/patient_details_screen.dart';
import 'package:readmore/readmore.dart';

class ScheduleAppointment extends StatefulWidget {
  const ScheduleAppointment({Key? key}) : super(key: key);

  @override
  State<ScheduleAppointment> createState() => _ScheduleAppointmentState();
}

class _ScheduleAppointmentState extends State<ScheduleAppointment> {
  final DatePickerController _controller = DatePickerController();
  DateTime _selectedValue = DateTime.now();
  String content =
      'A doctor is someone who is experienced and certified to practice medicine to help maintain or restore physical and mental health. A doctor is tasked with interacting with patients.A doctor is someone who is experienced and certified to practice medicine to help maintain or restore physical and mental health. A doctor is tasked with interacting with patients.';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: ElevatedButton(
            onPressed: () {
              Navigator.push(
                  context,
                  CupertinoPageRoute(
                      builder: (context) => const PatientDetails()));
            },
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: const Center(
                  child: Text(
                'Book Appointment',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              )),
            )),
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.blue),
          backgroundColor: Colors.white,
          elevation: 0,
          title: const Text(
            'Book Appointment',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18),
            child: Column(
              children: [
                Container(
                  height: 120,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.grey[100],
                      borderRadius: BorderRadius.circular(10.0)),
                  child: Card(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Image.asset(
                          'images/ml_doctor.png',
                          height: double.infinity,
                          width: 80,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Dr. Darell Steward',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Image.asset(
                                  'images/ml_like.png',
                                  height: 15,
                                  width: 20,
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                const Text(
                                  '92 % (2811 reviews)',
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const Text(
                              'General Practitioner - Hospital name',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 14),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  height: 100,
                  width: double.infinity,
                  margin: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      border: Border.all(color: Colors.blue)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Column(
                            children: [
                              Container(
                                  height: 40,
                                  width: 40,
                                  decoration: BoxDecoration(
                                      color: Colors.blue[100]?.withOpacity(0.4),
                                      borderRadius:
                                          BorderRadius.circular(50.0)),
                                  child: const Icon(
                                    Icons.person,
                                    color: Colors.red,
                                  )),
                              const SizedBox(
                                height: 5,
                              ),
                              const Text(
                                '5000 +',
                                style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.red,
                                    fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              const Text(
                                'Patients',
                                style: TextStyle(
                                    color: Colors.red,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                          Column(
                            children: [
                              Container(
                                height: 40,
                                width: 40,
                                decoration: BoxDecoration(
                                    color: Colors.blue[100]?.withOpacity(0.4),
                                    borderRadius: BorderRadius.circular(30.0)),
                                child: const Icon(
                                  Icons.person,
                                  color: Colors.green,
                                ),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              const Text(
                                '15 +',
                                style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.green,
                                    fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              const Text(
                                'Year Experience',
                                style: TextStyle(
                                    color: Colors.green,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                          Column(
                            children: [
                              Container(
                                  height: 40,
                                  width: 40,
                                  decoration: BoxDecoration(
                                      color: Colors.blue[100]?.withOpacity(0.4),
                                      borderRadius:
                                          BorderRadius.circular(30.0)),
                                  child: const Icon(
                                    Icons.chat,
                                    color: Colors.blue,
                                  )),
                              const SizedBox(
                                height: 5,
                              ),
                              const Text(
                                '3000 +',
                                style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.blue,
                                    fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              const Text(
                                'Reviews',
                                style: TextStyle(
                                    color: Colors.blue,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                Column(
                  children: [
                    const Align(
                      alignment: Alignment.bottomLeft,
                      child: Text(
                        'About Doctor -',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SingleChildScrollView(
                          child: Container(
                            child: ReadMoreText(
                              content,
                              trimLines: 1,
                              textAlign: TextAlign.justify,
                              trimMode: TrimMode.Line,
                              trimCollapsedText: '...Show more',
                              trimExpandedText: 'Show less',
                              lessStyle: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.blue,
                              ),
                              moreStyle: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.blue,
                              ),
                              style: const TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        const Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              'Working Time',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16),
                            )),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                          'Mon - Fri, 09.00 AM - 20.00 PM',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text(
                              'Reviews',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16),
                            ),
                            Text(
                              'See Reviews',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blue),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                const Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Make Appointment',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    )),
                const SizedBox(height: 10),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    DatePicker(
                      DateTime.now(),
                      initialSelectedDate: DateTime.now(),
                      selectionColor: Colors.blue,
                      selectedTextColor: Colors.white,
                      onDateChange: (date) {
                        // New date selected
                        setState(() {
                          _selectedValue = date;
                        });
                      },
                    ),
                  ],
                )
              ],
            ),
          ),
        ));
  }
}
