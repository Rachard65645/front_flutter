import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:gas/orders/business_logique/bloc/orders_bloc.dart';

@RoutePage()
class CreateOrdersPage extends StatefulWidget {
  const CreateOrdersPage({super.key});

  @override
  State<CreateOrdersPage> createState() => _CreateOrdersPageState();
}

class _CreateOrdersPageState extends State<CreateOrdersPage> {
  late TextEditingController quantityController;
  final _formkey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    quantityController = TextEditingController();
  }

  @override
  void dispose() {
    quantityController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<OrdersBloc, OrdersState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: ListView(
              children: [
                Container(
                  height: 300,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(2)),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset('assets/images/login_screen.png'),
                  ),
                ),
                Form(
                  key: _formkey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextFormField(
                        controller: quantityController,
                        validator: FormBuilderValidators.compose([
                          FormBuilderValidators.required(),
                        ]),
                        decoration: const InputDecoration(
                            label: Row(
                              children: [Text('Email')],
                            ),
                            hintText: 'email',
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5)))),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          if (_formkey.currentState!.validate()) {
                            context.read<OrdersBloc>().add(
                                  CreateOrderEvent(
                                    
                                    quantity: quantityController.hashCode, 
                                    storeId: '', 
                                    gasBottle_id: '', 
                                    aggregator_method_id: ''
                                      
                                      ),
                                );
                          }
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Color.fromARGB(206, 255, 98, 0),
                            minimumSize: const Size(750, 40)),
                        child: state is OrdersLoading
                            ? const CircularProgressIndicator(
                                color: Colors.white,
                              )
                            : const Text(
                                'Login',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                      ),
                      
                    ],
                  ),
                )
              ],
            ),
          );
          
        },
      ),
    );
  }
}
