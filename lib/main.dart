import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:rrrflectly/service_locator.dart' as sl;
import 'package:rrrflectly/ui/screens/home/home_page.dart';
import 'package:rrrflectly/ui/screens/home/home_viewmodel_impl.dart';
import 'package:rrrflectly/ui/screens/welcome/welcome_page.dart';
import 'package:rrrflectly/ui/screens/welcome/welcome_viewmodel_impl.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Init service locator
  await sl.init();

  // Force portrait only because I don't have much time!
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(const App());
  });
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<WelcomeViewModelImpl>(
            create: (context) => WelcomeViewModelImpl()),
        ChangeNotifierProvider<HomeViewModelImpl>(
            create: (context) => HomeViewModelImpl()),
      ],
      child: MaterialApp(
        title: 'Rrrflectly',
        initialRoute: '/',
        // Remove default navigation route animation
        onGenerateRoute: (settings) {
          if (settings.name == '/') {
            return PageRouteBuilder(
                pageBuilder: (_, __, ___) => const WelcomePage());
          }
          if (settings.name == '/home') {
            return PageRouteBuilder(
                pageBuilder: (_, __, ___) => const HomePage());
          }

          return null;
        },
      ),
    );
  }
}
