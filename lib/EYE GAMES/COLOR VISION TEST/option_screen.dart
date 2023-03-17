import 'package:flutter/material.dart';

class OptionScreen extends StatefulWidget {
  const OptionScreen({Key? key}) : super(key: key);

  @override
  State<OptionScreen> createState() => _OptionScreenState();
}

class _OptionScreenState extends State<OptionScreen> {
  List<String> imageList = [
    // 'images/lea_airplan.png',
    // 'images/lea_car.png',
    // 'images/lea_elephant.png',
    'images/lea_mushroom.png',
    'images/lea_star.png',
    'images/lea_tree.png',
    'images/lea_teapot.png'
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 100),
        child: ElevatedButton(onPressed: (){}, child: Text('NOTHING')),
      ),
        appBar: AppBar(
          title: Text('Option Screen'),
        ),
        body: GridView.count(
          padding: EdgeInsets.symmetric(horizontal: 30,vertical: 150),
          crossAxisCount: 2,
          children: List.generate(
              imageList.length, (index) {
            return Column(
              children: [
                Container(
                  color: Colors.grey,
                  width: 150,
                  height: 130,
                  child: Image.asset(imageList[index],color: Colors.white,),
                ),
              ],
            );
          }),
        ));
  }
}

//class ImageScreen extends StatefulWidget {
//   @override
//   _ImageScreenState createState() => _ImageScreenState();
// }
//
// class _ImageScreenState extends State<ImageScreen> {
//   int _selectedImageIndex = -1;
//
//   final List<String> images = [
//     'assets/images/image1.jpg',
//     'assets/images/image2.jpg',
//     'assets/images/image3.jpg',
//     'assets/images/image4.jpg',
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Selectable Images'),
//       ),
//       body: GridView.count(
//         crossAxisCount: 2,
//         children: List.generate(images.length, (index) {
//           return GestureDetector(
//             onTap: () {
//               setState(() {
//                 _selectedImageIndex = index;
//               });
//             },
//             child: Container(
//               margin: EdgeInsets.all(10),
//               decoration: BoxDecoration(
//                 border: Border.all(
//                   color: _selectedImageIndex == index
//                       ? Colors.blue
//                       : Colors.grey,
//                   width: 2,
//                 ),
//                 borderRadius: BorderRadius.circular(10),
//               ),
//               child: ClipRRect(
//                 borderRadius: BorderRadius.circular(8),
//                 child: Image.asset(
//                   images[index],
//                   fit: BoxFit.cover,
//                 ),
//               ),
//             ),
//           );
//         }),
//       ),
//     );
//   }
// }
