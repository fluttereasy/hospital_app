import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:readmore/readmore.dart';

class HospitalAppointmentScreen extends StatefulWidget {
  const HospitalAppointmentScreen({Key? key}) : super(key: key);

  @override
  State<HospitalAppointmentScreen> createState() =>
      _HospitalAppointmentScreenState();
}

class _HospitalAppointmentScreenState extends State<HospitalAppointmentScreen> {
  String content =
      'A doctor is someone who is experienced and certified to practice medicine to help maintain or restore physical and mental health. A doctor is tasked with interacting with patients.A doctor is someone who is experienced and certified to practice medicine to help maintain or restore physical and mental health. A doctor is tasked with interacting with patients.';
  final TextEditingController _ratingController = TextEditingController();
  double? _rating = 2;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      // bottomNavigationBar: ElevatedButton(onPressed: (){}, child: Container(
      //   height: 20,
      //   child: const Center(child: Text('Book Appointment',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),),
      // )),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              children: [
                Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0)),
                    child: Image.asset('images/hospital.jpg')),
                Container(
                  padding: const EdgeInsets.all(10.0),
                  color: Colors.transparent,
                  child: Column(
                    children: [
                      Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  'Hospital Name',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.blue),
                                ),
                                GFRating(
                                  color: Colors.blue,
                                  controller: _ratingController,
                                  size: GFSize.SMALL,
                                  value: _rating!,
                                  onChanged: (value) {
                                    setState(() {
                                      _rating = value;
                                    });
                                  },
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Row(
                                  children: const [
                                    Icon(
                                      Icons.location_on,
                                      color: Colors.blue,
                                    ),
                                    Text(
                                      'General Hospital , NY',
                                      style: TextStyle(
                                          color: Colors.grey,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                          color: Colors.purple[400],
                                          borderRadius:
                                              BorderRadius.circular(10.0)),
                                      margin: const EdgeInsets.all(10.0),
                                      height: 40,
                                      width: 70,
                                      child: const Center(
                                          child: Text(
                                        '     5+\nRatings',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white),
                                      )),
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                          color: Colors.purple[400],
                                          borderRadius:
                                              BorderRadius.circular(10.0)),
                                      margin: const EdgeInsets.all(10.0),
                                      height: 40,
                                      width: 70,
                                      child: const Center(
                                          child: Text(
                                        '1000+\nPatient',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white),
                                      )),
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                          color: Colors.purple[400],
                                          borderRadius:
                                              BorderRadius.circular(10.0)),
                                      margin: const EdgeInsets.all(10.0),
                                      height: 40,
                                      width: 70,
                                      child: const Center(
                                          child: Text(
                                        '13 yrs\n Exper..',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white),
                                      )),
                                    ),
                                  ],
                                ),
                                Container(
                                  padding: const EdgeInsets.all(10.0),
                                  child: const Align(
                                    alignment: Alignment.topLeft,
                                    child: Text(
                                      'About',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20),
                                    ),
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.all(10.0),
                                  child: ReadMoreText(
                                    content,
                                    trimLines: 2,
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
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    print('tapped');
                                  },
                                  child: Container(
                                    height: 40,
                                    width: 200,
                                    decoration: BoxDecoration(
                                        color: Colors.blue,
                                        borderRadius:
                                            BorderRadius.circular(30.0)),
                                    child: const Center(
                                      child: Text(
                                        'Book Appointment',
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
