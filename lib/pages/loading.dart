
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
class Loading extends StatefulWidget{

  @override
  Load  createState(){
    return Load();
  }

}

class Load extends State<Loading>{





  @override
  Widget build(BuildContext context){
    return Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: SpinKitWaveSpinner(
            color: Colors.blue,
            size: 50.0,
          ),
        )
    );
  }
}