import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gas/orders/business_logique/bloc/orders_bloc.dart';
import 'package:gas/service_locator.dart';
import 'package:gas/vendor/store/business_logique/bloc/store_bloc.dart';
import 'package:gas/vendor/store/presentation/payment_page.dart';

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
                    title: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 50,
                        ),
                        Text(
                          state.store?.name ?? '',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.location_on,
                              size: 16,
                            ),
                            SizedBox(
                              width: 8,
                            ),
                            Text(state.store?.city ?? '',
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                )),
                            SizedBox(
                              width: 8,
                            ),
                            Text(state.store?.address ?? '',
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ))
                          ],
                        )
                      ],
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
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Icon(
                                      Icons.phone,
                                      color: Colors.orange,
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      state.store?.seller.user.phone ?? '',
                                      style: const TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.email,
                                      color: Colors.orange,
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      state.store?.seller.user.email ?? '',
                                      style: const TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
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
                        Text(
                          'available stocks',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        state.store?.stocks.isNotEmpty ?? false
                            ? GridView.builder(
                                physics: const BouncingScrollPhysics(),
                                shrinkWrap: true,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 10),
                                gridDelegate:
                                    SliverGridDelegateWithMaxCrossAxisExtent(
                                  maxCrossAxisExtent:
                                      250, // La taille maximale d'un élément
                                  crossAxisSpacing: 10,
                                  mainAxisSpacing: 10,
                                  childAspectRatio:
                                      0.7, // Ajuste la proportion de l'élément (hauteur/largeur)
                                ),
                                itemCount: state.store!.stocks.length,
                                itemBuilder: (context, index) {
                                  final stock = state.store!.stocks[index];
                                  return GestureDetector(
                                    onTap: () {
                                      _showOrderDialog(
                                        context,
                                        stock.gasBottle.gasStation.name,
                                        stock.price,
                                        stock.gasBottle.id,
                                        'uhfuhfizuhfiuz',
                                        state.store?.id ?? '',
                                        'http://$IpGlobal:4000/api/${stock.gasBottle.image}',
                                      );
                                    },
                                    child: Card(
                                      elevation: 8,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      clipBehavior: Clip.antiAlias,
                                      child: Stack(
                                        fit: StackFit.expand,
                                        children: [
                                          // Image du produit
                                          Image.network(
                                            'http://$IpGlobal:4000/api/${stock.gasBottle.image}',
                                            fit: BoxFit.cover,
                                          ),
                                          // Effet d'ombrage
                                          Container(
                                            decoration: BoxDecoration(
                                              color:
                                                  Colors.black.withOpacity(0.5),
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                            ),
                                          ),
                                          // Contenu textuel et bouton
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Text(
                                                  stock.gasBottle.gasStation
                                                      .name,
                                                  style: const TextStyle(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Text(
                                                  stock.gasBottle.bottleCategory
                                                      .weight,
                                                  style: const TextStyle(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Text(
                                                  '${stock.price} FCFA',
                                                  style: const TextStyle(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: OutlinedButton(
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
                                                  style:
                                                      OutlinedButton.styleFrom(
                                                    side: const BorderSide(
                                                        color: Colors.white,
                                                        width: 1),
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                    ),
                                                    padding: const EdgeInsets
                                                        .symmetric(
                                                        horizontal: 25,
                                                        vertical: 10),
                                                    backgroundColor:
                                                        Colors.transparent,
                                                  ),
                                                  child: const Text(
                                                    'Acheter',
                                                    style: TextStyle(
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              const SizedBox(height: 10),
                                            ],
                                          ),
                                        ],
                                      ),
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
  final TextEditingController addressController = TextEditingController();
  final TextEditingController dateController = TextEditingController();
  String selectedPaymentMethod = 'Cash';
  bool isDelivery = false;
  final List<String> paymentMethods = ['Cash', 'Credit Card', 'Mobile Money'];

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return BlocConsumer<OrdersBloc, OrdersState>(
        listener: (context, state) {
          if (state is CreateOrdersSuccess) {
            Navigator.of(context).pop();
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Commande effectuée avec succès !')),
            );

            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    PaymentPage(paymentUrl: state.payment!.paymentUrl),
              ),
            );
          } else if (state is OrdersFailure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.message)),
            );
          }
        },
        builder: (context, state) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
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
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: InteractiveViewer(
                      boundaryMargin: const EdgeInsets.all(8.0),
                      minScale: 0.8,
                      maxScale: 4.0,
                      child: Image.network(
                        imageUrl,
                        fit: BoxFit.contain,
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
                  const SizedBox(height: 16),
                  CheckboxListTile(
                    title: const Text('Livraison à domicile'),
                    value: isDelivery,
                    onChanged: (bool? value) {
                      isDelivery = value ?? false;
                      (context as Element).markNeedsBuild(); // Rafraîchit l'UI
                    },
                    controlAffinity: ListTileControlAffinity.leading,
                  ),
                  if (isDelivery) ...[
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: addressController,
                      decoration: const InputDecoration(
                        labelText: 'Adresse de livraison',
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.location_on),
                      ),
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: dateController,
                      readOnly: true,
                      onTap: () async {
                        DateTime? pickedDate = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(2000),
                          lastDate: DateTime(2101),
                        );
                        if (pickedDate != null) {
                          dateController.text =
                              "${pickedDate.day}/${pickedDate.month}/${pickedDate.year}";
                        }
                      },
                      decoration: const InputDecoration(
                        labelText: 'Date de livraison',
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.calendar_today),
                      ),
                    ),
                  ],
                ],
              ),
            ),
            actions: [
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text(
                  'Annuler',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              ElevatedButton(
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

                  if (isDelivery &&
                      (addressController.text.isEmpty ||
                          dateController.text.isEmpty)) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                          content: Text(
                              'Veuillez entrer l\'adresse et la date de livraison.')),
                    );
                    return;
                  }

                  context.read<OrdersBloc>().add(CreateOrderEvent(
                        storeId: storeId,
                        gasBottle_id: gasBottle_id,
                        quantity: enteredQuantity,
                        aggregator_method_id: aggregator_method_id,
                      ));
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text(
                  'Commander',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          );
        },
      );
    },
  );
}
