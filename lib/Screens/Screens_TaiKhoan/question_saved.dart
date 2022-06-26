import 'dart:io';
import 'package:app_q_n_a/Screens/Screens_TaiKhoan/question_Widget.dart';
import 'package:flutter/material.dart';
import 'package:responsive_scaffold_nullsafe/templates/list/responsive_list.dart';
import '../../../item/answer_card.dart';
import '../../../styles/colors.dart';
import '../../../styles/styles.dart';

class Question_saved extends StatefulWidget {
  @override
  _Question_savedState createState() => _Question_savedState();
}

class _Question_savedState extends State<Question_saved> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  late List<String> _items;

  @override
  void initState() {
    _items = List.generate(
      5,
      (int index) => "Câu $index",
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveListScaffold.builder(
      scaffoldKey: _scaffoldKey,
      detailBuilder: (BuildContext context, int? index, bool tablet) {
        final i = _items[index!];
        return DetailsScreen(
          body: Question_savedStt(
            items: _items,
            row: i,
            tablet: tablet,
            onDelete: () {
              setState(() {
                _items.removeAt(index);
              });
              if (!tablet) Navigator.of(context).pop();
            },
          ),
        );
      },
      appBar: AppBar(
        backgroundColor: ColorApp.whiteF0,
        title: Text(
          "Câu hỏi đã lưu",
          style: StyleApp.textStyle700(fontSize: 18, color: ColorApp.black),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Platform.isAndroid ? Icons.arrow_back : Icons.arrow_back_ios,
            color: ColorApp.black,
          ),
        ),
      ),
      itemCount: _items.length,
      itemBuilder: (BuildContext context, int index) {
        final i = _items[index];
        return ListTile(
          leading: Text(i),
        );
      },
    );
  }
}

class Question_savedStt extends StatelessWidget {
  const Question_savedStt({
    Key? key,
    required List<String> items,
    required this.row,
    required this.tablet,
    required this.onDelete,
  })  : _items = items,
        super(key: key);

  final List<String> _items;
  final String row;
  final bool tablet;
  final VoidCallback onDelete;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorApp.whiteF0,
        title: Text(
          "$row",
          style: StyleApp.textStyle700(fontSize: 18, color: ColorApp.black),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Platform.isAndroid ? Icons.arrow_back : Icons.arrow_back_ios,
            color: ColorApp.black,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.delete,
              color: ColorApp.black,
            ),
            onPressed: onDelete,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 5,
              ),
              QuestionWidget(
                time: '11:07 7/6/2022',
                title: 'Đếm số đỉnh, số cạnh của khối bát diện đều',
                avatar: 'https://img.loigiaihay.com/picture/2021/1116/1.png',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
