
import 'package:fharmony/pages/customer/app/data/local/my_shared_pref.dart';
import 'package:fharmony/pages/customer/app/modules/welcome/views/welcome_view.dart';
import 'package:fharmony/pages/customer/app/routes/app_pages.dart';
import 'package:fharmony/pages/customer/config/theme/my_theme.dart';
import 'package:fharmony/pages/customer/config/translations/localization_service.dart';
import 'package:fharmony/pages/customer/customerlogin.dart';
import 'package:fharmony/pages/customer/customersignup.dart';
import 'package:fharmony/pages/customer/customersignup2.dart';
import 'package:fharmony/pages/customer/customerintro.dart';
import 'package:fharmony/pages/customer/passwordreset.dart';
import 'package:fharmony/pages/customer/passwordresetmailresend.dart';
import 'package:fharmony/pages/farmer/farmerlogin.dart';
import 'package:fharmony/pages/home.dart';
import 'package:fharmony/pages/loading.dart';
import 'package:fharmony/pages/organizerlogin.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

void main() async {


  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
      options: FirebaseOptions(
        apiKey: 'AIzaSyAiiIdau62O1aX0-tcP1Z4kbVrzRIdZ9jg',
        appId: '1:181893875604:web:355e58dab917f4f3747181',
        messagingSenderId: '181893875604',
        projectId: 'fir-1b8b4',
        // Your web Firebase config options
      ),
    );
  } else {
    await Firebase.initializeApp();
  }
  WidgetsFlutterBinding.ensureInitialized();

  // init shared preference
  await MySharedPref.init();

  runApp(
    ScreenUtilInit(
      designSize: const Size(390, 844),
      minTextAdapt: true,
      splitScreenMode: true,
      useInheritedMediaQuery: true,
      rebuildFactor: (old, data) => true,
      builder: (context, widget) {
        return GetMaterialApp(
          title: "FHARMONY",
          useInheritedMediaQuery: true,
          debugShowCheckedModeBanner: false,
          builder: (context,widget) {
            bool themeIsLight = MySharedPref.getThemeIsLight();
            return Theme(
              data: MyTheme.getThemeData(isLight: themeIsLight),
              child: MediaQuery(
                data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
                child: widget!,
              ),
            );
          },
          initialRoute: AppPages.INITIAL, // first screen to show when app is running
          getPages: AppPages.routes, // app screens
          locale: MySharedPref.getCurrentLocal(), // app language
          translations: LocalizationService.getInstance(), // localization services in app (controller app language)
        );
      },
    ),
  );
  /*runApp(MaterialApp(

      initialRoute: AppPages.INITIAL, // first screen to show when app is running
      getPages: AppPages.routes,
       initialRoute: '/home',
      routes:{'/home':(context)=>Home(),
        '/customerlogin':(context)=>CustomerLogin(),
        '/farmerlogin':(context)=>FarmerLogin(),
        '/organizerlogin':(context)=>OrganizerLogin(),
        '/loading':(context)=>Loading(),
        '/customersignup':(context)=>CustomerSignUp(),
        '/customersignup2':(context)=>CustomerSignUp2(),
        '/customerwelcome':(context)=>CustomerIntro(),
        '/home_view':(context)=>HomeView(),
        '/welcome_view':(context)=>WelcomeView(),
        '/passwordreset':(context)=>ResetPwPage(),
        '/passwordresetmailresend':(context)=>PasswordResetResentPage(mail: '',),

       }
  ));*/
}



