import 'package:flutter/material.dart';

import 'customersignup.dart';

class CustomerIntro extends StatefulWidget{
  @override
 Intro createState() {
    // TODO: implement createState
    return Intro();
  }

}

class Intro extends State<CustomerIntro>{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.white, // Change the arrow color
        ),

        title: Text('Welcome to FHARMONY', style: TextStyle(color:Colors.white,fontSize: 22, fontWeight: FontWeight.bold)),
        centerTitle: true,
        backgroundColor: Color(0xFF0F52BA),
        elevation: 5,
      ),
        body: Center(
          child: Container(
            margin: EdgeInsets.fromLTRB(25, 25, 25, 25),
            child: Center(
              child: Column(
                children: [
                  Image.asset(
                    'assets/images/customerlogo.png',
                    height: 200,
                    width: 200,
                  ),
                  SizedBox(height: 25,),
                  Text('Thank you for choosing FHARMONY',
                    textAlign: TextAlign.center,
                    style: TextStyle(

                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue.shade800,),),
                  //Text("Email                                                                ",style: TextStyle(fontSize: 22),textAlign: TextAlign.left,),
                  // SizedBox(height: 5,),
                  SizedBox(height: 20,),
                  Text(
                    'We’re excited to have you onboard. Create your account to unlock exclusive deals, faster checkout, and a seamless shopping experience! Explore thousands of products tailored to your needs, with real-time tracking and secure payments.Enjoy personalized recommendations and exclusive rewards as a valued member of our ShopEase family.',
                    textAlign: TextAlign.justify,
                    style: TextStyle(fontSize: 17),),
                  SizedBox(height: 20,),
                  Container(
                    height: 60,
                    child: ElevatedButton(

                        style: ElevatedButton.styleFrom(
                            minimumSize: const Size.fromHeight(60),
                            backgroundColor: Color(0xFF0F52BA),
                            shape: RoundedRectangleBorder( //to set border radius to button
                                borderRadius: BorderRadius.circular(50)
                            )),
                        onPressed: () { Navigator.pushReplacement(context,MaterialPageRoute(builder: (context)=>CustomerSignUp()));},
                        child: Text(
                          "Create Account", style: TextStyle(color: Colors
                            .white, fontSize: 25),)),
                  ),


                ],
              ),
            ),
          ),
        ));
  }
}
