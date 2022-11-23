import 'package:app_q_n_a/bloc/bloc/address/bloc_districts.dart';
import 'package:app_q_n_a/bloc/bloc/address/bloc_provices.dart';
import 'package:app_q_n_a/bloc/bloc/auth/bloc_registrantion.dart';

import 'package:app_q_n_a/bloc/check_log_state.dart';
import 'package:app_q_n_a/bloc/event_bloc.dart';
import 'package:app_q_n_a/bloc/state_bloc.dart';
import 'package:app_q_n_a/item/button.dart';
import 'package:app_q_n_a/item/dropdown/Dropdown1.dart';
import 'package:app_q_n_a/item/input/text_filed.dart';
import 'package:app_q_n_a/models/model_local.dart';
import 'package:app_q_n_a/styles/init_style.dart';
import 'package:app_q_n_a/validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toast/toast.dart';

import '../path/image_path.dart';

enum EnumRegistrantion { username, phone }

class SignUpScreen extends StatefulWidget {
  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final keyFormHoi = GlobalKey<FormState>();
  final keyFormTraLoi = GlobalKey<FormState>();

  TextEditingController usernameHoi = TextEditingController();
  TextEditingController phoneHoi = TextEditingController();
  TextEditingController passwordHoi = TextEditingController();
  TextEditingController emailHoi = TextEditingController();
  TextEditingController confirmHoi = TextEditingController();

  TextEditingController usernameTL = TextEditingController();
  TextEditingController phoneTL = TextEditingController();
  TextEditingController passwordTL = TextEditingController();
  TextEditingController emailTL = TextEditingController();
  TextEditingController confirmTL = TextEditingController();
  TextEditingController workTL = TextEditingController();
  TextEditingController userNameBank = TextEditingController();
  TextEditingController bankName = TextEditingController();
  TextEditingController bankNumber = TextEditingController();
  TextEditingController cccd = TextEditingController();

  BlocRegistrantion blocRegistrantionHoi = BlocRegistrantion();
  BlocRegistrantion blocRegistrantionTL = BlocRegistrantion();

  BlocProvinces blocProvinces = BlocProvinces()..add(GetData());
  BlocDistricts blocDistricts = BlocDistricts();

  ModelLocal? province;
  ModelLocal? district;

  String provinceID = '0';
  String districtID = '0';

  SignUpVoid() async {
    if (keyFormHoi.currentState!.validate()) {
      blocRegistrantionHoi.add(AddDataRegistrantion(
        username: usernameHoi.text,
        email: emailHoi.text,
        phone: phoneHoi.text,
        password: passwordHoi.text,
        role: tab.toString(),
      ));
    }
  }

  SignUpVoidTl() async {
    if (keyFormTraLoi.currentState!.validate()) {
      blocRegistrantionTL.add(AddDataRegistrantion(
          username: usernameTL.text,
          email: emailTL.text,
          phone: phoneTL.text,
          password: passwordTL.text,
          role: tab.toString(),
          cccd: cccd.text,
          province_id: int.parse(provinceID),
          district_id: int.parse(districtID),
          work: workTL.text,
          bankNumber: bankNumber.text,
          bankName: bankName.text,
          userNameBank: userNameBank.text));
    }
  }

  int tab = 0;

