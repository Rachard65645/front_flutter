import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gas/vendor/stores/business_logic/bloc/stores_bloc.dart';
import 'package:shimmer/shimmer.dart';

class CurrentStorePage extends StatelessWidget {
  const CurrentStorePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StoresBloc, StoresState>(builder: (context, state) {
      if (state is StoresInitial) {
        context.read<StoresBloc>().add(FetchStoreEvent());
      }

      if (state is Storesloading) {
        return GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10.0,
            mainAxisSpacing: 10.0,
          ),
          itemCount: 10, // Affichez un nombre fixe d'éléments en attente
          itemBuilder: (context, index) {
            return Shimmer.fromColors(
                baseColor: Colors.grey[300]!,
                highlightColor: Colors.grey[100]!,
                child: Card(
                  child: Column(
                    children: [
                      // Affichez une zone de chargement pour l'image
                      Container(
                        width: double.infinity,
                        height: 100,
                        color: Colors.grey[300],
                      ),
                      const SizedBox(height: 10),
                      // Affichez un champ de texte de chargement
                      Container(
                        width: 80,
                        height: 10,
                        color: Colors.grey[300],
                      ),
                      const SizedBox(height: 5),
                      // Affichez un autre champ de texte de chargement
                      Container(
                        width: 60,
                        height: 10,
                        color: Colors.grey[300],
                      ),
                    ],
                  ),
                ));
          },
        );
      }

      if (state.stores?.isEmpty ?? true) {
        return const Center(child: Text("No sellers yet"));
      }

      if (state is FetchStoreSuccess) {
        final stores = state.stores;
        return GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // Nombre de colonnes
            crossAxisSpacing: 10, // Espacement entre les colonnes
            mainAxisSpacing: 10, // Espacement entre les lignes
            childAspectRatio: 0.8, // Aspect ratio des cartes
          ),
          itemCount: stores!.length,
          itemBuilder: (context, index) {
            final store = stores[index];
            return Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                mainAxisSize: MainAxisSize
                    .min, // Réduit la taille de la Card pour l'adapter au contenu
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: CachedNetworkImage(
                      imageUrl: 'http://172.20.10.2:4000/api/${store.logo}',
                      height: 170, // Réduit la hauteur de l'image
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(
                        6.0), // Réduit la marge autour du texte
                    child: Text(
                      store.name,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 6.0), // Réduit la marge horizontale
                    child: Text(
                      store.address,
                      style: const TextStyle(
                          fontSize: 12), // Réduit la taille du texte
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          spreadRadius: 2,
                          blurRadius: 6,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: CircleAvatar(
                      radius: 30.0,
                      backgroundColor: Color.fromARGB(206, 255, 98, 0),
                      child: IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.arrow_circle_right_rounded,
                            color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        );
      }

      return Container();
    });
  }
}
