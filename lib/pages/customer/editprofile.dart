import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fharmony/pages/customer/app/modules/profile/views/profile_view.dart';
import 'package:fharmony/pages/customer/utils/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:image_picker/image_picker.dart';
import '../../features/toast.dart';
import '../../features/userdetailsupdate.dart';
import 'app/components/custom_button.dart';
import 'app/components/custom_icon_button.dart';
import 'app/routes/app_pages.dart';

class EditProfile extends StatefulWidget{

  //final  String docId;
 // const EditProfile({Key? key, required this.docId}) : super(key: key);
  @override
  UserProfile  createState(){
    return UserProfile();
  }

}

class UserProfile extends State<EditProfile> {
  final Update _update = Update();
  bool isUpdate = false;
  late String ocId;
  TextEditingController firstnamecontroller = TextEditingController();
  TextEditingController lastnamecontroller = TextEditingController();
  TextEditingController phonenumbercontroller = TextEditingController();
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  TextEditingController confirmpasswordcontroller = TextEditingController();
//  final FirebaseAuthService _auth = FirebaseAuthService();
  final formKey = GlobalKey<FormState>();
  bool notVisible = true;
  File? _imageFile;
  final ImagePicker _picker = ImagePicker();

  // Function to pick image from gallery or camera
  Future<void> _pickImage() async {
    final XFile? pickedFile = await _picker.pickImage(
        source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _imageFile = File(pickedFile.path);
      });
    }
  }
  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  String firstname = "";
  String lastname = "";
  String phonenumber = "";
  String email = "";
  String password = "";


  void initState() {
    super.initState();
    //ocId = widget.docId;
    final arguments = Get.arguments;
    print(arguments);
    ocId = arguments['uid'];
    fetchData();
    //  firstnamecontroller.text= firstname.isEmpty ? 'Loading...':firstname;
    // lastnamecontroller.text= lastname.isEmpty ? 'Loading...':lastname;
    //phonenumbercontroller.text= phonenumber.isEmpty ? 'Loading...':phonenumber;
    //  emailcontroller.text= email.isEmpty ? 'Loading...':email;
    // passwordcontroller.text= password.isEmpty ? 'Loading...':password;
  }
