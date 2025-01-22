import 'package:flutter/material.dart';

import '../../cubit/cubit/auth_state.dart';

Listener listener(context, state) {
        if (state is AuthSucessState) {
          if (state.userdata["status"] == "success") {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                backgroundColor: Colors.indigoAccent,
                content: Text(state.userdata["message"])));
          }
          if (state.userdata["status"] == "error") {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                backgroundColor: Colors.red,
                content: Text(state.userdata["message"])));
          }
        }
        return Listener(
          child: Container(),
          onPointerDown: (_) {},
        );
      }
