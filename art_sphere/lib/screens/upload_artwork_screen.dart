import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

class UploadArtworkScreen extends StatefulWidget {
  @override
  _UploadArtworkScreenState createState() => _UploadArtworkScreenState();
}

class _UploadArtworkScreenState extends State<UploadArtworkScreen> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController tagsController = TextEditingController();
  String? selectedCategory;
  bool enableDownloads = false;
  bool sellArtwork = false;
  double? price;
  XFile? imageFile;

  final List<String> categories = [
    'Painting',
    'Drawing',
    'Sculpture',
    'Photography'
  ];

  Future<void> pickImage() async {
    final ImagePicker picker = ImagePicker();
    imageFile = await picker.pickImage(source: ImageSource.gallery);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Upload Artwork',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.deepPurple[900],
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.white, Colors.white],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                GestureDetector(
                  onTap: pickImage,
                  child: Container(
                    height: 200,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: imageFile == null
                        ? Center(child: Text('Tap to select an image'))
                        : Image.file(
                            File(imageFile!.path),
                            fit: BoxFit.cover,
                          ),
                  ),
                ),
                SizedBox(height: 20),
                TextField(
                  controller: titleController,
                  decoration: InputDecoration(labelText: 'Title'),
                ),
                TextField(
                  controller: descriptionController,
                  decoration: InputDecoration(labelText: 'Description'),
                ),
                TextField(
                  controller: tagsController,
                  decoration:
                      InputDecoration(labelText: 'Tags (comma separated)'),
                ),
                DropdownButtonFormField<String>(
                  value: selectedCategory,
                  hint: Text('Select Category'),
                  items: categories.map((String category) {
                    return DropdownMenuItem<String>(
                      value: category,
                      child: Text(category),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      selectedCategory = value;
                    });
                  },
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Visibility:'),
                    Row(
                      children: [
                        Text('Public'),
                        Radio(
                          value: true,
                          groupValue: selectedCategory != null,
                          onChanged: (value) {
                            setState(() {
                              selectedCategory = 'Public';
                            });
                          },
                        ),
                        Text('Private'),
                        Radio(
                          value: false,
                          groupValue: selectedCategory != null,
                          onChanged: (value) {
                            setState(() {
                              selectedCategory = 'Private';
                            });
                          },
                        ),
                      ],
                    ),
                  ],
                ),
                SwitchListTile(
                  title: Text('Enable Downloads'),
                  value: enableDownloads,
                  onChanged: (value) {
                    setState(() {
                      enableDownloads = value;
                    });
                  },
                ),
                SwitchListTile(
                  title: Text('Sell This Artwork'),
                  value: sellArtwork,
                  onChanged: (value) {
                    setState(() {
                      sellArtwork = value;
                    });
                  },
                ),
                if (sellArtwork)
                  TextField(
                    decoration: InputDecoration(labelText: 'Price'),
                    keyboardType: TextInputType.number,
                    onChanged: (value) {
                      price = double.tryParse(value);
                    },
                  ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    // Handle upload logic here
                    // You can save the artwork details to the database here
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepPurple[900], // Set button color
                  ),
                  child: Text(
                    'Upload Artwork',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
