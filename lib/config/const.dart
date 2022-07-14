import 'dart:ui';

import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

import 'path/share_pref_path.dart';
import 'share_pref.dart';

class Const {
  //tai khoan test
  //0817932159
  //123456
  static final ConvertPrice = NumberFormat("#,##0.##", "vi");

  static const image_host = 'hoidap.nanoweb.vn/static';

  static const api_host = 'hoidap.nanoweb.vn/api';

  static const domain = "hoidap.nanoweb.vn";

  static const key = 'key_nanoweb_hoidap_2021_real';

  static const int debug = 1;

  static checkLogin({required Function nextPage}) async {
    bool isLogin = await SharedPrefs.readBool(SharePrefsKey.login);
    if(isLogin){
      nextPage();
    }else{
      //Get.toNamed(RouterScreens.screenLogin);
    }

  }

  static formatTime(time, {String? format}) {
    var check = isNumeric(time.toString());
    if (check) {
      return DateFormat(format ?? 'dd-MM-yyyy', 'en_US')
          .format(DateTime.fromMillisecondsSinceEpoch(int.parse(time.toString()) * 1000));
    }
    return '';
  }

  static formatTimeString(time, {String? format}) {
    return DateFormat(format ?? 'dd/MM/yyyy  HH:mm:ss', 'en_US')
        .format(DateTime.parse(time));
  }

  static copy(String text) {
    Clipboard.setData(ClipboardData(text: text));
    // Get.snackbar(
    //   'Copy',
    //   'Đã copy thành công',
    //   snackPosition: SnackPosition.BOTTOM,
    // );
  }

  static checkStatusOrder(int index) {

    List status = [
      "Tạo mới",
      "Hủy",
      "Đã lấy hàng",
      "Đang vận chuyển",
      "Đang giao hàng",
      "Đang chuyển hoàn",
      "Đã giao hàng",
      "Đã trả hàng",
      "Kiện vấn đề",
    ];

    return status[index > 0 ? index - 1 : 0];
  }

  static convertPrice(
      dynamic price,
      ) {
    var res = isNumeric(price.toString());
    if (res) {
      return ConvertPrice.format(double.parse(price.toString())).toString();
    }
    return "0";
  }

  static String formatPrice(dynamic price, ) {
    double key = 0;
    var check = isNumeric(price.toString());
    if (check) {
      key = double.parse(price.toString());
    }
    var formatCurrency = NumberFormat("#,##0.##", "en_US");
    String format = formatCurrency.format(key);
    var formatCurrency2 = '';
    if (1000000 > key) {
      formatCurrency2 = '${formatCurrency.format(key / 1000)} K';
    } else if (1000000000 > key) {
      formatCurrency2 = '${formatCurrency.format(key / 1000000)} M';
    } else if (1000000000000 > key) {
      formatCurrency2 = '${formatCurrency.format(key / 1000000000)} B';
    } else {
      formatCurrency2 = '${formatCurrency.format(key / 1000000000000)} KB';
    }

    if (key == 0) {
      formatCurrency2 = format;
    }
    // return format.substring(1, format.length);
    return formatCurrency2;
  }

  static convertPhone(String? phone, {bool check = false, bool isHint = false}) {
    if (phone == "null" || phone == "" || phone == null) {
      if (check) {
        return "";
      }
      return "Chưa cập nhật";
    }

    if(isHint){
      return "${phone.substring(0, 4)}***${phone.substring(7, 10)}";
    }

    return "${phone.substring(0, 4)} ${phone.substring(4, 7)} ${phone.substring(7, 10)}";
  }

  static convertContact(
      String? value,
      ) {
    if (value != null) {
      String data = value.replaceAll(" ", '');
      String data1 = data.replaceAll("-", '');
      String data2 = data1.replaceAll("+", '');
      if(data2.startsWith("84")){
        return "0${data2.substring(2,data2.length)}";
      }
      return data2;
    }
    return "";
  }

  static checkStringNull(String? text,
      {bool checkReturn = false,
        bool checkAddress = false,
        bool checkPrice = false}) {
    if (text == "null" || text == null || text == "") {
      if (!checkReturn) {
        if (checkAddress ) {
          return "";
        }
        if (checkPrice) {
          return "Liên hệ";
        }
        return "Chưa cập nhật";
      }

      return "Lỗi dữ liệu";
    }
    if (checkAddress) {
      return "$text  ";
    }
    return text;
  }

  static convertNumber(dynamic data) {
    var res = isNumeric(data.toString());
    if (res) {
      return double.parse(data.toString());
    }
    return 0;
  }

  static convertSale({dynamic price, dynamic priceMarket}) {
    var res = isNumeric(price.toString());
    var res1 = isNumeric(priceMarket.toString());
    if (res && res1) {
      double price1 = double.parse(price.toString());
      double price2 = double.parse(priceMarket.toString());
      if (price2 > price1) {
        double priceSale = price2 - price1;
        double sale = (priceSale / price2);
        return (sale * 100).round();
      }
      return 0;
    }
    return 0;
  }

  static bool isNumeric(String result) {
    if (result == null) {
      return false;
    }
    return double.tryParse(result) != null;
  }

  static checkTime(int timestamp, {bool checkNew = true}) {
    // DateTime _timeDate = DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);
    // String timestr = "";
    // final customDate = CustomTimeElapsed(
    //   minutes: 'phút trước',
    //   hours: 'giờ trước',
    //   days: 'ngày trước',
    //   now: 'vừa xong',
    //   seconds: 'giây trước',
    //   weeks: 'tuần trước',
    // );
    // timestr =
    //     TimeElapsed.fromDateTime(_timeDate).toCustomTimeElapsed(customDate);
    // return timestr;
  }

  static callLaunch(url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}

extension HexColor on Color {
  /// String is in the format "aabbcc" or "ffaabbcc" with an optional leading "#".
  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }

  /// Prefixes a hash sign if [leadingHashSign] is set to `true` (default is `true`).
  String toHex({bool leadingHashSign = true}) => '${leadingHashSign ? '#' : ''}'
      '${alpha.toRadixString(16).padLeft(2, '0')}'
      '${red.toRadixString(16).padLeft(2, '0')}'
      '${green.toRadixString(16).padLeft(2, '0')}'
      '${blue.toRadixString(16).padLeft(2, '0')}';
}



