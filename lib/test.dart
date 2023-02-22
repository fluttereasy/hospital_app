import 'package:flutter/material.dart';

class TestScreen extends StatefulWidget {
  const TestScreen({Key? key}) : super(key: key);

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  final List<Map<String, dynamic>> _allUsers = [
    {"id": 1, "name": "Andy Doctor", "age": 29},
    {"id": 2, "name": "Aragon Doctor", "age": 40},
    {"id": 3, "name": "Bob Doctor", "age": 5},
    {"id": 4, "name": "Barbara Doctor", "age": 35},
    {"id": 5, "name": "Candy Doctor", "age": 21},
    {"id": 6, "name": "Colin Doctor", "age": 55},
    {"id": 7, "name": "Audra Doctor", "age": 30},
    {"id": 8, "name": "Banana Doctor", "age": 14},
    {"id": 9, "name": "Caversky Doctor", "age": 100},
    {"id": 10, "name": "Becky Doctor", "age": 32},
  ];

  // This list holds the data for the list view
  List<Map<String, dynamic>> _foundUsers = [];
  bool showSpecialList = false;
  bool showHospitalList = false;
  TextEditingController specialistController = TextEditingController();
  TextEditingController hosptalListController = TextEditingController();
  @override
  initState() {
    _foundUsers = _allUsers;
    super.initState();
  }

