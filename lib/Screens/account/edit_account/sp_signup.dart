import 'dart:io';

import 'package:app_q_n_a/Screens/screen_home.dart';
import 'package:app_q_n_a/bloc/bloc/supporter/bloc_sp_sign.dart';
import 'package:app_q_n_a/bloc/check_log_state.dart';
import 'package:app_q_n_a/item/input/text_filed.dart';
import 'package:app_q_n_a/styles/init_style.dart';
import 'package:app_q_n_a/validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/bloc/address/bloc_districts.dart';
import '../../../bloc/bloc/address/bloc_provices.dart';
import '../../../bloc/event_bloc.dart';
import '../../../bloc/state_bloc.dart';
import '../../../item/button.dart';
import '../../../item/dropdown/Dropdown1.dart';
import '../../../models/model_local.dart';

class SupporterSignUp extends StatefulWidget {
  const SupporterSignUp({Key? key}) : super(key: key);

  @override
  State<SupporterSignUp> createState() => _SupporterSignUpState();
}

class _SupporterSignUpState extends State<SupporterSignUp> {
  BlocProvinces blocProvinces = BlocProvinces()..add(GetData());
  BlocDistricts blocDistricts = BlocDistricts();
  final keyformSp = GlobalKey<FormState>();
  ModelLocal? province;
  ModelLocal? district;
  String provinceID = '0';
  String districtID = '0';

  BlocSpSignup blocSpSignup = BlocSpSignup();
  TextEditingController work = TextEditingController();
  TextEditingController userNameBank = TextEditingController();
  TextEditingController bankName = TextEditingController();
  TextEditingController bankNumber = TextEditingController();
  TextEditingController cccd = TextEditingController();

  spSignup() async {
    if (keyformSp.currentState!.validate()) {
      blocSpSignup.add(AddDataRegistrantion(
          cccd: cccd.text,
          province_id: int.parse(provinceID),
          district_id: int.parse(districtID),
          work: work.text,
          bankNumber: bankNumber.text,
          bankName: bankName.text,
          userNameBank: userNameBank.text));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(


      backgroundColor: ColorApp.whiteF0,
      appBar: AppBar(
        backgroundColor: ColorApp.whiteF0,
        centerTitle: true,
        title: Text(
          "Đăng ký người trả lời",
          style: StyleApp.textStyle700(fontSize: 18),
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
      body: SingleChildScrollView(
        reverse: true,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 15),
          child: Form(
            key: keyformSp,
            child: Column(
              children: [
                InputText1(
                  controller: work,
                  label: "Nghề nghiệp",
                  borderColor: ColorApp.main.withOpacity(0.2),
                  hasLeading: true,
                  iconData: Icons.work_outline,
                  obscureText: false,
                  hasPass: false,
                  radius: 10,
                  width: double.infinity,
                  validator: (val) {
                    return ValidatorApp.checkNull(text: val, isTextFiled: true);
                  },
                ),
                SizedBox(
                  height: 15,
                ),
                InputText1(
                  keyboardType: TextInputType.number,
                  label: "Nhập CCCD",
                  controller: cccd,
                  borderColor: ColorApp.main.withOpacity(0.2),
                  hasLeading: true,
                  iconData: Icons.person_outline,
                  obscureText: false,
                  hasPass: false,
                  radius: 10,
                  width: double.infinity,
                  validator: (val) {
                    return ValidatorApp.checkNull(text: val, isTextFiled: true);
                  },
                ),
                SizedBox(
                  height: 15,
                ),
                BlocBuilder(
                    bloc: blocProvinces,
                    builder: (context, state) {
                      final list = state is LoadSuccess
                          ? state.data as List<ModelLocal>
                          : <ModelLocal>[];
                      return DropDown2(
                        filled: false,
                        validator: (val) {
                          return ValidatorApp.checkNull(
                              text: val, isTextFiled: true);
                        },
                        pad: 47,
                        listItem: list,
                        hint: "Chọn tỉnh/thành phố",
                        onChanged: (val) {
                          province = val;
                          provinceID = val.id;
                          blocDistricts.add(GetData(
                            id: val.id,
                          ));
                        },
                        value: province,
                      );
                    }),
                SizedBox(
                  height: 15,
                ),
                BlocBuilder(
                    bloc: blocDistricts,
                    builder: (context, state) {
                      final list = state is LoadSuccess
                          ? state.data as List<ModelLocal>
                          : <ModelLocal>[];
                      return DropDown2(
                        validator: (val) {
                          return ValidatorApp.checkNull(
                              text: val, isTextFiled: true);
                        },
                        pad: 47,
                        listItem: list,
                        hint: "Chọn quận/huyện",
                        onChanged: (val) {
                          district = val;
                          districtID = val.id;
                        },
                        value: district,
                      );
                    }),
                SizedBox(
                  height: 15,
                ),
                InputText1(
                  label: "Nhập tên ngân hàng",
                  controller: bankName,
                  borderColor: ColorApp.main.withOpacity(0.2),
                  hasLeading: true,
                  iconData: Icons.account_balance_outlined,
                  obscureText: false,
                  hasPass: false,
                  radius: 10,
                  width: double.infinity,
                  validator: (val) {
                    return ValidatorApp.checkNull(text: val, isTextFiled: true);
                  },
                ),
                SizedBox(
                  height: 15,
                ),
                InputText1(
                  label: "Nhập tên tài khoản ngân hàng",
                  controller: userNameBank,
                  borderColor: ColorApp.main.withOpacity(0.2),
                  hasLeading: true,
                  iconData: Icons.person_outline,
                  obscureText: false,
                  hasPass: false,
                  radius: 10,
                  width: double.infinity,
                  validator: (val) {
                    return ValidatorApp.checkNull(text: val, isTextFiled: true);
                  },
                ),
                SizedBox(
                  height: 15,
                ),
                InputText1(
                  keyboardType: TextInputType.number,
                  label: "Nhập số tài khoản ngân hàng",
                  controller: bankNumber,
                  borderColor: ColorApp.main.withOpacity(0.2),
                  hasLeading: true,
                  iconData: Icons.credit_card_outlined,
                  obscureText: false,
                  hasPass: false,
                  radius: 10,
                  width: double.infinity,
                  validator: (val) {
                    return ValidatorApp.checkNull(text: val, isTextFiled: true);
                  },
                ),
                SizedBox(
                  height: 30,

                ),
                BlocListener(
                  bloc: blocSpSignup,
                  listener: (_, StateBloc state) {
                    CheckLogState.check(context,
                        state: state,
                        msg:
                        "Đăng ký thành công. Admin sẽ kiểm tra trong thời gian sớm nhất",
                        duration: 3,
                        success: (){
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ScreenHome(),
                            ),
                          );
                        })
                    ;
                  },
                  child: Button1(
                      ontap: spSignup,
                      border: Border.all(color: ColorApp.orangeF2, width: 0.5),
                      style: false,
                      fontSize: 18,
                      radius: 30,
                      colorButton: ColorApp.orangeF2,
                      textColor: Colors.white,
                      textButton: 'Đăng ký người trả lời'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
