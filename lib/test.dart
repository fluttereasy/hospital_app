import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

import 'Doctors and Speciality/speciality_bloc.dart';

class TestScreen extends StatefulWidget {
  const TestScreen({Key? key}) : super(key: key);

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  TextEditingController specialityController = TextEditingController();
  List originalList = [];
  List filteredList = [];



  @override
  void initState() {
    //loadSpeciality.add(SpecialityListFetchEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SpecialityBloc()..add(SpecialityListFetchEvent()),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Test Screen'),
        ),
        body: Column(
          children: [
            TextField(
              controller: specialityController,
              decoration: const InputDecoration(hintText: 'Speciality/Doctors'),
              onTap: () {},
            ),
            const SizedBox(height: 5),
            BlocBuilder<SpecialityBloc, SpecialityState>(
              builder: (context, state) {
                if (state is SpecialityLoadedState) {
                  print('Loaded');
                  List specialityofDoctor = state.doctorSPecialityList;
                  originalList = specialityofDoctor;
                  return Expanded(
                      child: Container(
                    child: ListView.builder(
                        itemCount: specialityofDoctor.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            title:
                                Text(specialityofDoctor[index]['Speciality']),
                          );
                        }),
                  ));
                }
                return SizedBox.shrink();
              },
            )
          ],
        ),
      ),
    );
  }
}
