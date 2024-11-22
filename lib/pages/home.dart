import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'customer/customerlogin.dart';
import 'farmer/farmerlogin.dart';
class Home extends StatefulWidget{
  @override
  View  createState(){
    return View();
  }

}

class View extends State<Home>{
  late bool isloading;
  @override
  void initState(){
    isloading=true;
    Future.delayed(const Duration(seconds: 2),(){
      setState(() {
        print("hi");
        isloading=false;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context){

    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.white,),
      backgroundColor: Colors.white,
      body:isloading? Center(child:SpinKitWaveSpinner(
        color: Colors.black,
        size: 50.0,
      )
      ):Center(
        child:Column(
    children: [
      Image(image: AssetImage('assets/fharmonylogo.png')),
      SizedBox(height: 20,),
      Container(
        height: 50,
        width: 300,
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
             backgroundColor: Colors.green
            ),
            onPressed:() {
              Navigator.push(context, MaterialPageRoute(builder: (context)=>FarmerLogin()));
            },
            child: Text("Farmer",style: TextStyle(color: Colors.white,fontSize: 20),)),
      ),
      SizedBox(height: 10,),
      Container(
        height: 50,
        width: 300,
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange[900]
            ),
            onPressed:() {},
            child: Text("Organizer",style: TextStyle(color: Colors.white,fontSize: 20),)),
      ),
      SizedBox(height: 10,),
      Container(
        height: 50,
        width: 300,
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF0F52BA)
            ),
            onPressed:() {
              Navigator.push(context, MaterialPageRoute(builder: (context)=>CustomerLogin()));
            },
            child: Text("Consumer",style: TextStyle(color: Colors.white,fontSize: 20),)),
      )
  ]
      )
      )
    );
  }
}