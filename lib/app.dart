import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teste_bloc/app/view/start_page.dart';

import 'app/app_import.dart';
import 'shared/repository/repository.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => ListCubit(repository: Repository())..fetchList(),
          child: App(),
          lazy: false,
        ),
        BlocProvider(
          create: (_) => ListCubit(repository: Repository())..fetchList(),
          child: SplashPage(),
          lazy: false,
        ),
        BlocProvider(
          create: (_) => ListCubit(repository: Repository())..fetchList(),
          child: StartPage(),
          lazy: false,
        ),
        BlocProvider(
          create: (_) => ListCubit(repository: Repository())..fetchList(),
          child: ListPage(
            pageController: PageController(),
            buttonColor: Colors.black,
          ),
          lazy: false,
        ),
        BlocProvider(
          create: (_) => ListCubit(repository: Repository())..fetchList(),
          child: CpfPage(),
          lazy: false,
        ),
        BlocProvider(
          create: (_) => ListCubit(repository: Repository())..fetchList(),
          child: BirthDatepage(),
          lazy: false,
        ),
        BlocProvider(
          create: (_) => ListCubit(repository: Repository())..fetchList(),
          child: NomeMotherPage(),
          lazy: false,
        ),
        BlocProvider(
          create: (_) => ListCubit(repository: Repository())..fetchList(),
          child: GenrePage(),
          lazy: false,
        ),
        BlocProvider(
          create: (_) => ListCubit(repository: Repository())..fetchList(),
          child: ConfirmRegisterPage(
            pageController: PageController(),
          ),
          lazy: false,
        )
      ],
      child: MaterialApp(
          color: Colors.red,
          theme: ThemeData(
              fontFamily: 'Google',
              colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.blue)
                  .copyWith(surface: Colors.blue)),
          debugShowCheckedModeBanner: false,
          home: SplashPage()),
    );
  }
}
