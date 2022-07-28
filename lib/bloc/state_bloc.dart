class StateBloc{}

class Loading extends StateBloc{

}
class LoadSuccess extends StateBloc{
  String? mess;
  dynamic data;
  String? keySearch;
  String? code;
  bool hasMore;
  bool checkLength;
  LoadSuccess({this.data, this.hasMore = false, this.checkLength = false, this.code, this.keySearch,this.mess});
}
class LoadFail extends StateBloc{
  final String error;

  LoadFail({
    required this.error,
  });
}
class LoadMore extends StateBloc{}
class LoadMoreSucces extends StateBloc{}