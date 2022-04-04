import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mvvm_flutter_masterclass/app/app_prefs.dart';
import 'package:mvvm_flutter_masterclass/domain/di/di.dart';
import 'package:mvvm_flutter_masterclass/presentation/common/state_renderer/state_render_impl.dart';
import 'package:mvvm_flutter_masterclass/presentation/managers/strings_manager.dart';
import 'package:mvvm_flutter_masterclass/presentation/managers/values_manager.dart';
import 'package:mvvm_flutter_masterclass/presentation/password/viewModel/forget_password_viewModel.dart';

class PasswordView extends StatefulWidget {
  const PasswordView({Key? key}) : super(key: key);

  @override
  State<PasswordView> createState() => _PasswordViewState();
}

class _PasswordViewState extends State<PasswordView> {
  //initialized on DI
  final _forgetPasswordViewModel = instance<ForgetPasswordViewModel>();
  final _appPrefs = instance<AppPreferences>();

  final _emailTextController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  _bind() {
    _forgetPasswordViewModel.start();

    _emailTextController.addListener(() =>
        {_forgetPasswordViewModel.setUserEmail(_emailTextController.text)});
  }

  @override
  void initState() {
    _bind();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppStrings.forgetPasswordString,
          style: GoogleFonts.lato(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: StreamBuilder<StateFlow>(
        stream: _forgetPasswordViewModel.outputState,
        builder: (context, snapshot) {
          return snapshot.data?.getScreenWidget(context, _getContent(), () {
                _forgetPasswordViewModel.sendEmail();
              }) ??
              _getContent();
        },
      ),
    );
  }

  Widget _getContent() {
    return Center(
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
                ),
                child: StreamBuilder<bool>(
                  stream: _forgetPasswordViewModel.outputIsUserEmailValid,
                  builder: (context, snapshot) {
                    return TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      controller: _emailTextController,
                      decoration: InputDecoration(
                        labelStyle:
                            GoogleFonts.lato(color: Colors.orangeAccent),
                        focusedBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.circular(AppFontSize.s12),
                            borderSide: const BorderSide(
                                color: Colors.orangeAccent, width: 2)),
                        fillColor: Colors.orangeAccent,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(AppFontSize.s12),
                          borderSide: const BorderSide(
                              color: Colors.orange,
                              width: 2.0,
                              style: BorderStyle.solid),
                        ),
                        hintText: AppStrings.emailString,
                        labelText: AppStrings.emailString,
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
                  stream: _forgetPasswordViewModel.outputIsUserEmailValid,
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
                            _forgetPasswordViewModel.sendEmail();
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
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _forgetPasswordViewModel.dispose();
    super.dispose();
  }
}
