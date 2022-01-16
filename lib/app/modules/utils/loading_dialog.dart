import 'package:flutter/cupertino.dart';

abstract class LoadingDialog {
  void show();
  Future<void> hide();
}

class LoadingDialogImpl implements LoadingDialog {
  @override
  Future<void> hide() {
    throw UnimplementedError();
  }

  @override
  void show() {}
}
