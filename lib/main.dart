import 'package:fharmony/pages/customer/customerhome.dart';
import 'package:fharmony/pages/customer/customerlogin.dart';
import 'package:fharmony/pages/customer/customersignup.dart';
import 'package:fharmony/pages/customer/customersignup2.dart';
import 'package:fharmony/pages/farmer/farmerlogin.dart';
import 'package:fharmony/pages/home.dart';
import 'package:fharmony/pages/loading.dart';
import 'package:fharmony/pages/organizerlogin.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

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

  runApp(MaterialApp(
      initialRoute: '/home',
      routes:{'/home':(context)=>Home(),
        '/customerlogin':(context)=>CustomerLogin(),
        '/farmerlogin':(context)=>FarmerLogin(),
        '/organizerlogin':(context)=>OrganizerLogin(),
        '/loading':(context)=>Loading(),
        '/customersignup':(context)=>CustomerSignUp(),
        '/customersignup2':(context)=>CustomerSignUp2(),
        '/customerhome':(context)=>CustomerHome(),
       }
  ));
}



