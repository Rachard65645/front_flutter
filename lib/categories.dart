import 'package:flutter/material.dart';

class Categories extends StatelessWidget {
  const Categories({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Categories'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: 6,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 5),
            child: Column(
              children: [
                Stack(
                  alignment: AlignmentDirectional.center,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image.asset(
                        'images/d.png',
                        fit: BoxFit.cover,
                        width: double.infinity,
                        height: 200,
                      ),
                    ),
                    Container(
                        height: 200,
                        decoration: BoxDecoration(
                            color: Color.fromARGB(118, 21, 13, 13),
                            borderRadius: BorderRadiusDirectional.circular(15)),
                        child: const Center(
                            child: Text(
                          'food',
                          style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.w900,
                              color: Colors.white),
                        ))),
                  ],
                ),
                const SizedBox(
                  height: 12,
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
