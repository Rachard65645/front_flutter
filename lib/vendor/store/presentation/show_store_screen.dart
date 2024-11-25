import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gas/orders/business_logique/bloc/orders_bloc.dart';
import 'package:gas/service_locator.dart';
import 'package:gas/vendor/store/business_logique/bloc/store_bloc.dart';

@RoutePage()
class ShowStoreScreen extends StatefulWidget {
  const ShowStoreScreen({super.key});

  @override
  State<ShowStoreScreen> createState() => _ShowStoreScreenState();
}

class _ShowStoreScreenState extends State<ShowStoreScreen> {
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
      backgroundColor: Colors.white,
      body: BlocBuilder<StoreBloc, StoreState>(
        builder: (context, state) {
          if (state is Storeloading) {
            return const Center(
              child: CircularProgressIndicator(color: Colors.orange),
            );
          }

          if (state is GetStoreByIdSuccess) {
            return CustomScrollView(
              slivers: [
                SliverAppBar(
                  expandedHeight: 200.0,
                  pinned: true,
                  backgroundColor: Colors.orange,
                  flexibleSpace: FlexibleSpaceBar(
                    title: Text(
                      state.store?.name ?? '',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    centerTitle: true,
                    background: Stack(
                      fit: StackFit.expand,
                      children: [
                        Image.network(
                          'http://$IpGlobal:4000/api/${state.store?.logo}',
                          fit: BoxFit.cover,
                        ),
                        Container(
                          color: Colors.black.withOpacity(0.3),
                        ),
                      ],
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "About ${state.store?.name ?? ''}",
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Container(
                              height: 20,
                              width: 40,
                              decoration: BoxDecoration(
                                color: state.store!.statusStore == "close"
                                    ? Colors.red
                                    : Color.fromARGB(82, 76, 175, 79),
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(5)),
                              ),
                              child: Center(
                                child: Text(
                                  state.store!.statusStore,
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Text(
                          state.store?.aboutStore ?? 'No description available',
                          style: const TextStyle(fontSize: 14),
                        ),
                        const SizedBox(height: 20),
                        state.store?.stocks.isNotEmpty ?? false
                            ? GridView.builder(
                                physics: const NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                padding: const EdgeInsets.all(10),
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  crossAxisSpacing: 10,
                                  mainAxisSpacing: 10,
                                ),
                                itemCount: state.store!.stocks.length,
                                itemBuilder: (context, index) {
                                  final stock = state.store!.stocks[index];
                                  return Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      image: DecorationImage(
                                        image: NetworkImage(
                                          'http://$IpGlobal:4000/api/${stock.gasBottle.image}',
                                        ),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    child: Stack(
                                      alignment: AlignmentDirectional.center,
                                      children: [
                                        Positioned.fill(
                                          child: Container(
                                            decoration: BoxDecoration(
                                              color:
                                                  Colors.black.withOpacity(0.5),
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                          ),
                                        ),
                                        Column(
                                          children: [
                                            Text(
                                              stock.gasBottle.gasStation.name,
                                              textAlign: TextAlign.center,
                                              style: const TextStyle(
                                                fontSize: 16,
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            Text(
                                              stock.gasBottle.bottleCategory
                                                  .weight,
                                              textAlign: TextAlign.center,
                                              style: const TextStyle(
                                                fontSize: 16,
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 15),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    '${stock.price} FCFA',
                                                    textAlign: TextAlign.center,
                                                    style: const TextStyle(
                                                      fontSize: 16,
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                  const Icon(
                                                    Icons.check_box,
                                                    color: Colors.green,
                                                  ),
                                                ],
                                              ),
                                            ),
                                            const SizedBox(height: 40),
                                            OutlinedButton(
                                              onPressed: () {
                                                _showOrderDialog(
                                                  context,
                                                  stock.gasBottle.gasStation
                                                      .name,
                                                  stock.price,
                                                  stock.gasBottle.id,
                                                  'uhfuhfizuhfiuz',
                                                  state.store?.id ?? '',
                                                  'http://$IpGlobal:4000/api/${stock.gasBottle.image}',
                                                );
                                              },
                                              style: OutlinedButton.styleFrom(
                                                side: const BorderSide(
                                                    color: Color.fromARGB(
                                                        255, 255, 255, 255),
                                                    width: 0.5),
                                                backgroundColor:
                                                    Colors.transparent,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                ),
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 30,
                                                        vertical: 10),
                                              ),
                                              child: const Text(
                                                'Commander',
                                                style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  );
                                },
                              )
                            : const Center(
                                child: Text('No stocks available'),
                              ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          }

          if (state is StoreFailure) {
            return Center(
              child: Text(
                state.message,
                style: const TextStyle(color: Colors.red, fontSize: 16),
              ),
            );
          }

          return const SizedBox.shrink();
        },
      ),
    );
  }
}

void _showOrderDialog(
  BuildContext context,
  String gasStationName,
  int price,
  String gasBottle_id,
  String aggregator_method_id,
  String storeId,
  String imageUrl,
) {
  final TextEditingController quantityController = TextEditingController();
  String selectedPaymentMethod = 'Cash';
  final List<String> paymentMethods = ['Cash', 'Credit Card', 'Mobile Money'];

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return BlocConsumer<OrdersBloc, OrdersState>(
        listener: (context, state) {
          if (state is CreateOrdersSuccess) {
            Navigator.of(context).pop(); // Fermer le dialogue
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Commande effectuée avec succès !')),
            );
          } else if (state is OrdersFailure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.message)),
            );
          }
        },
        builder: (context, state) {
          return AlertDialog(
            title: const Text(
              'Confirmation de commande',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            content: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Voulez-vous commander une bouteille de gaz de $gasStationName pour $price FCFA par unité ?',
                    style: const TextStyle(fontSize: 16),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    height: 200,
                    width: double.infinity,
                    child: InteractiveViewer(
                      boundaryMargin: const EdgeInsets.all(8.0),
                      minScale: 0.8,
                      maxScale: 4.0,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.network(
                          imageUrl,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: quantityController,
                    keyboardType: TextInputType.number,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    decoration: const InputDecoration(
                      labelText: 'Quantité',
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.shopping_cart),
                    ),
                  ),
                  const SizedBox(height: 16),
                  DropdownButtonFormField<String>(
                    value: selectedPaymentMethod,
                    onChanged: (String? value) {
                      if (value != null) {
                        selectedPaymentMethod = value;
                      }
                    },
                    decoration: const InputDecoration(
                      labelText: 'Moyen de paiement',
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.payment),
                    ),
                    items: paymentMethods.map((String method) {
                      return DropdownMenuItem<String>(
                        value: method,
                        child: Text(method),
                      );
                    }).toList(),
                  ),
                ],
              ),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text(
                  'Annuler',
                  style: TextStyle(color: Colors.red),
                ),
              ),
              TextButton(
                onPressed: () {
                  final enteredQuantity = int.tryParse(quantityController.text);
                  if (enteredQuantity == null || enteredQuantity <= 0) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                          content:
                              Text('Veuillez entrer une quantité valide.')),
                    );
                    return;
                  }

                  // Déclenchement de l'événement pour créer une commande
                  context.read<OrdersBloc>().add(CreateOrderEvent(
                        storeId: storeId,
                        gasBottle_id: gasBottle_id,
                        quantity: enteredQuantity,
                        aggregator_method_id: aggregator_method_id,
                      ));
                },
                child: const Text(
                  'Commander',
                  style: TextStyle(color: Colors.green),
                ),
              ),
            ],
          );
        },
      );
    },
  );
}
