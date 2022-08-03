import 'package:flutter_bloc/flutter_bloc.dart';

class PriceByCoin extends Cubit<int> {
  PriceByCoin() : super(0);

  void getPrice(int coin) {
    int price = coin;
    emit(price);
  }
}
