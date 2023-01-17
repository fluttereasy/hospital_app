import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.blue,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
              child: Image.asset(
            'images/ml_profile_Image.png',
            height: 170,
          )),
          const Text(
            'Sawan Bhardwaj',
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 16, color: Colors.white),
          ),
          const Text(
            'SawanBhardwaj@gmail.com',
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 14, color: Colors.white),
          ),
          Expanded(
            child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(30.0),
                      topLeft: Radius.circular(30.0))),
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text(
                          'Settings',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'View all >',
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Divider(
                      color: Colors.black,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ListTile(
                          leading: Container(
                            height: 35,
                            width: 30,
                            decoration: BoxDecoration(
                                color: Colors.grey[300],
                                borderRadius: BorderRadius.circular(2.0)),
                            child: const Icon(
                              Icons.settings,
                              color: Colors.blue,
                            ),
                          ),
                          title: const Text(
                            'Settings',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                          trailing: const Icon(Icons.arrow_forward),
                        ),
                        ListTile(
                          leading: Container(
                            height: 35,
                            width: 30,
                            decoration: BoxDecoration(
                                color: Colors.grey[300],
                                borderRadius: BorderRadius.circular(2.0)),
                            child: const Icon(
                              Icons.currency_rupee,
                              color: Colors.blue,
                            ),
                          ),
                          title: const Text(
                            'Billing Details',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                          trailing: const Icon(Icons.arrow_forward),
                        ),
                        ListTile(
                          leading: Container(
                            height: 35,
                            width: 30,
                            decoration: BoxDecoration(
                                color: Colors.grey[300],
                                borderRadius: BorderRadius.circular(2.0)),
                            child: const Icon(
                              Icons.person,
                              color: Colors.blue,
                            ),
                          ),
                          title: const Text(
                            'User Management',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                          trailing: const Icon(Icons.arrow_forward),
                        ),
                        const Divider(
                          color: Colors.black,
                        ),
                        ListTile(
                          leading: Container(
                            height: 35,
                            width: 30,
                            decoration: BoxDecoration(
                                color: Colors.grey[300],
                                borderRadius: BorderRadius.circular(2.0)),
                            child: const Icon(
                              Icons.info,
                              color: Colors.blue,
                            ),
                          ),
                          title: const Text(
                            'Information',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                          trailing: const Icon(Icons.arrow_forward),
                        ),
                        ListTile(
                          leading: Container(
                            height: 35,
                            width: 30,
                            decoration: BoxDecoration(
                                color: Colors.grey[300],
                                borderRadius: BorderRadius.circular(2.0)),
                            child: const Icon(
                              Icons.logout,
                              color: Colors.blue,
                            ),
                          ),
                          title: const Text(
                            'Logout',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                          trailing: const Icon(Icons.arrow_forward),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
