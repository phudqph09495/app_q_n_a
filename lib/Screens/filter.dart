import 'dart:io';

import 'package:app_q_n_a/Screens/home.dart';
import 'package:app_q_n_a/bloc/bloc/auth/bloc_get_answer.dart';
import 'package:app_q_n_a/bloc/bloc/auth/bloc_getquestion.dart';
import 'package:app_q_n_a/bloc/bloc/question/get_class_bloc.dart';
import 'package:app_q_n_a/bloc/check_log_state.dart';
import 'package:app_q_n_a/bloc/event_bloc.dart';
import 'package:app_q_n_a/item/gridView/grid_view_2.dart';
import 'package:app_q_n_a/models/model_local.dart';
import 'package:app_q_n_a/styles/init_style.dart';
import 'package:flutter/material.dart';
import 'package:app_q_n_a/item/radio_list_tile.dart';
import 'package:app_q_n_a/item/grid_view.dart';
import 'package:app_q_n_a/item/button.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import '../bloc/state_bloc.dart';

class Filter extends StatefulWidget {
  @override
  State<Filter> createState() => _FilterState();
}

class _FilterState extends State<Filter> {
  BlocGetClass blocGetClass = BlocGetClass()..add(GetData());


  Map req = new Map();
  String? theloai;
  String? lophoc;
  String? monhoc;
  int? lopval;
  int? monval;
  int? catval;
  List cat = [
    ModelLocal(id: "7", name: "Ngẫu hứng"),
    ModelLocal(id: "8", name: "Chiến lược"),
  ];
  List listmon = [
    ModelLocal(id: "16", name: "Toán học"),
    ModelLocal(id: "19", name: "Vật lý"),
    ModelLocal(id: "20", name: "Hoá học"),
    ModelLocal(id: "17", name: "Văn học"),
    ModelLocal(id: "21", name: "Sinh học"),
    ModelLocal(id: "15", name: "Lịch sử"),
    ModelLocal(id: "22", name: "Địa lý"),
    ModelLocal(id: "18", name: "Tiếng Anh"),
    ModelLocal(id: "23", name: "Tin học"),
    ModelLocal(id: "24", name: "GDCD"),
    ModelLocal(id: "25", name: "Công nghệ"),
    ModelLocal(id: "26", name: "Âm nhạc"),
    ModelLocal(id: "27", name: "Mỹ thuật"),
  ];
  List listlop = [
    ModelLocal(id: "3", name: "Lớp 1"),
    ModelLocal(id: "4", name: "Lớp 2"),
    ModelLocal(id: "5", name: "Lớp 3"),
    ModelLocal(id: "6", name: "Lớp 4"),
    ModelLocal(id: "7", name: "Lớp 5"),
    ModelLocal(id: "8", name: "Lớp 6"),
    ModelLocal(id: "9", name: "Lớp 7"),
    ModelLocal(id: "10", name: "Lớp 8"),
    ModelLocal(id: "11", name: "Lớp 9"),
    ModelLocal(id: "12", name: "Lớp 10"),
    ModelLocal(id: "13", name: "Lớp 11"),
    ModelLocal(id: "14", name: "Lớp 12"),
  ];
  GetData getQuestionHome = GetData();

  getKeySearch(){
    String key = "";
    if(theloai != null){
      key = key + "$theloai ";
    }
    if(lophoc != null){
      key = key + "$lophoc ";
    }
    if(monhoc != null){
      key = key + "$monhoc ";
    }

    if(key != ""){
      return key;
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomSheet: Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.0,vertical: 10),
          child:
          Button1(
              style: false,
              fontSize: 18,
              radius: 30,
              ontap: () {
                if(lopval != null){
                  getQuestionHome.class_id = lopval;
                }
                if(monval != null){
                  getQuestionHome.subject_id = monval;
                }
                if(catval != null){
                  getQuestionHome.cat_id =  catval;
                }
                context.read<BlocGetQuestion>().add(getQuestionHome);

                Navigator.pop(context);
              },
              colorButton: ColorApp.orangeF2,
              textColor: Colors.white,
              border: Border.all(color: ColorApp.orangeF2, width: 0.5),
              textButton: 'Tìm kiếm'),
        ),
        backgroundColor: ColorApp.whiteF0,
        appBar: AppBar(
          centerTitle: true,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Platform.isAndroid ? Icons.arrow_back : Icons.arrow_back_ios,
              color: ColorApp.black,
            ),
          ),
          title: Text(
            'Lọc câu hỏi',
            style: StyleApp.textStyle700(
              fontSize: 18,
            ),
          ),
          backgroundColor: ColorApp.whiteF0,
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              FilterList2(
                value: catval,
                column: 1,
                list: cat,
                title: '  Trạng thái câu hỏi',
                space: 10,
                onChanged: (val) {
                  setState(() {
                    catval = val;
                  });
                  getQuestionHome.keySearch = getKeySearch();
                },
              ),
              const SizedBox(
                height: 8,
              ),
              BlocBuilder(
                 bloc: blocGetClass,
                 builder: (context, state) {
                   final list  = state is LoadSuccess ? state.data as List<ModelLocal> : <ModelLocal>[];
                   return FilterList2(
                     value: lopval,
                     title: '  Lớp',
                     column: 3,
                     list: list,
                     onChanged: (val) {
                       lopval = val;
                       for(ModelLocal element in list){
                         if(element.id.toString() == val.toString()){
                           lophoc = element.name;
                         }
                       }
                       getQuestionHome.keySearch = getKeySearch();
                     },
                   );
                 },
              ),
              const SizedBox(
                height: 8,
              ),
              FilterList2(
                value: monval,
                title: '  Môn học',
                column: 3,
                list: listmon,
                onChanged: (val) {
                  setState(() {
                    monval = val;
                  });
                  getQuestionHome.keySearch = getKeySearch();
                },
              ),
              const SizedBox(
                height: 8,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
