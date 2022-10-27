import 'package:app_q_n_a/bloc/check_version.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:package_info_plus/package_info_plus.dart';

class BlocCheckVersion extends Cubit<bool> {
  BlocCheckVersion() : super(false);

  checkData() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    String version = packageInfo.version;
    ModelVersion iosVersion =
        await CheckVersion().getIosStoreVersion2("com.app.hotrohoctap");
    if (iosVersion.version == version) {
      emit(true);
      return;
    } else {
      emit(false);
      return;
    }
  }
}
