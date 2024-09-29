import 'package:flutter/material.dart';

class ScreenTwo extends StatelessWidget {
  const ScreenTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            '/images/Destination.png',
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: Column(
                children: [
                  Divider(
                    height: 2,
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.location_on_outlined,
                      color: Color.fromARGB(242, 255, 98, 0),
                      weight: 44,
                    ),
                    title: Text(
                      'Current position of user',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Divider(
                    height: 2,
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.delivery_dining_rounded,
                      color: Color.fromARGB(242, 255, 98, 0),
                      weight: 44,
                    ),
                    title: Text(
                      'Fast delivery ',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Divider(
                    height: 2,
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.message_sharp,
                      color: Color.fromARGB(242, 255, 98, 0),
                      weight: 44,
                    ),
                    title: Text(
                      'Facturation yftftygtygt ',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Divider(
                    height: 2,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
