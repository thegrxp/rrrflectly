import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:rrrflectly/ui/screens/welcome/welcome_viewmodel_impl.dart';
import 'package:rrrflectly/ui/utils/colors.dart';
import 'package:rrrflectly/ui/utils/styles.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  late WelcomeViewModelImpl _viewModel;
  late bool _isBackgroundColorInit;

  @override
  void initState() {
    super.initState();
    _isBackgroundColorInit = false;
  }

  @override
  void didChangeDependencies() async {
    super.didChangeDependencies();
    _viewModel = Provider.of<WelcomeViewModelImpl>(context);

    if (!_isBackgroundColorInit) {
      await _viewModel.initBackgroundColor(AppColors.primary);
      _isBackgroundColorInit = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _viewModel.getBackgroundColor(),
      // LayoutBuilder is useless in this case but we would use it if we were
      // handling different screens size
      body: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
        return Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Column(children: <Widget>[
                  Hero(
                    tag: 'emoji',
                    child: Lottie.asset('assets/animations/emoji-anim.json',
                        width: 150, height: 150),
                  ),
                  const SizedBox(height: Insets.xl),
                  DelayedDisplay(
                    delay: const Duration(milliseconds: 500),
                    child: Text(
                      "Hi there",
                      style: TextStyles.h1Bold,
                    ),
                  ),
                  const SizedBox(height: Insets.med),
                  DelayedDisplay(
                    delay: const Duration(milliseconds: 1000),
                    child: Text(
                      "Welcome",
                      style: TextStyles.h3Light,
                    ),
                  ),
                ]),
                SizedBox(
                  height: 120,
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: Insets.xxxl),
                        child: GestureDetector(
                          onTap: () {
                            _viewModel.setBackgroundColor(AppColors.primary);
                          },
                          child: ClipOval(
                            child: AnimatedContainer(
                              width: _viewModel.getBackgroundColor().value ==
                                      AppColors.primary.value
                                  ? 75
                                  : 50,
                              height: _viewModel.getBackgroundColor().value ==
                                      AppColors.primary.value
                                  ? 75
                                  : 50,
                              curve: Curves.linearToEaseOut,
                              duration: const Duration(milliseconds: 300),
                              decoration: BoxDecoration(
                                  border: Border.all(color: AppColors.white),
                                  borderRadius: Corners.maxBorder,
                                  color: AppColors.primary),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: Insets.xl),
                      Padding(
                        padding: const EdgeInsets.only(bottom: Insets.xxxl),
                        child: GestureDetector(
                          onTap: () {
                            _viewModel.setBackgroundColor(AppColors.secondary);
                          },
                          child: ClipOval(
                            child: AnimatedContainer(
                              width: _viewModel.getBackgroundColor().value ==
                                      AppColors.secondary.value
                                  ? 75
                                  : 50,
                              height: _viewModel.getBackgroundColor().value ==
                                      AppColors.secondary.value
                                  ? 75
                                  : 50,
                              curve: Curves.linearToEaseOut,
                              duration: const Duration(milliseconds: 300),
                              decoration: BoxDecoration(
                                  border: Border.all(color: AppColors.white),
                                  borderRadius: Corners.maxBorder,
                                  color: AppColors.secondary),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                DelayedDisplay(
                  delay: const Duration(milliseconds: 1500),
                  child: TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: AppColors.white,
                      padding: const EdgeInsets.all(Insets.xl),
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Corners.maxRadius),
                      ),
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, "/home");
                    },
                    child: Text(
                      "Let's go!",
                      style: TextStyles.h2
                          .copyWith(color: _viewModel.getBackgroundColor()),
                    ),
                  ),
                ),
              ]),
        );
      }),
    );
  }
}
