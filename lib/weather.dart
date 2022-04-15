import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:weather/app_router.dart';
import 'package:weather/bloc/message_handling_bloc.dart';
import 'package:weather/bloc/routers/main_bloc/main_bloc.dart';
import 'package:weather/bloc/weather_bloc/weather_bloc.dart';
import 'package:weather/bloc/weather_list_item_bloc/weather_list_item_bloc.dart';
import 'package:weather/data/repositories/weather_repository.dart';
import 'package:weather/generated/l10n.dart';
import 'package:weather/screens/components/mixin_components.dart';
import 'package:weather/utilities/message.dart';
import 'package:weather/utilities/themes.dart';

class WeatherApp extends StatelessWidget {
  const WeatherApp({required this.weatherRepository, Key? key})
      : super(key: key);

  final WeatherRepository weatherRepository;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather',
      theme: lightTheme(),
      localizationsDelegates: const [
        AppLocalizationDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      home: Builder(
        builder: (context) {
          // final appLocalization = AppLocalizations.of(context);
          return _MessageHandlingWidget(
              child: MultiRepositoryProvider(
                  providers: [
                RepositoryProvider<WeatherRepository>(
                    create: (context) => weatherRepository)
              ],
                  child: MultiBlocProvider(
                    providers: [
                      BlocProvider(
                          create: (context) => WeatherBloc(
                              messageHandlingBloc:
                                  BlocProvider.of<MessageHandlingBloc>(context),
                              weatherRepository: weatherRepository)),
                      BlocProvider(create: (context) => MainBloc()),
                      BlocProvider(
                          create: (context) => WeatherListItemBloc(
                              messageHandlingBloc:
                                  BlocProvider.of<MessageHandlingBloc>(context),
                              weatherRepository: weatherRepository)),
                    ],
                    child: StreamBuilder<ConnectivityResult>(
                      stream: Connectivity().onConnectivityChanged,
                      builder: (context, snapshot) {
                        if (snapshot.data == ConnectivityResult.none) {
                          return Container(color: Colors.red);
                        } else {
                          return AppRouter();
                        }
                      },
                    ),
                  )));
        },
      ),
    );
  }
}

class _MessageHandlingWidget extends StatelessWidget with ShowErrorDialog {
  final Widget child;

  const _MessageHandlingWidget({
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MessageHandlingBloc(),
      child: BlocListener<MessageHandlingBloc, MessageHandlingBlocState>(
        listener: (context, state) {
          if (state is MessageHandlingBlocError) {
            showErrorDialog(context, state.error, true);
          } else if (state is MessageHandlingBlocSuccess) {
            Message.showSuccess(
              context: context,
              message: state.message,
            );
          }
        },
        child: child,
      ),
    );
  }
}
