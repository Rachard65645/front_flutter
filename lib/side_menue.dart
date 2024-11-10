import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class SideMenue extends StatefulWidget {
  const SideMenue({super.key});

  @override
  State<SideMenue> createState() => _SideMenueState();
}

class _SideMenueState extends State<SideMenue> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: 280,
        height: double.infinity,
        color: Color(0xFF17203A),
        child: SideBarMenu(),
      ),
    );
  }
}

class SideBarMenu extends StatelessWidget {
  const SideBarMenu({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 24),
          child: Divider(
            color: Colors.white24,
            height: 1,
          
          ),
        ),
        const InfoCard(name: "Allo gas !!", pseudo: 'passez votre commande et nous vous livrons',),
        ListTile(
          leading: SizedBox(
            height: 34,
            width: 34,
            child: RiveAnimation.network(
               'https://cdn.rive.app/animations/vehicles.riv',
               artboard: 'HOME',
               onInit: (Artboard) {},
            ),
          ),
          title: const Text('Home', style: TextStyle(
            color: Colors.white
          ),),
        )
      ],
    );
  }
}

class InfoCard extends StatelessWidget {
  
  const InfoCard({
    super.key,
     required this.name, 
     required this.pseudo,
  });

   final String name, pseudo;

  @override
  Widget build(BuildContext context) {
    return  ListTile(
      leading: const CircleAvatar(
        backgroundColor: Colors.white24,
        child: Icon(
          Icons.person,
          color: Colors.white,
        ),
      ),
      title: Text(
        name,
        style: const TextStyle(
          color: Colors.white,
        ),
      ),
      subtitle: Text(pseudo,
          style: const TextStyle(
            color: Colors.white,
          )),
    );
  }
}
