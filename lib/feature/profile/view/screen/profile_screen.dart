import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubit/cubit/profile_cubit.dart';
import '../../cubit/cubit/profile_state.dart';
import '../widget/card_profile_widget.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfileCubit()..prfileDataCubit(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: const Text(
            'Profile',
            style: TextStyle(
                color: Colors.white, fontSize: 26, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: BlocConsumer<ProfileCubit, ProfileCubitStatue>(
            listener: (context, state) {},
            builder: (context, state) {
              if (state is SucessProfileCubit) {
                return Column(
                  children: [
                    CircleAvatar(
                      radius: 80,
                      backgroundImage: NetworkImage(
                          state.profileModelUserData.profileModel.profileImage),
                    ),
                    const SizedBox(height: 40),
                    CardProfileWidget(
                      text: state.profileModelUserData.profileModel.name,
                      icon: Icons.person,
                    ),
                    const SizedBox(height: 20),
                    CardProfileWidget(
                      text: state.profileModelUserData.profileModel.email,
                      icon: Icons.email,
                    ),
                    const SizedBox(height: 20),
                    CardProfileWidget(
                      text: state.profileModelUserData.profileModel.phone,
                      icon: Icons.call,
                    ),
                    const SizedBox(height: 20),
                    CardProfileWidget(
                      text: state.profileModelUserData.profileModel.nationalId,
                      icon: Icons.card_travel,
                    ),
                    const SizedBox(height: 20),
                  ],
                );
              } else if (state is LoadingProfileCubit) {
                return const CircularProgressIndicator();
              } else {
                return const Text('error');
              }
            },
          ),
        ),
      ),
    );
  }
}
