import 'package:flutter/material.dart';
import 'package:todo_list/logic/all_logic.dart';
import 'package:todo_list/utils/shared_util.dart';


class GlobalModel extends ChangeNotifier {

  GlobalLogic logic;
  BuildContext context;
  String appName = "One Day";
  String currentThemeType = "pink";


  List<String> currentLanguage = ["zh", "CN"];


  GlobalModel() {
    logic = GlobalLogic(this);
  }

  void setContext(BuildContext context) {
    if (this.context == null) {
      this.context = context;
      SharedUtil.instance.getStringList(Keys.currentLanguage).then((list) {
        if (list == null) return;
        if (list == currentLanguage) return;
        currentLanguage = list;
        notifyListeners();
      });

      SharedUtil.instance.getString(Keys.currentThemeType).then((theme){
        if(theme == null) return;
        if(theme == currentThemeType) return;
        currentThemeType = theme;
        notifyListeners();
      });
    }
  }

  @override
  void dispose() {
    super.dispose();
    debugPrint("GlobalModel销毁了");
  }

  void refresh() {
    notifyListeners();
  }
}