import 'package:flutter/material.dart';

import '../../features/toast.dart';
import 'customerlogin.dart';


class CustomerHome extends StatefulWidget{
  @override
  HomeView createState() {
    return  HomeView();
  }
}
class HomeView extends State<CustomerHome>{
  Map? data;
  @override
  Widget build(BuildContext context) {
    data= ModalRoute.of(context)?.settings.arguments as Map?;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        actions: [
          ProfileIcon(data),
        ],
      ),
    );
  }
}

class ProfileIcon extends StatelessWidget {
  Map? data;
  ProfileIcon(Map? data){
    this.data=data;
  }

  @override
  Widget build(BuildContext context) {
    //print(data?['email']);
    return PopupMenuButton<String>(
      color: Colors.grey[200],
      icon: CircleAvatar(
        backgroundImage: AssetImage("assets/profileicon.jpg"),
      ),
      offset: Offset(0, 50),

      onSelected: (String result) {
        if (result=='Logout')
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => CustomerLogin()));
          showToastMsg(message: "Successfully Logout");
        },

      itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
        PopupMenuItem<String>(
          value: 'Logout',
          child: Text('Logout'),
        ),
      ],
    );
  }
}
