import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class UserImagePicker extends StatefulWidget {
  const UserImagePicker({
    super.key,
    required this.onPickImage,
  });

  @override
  State<UserImagePicker> createState() => _UserImagePickerState();
  // Declare a function onPickImage which takes a File argument
  final void Function(File pickedImage) onPickImage;
}

class _UserImagePickerState extends State<UserImagePicker> {
  // Declare a variable to store the picked image file
  File? _pickedImageFile;

  // Create a private function _pickImage to pick an image from the camera
  void _pickImage() async {
    // Use ImagePicker to pick an image from the camera
    final pickedImage = await ImagePicker().pickImage(
      source: ImageSource.camera,
      imageQuality: 50,
      maxWidth: 150,
    );

    // Check if an image was picked
    if (pickedImage == null) {
      return;
    }

    // Set the picked image file and update the state
    setState(() {
      _pickedImageFile = File(pickedImage.path);
    });

    // Call the onPickImage function provided by the parent widget and pass the picked image file
    widget.onPickImage(_pickedImageFile!);
  }

  @override
  Widget build(BuildContext context) {
    // Return a Column widget with children
    return Column(
      children: [
        // Display a CircleAvatar widget for showing the user's image
        CircleAvatar(
          radius: 40,
          backgroundColor: Colors.grey,
          foregroundImage:
              _pickedImageFile != null ? FileImage(_pickedImageFile!) : null,
        ),
        // Display a TextButton with an icon and label to trigger image picking
        TextButton.icon(
          onPressed: _pickImage,
          icon: const Icon(Icons.image),
          label: Text(
            'Add Image',
            style: TextStyle(
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
        )
      ],
    );
  }
}
