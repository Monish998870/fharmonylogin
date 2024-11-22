
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../features/userauthentication.dart';

class CustomerSignUp extends StatefulWidget{
  @override
  UserSignUp  createState(){
    return  UserSignUp();
  }

}

class  UserSignUp extends State<CustomerSignUp> {
  TextEditingController firstnamecontroller = TextEditingController();
  TextEditingController lastnamecontroller = TextEditingController();
  TextEditingController phonenumbercontroller = TextEditingController();
  final FirebaseAuthService _auth = FirebaseAuthService();
  final formKey = GlobalKey<FormState>();


  @override
  void dispose() {
    firstnamecontroller.dispose();
    lastnamecontroller.dispose();
    phonenumbercontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(backgroundColor: Colors.white,),
        backgroundColor: Colors.white,
        body: Center(
          child: Container(
            margin: EdgeInsets.fromLTRB(25, 0, 25, 25),
            child: Center(
              child: Form(
                key: formKey,
                child: Column(
                  children: [

                    Text("SignUp", style: TextStyle(fontSize: 50),
                        textAlign: TextAlign.center),
                    SizedBox(height: 20,),

                    TextFormField(
                      style: TextStyle(fontSize: 20),
                      cursorColor: Colors.black,
                      keyboardType: TextInputType.name,
                      controller: firstnamecontroller,
                      validator: (String? value) {
                        if (0 == value!.length)
                          return " Enter Your First Name ";
                        else
                          return null;
                      },
                      decoration: InputDecoration(
                        // floatingLabelStyle: TextStyle(color:focusNode.hasFocus? Colors.blue:Colors.grey[600]),
                        //labelStyle: TextStyle(fontSize: 20, color: Colors.green),
                        labelText: "First Name",
                        labelStyle: TextStyle(fontSize: 20),
                        // fillColor: Colors.grey[200],
                        //focusColor: Colors.grey,
                        //  focusedBorder: OutlineInputBorder(
                        //  borderRadius: BorderRadius.circular(50),
                        //  borderSide: BorderSide(color: Colors.blue)),


                        border: OutlineInputBorder(
                            borderSide: BorderSide(width: 3, color: Colors
                                .black),
                            borderRadius: BorderRadius.circular(50)),

                        prefixIcon: IconButton(
                          color: Colors.black,
                          icon: Icon(Icons.person),
                          onPressed: () {},
                          // filled: true,

                        ),
                      ),
                    ),
                    SizedBox(height: 12,),

                    TextFormField(
                      style: TextStyle(fontSize: 20),
                      cursorColor: Colors.black,
                      keyboardType: TextInputType.name,
                      controller: lastnamecontroller,
                      validator: (String? value) {
                        if (0 == value!.length)
                          return " Enter Your Last Name ";
                        else
                          return null;
                      },
                      decoration: InputDecoration(
                        // floatingLabelStyle: TextStyle(color:focusNode.hasFocus? Colors.blue:Colors.grey[600]),
                        //labelStyle: TextStyle(fontSize: 20, color: Colors.green),
                        labelText: "Last Name",
                        labelStyle: TextStyle(fontSize: 20),
                        // fillColor: Colors.grey[200],
                        //focusColor: Colors.grey,
                        //  focusedBorder: OutlineInputBorder(
                        //  borderRadius: BorderRadius.circular(50),
                        //  borderSide: BorderSide(color: Colors.blue)),


                        border: OutlineInputBorder(
                            borderSide: BorderSide(width: 3, color: Colors
                                .black),
                            borderRadius: BorderRadius.circular(50)),

                        prefixIcon: IconButton(
                          color: Colors.black,
                          icon: Icon(Icons.person),
                          onPressed: () {},
                          // filled: true,

                        ),
                      ),
                    ),
                    SizedBox(height: 12,),

                    TextFormField(
                      style: TextStyle(fontSize: 20),
                      cursorColor: Colors.black,
                      keyboardType: TextInputType.number,
                      controller: phonenumbercontroller,
                      validator: (String? value) {
                        if (0 == value!.length)
                          return " Enter Your Phone Number ";
                        else
                          return null;
                      },
                      decoration: InputDecoration(
                        // floatingLabelStyle: TextStyle(color:focusNode.hasFocus? Colors.blue:Colors.grey[600]),
                        //labelStyle: TextStyle(fontSize: 20, color: Colors.green),
                        labelText: "Phone Number",
                        labelStyle: TextStyle(fontSize: 20),
                        // fillColor: Colors.grey[200],
                        //focusColor: Colors.grey,
                        //  focusedBorder: OutlineInputBorder(
                        //  borderRadius: BorderRadius.circular(50),
                        //  borderSide: BorderSide(color: Colors.blue)),


                        border: OutlineInputBorder(
                            borderSide: BorderSide(width: 3, color: Colors
                                .black),
                            borderRadius: BorderRadius.circular(50)),

                        prefixIcon: IconButton(
                          color: Colors.black,
                          icon: Icon(Icons.phone),
                          onPressed: () {},
                          // filled: true,

                        ),
                      ),
                    ),
                    SizedBox(height: 20,),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [Container(
                          height: 60,
                          width: 163,
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                //minimumSize: const Size.fromHeight(60),
                                  backgroundColor: Colors.blue[100],
                                  shape: RoundedRectangleBorder( //to set border radius to button
                                      borderRadius: BorderRadius.circular(50)
                                  )),
                              onPressed: () {},
                              child: Text("Previous", style: TextStyle(
                                  color: Colors.grey[700], fontSize: 25),)),
                        ),
                          SizedBox(width: 8,),
                          Container(
                            height: 60,
                            width: 163,
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(

                                  // minimumSize: const Size.fromHeight(60),
                                    backgroundColor: Color(0xFF0F52BA),
                                    shape: RoundedRectangleBorder( //to set border radius to button
                                        borderRadius: BorderRadius.circular(50)
                                    )),
                                onPressed: () {
                                  if (formKey.currentState!.validate())
                                    Navigator.pushNamed(
                                        context,
                                        '/customersignup2',
                                        arguments: {
                                          'firstname': firstnamecontroller.text,
                                          'lastname': lastnamecontroller.text,
                                          'phonenumber': phonenumbercontroller
                                              .text,
                                        });
                                  //Navigator.pushReplacement(
                                  //context, MaterialPageRoute(builder: (context) =>
                                  //  Home()));
                                },
                                child: Text("Next", style: TextStyle(
                                    color: Colors.white, fontSize: 25),)),
                          ),

                        ]
                    ),
                    SizedBox(height: 10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Already have an account?",
                          style: TextStyle(fontSize: 15),),
                        SizedBox(
                          width: 5,
                        ),
                        GestureDetector(
                            onTap: () {
                              Navigator.pushNamedAndRemoveUntil(context,
                                  "/customerlogin", (r) => false);
                            },
                            child: Text(
                              "Login",
                              style: TextStyle(
                                  fontSize: 15,
                                  color: Color(0xFF0F52BA),
                                  fontWeight: FontWeight.bold),
                            ))
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        )
    );
  }
}