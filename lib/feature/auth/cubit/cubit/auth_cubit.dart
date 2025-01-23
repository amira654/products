
import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import '../../model/data_auth/auth_data.dart';
import 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  final AuthData authData = AuthData();
postLoginCubit({
    required emaildata,
    required passworddata,
  }) async {
    emit(AuthLoadingState());
    var user = await authData.loginData(
      email: emaildata,
      password: passworddata,
    );

    emit(AuthSucessState(userdata: user));
  }
  postDataCubit(
      {required namedata,
      required emaildata,
      required genderdata,
      required nationalIddata,
      required passworddata,
      required phonedata,
      required tokendata}) async {
    emit(AuthLoadingState());
    var user = await authData.postData(
        name: namedata,
        email: emaildata,
        gender: genderdata,
        nationalId: nationalIddata,
        password: passworddata,
        phone: phonedata,
        profileImage:userImage,
        token: tokendata);

    emit(AuthSucessState(userdata: user));
  }

  ImagePicker picker = ImagePicker();
  File ?image;
  String? userImage;

  Future<void> addImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      image = File(pickedFile.path);
      Uint8List bytes = File(image!.path).readAsBytesSync();
      userImage = base64Encode(bytes);
      if (kDebugMode) {
        print('images = $userImage');
      }
      emit(ChooseImage());
    } else {
      if (kDebugMode) {
        print('no image selected');
      }
    }
  }
}

