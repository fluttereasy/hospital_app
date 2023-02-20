import 'package:flutter/material.dart';

class SearchDoctors extends StatefulWidget {
  const SearchDoctors({Key? key}) : super(key: key);

  @override
  State<SearchDoctors> createState() => _SearchDoctorsState();
}

TextEditingController specialityController = TextEditingController();

class _SearchDoctorsState extends State<SearchDoctors> {
  List<String> countriesName = ['India', 'USA', 'CANADA', ' Australia'];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            color: const Color(0xff00b4db),
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: [
                const SizedBox(
                  height: 5,
                ),
                const Center(
                  child: Text(
                    'Appointment',
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 30),
                  ),
                ),
                const SizedBox(height: 5),
                Container(
                  padding: const EdgeInsets.all(10),
                  color: Colors.white,
                  height: 110,
                  width: double.infinity,
                  child: const Center(
                    child: Text(
                      'SELECT BY DOCTORS OR SPECIALITY',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color(0xff025363),
                          fontSize: 26),
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                Container(
                  width: double.infinity,
                  height: 33,
                  color: Colors.white,
                ),
                Container(
                  height: 500,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.fill,
                          image: AssetImage('images/hosBack.jpg'))),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'SPECIALITY',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 2,
                                  fontSize: 16),
                            ),
                            Container(
                                margin: const EdgeInsets.all(10),
                                height: 50,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.white),
                                child: ListTile(
                                  title: Autocomplete(
                                    // initialValue:
                                    // const TextEditingValue(text: 'Choose the Hospital'),
                                    optionsBuilder: (TextEditingValue value) {
                                      return countriesName
                                          .where((element) => element
                                              .toLowerCase()
                                              .contains(
                                                  value.text.toLowerCase()))
                                          .toList();
                                    },
                                  ),
                                  trailing: const Icon(
                                    Icons.search,
                                    color: Colors.black,
                                  ),
                                )),
                            const SizedBox(height: 10),
                            const Text(
                              'DOCTORS',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 2,
                                  fontSize: 16),
                            ),
                            const SizedBox(height: 5),
                            Container(
                                margin: const EdgeInsets.all(10),
                                height: 50,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.white),
                                child: ListTile(
                                  title: Autocomplete(
                                    // initialValue:
                                    // const TextEditingValue(text: 'Choose the Hospital'),
                                    optionsBuilder: (TextEditingValue value) {
                                      return countriesName
                                          .where((element) => element
                                              .toLowerCase()
                                              .contains(
                                                  value.text.toLowerCase()))
                                          .toList();
                                    },
                                  ),
                                  trailing: const Icon(
                                    Icons.search,
                                    color: Colors.black,
                                  ),
                                )),
                            const SizedBox(height: 20),
                            Center(
                              child: SizedBox(
                                height: 45,
                                width: 180,
                                child: ElevatedButton(
                                    onPressed: () {},
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor:
                                            const Color(0xff00b4db),
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(30.0))),
                                    child: const Text(
                                      'SUBMIT',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          letterSpacing: 3),
                                    )),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// Padding(
//                   padding: const EdgeInsets.all(20.0),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       const Text(
//                         'SPECIALITY',
//                         style: TextStyle(
//                             color: Colors.white,
//                             fontWeight: FontWeight.bold,
//                             letterSpacing: 2,
//                             fontSize: 16),
//                       ),
//                       SizedBox(height: 5),
//                       TextFormField(
//                         controller: specialityController,
//                         style: const TextStyle(color: Colors.white),
//                         decoration: const InputDecoration(
//                             fillColor: Colors.white,
//                             hintText: 'Search for Hospital',
//                             suffixIcon: Icon(Icons.search),
//                             filled: true,
//                             enabledBorder: OutlineInputBorder()),
//                       ),
//                       const SizedBox(height: 10),
//                       const Text(
//                         'DOCTORS',
//                         style: TextStyle(
//                             color: Colors.white,
//                             fontWeight: FontWeight.bold,
//                             letterSpacing: 2,
//                             fontSize: 16),
//                       ),
//                       const SizedBox(height: 5),
//                       TextFormField(
//                         controller: specialityController,
//                         style: const TextStyle(color: Colors.white),
//                         decoration: const InputDecoration(
//                             fillColor: Colors.white,
//                             hintText: 'Search for Doctors',
//                             suffixIcon: Icon(Icons.search),
//                             filled: true,
//                             enabledBorder: OutlineInputBorder()),
//                       ),
//                       SizedBox(height: 20),
//                       Center(
//                         child: SizedBox(
//                           height: 45,
//                           width: 180,
//                           child: ElevatedButton(
//                               onPressed: () {},
//                               style: ElevatedButton.styleFrom(
//                                   backgroundColor: const Color(0xff00b4db),
//                                   shape: RoundedRectangleBorder(
//                                       borderRadius:
//                                           BorderRadius.circular(30.0))),
//                               child: Text(
//                                 'SUBMIT',
//                                 style: TextStyle(
//                                     fontWeight: FontWeight.bold,
//                                     letterSpacing: 3),
//                               )),
//                         ),
//                       )
//                     ],
//                   ),
//                 )
