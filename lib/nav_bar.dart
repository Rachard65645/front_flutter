import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NavBar extends StatelessWidget {
  const NavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            UserAccountsDrawerHeader(
              accountName:const Text('lorem upsum'),
               accountEmail:const Text('lorem uosum'),
               currentAccountPicture: CircleAvatar(
                child: ClipOval(child: Image.asset('assets/images/Deliveries.png')),
               ),
               decoration:const BoxDecoration(
                color: Color.fromARGB(242, 255, 98, 0),
                  
               ),
              ),//awounang nguefack Eve Sarah
               ListTile(leading: Icon(Icons.home),
              title: Text('devenir vendor '),
              onTap: (){} ,
              )
              
          ],
        ),
      );
  }
}
