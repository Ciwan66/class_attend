import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'face_recognition.dart';  // Import the face recognition logic

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Face Recognition Attendance',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final FaceRecognition _faceRecognition = FaceRecognition();

  // Load the model when the app starts
  @override
  void initState() {
    super.initState();
    _faceRecognition.loadModel();
  }

  // Pick an image from the gallery
  Future<void> _pickImage() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      String result = await _faceRecognition.recognizeFace(image);
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text(result),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text("OK"),
            )
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Face Recognition Attendance"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: _pickImage,
          child: Text("Pick Image for Face Recognition"),
        ),
      ),
    );
  }
}
