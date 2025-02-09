import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'customer/customerlogin.dart';
import 'farmer/farmerlogin.dart';
import 'organizerlogin.dart';
class Home extends StatefulWidget{
  @override
  View  createState(){
    return View();
  }

}

class View extends State<Home>{
  late bool isloading;
 /* @override
  void initState(){
    isloading=true;
    Future.delayed(const Duration(seconds: 2),(){
      setState(() {
        print("hi");
        isloading=false;
      });
    });
    super.initState();
  }*/

  @override
  Widget build(BuildContext context){

    return Scaffold(
        resizeToAvoidBottomInset: false,
      appBar: AppBar(backgroundColor: Colors.white,),
      backgroundColor: Colors.white,
      body:
      Center(

        child:Container(
          margin: EdgeInsets.fromLTRB(25,0,25,25),
          child: Center(
            child: Column(
                children: [
                  Image(image: AssetImage('assets/images/fharmonylogo.png')),
                  SizedBox(height: 20,),
                  Container(
            height: 60,
            child: ElevatedButton(

                style: ElevatedButton.styleFrom(
                    minimumSize: const Size.fromHeight(60),
                    backgroundColor: Colors.green,
                    shape: RoundedRectangleBorder( //to set border radius to button
                        borderRadius: BorderRadius.circular(50)
                    )),
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>OrganizerLogin()));

                },
                child: Text("Farmer",style: TextStyle(color: Colors.white,fontSize:25),)),
                  ),
                  SizedBox(height: 10,),
                  Container(
            height: 60,
            child: ElevatedButton(

                style: ElevatedButton.styleFrom(
                    minimumSize: const Size.fromHeight(60),
                    backgroundColor: Colors.orange[900],
                    shape: RoundedRectangleBorder( //to set border radius to button
                        borderRadius: BorderRadius.circular(50)
                    )),
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>OrganizerLogin()));

                },
                child: Text("Organizer",style: TextStyle(color: Colors.white,fontSize:25),)),
                  ),
                  SizedBox(height: 10,),
                  Container(
            height: 60,
            child: ElevatedButton(

                style: ElevatedButton.styleFrom(
                    minimumSize: const Size.fromHeight(60),
                    backgroundColor: Color(0xFF0F52BA),
                    shape: RoundedRectangleBorder( //to set border radius to button
                        borderRadius: BorderRadius.circular(50)
                    )),
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>CustomerLogin()));

                },
                child: Text("Consumer",style: TextStyle(color: Colors.white,fontSize:25),)),
                  ),
              ]
                  ),
          ),
        )
      )
    );
  }
}