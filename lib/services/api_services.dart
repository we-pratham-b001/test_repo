import 'dart:io';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
class ApiServices{
  Dio dio = Dio();

  Future<void> uploadImage({required File image,required BuildContext context}) async{
    print('Uploading');
    String fileName = image.path.split('/').last;

    FormData data = FormData.fromMap({
      'key':'56233de20c477232566170e3ca003fa2',
      'image': await MultipartFile.fromFile( image.path,filename:fileName),
      'name': 'image.jpg'
    });

    try {
      Response response = await dio.post('https://api.imgbb.com/1/upload', data: data);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Success ${response.statusCode}')));
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error uploading image'), backgroundColor: Colors.red),
      );
      print('Upload error: $e');
    }
  }

  Future<File?>pickImage() async {
    ImagePicker imagePicker = ImagePicker();
    XFile? image = await imagePicker.pickImage(source: ImageSource.gallery);
  if(image?.path != null){
    print(image!.path);
    return File(image.path);
  } else {
    return null;
  }

  }

  Future<void> download() async{
    Directory directory = await getApplicationDocumentsDirectory();
    await dio.download('https://sample-files.com/downloads/documents/txt/simple.txt', '${directory.path}downloaded.txt');
  }

}