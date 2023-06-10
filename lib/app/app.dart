import 'package:earnipay/app/modules/home/home.dart';
import 'package:earnipay/app/modules/photo_details/photo_details.dart';
import 'package:earnipay/app/routes/app_pages.dart';
import 'package:earnipay/app/routes/app_routes.dart';
import 'package:earnipay/core/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<HomeBloc>(
          create: (context) => HomeBloc(HomeRepository())..add(LoadMorePhotosEvent()),
        ),
        BlocProvider<PhotoDetailsBloc>(
          create: (context) => PhotoDetailsBloc(),
        ),
      ],
      child: MaterialApp(
        title: "EarniPay",
        debugShowCheckedModeBanner: false,
        theme: AppTheme.lightTheme,
        initialRoute: AppRoute.home,
        routes: AppPages.page,
      ),
    );
  }
}
