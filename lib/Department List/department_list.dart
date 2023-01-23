import 'package:flutter/material.dart';

class DepartmentList extends StatefulWidget {
  const DepartmentList({Key? key}) : super(key: key);

  @override
  State<DepartmentList> createState() => _DepartmentListState();
}

class _DepartmentListState extends State<DepartmentList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text('Department List'),
          elevation: 0,
          backgroundColor: Colors.blue,
        ),
        body: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
          Container(
            color: Colors.blue,
            height: 100,
            width: double.infinity,
            child: Container(
              margin: const EdgeInsets.fromLTRB(5, 0, 5, 0),
              child: TextFormField(
                decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    hintText: 'Type here...',
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(60.0),
                    ),
                    prefixIcon: const Icon(Icons.search_rounded)),
              ),
            ),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: ListView.builder(
                    itemCount: 6,
                    itemBuilder: ((context, index) => Card(
                          elevation: 3,
                          child: SizedBox(
                            height: 130,
                            width: double.infinity,
                            child: Padding(
                              padding: const EdgeInsets.all(1.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                      child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Container(
                                            height: 100,
                                            width: 130,
                                            decoration: const BoxDecoration(
                                                image: DecorationImage(
                                                    image: AssetImage(
                                                        'images/ml_department_two.png'))),
                                          ),
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              const Text(
                                                'Department name',
                                                style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              const SizedBox(height: 10),
                                              const Text(
                                                'John Hokins hospital',
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.grey),
                                              ),
                                              const SizedBox(height: 10),
                                              ElevatedButton(
                                                  onPressed: () {},
                                                  child: Container(
                                                    child: const Text(
                                                      'Details',
                                                      style: TextStyle(
                                                          letterSpacing: 3),
                                                    ),
                                                  ))
                                            ],
                                          )
                                        ],
                                      )
                                    ],
                                  ))
                                ],
                              ),
                            ),
                          ),
                        )))),
          )
        ]));
  }
}
