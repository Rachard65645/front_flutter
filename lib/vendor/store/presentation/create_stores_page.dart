import 'dart:io';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:gas/service_locator.dart';
import 'package:gas/vendor/store/business_logique/bloc/store_bloc.dart';
import 'package:image_picker/image_picker.dart';

@RoutePage()
class CreateStoresPage extends StatefulWidget {
  const CreateStoresPage({super.key});

  @override
  State<CreateStoresPage> createState() => _CreateStoresPageState();
}

class _CreateStoresPageState extends State<CreateStoresPage> {
  late TextEditingController nameController;
  late TextEditingController addressController;
  late TextEditingController pseudoController;
  late TextEditingController aboutStoreController;
  late TextEditingController cityController;
  late TextEditingController statusStoreController;
  final _formKey = GlobalKey<FormState>();
  XFile? logo; // Variable pour stocker le logo

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController();
    addressController = TextEditingController();
    pseudoController = TextEditingController();
    aboutStoreController = TextEditingController();
    cityController = TextEditingController();
    statusStoreController = TextEditingController();
  }

  @override
  void dispose() {
    nameController.dispose();
    addressController.dispose();
    pseudoController.dispose();
    aboutStoreController.dispose();
    cityController.dispose();
    statusStoreController.dispose();
    super.dispose();
  }

  Future<void> _pickLogo() async {
    final ImagePicker _picker = ImagePicker();
    try {
      final pickedImage = await _picker.pickImage(source: ImageSource.gallery);
      if (pickedImage != null) {
        final extension = pickedImage.path.split('.').last;
        if (!['png', 'jpg', 'jpeg', 'gif'].contains(extension)) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
                content: Text(
                    'Le fichier sélectionné n\'est pas une image valide.')),
          );
          return;
        }
        setState(() => logo = pickedImage); // Mise à jour de l'état
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Erreur lors de la sélection de l\'image : $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<StoreBloc, StoreState>(
        listener: (context, state) {
          if (state is CreateStoreSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Magasin créé avec succès !')),
            );
          } else if (state is StoreFailure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Erreur : ${state.message}')),
            );
          }
        },
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.all(40),
            child: ListView(
              children: [
                const Text(
                  'Create Store',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 20),
                // Affichage du logo
                logo != null
                    ? Image.file(File(logo!.path), height: 100)
                    : const Text('No logo selected',
                        style: TextStyle(color: Colors.grey)),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _pickLogo,
                  child: const Text('Select Logo'),
                ),
                const SizedBox(height: 20),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      _buildTextField('Name', nameController),
                      const SizedBox(height: 20),
                      _buildTextField('Pseudo', pseudoController),
                      const SizedBox(height: 20),
                      _buildTextField('City', cityController),
                      const SizedBox(height: 20),
                      _buildTextField('Address', addressController),
                      const SizedBox(height: 30),
                      _buildTextField('status', statusStoreController),
                      const SizedBox(height: 30),
                      _buildTextField('About', aboutStoreController),
                      const SizedBox(height: 30),
                      ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            getIt.get<StoreBloc>().add(CreateStoreEvent(
                                  name: nameController.text,
                                  pseudo: pseudoController.text,
                                  aboutStore: aboutStoreController.text,
                                  city: cityController.text,
                                  address: addressController.text,
                                  logo: logo?.name ?? '',
                                  statusStore: statusStoreController.text,
                                ));
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              const Color.fromARGB(206, 255, 98, 0),
                          minimumSize: const Size(750, 40),
                        ),
                        child: state is Storeloading
                            ? const CircularProgressIndicator(
                                color: Colors.white)
                            : const Text(
                                'Add',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildTextField(String label, TextEditingController controller) {
    return TextFormField(
      controller: controller,
      validator:
          FormBuilderValidators.compose([FormBuilderValidators.required()]),
      decoration: InputDecoration(
        labelText: label,
        hintText: label,
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(5)),
        ),
      ),
    );
  }
}
