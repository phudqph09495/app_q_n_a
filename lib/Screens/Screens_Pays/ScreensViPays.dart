import 'dart:io';
import 'package:app_q_n_a/styles/styles.dart';
import 'package:flutter/material.dart';

import '../../styles/colors.dart';

class ViTien extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorApp.whiteF0,
        title: Text(
          'Ví tiền',
          style: StyleApp.textStyle700(fontSize: 16),
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
        child: SafeArea(
          child: Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                child: Card(
                  color: Colors.greenAccent,
                  elevation: 20,
                  shadowColor: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      gradient: const SweepGradient(
                        startAngle: 3.14 * 0.1,
                        endAngle: 3.14 * 1.7,
                        colors: [
                          Colors.green,
                          Colors.lightGreen,
                          Colors.greenAccent,
                          Colors.yellow,
                          Colors.green,
                        ],
                        stops: <double>[0.0, 1.0, 0.5, 0.0, 0.0],
                        tileMode: TileMode.clamp,
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text(
                                'Tiền',
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w700),
                              ),
                              Text(
                                '\$999',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontStyle: FontStyle.italic,
                                  fontWeight: FontWeight.w700,
                                  letterSpacing: 1,
                                  fontSize: 22,
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Image(
                                image: NetworkImage(
                                    'https://toigingiuvedep.vn/wp-content/uploads/2021/05/hinh-anh-hoa-dao-png-1.png'),
                                height: 200,
                                color: Colors.black54,
                              ),
                            ],
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: const [
                                Image(
                                  image: NetworkImage(
                                      'https://icons.iconarchive.com/icons/pixelkit/swanky-outlines/256/06-Wallet-icon.png'),
                                  height: 50,
                                  color: Colors.black87,
                                ),
                                SizedBox(
                                  height: 105,
                                ),
                                Image(
                                  image: NetworkImage(
                                      'https://scontent.xx.fbcdn.net/v/t1.15752-9/281557024_2088267788008464_2556644716703021321_n.png?_nc_cat=111&ccb=1-7&_nc_sid=aee45a&_nc_ohc=pTH0kvWigrIAX_XaN9R&_nc_ad=z-m&_nc_cid=0&_nc_ht=scontent.xx&oh=03_AVL6KuHrii-wJqzuB6xmz8khaLtymhrCOfEe1ni6VGwnTw&oe=62D6E232'),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Column(
                children: [
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(20, 10, 0, 0),
                      child: Text(
                        'Nạp tiền vào ví',
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 20),
                    child: TextFormField(
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                      ),
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        prefixIcon: const Icon(
                          Icons.attach_money,
                          color: ColorApp.orangeF01,
                        ),
                        errorStyle: const TextStyle(
                          color: Colors.red,
                        ),
                        contentPadding: const EdgeInsets.all(15),
                        hintText: 'Money',
                        hintStyle: const TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                            fontWeight: FontWeight.w700),
                        filled: true,
                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                            color: Colors.red,
                          ),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                            color: Colors.black,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                            color: Colors.grey,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 50),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        plustMoney(10),
                        plustMoney(20),
                        plustMoney(50),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 20),
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: 40.0,
                      child: RaisedButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        onPressed: () {},
                        color: Colors.green,
                        textColor: Colors.yellow,
                        splashColor: Colors.white,
                        child: const Text(
                          'Proceed',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            letterSpacing: 1,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: InkWell(
                      child: Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.lightGreen,
                        ),
                        height: MediaQuery.of(context).size.height * .055,
                        width: MediaQuery.of(context).size.width,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8, right: 8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Icon(
                                Icons.history,
                                color: ColorApp.black,
                              ),
                              Text(
                                'Lịch sử giao dịch',
                                style: TextStyle(
                                  fontSize: 16,
                                  letterSpacing: 1,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              Icon(
                                Icons.arrow_forward_ios_outlined,
                                color: ColorApp.black,
                              ),
                            ],
                          ),
                        ),
                      ),
                      onTap: () {},
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget plustMoney(int num) {
    return InkWell(
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(25),
          border: Border.all(color: Colors.lightGreenAccent, width: 2),
        ),
        child: Center(
          child: Text(
            '+$num',
            style: const TextStyle(
              fontSize: 16,
              letterSpacing: 1,
              color: Colors.black,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ),
      onTap: () {},
    );
  }
}
