import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

@RoutePage()
class CreateSellerScreen extends StatefulWidget {
  const CreateSellerScreen({super.key});

  @override
  State<CreateSellerScreen> createState() => _CreateSellerScreenState();
}

class _CreateSellerScreenState extends State<CreateSellerScreen> {
  File? _image;

  Future<XFile?> getImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(
      source: ImageSource.gallery,
    );
    return image;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Text(
            "Image du plat",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
          const SizedBox(
            height: 5,
          ),
          GestureDetector(
              onTap: () async {
                var image = await getImage();
                if (image != null) {
                  setState(() {
                    _image = File(image.path);
                  });
                } else {
                  if (mounted) {
                    print('error select image');
                  }
                }
              },
              child: const Icon(
                Icons.camera,
                size: 50,
              )),
         const  SizedBox(
            height: 50,
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.09,
            width: 100,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black),
              image: DecorationImage(
                image: _image != null
                    ? FileImage(_image!)
                    : const AssetImage('assets/images/d.png') as ImageProvider,
                fit: BoxFit.cover, // Apply BoxFit.cover here
              ),
            ),
          )
        ],
      ),
    );
  }
}












