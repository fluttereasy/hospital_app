import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:webview_flutter/webview_flutter.dart';

class TestScreen extends StatefulWidget {
  const TestScreen({Key? key}) : super(key: key);

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  bool loading = false;
  Dio dio = Dio();
  double progress = 0;

  String url =
      'http://gtech.easysolution.asia:91/api/DownloadFile?Reciept_NO=KALY/2022-23/OSO-0003859';

  Future<void> requestDownload(String _url, String _name) async {
    final dir =
    await getExternalStorageDirectory();
//From path_provider package
    var _localPath = dir!.path + _name;
    final savedDir = Directory(_localPath);
    await savedDir.create(recursive: true).then((value) async {
      String? _taskid = await FlutterDownloader.enqueue(
        url: _url,
        fileName: _name,
        savedDir: _localPath,
        showNotification: true,
        openFileFromNotification: false,
      );
      print(_taskid);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Downloading'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
                child: ElevatedButton(
                    onPressed: () {}, child: const Text('Download File'))),
          ],
        ));
  }
}
