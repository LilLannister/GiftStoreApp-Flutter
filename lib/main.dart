import 'package:flutter/material.dart';
import 'screens/home_screen.dart';

void main(){
  runApp(const GiftStoreApp());
}

class GiftStoreApp extends StatelessWidget {
  const GiftStoreApp({super.key});

  @override 
  Widget build(BuildContext context){
    return MaterialApp(
      title: 'Gift Store',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}