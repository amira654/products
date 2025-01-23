import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/feature/fav/cubit/cubit/fav_cubit.dart';
import 'package:flutter_application_2/feature/fav/cubit/cubit/fav_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavScreen extends StatelessWidget {
  const FavScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FavCubit()..getAllFav(),
      child: BlocBuilder<FavCubit, FavState>(
        builder: (context, state) {
          if (state is FavGetSuccess) {
            return Scaffold(
                appBar: AppBar(
                  title: const Text('Favourites'),
                  centerTitle: true,
                ),
                body: ListView.builder(
                  itemCount: state.listFav.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: CircleAvatar(
                        backgroundImage:
                            NetworkImage(state.listFav[index].image),
                      ),
                      trailing: IconButton(
                          onPressed: () {
                            FavCubit.get(context).deleteFavCubit(
                            productId: state.listFav[index].id);
                          }, icon: const Icon(Icons.delete,)),
                      title: Text(state.listFav[index].name),
                    );
                  },
                ));
          } else {
            return Scaffold(
              appBar: AppBar(
                title: Text('Favourites'),
              ),
              body: Center(child: CircularProgressIndicator()),
            );
          }
        },
      ),
    );
  }
}