  @override
  Widget build(BuildContext context) {
    ToastContext().init(context);
    double paddingTop = MediaQuery.of(context).padding.top;
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: ColorApp.whiteF7,
        body: Stack(
          alignment: Alignment.topLeft,
          children: <Widget>[
            NestedScrollView(
              headerSliverBuilder:
                  (BuildContext context, bool innerBoxIsScrolled) {
                return [
                  SliverToBoxAdapter(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        SizedBox(
                          height: paddingTop + 30,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              ImagesPath.imageLogo,
                              width: 222,
                              height: 88,
                              alignment: Alignment.center,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Đăng ký',
                          textAlign: TextAlign.center,
                          style: StyleApp.textStyle700(
                              fontSize: 30, color: ColorApp.red),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          decoration: BoxDecoration(
                            border: Border(
                                bottom:
                                    BorderSide(color: Colors.grey.shade100)),
                          ),
                          child: TabBar(
                            indicatorColor: ColorApp.orangeF2,
                            unselectedLabelStyle: StyleApp.textStyle500(
                                color: ColorApp.grey82, fontSize: 16),
                            onTap: (val) {
                              tab = val;
                            },
                            labelColor: ColorApp.orangeF2,
                            unselectedLabelColor: ColorApp.grey82,
                            tabs: const [
                              Tab(text: 'Người hỏi'),
                              Tab(text: 'Người trả lời'),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                ];
              },
              body: TabBarView(
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  _Nguoihoi(),
                  _NguoiTraloi(),
                ],
              ),
            ),
            Positioned(
              top: paddingTop,
              child: IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  _Nguoihoi() {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Form(
        key: keyFormHoi,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20,
            ),
            InputText1(
              label: "Họ và tên",
              controller: usernameHoi,
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
            const SizedBox(
              height: 15,
            ),
            InputText1(
              keyboardType: TextInputType.phone,
              label: "Số điện thoại",
              controller: phoneHoi,
              borderColor: ColorApp.main.withOpacity(0.2),
              hasLeading: true,
              iconData: Icons.phone_android,
              obscureText: false,
              hasPass: false,
              radius: 10,
              width: double.infinity,
              validator: (val) {
                return ValidatorApp.checkPhone(text: val);
              },
            ),
            const SizedBox(
              height: 15,
            ),
            InputText1(
              keyboardType: TextInputType.emailAddress,
              label: "Email",
              controller: emailHoi,
              borderColor: ColorApp.main.withOpacity(0.2),
              hasLeading: true,
              iconData: Icons.email_outlined,
              obscureText: false,
              hasPass: false,
              radius: 10,
              width: double.infinity,
            ),
            SizedBox(
              height: 15,
            ),
            InputText1(
              label: "Mật khẩu",
              controller: passwordHoi,
              borderColor: ColorApp.main.withOpacity(0.2),
              hasLeading: true,
              iconData: Icons.lock_outline,
              obscureText: true,
              hasPass: true,
              radius: 10,
              width: double.infinity,
              validator: (val) {
                return ValidatorApp.checkPass(
                    text: val, isSign: true, text2: confirmHoi.text);
              },
            ),
            SizedBox(
              height: 15,
            ),
            InputText1(
              label: "Nhập lại mật khẩu",
              controller: confirmHoi,
              borderColor: ColorApp.main.withOpacity(0.2),
              hasLeading: true,
              iconData: Icons.lock_outline,
              obscureText: true,
              hasPass: true,
              radius: 10,
              width: double.infinity,
              validator: (val) {
                return ValidatorApp.checkPass(
                    text: val, isSign: true, text2: passwordHoi.text);
              },
            ),
            SizedBox(
              height: 15,
            ),
            BlocListener(
              bloc: blocRegistrantionHoi,
              listener: (_, StateBloc state) {
                CheckLogState.check(
                  context,
                  state: state,
                  msg: "Đăng ký tài khoản thành công",
                  success: () {
                    Navigator.pop(context);
                  },
                );
              },
              child: Button1(
                  ontap: SignUpVoid,
                  border: Border.all(color: ColorApp.orangeF2, width: 0.5),
                  style: false,
                  fontSize: 18,
                  radius: 30,
                  colorButton: ColorApp.orangeF2,
                  textColor: Colors.white,
                  textButton: 'Đăng ký'),
            ),
          ],
        ),
      ),
    );
  }

  _NguoiTraloi() {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Form(
        key: keyFormTraLoi,
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            InputText1(
              label: "Họ và tên",
              controller: usernameTL,
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
              keyboardType: TextInputType.phone,
              label: "Số điện thoại",
              controller: phoneTL,
              borderColor: ColorApp.main.withOpacity(0.2),
              hasLeading: true,
              iconData: Icons.phone_android,
              obscureText: false,
              hasPass: false,
              radius: 10,
              width: double.infinity,
              validator: (val) {
                return ValidatorApp.checkPhone(text: val);
              },
            ),
            SizedBox(
              height: 15,
            ),
            InputText1(
              keyboardType: TextInputType.emailAddress,
              label: "Email",
              controller: emailTL,
              borderColor: ColorApp.main.withOpacity(0.2),
              hasLeading: true,
              iconData: Icons.email_outlined,
              obscureText: false,
              hasPass: false,
              radius: 10,
              width: double.infinity,
            ),
            SizedBox(
              height: 15,
            ),
            InputText1(
              label: "Nghề nghiệp",
              controller: workTL,
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
              label: "Mật khẩu",
              controller: passwordTL,
              borderColor: ColorApp.main.withOpacity(0.2),
              hasLeading: true,
              iconData: Icons.lock_outline,
              obscureText: true,
              hasPass: true,
              radius: 10,
              width: double.infinity,
              validator: (val) {
                return ValidatorApp.checkPass(
                    text: val, isSign: true, text2: confirmTL.text);
              },
            ),
            SizedBox(
              height: 15,
            ),
            InputText1(
              label: "Nhập lại mật khẩu",
              controller: confirmTL,
              borderColor: ColorApp.main.withOpacity(0.2),
              hasLeading: true,
              iconData: Icons.lock_outline,
              obscureText: true,
              hasPass: true,
              radius: 10,
              width: double.infinity,
              validator: (val) {
                return ValidatorApp.checkPass(
                    text: val, isSign: true, text2: passwordTL.text);
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
                    validator: (val) {
                      return ValidatorApp.checkNull(
                          text: val, isTextFiled: true);
                    },
                    iconData: Icons.location_city,
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
                    iconData: Icons.location_city,
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
              height: 15,
            ),
            BlocListener(
              bloc: blocRegistrantionTL,
              listener: (_, StateBloc state) {
                CheckLogState.check(
                  context,
                  state: state,
                  msg: "Đăng ký tài khoản thành công Supporter",
                  success: () {
                    Navigator.pop(context);
                  },
                );
              },
              child: Button1(
                  ontap: SignUpVoidTl,
                  border: Border.all(color: ColorApp.orangeF2, width: 0.5),
                  style: false,
                  fontSize: 18,
                  radius: 30,
                  colorButton: ColorApp.orangeF2,
                  textColor: Colors.white,
                  textButton: 'Đăng ký'),
            ),
          ],
        ),
      ),
    );
  }
}
