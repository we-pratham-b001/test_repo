import 'dart:io';

import 'package:first/controller/count_controller.dart';
import 'package:first/services/api_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    Get.put(CountController());
    return GetMaterialApp(
      home: HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();

}

class _HomeScreenState extends State<HomeScreen> {
  File? image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey.shade800,
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: Text('Dio Image Upload')
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,

            children: [
              image != null ? Image.file(image!,height: 200,)
                  :Text('Image not Selected',style: TextStyle(fontSize: 18),),
              SizedBox(height: 20),
              image == null? ElevatedButton(onPressed: () async{
                  image = await ApiServices().pickImage();
                  print(image!.path);
                 setState(() {
                 });
                },
                child: Text('Pick Image'),
              ):
              ElevatedButton(onPressed: ()async{
                await ApiServices().uploadImage(
                    image:  image!,context: context
                );
              }, child: Text('Upload Image')),
            ],
          ),
        ),
      ),
    );
  }
}