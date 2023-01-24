import 'package:flutter/material.dart';

class NotificationSettings extends StatefulWidget {
  const NotificationSettings({Key? key}) : super(key: key);

  @override
  State<NotificationSettings> createState() => _NotificationSettingsState();
}

class _NotificationSettingsState extends State<NotificationSettings> {
  bool generalNotificatonvalue = false;
  bool soundValue = false;
  bool vibrateValue = false;
  bool specialOffervalue = false;
  bool promoValue = false;
  bool appUpdate = false;
  bool newService = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Notification',
          style: TextStyle(
              fontWeight: FontWeight.bold, color: Colors.black, fontSize: 23),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListTile(
                title: const Text(
                  'Sound',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                trailing: Switch(
                    value: soundValue,
                    activeColor: Colors.blue,
                    onChanged: (onChanged) {
                      setState(() {
                        soundValue = onChanged;
                      });
                    })),
            ListTile(
                title: const Text(
                  'Vibrate',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                trailing: Switch(
                    value: vibrateValue,
                    activeColor: Colors.blue,
                    onChanged: (onChanged) {
                      setState(() {
                        vibrateValue = onChanged;
                      });
                    })),
            ListTile(
                title: const Text(
                  'Special Offers',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                trailing: Switch(
                    value: specialOffervalue,
                    activeColor: Colors.blue,
                    onChanged: (onChanged) {
                      setState(() {
                        specialOffervalue = onChanged;
                      });
                    })),
            ListTile(
                title: const Text(
                  'Promo & Discount',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                trailing: Switch(
                    value: promoValue,
                    activeColor: Colors.blue,
                    onChanged: (onChanged) {
                      setState(() {
                        promoValue = onChanged;
                      });
                    })),
            ListTile(
                title: const Text(
                  'App Updates',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                trailing: Switch(
                    value: appUpdate,
                    activeColor: Colors.blue,
                    onChanged: (onChanged) {
                      setState(() {
                        appUpdate = onChanged;
                      });
                    })),
            ListTile(
                title: const Text(
                  'New Services Available',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                trailing: Switch(
                    value: newService,
                    activeColor: Colors.blue,
                    onChanged: (onChanged) {
                      setState(() {
                        newService = onChanged;
                      });
                    })),
          ],
        ),
      ),
    );
  }
}
