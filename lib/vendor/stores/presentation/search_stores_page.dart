import 'dart:async'; // Pour le debouncing
import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gas/router/app_router.gr.dart';
import 'package:gas/service_locator.dart';
import 'package:gas/vendor/search_store/business_logique/bloc/search_stores_bloc.dart';
import 'package:gas/vendor/store/business_logique/bloc/store_bloc.dart';
import 'package:shimmer/shimmer.dart';

@RoutePage()
class SearchStoresPage extends StatefulWidget {
  const SearchStoresPage({super.key});

  @override
  State<SearchStoresPage> createState() => _SearchStoresPageState();
}

class _SearchStoresPageState extends State<SearchStoresPage> {
  final _debounceDuration = Duration(milliseconds: 500);
  Timer? _debounceTimer;
  String _searchQueryName = '';
  String _searchQueryAddress = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Store Search"),
        backgroundColor: Colors.deepOrangeAccent,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Search for a store by name or address:',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 20.0),

            
            _buildSearchField(
              hintText: 'Search by store name',
              icon: Icons.search,
              onChanged: (query) {
                _onSearchChanged(query, isNameSearch: true);
              },
            ),
            const SizedBox(height: 20.0),

           
            _buildSearchField(
              hintText: 'Search by store address',
              icon: Icons.location_on,
              onChanged: (query) {
                _onSearchChanged(query, isNameSearch: false);
              },
            ),
            const SizedBox(height: 20.0),

           
            Expanded(
              child: BlocBuilder<SearchStoresBloc, SearchStoresState>(
                builder: (context, state) {
                  if (state is SearchStoreLoading) {
                    return _buildLoadingState();
                  }

                  if (state is SearchStoreSuccess) {
                    return _buildSearchResults(state);
                  }

                  if (state.search?.isEmpty ?? true) {
                    return const Center(child: Text("No stores found"));
                  }

                  return Container();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  
  Widget _buildSearchField({
    required String hintText,
    required IconData icon,
    required Function(String) onChanged,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.orange[50],
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 5.0,
            spreadRadius: 2.0,
          ),
        ],
      ),
      child: TextField(
        onChanged: onChanged,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.orange[50],
          hintText: hintText,
          prefixIcon: Icon(icon, color: Colors.deepOrange),
          border: InputBorder.none,
          contentPadding:
              const EdgeInsets.symmetric(vertical: 18.0, horizontal: 16.0),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: Colors.deepOrange),
          ),
        ),
      ),
    );
  }

 
  void _onSearchChanged(String query, {required bool isNameSearch}) {
    if (_debounceTimer?.isActive ?? false) _debounceTimer!.cancel();

    _debounceTimer = Timer(_debounceDuration, () {
      if (isNameSearch) {
        setState(() {
          _searchQueryName = query;
        });
      } else {
        setState(() {
          _searchQueryAddress = query;
        });
      }

      context.read<SearchStoresBloc>().add(
            SearchAllStoresEvent(
              name: _searchQueryName,
              address: _searchQueryAddress,
            ),
          );
    });
  }

  
  Widget _buildLoadingState() {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) {
        return Shimmer.fromColors(
          baseColor: Colors.grey[300]!,
          highlightColor: Colors.grey[100]!,
          child: ListTile(
            leading: CircleAvatar(
              radius: 30.0,
              backgroundColor: Colors.grey[300],
            ),
            title: Container(
              width: double.infinity,
              height: 10.0,
              color: Colors.grey[300],
            ),
            subtitle: Container(
              width: 150,
              height: 10.0,
              color: Colors.grey[300],
            ),
          ),
        );
      },
    );
  }

  
  Widget _buildSearchResults(SearchStoreSuccess state) {
    return ListView.builder(
      itemCount: state.search!.length,
      itemBuilder: (context, index) {
        final store = state.search![index];
        return ListTile(
          leading: CircleAvatar(
            radius: 30.0,
            backgroundColor: const Color.fromARGB(206, 255, 98, 0),
            backgroundImage: CachedNetworkImageProvider(
              'http://$IpGlobal:4000/api/${store.logo}',
            ),
          ),
          title: Text(
            store.name,
            style: const TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold),
          ),
          subtitle: Text(
            store.pseudo,
            style: const TextStyle(color: Colors.black54),
          ),
          trailing: Container(
            height: 20,
            width: 40,
            decoration: BoxDecoration(
              color: store.statusStore == "close"
                  ? Colors.red
                  : const Color.fromARGB(82, 76, 175, 79),
              borderRadius: const BorderRadius.all(Radius.circular(5)),
            ),
            child: Center(
              child: Text(
                store.statusStore,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          onTap: () {
            getIt.get<StoreBloc>().add(GetStoreByIdEven(id: store.id));
            context.router.push(const ShowStoreRoute());
          },
        );
      },
    );
  }
}
