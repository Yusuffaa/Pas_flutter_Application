import 'package:get/get.dart';
import 'package:pas_flutter/pages/detailecommers_pages.dart';
import 'package:pas_flutter/pages/login_pages.dart';
import 'package:pas_flutter/pages/main_menupages.dart';

class Routes {
static const String loginclonefix = "/loginCloneFix";
static const String mainmenupages = "/mainMenuPages";
static const String detailecommerce = "/mainMenuPages";





  static final myPages = [

     GetPage(name: loginclonefix, page: ()=> LoginCloneFixPage()),
     GetPage(name: mainmenupages, page: ()=> MainMenuPage()),
     GetPage(name: detailecommerce, page: ()=> DetailecommersPages()),

  ];
}