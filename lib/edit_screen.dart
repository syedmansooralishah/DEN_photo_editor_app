import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image/image.dart' as img;
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

class EditScreen extends StatefulWidget {
  final String imagePath;

  EditScreen({required this.imagePath});

  @override
  _EditScreenState createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
  late img.Image _image;
  late File _imageFile;
  double _brightness = 1.0;
  double _contrast = 1.0;
  double _saturation = 1.0;

  @override
  void initState() {
    super.initState();
    _imageFile = File(widget.imagePath);
    _image = img.decodeImage(_imageFile.readAsBytesSync())!;
  }

  // Function to adjust the brightness, contrast, and saturation
  void _applyImageAdjustments() {
    setState(() {
      _image = img.adjustColor(_image, brightness: _brightness, contrast: _contrast, saturation: _saturation);
    });
  }

  // Function to save the edited image to the gallery
  Future<void> _saveImage() async {
    // Save logic here (e.g., using the image_compress library or directly saving the file to gallery)
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Image'),
        actions: [
          IconButton(
            icon: Icon(Icons.done),
            onPressed: () {
              _saveImage();
              Navigator.pop(context);
            },
          ),
        ],
      ),
      body: Column(
        children: [
          // Image Display
          Expanded(
            child: PhotoView(
              imageProvider: FileImage(_imageFile),
              minScale: PhotoViewComputedScale.contained,
              maxScale: PhotoViewComputedScale.covered,
            ),
          ),

          // Sliders for brightness, contrast, and saturation
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Text('Brightness'),
                Slider(
                  value: _brightness,
                  min: 0.0,
                  max: 2.0,
                  onChanged: (value) {
                    setState(() {
                      _brightness = value;
                    });
                    _applyImageAdjustments();
                  },
                ),
                Text('Contrast'),
                Slider(
                  value: _contrast,
                  min: 0.0,
                  max: 2.0,
                  onChanged: (value) {
                    setState(() {
                      _contrast = value;
                    });
                    _applyImageAdjustments();
                  },
                ),
                Text('Saturation'),
                Slider(
                  value: _saturation,
                  min: 0.0,
                  max: 2.0,
                  onChanged: (value) {
                    setState(() {
                      _saturation = value;
                    });
                    _applyImageAdjustments();
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
