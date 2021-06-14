// Copyright (c) 2021, Very Good Ventures
// https://verygood.ventures
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'dart:async';
import 'dart:developer';

import 'package:bill/app/top_level_widget/app_bloc_provider.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:bloc/bloc.dart';

import 'package:bill/app/top_level_widget/app_bloc_observer.dart';

void main() async {
  Bloc.observer = AppBlocObserver();
  FlutterError.onError = (details) {
    log(details.exceptionAsString(), stackTrace: details.stack);
  };

  runZonedGuarded(
    () {
      WidgetsFlutterBinding.ensureInitialized();
      SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
            systemNavigationBarColor: Colors.transparent),
      );
      SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
          .then(
        (_) {
          runApp(
            AppBlocProvider(),
          );
        },
      );
    },
    (error, stackTrace) => log(error.toString(), stackTrace: stackTrace),
  );
}
