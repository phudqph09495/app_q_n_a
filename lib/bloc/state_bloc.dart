class StateBloc {}

class Loading extends StateBloc {}

class LoadSuccess extends StateBloc {
  String? mess;
  dynamic data;
  String? keySearch;
  String? keySearch1;
  String? keySearch2;
  String? code;
  bool hasMore;
  bool checkLength;
  int? countFilter;

  LoadSuccess({
    this.data,
    this.hasMore = false,
    this.checkLength = false,
    this.code,
    this.keySearch,
    this.mess,
    this.keySearch1,
    this.keySearch2,
     this.countFilter,
  });
}

class LoadFail extends StateBloc {
  final String error;

  LoadFail({
    required this.error,
  });
}

class LoadMore extends StateBloc {}

class LoadMoreSucces extends StateBloc {}
