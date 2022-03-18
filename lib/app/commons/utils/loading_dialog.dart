import 'package:clean_login/app/modules/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:asuka/asuka.dart' as asuka;
import 'package:flutter_modular/flutter_modular.dart';
part 'loading_dialog.g.dart';

//flutter pub run build_runner build

abstract class LoadingDialog {
  void show();
  Future<void> hide();
}

@Injectable()
class LoadingDialogImpl implements LoadingDialog {
  late OverlayEntry entry;

  LoadingDialogImpl() {
    entry = OverlayEntry(builder: (context) {
      return Container(
        color: Colors.white.withOpacity(.3),
        alignment: Alignment.center,
        child: const CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(ThemeApp.appColor),
        ),
      );
    });
  }

  @override
  Future<void> hide() async {
    entry.remove();
    await Future.delayed(
      const Duration(milliseconds: 500),
    );
  }

  @override
  void show() {
    FocusManager.instance.primaryFocus!.unfocus();
    asuka.addOverlay(entry);
  }
}
