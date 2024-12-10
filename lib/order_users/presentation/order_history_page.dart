import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gas/order_users/business_logique/bloc/order_user_bloc.dart';

@RoutePage()
class OrderHistoryPage extends StatelessWidget {
  const OrderHistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.deepOrangeAccent,
            title: Text(
              'Orders History',
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            centerTitle: true,
          ),
          body: Column(
            children: [
              TabBar(tabs: const [
                Tab(
                  icon: Icon(Icons.widgets),
                ),
                Tab(
                  icon: Icon(Icons.abc),
                )
              ]),
              Expanded(
                child: TabBarView(
                  children: [
                    BlocBuilder<OrderUserBloc, OrderUserState>(
                      builder: (context, state) {
                        if (state is OrderUserLoading) {
                          return Center(
                            child: CircularProgressIndicator(
                              color: Colors.orange,
                            ),
                          );
                        }

                        if (state is OrderUserSucess) {
                          return ListView.builder(
                            itemCount: state.orderUser!.length,
                            padding: EdgeInsets.all(8.0),
                            itemBuilder: (context, index) {
                              final order = state.orderUser![index];

                              return Card(
                                margin: EdgeInsets.symmetric(vertical: 10.0),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                                elevation: 4.0,
                                child: Padding(
                                  padding: EdgeInsets.all(16.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "Status: ${order.status}",
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16.0,
                                              color: Colors.blueAccent,
                                            ),
                                          ),
                                          Icon(
                                            Icons.history,
                                            color: Colors.grey,
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 8.0),
                                      Row(
                                        children: [
                                          Icon(Icons.store,
                                              color: Colors.green),
                                          SizedBox(width: 8.0),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                order.stores.name,
                                                style: TextStyle(
                                                  fontSize: 16.0,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                              SizedBox(height: 4.0),
                                              Text(
                                                "${order.stores.address}, ${order.stores.city}",
                                                style: TextStyle(
                                                  fontSize: 14.0,
                                                  color: Colors.grey[700],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 8.0),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: order.orderItems.map((item) {
                                          return Padding(
                                            padding:
                                                const EdgeInsets.only(top: 8.0),
                                            child: Row(
                                              children: [
                                                Icon(Icons.local_gas_station,
                                                    color: Colors.orange),
                                                SizedBox(width: 8.0),
                                                Text(
                                                  item.gasBottles.gasStations
                                                      .name,
                                                  style: TextStyle(
                                                    fontSize: 14.0,
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                ),
                                                Spacer(),
                                                Text(
                                                  "${item.quantity} x ${item.price} FCFA",
                                                  style: TextStyle(
                                                    fontSize: 14.0,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.black87,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          );
                                        }).toList(),
                                      ),
                                      SizedBox(height: 16.0),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "Total:",
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16.0,
                                            ),
                                          ),
                                          Text(
                                            "${order.orderItems.fold(0, (total, item) => total + (item.price * item.quantity))} FCFA",
                                            style: TextStyle(
                                              fontSize: 16.0,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.blueAccent,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          );
                        }

                        return Container();
                      },
                    ),
                    Container(
                      child: Text('hjh'),
                    )
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