  // This function is called whenever the text field changes
  void _runFilter(String enteredKeyword) {
    List<Map<String, dynamic>> results = [];
    if (enteredKeyword.isEmpty) {
      // if the search field is empty or only contains white-space, we'll display all users
      List.empty();
      results = _allUsers;
    } else {
      results = _allUsers
          .where((user) =>
          user["name"].toLowerCase().contains(enteredKeyword.toLowerCase()))
          .toList();
      // we use the toLowerCase() method to make it case-insensitive
    }
    setState(() {
      _foundUsers = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xff00b4db),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(
                height: 10,
              ),
              const Text(
                'Appointment',
                style: TextStyle(
                    fontSize: 26,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              ),
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
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            'Speciality/Doctors',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 16),
                          )),
                      const SizedBox(height: 8),
                      TextField(
                        controller: specialistController,
                        onChanged: (value) => _runFilter(value),
                        decoration: const InputDecoration(
                          // border: OutlineInputBorder(
                          //   borderRadius: BorderRadius.circular(30)
                          // ),
                            fillColor: Colors.white,
                            filled: true,
                            hintText: 'Choose Doctors/Speciality',
                            suffixIcon: Icon(
                              Icons.search,
                              color: Colors.black,
                            )),
                        onTap: () {
                          setState(() {
                            showSpecialList = true;
                            showHospitalList = false;
                          });
                        },
                      ),
                      const SizedBox(
                        height: 1,
                      ),
                      showSpecialList == true
                          ? Expanded(
                        child: Container(
                          child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: _foundUsers.length,
                            itemBuilder: (context, index) => Card(
                                key: ValueKey(_foundUsers[index]["id"]),
                                color: Colors.green,
                                elevation: 1,
                                margin: const EdgeInsets.symmetric(
                                    vertical: 0.5),
                                child: ListTile(
                                  selectedColor: Colors.blue[100],
                                  tileColor: Colors.white,
                                  title: Text(
                                    _foundUsers[index]["name"],
                                    style: const TextStyle(
                                      color: Colors.black,
                                    ),
                                  ),
                                  onTap: () {
                                    specialistController.text =
                                    _foundUsers[index]["name"];
                                    setState(() {
                                      showSpecialList = false;
                                    });
                                  },
                                )),
                          ),
                        ),
                      )
                          : const SizedBox.shrink(),
                      const SizedBox(
                        height: 10,
                      ),
                      const Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            'Hospitals',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 16),
                          )),
                      const SizedBox(height: 8),
                      TextField(
                        controller: hosptalListController,
                        onChanged: (value) => _runFilter(value),
                        decoration: const InputDecoration(
                          // border: OutlineInputBorder(
                          //   borderRadius: BorderRadius.circular(30)
                          // ),
                            fillColor: Colors.white,
                            filled: true,
                            hintText: 'Choose Hospital',
                            suffixIcon: Icon(
                              Icons.search,
                              color: Colors.black,
                            )),
                        onTap: () {
                          setState(() {
                            showHospitalList = true;
                            showSpecialList = false;
                          });
                        },
                      ),
                      const SizedBox(
                        height: 1,
                      ),
                      showHospitalList == true
                          ? Expanded(
                        child: Container(
                          child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: _foundUsers.length,
                            itemBuilder: (context, index) => Card(
                              key: ValueKey(_foundUsers[index]["id"]),
                              color: Colors.white,
                              elevation: 1,
                              margin: const EdgeInsets.symmetric(
                                  vertical: 0.5),
                              child: ListTile(
                                selectedColor: Colors.blue[100],
                                title: Text(_foundUsers[index]['name'],
                                    style: const TextStyle(
                                        color: Colors.black)),
                                onTap: () {
                                  setState(() {
                                    hosptalListController.text =
                                    _foundUsers[index]['name'];
                                    showHospitalList = false;
                                  });
                                },
                              ),
                            ),
                          ),
                        ),
                      )
                          : const SizedBox.shrink(),
                      const SizedBox(height: 8),
                      Center(
                        child: SizedBox(
                          height: 45,
                          width: 180,
                          child: ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(0xff00b4db),
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
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

// Container(
//               padding: const EdgeInsets.all(10),
//               child: TextField(
//                 controller: specialistController,
//                 onChanged: (value) => _runFilter(value),
//                 decoration: const InputDecoration(
//                     fillColor: Colors.white,
//                     filled: true,
//                     labelText: 'Choose Doctors/Speciality',
//                     suffixIcon: Icon(
//                       Icons.search,
//                       color: Colors.black,
//                     )),
//                 onTap: () {
//                   setState(() {
//                     showSpecialList = true;
//                     showHospitalList = false;
//                   });
//                 },
//               ),
//             ),
//             const SizedBox(
//               height: 20,
//             ),
//             showSpecialList == true
//                 ? Expanded(
//                     child: ListView.builder(
//                       shrinkWrap: true,
//                       itemCount: _foundUsers.length,
//                       itemBuilder: (context, index) => Card(
//                           key: ValueKey(_foundUsers![index]["id"]),
//                           color: Colors.white,
//                           // elevation: 4,
//                           margin: const EdgeInsets.symmetric(vertical: 0),
//                           child: ListTile(
//                             tileColor: Colors.grey[200],
//                             minLeadingWidth: 5,
//                             title: Text(
//                               _foundUsers[index]["name"],
//                               style: TextStyle(color: Colors.orange),
//                             ),
//                             onTap: () {
//                               specialistController.text =
//                                   _foundUsers[index]["name"];
//                               setState(() {
//                                 showSpecialList = false;
//                               });
//                             },
//                           )
//                           // ListTile(
//                           //   leading: Text(
//                           //     _foundUsers![index]["id"].toString(),
//                           //     style: const TextStyle(
//                           //         fontSize: 24, color: Colors.white),
//                           //   ),
//                           //   title: Text(_foundUsers![index]['name'],
//                           //       style: const TextStyle(color: Colors.white)),
//                           //   subtitle: Text(
//                           //       '${_foundUsers![index]["age"].toString()} years old',
//                           //       style: TextStyle(color: Colors.white)),
//                           //   onTap: () {
//                           //     setState(() {
//                           //       specialistController.text =
//                           //           _foundUsers![index]['name'];
//                           //       showList = false;
//                           //     });
//                           //   },
//                           // ),
//                           ),
//                     ),
//                   )
//                 : const SizedBox.shrink(),
//             SizedBox(
//               height: 10,
//             ),
//             Container(
//               padding: EdgeInsets.all(10),
//               child: TextField(
//                 controller: hosptalListController,
//                 onChanged: (value) => _runFilter(value),
//                 decoration: const InputDecoration(
//                     fillColor: Colors.white,
//                     filled: true,
//                     labelText: 'Choose Hospital',
//                     suffixIcon: Icon(
//                       Icons.search,
//                       color: Colors.black,
//                     )),
//                 onTap: () {
//                   setState(() {
//                     showHospitalList = true;
//                     showSpecialList = false;
//                   });
//                 },
//               ),
//             ),
//             const SizedBox(
//               height: 20,
//             ),
//             showHospitalList == true
//                 ? Expanded(
//                     child: ListView.builder(
//                       shrinkWrap: true,
//                       itemCount: _foundUsers.length,
//                       itemBuilder: (context, index) => Card(
//                         key: ValueKey(_foundUsers![index]["id"]),
//                         color: Colors.blue,
//                         elevation: 4,
//                         margin: const EdgeInsets.symmetric(vertical: 10),
//                         child: ListTile(
//                           leading: Text(
//                             _foundUsers![index]["id"].toString(),
//                             style: const TextStyle(
//                                 fontSize: 24, color: Colors.white),
//                           ),
//                           title: Text(_foundUsers![index]['name'],
//                               style: const TextStyle(color: Colors.white)),
//                           subtitle: Text(
//                               '${_foundUsers![index]["age"].toString()} years old',
//                               style: TextStyle(color: Colors.white)),
//                           onTap: () {
//                             setState(() {
//                               hosptalListController.text =
//                                   _foundUsers![index]['name'];
//                               showHospitalList = false;
//                             });
//                           },
//                         ),
//                       ),
//                     ),
//                   )
//                 : SizedBox.shrink(),
