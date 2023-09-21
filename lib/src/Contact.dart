import 'package:demo_views/models/PersonalContact.dart';
import 'package:flutter/material.dart';

class Contact extends StatelessWidget {
  const Contact({super.key, required this.personalContact});
  static const TextStyle optionStyle = TextStyle(fontSize: 30, fontWeight: FontWeight.w500);
  static const TextStyle option2Style = TextStyle(fontSize: 18, fontWeight: FontWeight.w500);
  static const TextStyle option3Style = TextStyle(fontSize: 18, fontWeight: FontWeight.w400);
  final PersonalContact personalContact;

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 10,),
            Text(personalContact.name, style: optionStyle),
            const SizedBox(height: 4,),
            const ClipOval(
              child: Icon(Icons.person,size: 50,),
            ),
            const SizedBox(height: 4,),
            const Text("Phone Number", style: option2Style),
            Text(personalContact.number.toString(), style: option3Style),
            const SizedBox(height: 4,),
            const Text("Email", style: option2Style),
            Text(personalContact.email, style: option3Style),
          ],
        ),
      ),
    ); 
  }
  
}