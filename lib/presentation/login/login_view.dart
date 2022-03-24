import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mvvm_flutter_masterclass/domain/di/di.dart';
import 'package:mvvm_flutter_masterclass/presentation/login/login_view_model/login_view_model.dart';
import 'package:mvvm_flutter_masterclass/presentation/managers/strings_manager.dart';
import 'package:mvvm_flutter_masterclass/presentation/managers/values_manager.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  //initialized on DI
  final _loginViewModel = instance<LoginViewModel>();

  final _nameTextController = TextEditingController();
  final _passwordTextController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

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
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(
                  height: AppFontSize.s260,
                  child: Card(
                    elevation: 0,
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
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppPadding.p20,
                    vertical: AppPadding.p8,
                  ),
                  child: StreamBuilder<bool>(
                    stream: _loginViewModel.outputIsUserNameValid,
                    builder: (_, snapshot) {
                      return TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        controller: _nameTextController,
                        decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.circular(AppFontSize.s12),
                              borderSide: const BorderSide(
                                  color: Colors.deepOrangeAccent, width: 2)),
                          fillColor: Colors.deepOrangeAccent,
                          border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.circular(AppFontSize.s12),
                            borderSide: const BorderSide(
                                color: Colors.orange,
                                width: 2.0,
                                style: BorderStyle.solid),
                          ),
                          labelStyle:
                              GoogleFonts.lato(color: Colors.deepOrangeAccent),
                          hintText: AppStrings.userNameString,
                          labelText: AppStrings.userNameString,
                          errorText: (snapshot.hasData)
                              ? null
                              : AppStrings.errorUserNameString,
                        ),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppPadding.p20,
                  ),
                  child: StreamBuilder<bool>(
                    stream: _loginViewModel.outputIsUserPasswordValid,
                    builder: (context, snapshot) {
                      return TextFormField(
                        obscureText: true,
                        keyboardType: TextInputType.visiblePassword,
                        controller: _passwordTextController,
                        decoration: InputDecoration(
                          labelStyle:
                              GoogleFonts.lato(color: Colors.deepOrangeAccent),
                          focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.circular(AppFontSize.s12),
                              borderSide: const BorderSide(
                                  color: Colors.deepOrangeAccent, width: 2)),
                          fillColor: Colors.deepOrangeAccent,
                          border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.circular(AppFontSize.s12),
                            borderSide: const BorderSide(
                                color: Colors.orange,
                                width: 2.0,
                                style: BorderStyle.solid),
                          ),
                          hintText: AppStrings.userPasswordString,
                          labelText: AppStrings.userPasswordString,
                          errorText: (snapshot.hasData)
                              ? null
                              : AppStrings.errorUserPasswordString,
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(
                  height: AppFontSize.s16,
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: AppFontSize.s20),
                  child: StreamBuilder<bool>(
                    stream: _loginViewModel.outputIsAllInputsValid,
                    builder: (_, snapshot) => ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.orange,
                        shadowColor: Colors.orange,
                        minimumSize: const Size(50, 50),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(AppFontSize.s16),
                        ),
                      ),
                      onPressed: (snapshot.data ?? false)
                          ? () {
                              _loginViewModel.loginUser();
                            }
                          : null,
                      child: Text(
                        AppStrings.loginString,
                        style: GoogleFonts.lato(
                            fontWeight: FontWeight.bold,
                            fontSize: AppFontSize.s18,
                            color: snapshot.data ?? false
                                ? Colors.white
                                : Colors.black),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(AppPadding.p14),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                        child: Text(
                          AppStrings.forgetString,
                          style: GoogleFonts.lato(
                            color: Colors.orange,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        style: TextButton.styleFrom(
                          primary: Colors.white,
                          backgroundColor: Colors.transparent,
                        ),
                        onPressed: () {},
                      ),
                      TextButton(
                        child: Text(AppStrings.registerString,
                            style: GoogleFonts.lato(
                              color: Colors.orange,
                              fontWeight: FontWeight.bold,
                            )),
                        style: TextButton.styleFrom(
                          primary: Colors.white,
                          backgroundColor: Colors.transparent,
                          shadowColor: Colors.red,
                        ),
                        onPressed: () {},
                      ),
                    ],
                  ),
                )
              ],
            ),
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
