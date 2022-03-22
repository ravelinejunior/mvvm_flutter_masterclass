import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mvvm_flutter_masterclass/presentation/login/login_view_model/login_view_model.dart';
import 'package:mvvm_flutter_masterclass/presentation/managers/values_manager.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final _loginViewModel = LoginViewModel(null);
  final _nameTextController = TextEditingController();
  final _passwordTextController = TextEditingController();

  _bind() {
    _loginViewModel.start();

    _nameTextController.addListener(
        () => _loginViewModel.setUserName(_nameTextController.text));

    _passwordTextController.addListener(
        () => _loginViewModel.setPassword(_passwordTextController.text));
  }

  @override
  void initState() {
    _bind();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return _getContent();
  }

  Widget _getContent() {
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Card(
                elevation: AppFontSize.s8,
                clipBehavior: Clip.antiAlias,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(AppFontSize.s16),
                ),
                child: const Image(
                  image: AssetImage(
                    'assets/images/splash_logo.png',
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _loginViewModel.dispose();
    super.dispose();
  }
}
