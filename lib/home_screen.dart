import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'edit_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ImagePicker _picker = ImagePicker();
  XFile? _image;

  Future<void> _pickImage() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        _image = image;
      });
      // Navigate to edit screen with the selected image
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => EditScreen(imagePath: _image!.path),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Select an Image'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: _pickImage,
          child: Text('Pick an Image from Gallery'),
        ),
      ),
    );
  }
}
