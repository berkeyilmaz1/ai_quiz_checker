import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: () {}, child: Text('Soru Ekle', style: TextStyle(color: Colors.buttonTextColor)));
  }
}
class Colors {
  static Color buttonTextColor = const Color.fromRGBO(20, 32, 55, 100);}

