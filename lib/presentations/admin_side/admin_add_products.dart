import 'dart:developer';
import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:plant_app/domain/product_model.dart';
import 'package:plant_app/presentations/admin_side/admin_products.dart';
import 'package:plant_app/presentations/user_side/screens/widgets/text_field.dart';

class AddProducts extends StatefulWidget {
  const AddProducts({super.key});

  @override
  State<AddProducts> createState() => _AddProductsState();
}

class _AddProductsState extends State<AddProducts> {
  List<String> dropdownItems = ['Plants', 'Flowers', 'Miniplants'];
  String? selecteditem = 'Plants';
  final plantController = TextEditingController();
  final priceController = TextEditingController();
  final aboutController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  XFile? imageFile;

  Future pickImageFile() async {
    final imagePicker = ImagePicker();
    final image = await imagePicker.pickImage(source: ImageSource.gallery);
    if (image == null) return;
    setState(() {
      imageFile = image;
    });
  }

  Future<String> uploadImage() async {
    final file = File(imageFile!.path);
    final path = 'file/${imageFile!.name}';

    final ref = FirebaseStorage.instance.ref().child(path);
    final uploadTask = ref.putFile(file);

    final snapshot = await uploadTask.whenComplete(() {});
    final urlLink = await snapshot.ref.getDownloadURL();

    return urlLink;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Form(
        key: formKey,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 350, top: 15),
              child: IconButton(
                  iconSize: 30,
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const AdminProducts()));
                  },
                  icon: const Icon(Icons.arrow_back)),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 20, right: 20, top: 30, bottom: 20),
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.grey,
                        image: (imageFile == null)
                            ? null
                            : DecorationImage(
                                image: FileImage(File(imageFile!.path)))),
                    height: 300,
                    width: 400,
                  ),
                  CircleAvatar(
                    radius: 25,
                    backgroundColor: Colors.black,
                    child: IconButton(
                        onPressed: () {
                          pickImageFile();
                        },
                        icon: const Icon(
                          Icons.add,
                          color: Colors.white,
                          size: 30,
                        )),
                  )
                ],
              ),
            ),
            DropdownButton<String>(
              value: selecteditem,
              items: dropdownItems
                  .map((item) =>
                      DropdownMenuItem<String>(value: item, child: Text(item)))
                  .toList(),
              onChanged: (item) {
                setState(() {
                  selecteditem = item;
                });
              },
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: textFieldWidget(
                  validator: (value) {
                    if (value != null && value.length < 4) {
                      return 'Enter your name';
                    } else {
                      return null;
                    }
                  },
                  controller: plantController,
                  hintText: "Enter plant name",
                  Icons: Icons.shopping_cart),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: textFieldWidget(
                controller: aboutController,
                hintText: 'About',
                Icons: Icons.info,
                maxline: 5,
                validator: (value) {
                  if (value != null && value.length < 10) {
                    return 'Enter about details';
                  } else {
                    return null;
                  }
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: textFieldWidget(
                keyboardType: TextInputType.number,
                hintText: "Price",
                Icons: Icons.price_change,
                controller: priceController,
                validator: (value) {
                  if (value != null && value.length < 2) {
                    return 'Enter price';
                  } else {
                    return null;
                  }
                },
              ),
            ),
            ElevatedButton(
                onPressed: () async {
                  if (!formKey.currentState!.validate()) {
                    return;
                  }

                  if (imageFile == null) return;

                  final uploadedImage = await uploadImage();
                  log(uploadedImage);
                  addProduct(
                    category: selecteditem!,
                    name: plantController.text.trim(),
                    about: aboutController.text.trim(),
                    price: int.parse(priceController.text.trim()),
                    image: uploadedImage,
                  );
                  Navigator.pop(context);
                },
                child: const Text("Add Product"))
          ],
        ),
      ),
    ));
  }
}
