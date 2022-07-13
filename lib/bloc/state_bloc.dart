class StateBloc{}

class Loading extends StateBloc{

}
class LoadSuccess extends StateBloc{
  dynamic data;
  String? code;
  bool hasMore;
  bool checkLength;
  LoadSuccess({this.data, this.hasMore = false, this.checkLength = false, this.code});
}
class LoadFail extends StateBloc{
  final String error;

  LoadFail({
    required this.error,
  });
}
class LoadMore extends StateBloc{}
class LoadMoreSucces extends StateBloc{}