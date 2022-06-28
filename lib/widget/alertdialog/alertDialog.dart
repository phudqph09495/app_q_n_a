import 'package:flutter/material.dart';

class Screen_Alert extends StatelessWidget {
  const Screen_Alert({Key? key}) : super(key: key);

  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: Scaffold(
        appBar: AppBar(title: const Text(_title)),
        body: const Center(
          child: AlertName(),
        ),
      ),
    );
  }
}

class AlertName extends StatelessWidget {
  const AlertName({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: const Text('Thông báo'),
          content: const Text('Bạn phải đăng nhập mới sử dụng được chức năng này!'),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.pop(context, 'Cancel'),
              child: const Text('Ok'),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context, 'OK'),
              child: const Text('Cancel'),
            ),
          ],
        ),
      ), child: null!,
    );
  }
}