/*
  Future<void> _updateUserData() async {
    if (formKey.currentState!.validate()) {
      try {
        User? user = FirebaseAuth.instance.currentUser;

        if (user != null) {
          // Update email
          await user.updateEmail(emailcontroller.text);
          await user.reload();
          user = FirebaseAuth.instance.currentUser; // Refresh user
          // Update password (optional, if provided)
          if (passwordcontroller.text.isNotEmpty) {
            await user?.updatePassword(passwordcontroller.text);
          }
        }
        //widget.docId=emailcontroller.text;
         await FirebaseFirestore.instance.collection('Users')
            .doc(ocId)
            .set({
          'FirstName': firstnamecontroller.text,
          'LastName': lastnamecontroller.text,
          'PhoneNumber': phonenumbercontroller.text,
          'Email': emailcontroller.text,
          'Password': passwordcontroller.text
        },SetOptions(merge: true));
      //  await FirebaseFirestore.instance.collection('Users').doc(emailcontroller.text).set(ocId as Map<String, dynamic>);


        // Optionally delete the old document
       // await FirebaseFirestore.instance.collection('Users').doc(ocId).delete();
        ocId=emailcontroller.text;
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('User data updated successfully!')),
        );
      } catch (e) {
        print('Error updating user data: $e');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to update user data')),
        );
      }
    }
  }

  Future<void> updateimage()async {
    DocumentReference<Map<String, dynamic>> users = FirebaseFirestore
        .instance
        .collection('/Users')
        .doc(email);
    var myJSONObj = {'ProfileImage':_imageFile};
    users.set(myJSONObj)
        .then((value) => print("User with CustomID added"))
        .catchError((error) => print("Failed to add user: $error"));


  }
*/
  Future<void> fetchData() async {
    try {
      // Fetch a document from a Firestore collection
      DocumentSnapshot snapshot = await _firestore.collection('Users').doc(ocId).get();
      if (snapshot.exists) {
        setState(() {
          firstnamecontroller.text = snapshot['FirstName'];
          lastnamecontroller.text = snapshot['LastName'];
          phonenumbercontroller.text = snapshot['PhoneNumber'];
          emailcontroller.text = snapshot['Email'];
          passwordcontroller.text = snapshot['Password'];
          // Assuming 'name' is a field in the document
        });
      } else {
        setState(() {
          //_data = 'Document not found!';
        });
      }
    } catch (e) {
      setState(() {
        // _data = 'Error: $e';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
   // ImageProvider e=AssetImage('assets/images/default_profile.png');
    //documentId=data?['email'];
    final theme = context.theme;
    //DocumentSnapshot? docsnap;
    //data= ModalRoute.of(context)?.settings.arguments as Map?;
    // print(data);

    //  final snapshot=db.collection('Users').where('Email',isEqualTo:data?['email']).get();
    //final userdata=snapshot.
    //  print(snapshot.data!.docs[''] );
//print(dta);
    //  print(documentData);
    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomIconButton(
                onPressed: () =>  Get.offNamed(Routes.BASE,arguments: {'uid':ocId}),
                backgroundColor: theme.scaffoldBackgroundColor,
                borderColor: theme.dividerColor,
                icon: SvgPicture.asset(
                  Constants.backArrowIcon,
                  fit: BoxFit.none,
                  color: theme.appBarTheme.iconTheme?.color,
                ),
              ),
              Text(
                'Edit Profile',
                style: theme.textTheme.displaySmall,
              ),
      const Opacity(
        opacity: 0.0,
        child: CustomIconButton(onPressed: null, icon: Center()),)
            ],
          ),
        ),
      ),
      body: Container(
        margin: EdgeInsets.fromLTRB(25, 25, 25, 25),
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    // Circular Avatar
                    GestureDetector(
                      onTap: _pickImage, // When tapped, open image picker
                      child: CircleAvatar(
                        radius: 80,
                        backgroundColor: Colors.grey[300],
                        backgroundImage: _imageFile != null
                            ? FileImage(
                            _imageFile!) // Display selected image
                            : AssetImage('assets/images/default_profile.png') as ImageProvider, // Default image if none selected
                      ),
                    ),
                    // Camera icon at the top-right corner of the avatar
                    Positioned(
                      right: 0,
                      bottom: 0,
                      child: GestureDetector(
                        onTap: _pickImage,
                        // Trigger image picker when icon is tapped
                        child: CircleAvatar(
                          radius: 20,
                          backgroundColor: Colors.white,
                          child: Icon(
                            Icons.camera_alt,
                            size: 20,
                            color: Colors.teal,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20,),
                Container(
                    child: TextFormField(
                      controller: firstnamecontroller,
                      style: TextStyle(fontSize: 20),
                      cursorColor: Colors.black,
                      keyboardType: TextInputType.name,
                      validator: (String? value) {
                        if (0 == value!.length)
                          return " Enter Your First Name ";
                        else
                          return null;
                      },
                      decoration: InputDecoration(
                        fillColor: theme.cardColor,
                        // floatingLabelStyle: TextStyle(color:focusNode.hasFocus? Colors.blue:Colors.grey[600]),
                        //labelStyle: TextStyle(fontSize: 20, color: Colors.green),
                        labelText: "First Name",
                        labelStyle: theme.textTheme.displaySmall,
                        // fillColor: Colors.grey[200],
                        //focusColor: Colors.grey,
                        //  focusedBorder: OutlineInputBorder(
                        //  borderRadius: BorderRadius.circular(50),
                        //  borderSide: BorderSide(color: Colors.blue)),


                        border: OutlineInputBorder(
                            borderSide: BorderSide(
                                width: 3, color: Colors.black),
                            borderRadius: BorderRadius.circular(50)),

                        prefixIcon: IconButton(
                          color:  theme.appBarTheme.iconTheme?.color,
                          icon: Icon(Icons.person),
                          onPressed: () {},
                          // filled: true,

                        ),
                      ),
                    )),
                SizedBox(height: 12,),

                Container(
                  child: TextFormField(
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
                      fillColor: theme.cardColor,
                      labelText: "Last Name",
                      labelStyle: theme.textTheme.displaySmall,
                      border: OutlineInputBorder(
                          borderSide: BorderSide(
                              width: 3, color: Colors.black),
                          borderRadius: BorderRadius.circular(50)),

                      prefixIcon: IconButton(
                        color:  theme.appBarTheme.iconTheme?.color,
                        icon: Icon(Icons.person),
                        onPressed: () {},
                        // filled: true,

                      ),
                    ),
                  ),
                ),
                SizedBox(height: 12,),

                Container(
                  child: TextFormField(
                    style: TextStyle(fontSize: 20),
                    cursorColor: Colors.black,
                    keyboardType: TextInputType.number,
                    controller: phonenumbercontroller,
                    validator: (String? value) {
                      if (0 == value!.length)
                        return " Enter Your Phone Number ";
                      else {
                        if(!(10==value!.length))
                          return " Enter Valid Phone Number ";
                        else
                          return null;
                      }
                    },
                    decoration: InputDecoration(
                      fillColor: theme.cardColor,
                      labelText: "Phone Number",
                      labelStyle: theme.textTheme.displaySmall,
                      border: OutlineInputBorder(
                          borderSide: BorderSide(
                              width: 3, color: Colors.black),
                          borderRadius: BorderRadius.circular(50)),
                      prefixIcon: IconButton(
                        color:  theme.appBarTheme.iconTheme?.color,
                        icon: Icon(Icons.phone),
                        onPressed: () {},
                        // filled: true,

                      ),
                    ),
                  ),
                ),
                SizedBox(height: 12,),
                /*Container(
                  child: TextFormField(
                    style: TextStyle(fontSize: 20),
                    cursorColor: Colors.black,
                    keyboardType: TextInputType.name,
                    controller: emailcontroller,
                    validator: (String? value) {
                      RegExp emailRegex = RegExp(
                          r'^[a-zA-Z0-9]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$'
                      );


                      if (value!.isEmpty) {
                        return 'Enter Your Email';
                      } else {
                        if (!emailRegex.hasMatch(value!)) {
                          return 'Enter Valid Email';
                        } else {
                          return null;
                        }
                      }
                    },
                    decoration: InputDecoration(
                      labelText: "Email",
                      labelStyle: TextStyle(fontSize: 20),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(
                              width: 3, color: Colors.black),
                          borderRadius: BorderRadius.circular(50)),
                      prefixIcon: IconButton(
                        color: Colors.black,
                        icon: Icon(Icons.mail),
                        onPressed: () {},
                        // filled: true,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 12,),
                Container(
                  child: TextFormField(
                    style: TextStyle(fontSize: 20),
                    cursorColor: Colors.black,
                    obscureText: notVisible,
                    controller: passwordcontroller,
                    validator: (String? value) {
                      RegExp pwRegex =
                      RegExp(
                          r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[%!@#\$&*~]).{8,}$');
                      if (value!.isEmpty) {
                        return 'Enter Your Password';
                      } else {
                        if (!pwRegex.hasMatch(value!)) {
                          return 'Enter Valid Password';
                        } else {
                          return null;
                        }
                      }
                    },
                    decoration: InputDecoration(
                      // floatingLabelStyle: TextStyle(color:elabel? Colors.blue:Colors.red),
                      labelStyle: TextStyle(fontSize: 20),
                      labelText: "Password",
                      suffixIcon: IconButton(
                          color: Colors.black,
                          onPressed: () {
                            setState(() {
                              notVisible = !notVisible;
                            });
                          },
                          icon: notVisible
                              ? Icon(Icons.visibility_off)
                              : Icon(Icons.visibility)),
                      //fillColor: Colors.grey[200],
                      // focusedBorder: OutlineInputBorder(
                      //    borderRadius: BorderRadius.circular(50),
                      //   borderSide: BorderSide(color: Colors.blue)),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50)),
                      prefixIcon: IconButton(
                        color: Colors.black,
                        icon: Icon(Icons.security_rounded),
                        onPressed: () {},
                        //filled: true,

                      ),
                    ),
                  ),
                ),
                */

                SizedBox(height: 20,),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 0.w),
                  child: CustomButton(
                    icon: Icon(Icons.edit, color: Colors.white),
                    text: 'Edit Profile',
                    onPressed: () => callupdate(),
                    fontSize: 25.sp,
                    radius: 50.r,
                    verticalPadding: 10.h,
                    hasShadow: false,
                  ).animate().fade().slideY(
                    duration: 300.ms,
                    begin: 1,
                    curve: Curves.easeInSine,
                  ),
                ),
              ],
            ),
          ),

        ),
      ),
    );
  }
  void callupdate(){
    if(formKey.currentState!.validate())
    update();
  }
  void update() async {

    setState(() {
      isUpdate = true;
    });

    String firstname =firstnamecontroller.text;
    String lastname =lastnamecontroller.text;
    String phonenumber = phonenumbercontroller.text;
    String email = emailcontroller.text;
    String password = passwordcontroller.text;
    String e=email;
    Object? user = await _update.updateUserData(firstname,lastname,phonenumber,email,password,ocId);

    setState(() {
      isUpdate = false;
    });
    if (user != null) {
      showToastMsg(message: "User data is successfully Updated");
     // Get.back();
      Get.offNamed(Routes.BASE,arguments: {'uid':ocId});
     // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => ProfileView(docId: ocId,)));
      //Navigator.pop
      // Navigator.pushNamedAndRemoveUntil(context, "/home", (r) => false,arguments: {'email':email});
    } //else {
    //showToastMsg(message: "Some error happend");
    //}
  }

}



