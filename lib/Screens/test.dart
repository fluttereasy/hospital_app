import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hospital_app/Doctor/HospitalServices/hospital_list_bloc.dart';

import '../Doctor/HospitalServices/hospital_Services.dart';

class TestScreen extends StatefulWidget {
  const TestScreen({Key? key}) : super(key: key);

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  HospitalServices hospitalServices = HospitalServices();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HospitalListBloc()..add(HospitalListLoadingEvent()),
      child: Scaffold(
        backgroundColor: Colors.blue,
        body: Column(
          children: const [
            SizedBox(height: 20),
            // TextFormField(
            //   onTap: () {
            //     context
            //         .read<HospitalListBloc>()
            //         .add(HospitalListShowEvent(true));
            //   },
            //   decoration: InputDecoration(
            //       fillColor: Colors.white,
            //       filled: true,
            //       hintText: 'Choose Speciality or Doctors',
            //       focusedBorder: OutlineInputBorder(
            //         borderSide:
            //             const BorderSide(color: Colors.white, width: 2.0),
            //         borderRadius: BorderRadius.circular(25.0),
            //       ),
            //       enabledBorder: OutlineInputBorder(
            //         borderSide: const BorderSide(color: Colors.white),
            //         borderRadius: BorderRadius.circular(60.0),
            //       ),
            //       prefixIcon: const Icon(Icons.search_rounded)),
            // ),
          ],
        ),
      ),
    );
  }
}

// BlocBuilder<HospitalListBloc, HospitalListState>(
//           builder: (context, state) {
//             if (state is HospitalListLoadedState) {
//               final hList = state.nameOfHospital;
//               return ListView.builder(
//                   itemCount: hList!.length,
//                   itemBuilder: (context, index) {
//                     return Container(
//                       height: 50,
//                       decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(20)),
//                       child: Card(
//                           child: ListTile(
//                         leading: Text(
//                           hList![index].rowId.toString(),
//                         ),
//                         title: Text(
//                           hList![index].hospitalName.toString(),
//                           style: TextStyle(fontWeight: FontWeight.bold),
//                         ),
//                       )),
//                     );
//                   });
//             }
//             return Text('Failed');
//           },
//         ),
