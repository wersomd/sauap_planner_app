import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sauap_planner/bloc_observer.dart';
import 'package:sauap_planner/routes/app_router.dart';
import 'package:sauap_planner/routes/pages.dart';
import 'package:sauap_planner/tasks/data/local/data_sources/tasks_data_provider.dart';
import 'package:sauap_planner/tasks/data/repository/task_repository.dart';
import 'package:sauap_planner/tasks/presentation/bloc/tasks_bloc.dart';
import 'package:sauap_planner/utils/color_palette.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = BlocStateOberver();
  SharedPreferences preferences = await SharedPreferences.getInstance();
  runApp(MyApp(
    preferences: preferences,
  ));
}

class MyApp extends StatelessWidget {
  final SharedPreferences preferences;

  const MyApp({super.key, required this.preferences});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) =>
          TaskRepository(taskDataProvider: TaskDataProvider(preferences)),
      child: BlocProvider(
        create: (context) => TasksBloc(context.read<TaskRepository>()),
        child: MaterialApp(
          title: 'Sauap Planner',
          debugShowCheckedModeBanner: false,
          initialRoute: Pages.initial,
          onGenerateRoute: onGenerateRoute,
          theme: ThemeData(
            fontFamily: 'Sora',
            visualDensity: VisualDensity.adaptivePlatformDensity,
            canvasColor: Colors.transparent,
            colorScheme: ColorScheme.fromSeed(seedColor: kPrimaryColor),
            useMaterial3: true,
          ),
        ),
      ),
    );
  }
}
