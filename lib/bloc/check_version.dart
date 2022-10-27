import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:package_info_plus/package_info_plus.dart';
import 'package:url_launcher/url_launcher.dart';

class CheckVersion {
  static check(BuildContext context,
      {required String ios, required String android}) async {
    try {
      PackageInfo packageInfo = await PackageInfo.fromPlatform();
      String version = packageInfo.version;
      String appName = packageInfo.appName;
      late ModelVersion modelVersion;
      if (Platform.isAndroid) {
        modelVersion = await CheckVersion().getAndroidStoreVersion(android);
      }
      if (Platform.isIOS) {
        ModelVersion ios1 = await CheckVersion().getIosStoreVersion(ios);
        ModelVersion ios2 = await CheckVersion().getIosStoreVersion2(ios);

        int iosVer1 = int.parse(ios1.version.replaceAll(".", ""));
        int iosVer2 = int.parse(ios2.version.replaceAll(".", ""));

        if (iosVer1 > iosVer2) {
          modelVersion = ios1;
        } else {
          modelVersion = ios2;
        }
      }

      int ves1 = int.parse(version.replaceAll(".", ""));
      int ves2 = int.parse(modelVersion.version.replaceAll(".", ""));

      print("version loca $ves1");
      print("version store $ves2");

      if (version != modelVersion.version && ves2 > ves1) {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text("Cập nhật"),
            content: Text(
                "Đã có phiên bản mới của $appName.\nPhiên bản ${modelVersion.version} đã sẵn sàng.\nBạn đang dùng $version."),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text("Đóng")),
              TextButton(
                  onPressed: () async {
                    await launch(modelVersion.url);
                  },
                  child: const Text("Cập nhật")),
            ],
          ),
        );
      }
    } catch (e) {
      print(e.toString());
    }
  }

  getAndroidStoreVersion(String id) async {
    final url = 'https://play.google.com/store/apps/details?id=$id';
    final response = await http.get(Uri.parse(url));
    if (response.statusCode != 200) {
      return null;
    }
    String? version = RegExp(r',\[\[\["([0-9,\.]*)"]],').firstMatch(response.body)!.group(1);
    return ModelVersion(url: url, version: version ?? "1.0.0");
  }

  getIosStoreVersion(String id) async {
    final url = 'http://itunes.apple.com/vn/lookup?bundleId=$id';
    final response = await http.get(Uri.parse(url));
    if (response.statusCode != 200) {
      return null;
    }
    final jsonObj = json.decode(response.body);
    return ModelVersion(
        url: jsonObj['results'][0]['trackViewUrl'],
        version: jsonObj['results'][0]['version']);
  }

  getIosStoreVersion2(String id) async {
    final url = 'https://itunes.apple.com/vn/lookup?bundleId=$id';
    final response = await http.get(Uri.parse(url));
    if (response.statusCode != 200) {
      return null;
    }
    final jsonObj = json.decode(response.body);
    if(jsonObj['results'].isEmpty){
      return ModelVersion(version: "version", url: url);
    }
    return ModelVersion(
        url: jsonObj['results'][0]['trackViewUrl'],
        version: jsonObj['results'][0]['version']);
  }
}

class ModelVersion {
  String url;
  String version;

  ModelVersion({required this.version, required this.url});
}

class BlocVersion extends Cubit<String>{
  BlocVersion(): super("1.0.0");

  getVersion() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    String version = packageInfo.version;
    emit(version);
  }
}
