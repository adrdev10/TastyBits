import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';



List<CameraDescription> cameras = [
  CameraDescription(lensDirection: CameraLensDirection.front)
];
class CameraApp extends StatefulWidget {
  @override
  _CameraAppState createState() => _CameraAppState();
}


class _CameraAppState extends State<CameraApp> with WidgetsBindingObserver{
  CameraController controller;
  String imagePath;
  String videoPath;
  bool _isReady = false;
  @override
  void initState() {
    super.initState();
    setupCameras();
    WidgetsBinding.instance.addObserver(this);   
  }

  Future<void> setupCameras() async {
    try {
      cameras = await availableCameras();
      controller = CameraController(cameras[0], ResolutionPreset.medium);
      await controller.initialize();
    }on CameraException catch(e){
      print(e);
    }
    
      if (!mounted) {
        return;
      }
      setState(() {
        _isReady = true;
      });
  }

   String timestamp() => DateTime.now().millisecondsSinceEpoch.toString();

    Future<String> takePicture() async {
    if (!controller.value.isInitialized) {
      
      return null;
    }
      final Directory extDir = await getApplicationDocumentsDirectory();
        final String dirPath = '${extDir.path}/Pictures/flutter_test';
        await Directory(dirPath).create(recursive: true);
        final String filePath = '$dirPath/${timestamp()}.jpg';
    
        if (controller.value.isTakingPicture) {
          // A capture is already pending, do nothing.
          return null;
        }
    
        try {
          await controller.takePicture(filePath);
        } on CameraException catch (e) {
          return null;
        }
        return filePath;
      }
      
    
      void logError(String code, String message) =>
        print('Error: $code\nError Message: $message');
    
    
      @override
      void dispose() {
        controller?.dispose();
        super.dispose();
        WidgetsBinding.instance.removeObserver(this);
      }
    
      @override
      Widget build(BuildContext context) {
        if (!_isReady) {
          return Container();
        }
        return Column(
          children: <Widget>[
              AspectRatio(
            aspectRatio: 
            controller.value.aspectRatio -.13,
            child: CameraPreview(controller)),
            Container(
              height: 100,
              width: double.infinity,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  GestureDetector(
                    onTap: (){
                      print('pressed');
                      final filepath = takePicture();
                      filepath.then((value) => print(value));
                    },
                    child: Icon(Icons.camera, color: Colors.white,size: 39,),
                  ),
                  GestureDetector(
                    onTap: (){
                      print('pressed');
                      final filepath = takePicture();
                      filepath.then((value) => print(value));
                    },
                    child: Icon(Icons.camera, color: Colors.white,size: 39,),
                  ),
                  GestureDetector(
                    onTap: (){
                      print('pressed');
                      final filepath = takePicture();
                      filepath.then((value) => print(value));
                    },
                    child: Icon(Icons.camera, color: Colors.white,size: 39,),
                  ),
                ],
              ),
            )
          ],
        );
      }
}