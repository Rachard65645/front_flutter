import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:gas/router/app_router.gr.dart';
import 'package:gas/station/business_logique/bloc/station_bloc.dart';

@RoutePage()
class UpdateStationScreen extends StatefulWidget {
  const UpdateStationScreen({super.key});

  @override
  State<UpdateStationScreen> createState() => _UpdateStationScreenState();
}

class _UpdateStationScreenState extends State<UpdateStationScreen> {
  late TextEditingController nameController;
  final _formkey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController();
  }

  @override
  void dispose() {
    nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create stations'),
        centerTitle: true,
      ),
      body: BlocConsumer<StationBloc, StationState>(
        listener: (context, state) {
          if (state is CreateStationSuccess) {
            context.router.push(const GetStationsRoute());
          }

          if (state is StationFailure) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(state.message??'')));
          }
        },
        builder: (context, state) {
          return ListView(
            children: [
              Form(
                  key: _formkey,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: nameController,
                        validator: FormBuilderValidators.compose([
                          FormBuilderValidators.required(),
                        ]),
                        decoration: const InputDecoration(
                            label: Row(
                              children: [Text('name')],
                            ),
                            hintText: 'name',
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5)))),
                      ),
                      ElevatedButton(
                          onPressed: () {
                            if (state is StationLoading) {
                              const CupertinoActivityIndicator();
                            }

                            if (_formkey.currentState!.validate()) {
                              context.read<StationBloc>().add(
                                    CreateStationEvent(
                                      name: nameController.text,
                                    ),
                                  );
                            }
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.green,
                              minimumSize: const Size(750, 40)),
                          child: const Text(
                            'Update',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          )),
                    ],
                  ))
            ],
          );
        },
      ),
    );
  }
}
