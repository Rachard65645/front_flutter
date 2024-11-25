import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gas/router/app_router.gr.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NavBar extends StatelessWidget {
  const NavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: const Text('Gasoduc'),
            accountEmail: const Text(''),
            currentAccountPicture: CircleAvatar(
              backgroundImage: AssetImage('assets/images/gasoduc.png'),
              radius: 40.0,
            ),
            decoration: const BoxDecoration(
              color: Color.fromARGB(242, 255, 98, 0),
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.store,
              color: Colors.orange,
            ),
            title: Text('Mes boutiques'),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(
              Icons.store,
              color: Colors.orange,
            ),
            title: Text('Become a seller'),
            onTap: () {
              context.router.push(const CreateStoresRoute());
            },
          ),
          ListTile(
            leading: Icon(
              Icons.delivery_dining_sharp,
              color: Colors.orange,
            ),
            title: Text('Become a deliver'),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(
              Icons.logout,
              color: Colors.orange,
            ),
            title: Text('Logout'),
            onTap: () => logout(context),
          ),
        ],
      ),
    );
  }
}


Future<void> logout(BuildContext context) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.remove('token');
  context.router.replace(const LoginRoute());
}
