
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../cubit/cubit/profile_cubit.dart';
import '../../cubit/cubit/profile_state.dart';
import '../widget/card_profile_widget.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserProfileCubit()..getUserProfileDataCubit(),
      child: Scaffold(
        appBar: AppBar(
            title: const Text('Profile', style: TextStyle(color: Colors.white)),
            centerTitle: true,
            elevation: 5,
            backgroundColor: Colors.teal),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: BlocConsumer<UserProfileCubit, UserProfileState>(
            listener: (context, state) {
              if (state is UserErrorState) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(state.errorMessage)),
                );
              }
            },
            builder: (context, state) {
              if (state is UserSuccessState) {
                return SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      CircleAvatar(
                        radius: 80,
                        backgroundImage: NetworkImage(
                          state.userData.userProfileModel.profileImage,
                        ),
                      ),
                      const SizedBox(height: 40),
                      CardProfileWidget(
                        text: state.userData.userProfileModel.name,
                        icon: Icons.person,
                      ),
                      const SizedBox(height: 20),
                      CardProfileWidget(
                        text: state.userData.userProfileModel.email,
                        icon: Icons.email,
                      ),
                      const SizedBox(height: 20),
                      CardProfileWidget(
                        text: state.userData.userProfileModel.phone,
                        icon: Icons.call,
                      ),
                      const SizedBox(height: 20),
                      CardProfileWidget(
                        text: state.userData.userProfileModel.nationalId,
                        icon: Icons.card_travel,
                      ),
                    ],
                  ),
                );
              } else if (state is UserLoadingState) {
                return const Center(child: CircularProgressIndicator());
              } else {
                return const Center(child: Text('Unexpected error occurred.'));
              }
            },
          ),
        ),
      ),
    );
  }
}
