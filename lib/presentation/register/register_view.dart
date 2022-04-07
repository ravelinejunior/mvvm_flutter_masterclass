import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:mvvm_flutter_masterclass/app/app_prefs.dart';
import 'package:mvvm_flutter_masterclass/domain/di/di.dart';
import 'package:mvvm_flutter_masterclass/presentation/common/state_renderer/state_render_impl.dart';
import 'package:mvvm_flutter_masterclass/presentation/managers/font_manager.dart';
import 'package:mvvm_flutter_masterclass/presentation/managers/routes_manager.dart';
import 'package:mvvm_flutter_masterclass/presentation/managers/strings_manager.dart';
import 'package:mvvm_flutter_masterclass/presentation/managers/values_manager.dart';
import 'package:mvvm_flutter_masterclass/presentation/register/viewModel/register_viewmodel.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({Key? key}) : super(key: key);

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  final _registerViewModel = instance<RegisterViewModel>();
  final _appPrefs = instance<AppPreferences>();

  final _nameTextController = TextEditingController();
  final _emailTextController = TextEditingController();
  final _phoneTextController = TextEditingController();
  final _sexTextController = TextEditingController();
  final _passwordTextController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  _bind() {
    _nameTextController.addListener(
        () => _registerViewModel.setUserName(_nameTextController.text));
    _emailTextController.addListener(
        () => _registerViewModel.setUserEmail(_emailTextController.text));
    _phoneTextController.addListener(() {
      _registerViewModel.setUserPhone(_phoneTextController.text.trim());
      debugPrint(_phoneTextController.text);
    });
    _sexTextController.addListener(
        () => _registerViewModel.setUserSex(_sexTextController.text));
    _passwordTextController.addListener(
        () => _registerViewModel.setUserPassword(_passwordTextController.text));

    _registerViewModel.isUserLoggedStreamController.listen((isLogged) {
      SchedulerBinding.instance?.addPostFrameCallback((time) {
        _appPrefs.setIsUserLogged();
        Get.offAndToNamed(ConstantsRoutes.mainRoute);
      });
    });
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
            AppStrings.registerString,
            style: GoogleFonts.lato(
              fontSize: AppFontSize.s16,
              color: Colors.white,
              fontWeight: FontWeightManager.bold,
            ),
          ),
        ),
        body: StreamBuilder<StateFlow>(
          stream: _registerViewModel.outputState,
          builder: (context, snapshot) =>
              snapshot.data?.getScreenWidget(context, _getContent(), () {
                _registerViewModel.registerUser();
              }) ??
              _getContent(),
        ));
  }

  Widget _getContent() {
    return Padding(
      padding: const EdgeInsets.all(AppFontSize.s28),
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
                  child: Lottie.asset('assets/json/register_lottie.json'),
                ),
              ),
              // Name
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppPadding.p20,
                  vertical: AppPadding.p8,
                ),
                child: StreamBuilder<bool>(
                  stream: _registerViewModel.outputIsUserNameValid,
                  builder: (_, snapshot) {
                    return TextFormField(
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.text,
                      maxLines: 1,
                      controller: _nameTextController,
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.circular(AppFontSize.s12),
                            borderSide:
                                const BorderSide(color: Colors.blue, width: 2)),
                        fillColor: Colors.blue,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(AppFontSize.s12),
                          borderSide: const BorderSide(
                              color: Colors.blue,
                              width: 2.0,
                              style: BorderStyle.solid),
                        ),
                        labelStyle: GoogleFonts.lato(color: Colors.grey),
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

              // Email
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppPadding.p20,
                  vertical: AppPadding.p8,
                ),
                child: StreamBuilder<bool>(
                  stream: _registerViewModel.outputIsUserEmailValid,
                  builder: (_, snapshot) {
                    return TextFormField(
                      maxLines: 1,
                      keyboardType: TextInputType.emailAddress,
                      controller: _emailTextController,
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.circular(AppFontSize.s12),
                            borderSide: const BorderSide(
                                color: Colors.yellowAccent, width: 2)),
                        fillColor: Colors.yellow,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(AppFontSize.s12),
                          borderSide: const BorderSide(
                              color: Colors.orange,
                              width: 2.0,
                              style: BorderStyle.solid),
                        ),
                        labelStyle: GoogleFonts.lato(color: Colors.grey),
                        hintText: AppStrings.emailString,
                        labelText: AppStrings.emailString,
                        errorText: (snapshot.hasData)
                            ? null
                            : AppStrings.errorUserEmailString,
                      ),
                    );
                  },
                ),
              ),

              // Phone
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppPadding.p20,
                  vertical: AppPadding.p8,
                ),
                child: StreamBuilder<bool>(
                  stream: _registerViewModel.outputIsUserPhoneValid,
                  builder: (_, snapshot) {
                    return TextFormField(
                      keyboardType: TextInputType.phone,
                      controller: _phoneTextController,
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.circular(AppFontSize.s12),
                            borderSide:
                                const BorderSide(color: Colors.lime, width: 2)),
                        fillColor: Colors.limeAccent,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(AppFontSize.s12),
                          borderSide: const BorderSide(
                              color: Colors.limeAccent,
                              width: 2.0,
                              style: BorderStyle.solid),
                        ),
                        labelStyle: GoogleFonts.lato(color: Colors.grey),
                        hintText: AppStrings.phoneNumberString,
                        labelText: AppStrings.phoneNumberString,
                        errorText: (snapshot.hasData)
                            ? null
                            : AppStrings.errorUserPhoneString,
                      ),
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                        TelefoneInputFormatter()
                      ],
                    );
                  },
                ),
              ),

              // Sex
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppPadding.p20,
                  vertical: AppPadding.p8,
                ),
                child: StreamBuilder<bool>(
                  stream: _registerViewModel.outputIsUserSexValid,
                  builder: (_, snapshot) {
                    return TextFormField(
                      keyboardType: TextInputType.text,
                      controller: _sexTextController,
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.circular(AppFontSize.s12),
                            borderSide:
                                const BorderSide(color: Colors.teal, width: 2)),
                        fillColor: Colors.teal,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(AppFontSize.s12),
                          borderSide: const BorderSide(
                              color: Colors.tealAccent,
                              width: 2.0,
                              style: BorderStyle.solid),
                        ),
                        labelStyle: GoogleFonts.lato(color: Colors.grey),
                        hintText: AppStrings.sexString,
                        labelText: AppStrings.sexString,
                        errorText: (snapshot.hasData)
                            ? null
                            : AppStrings.errorUserSexString,
                      ),
                    );
                  },
                ),
              ),

              // Password
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppPadding.p20,
                ),
                child: StreamBuilder<bool>(
                  stream: _registerViewModel.outputIsUserPasswordValid,
                  builder: (context, snapshot) {
                    return TextFormField(
                      obscureText: true,
                      keyboardType: TextInputType.visiblePassword,
                      textInputAction: TextInputAction.done,
                      controller: _passwordTextController,
                      decoration: InputDecoration(
                        labelStyle: GoogleFonts.lato(color: Colors.grey),
                        focusedBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.circular(AppFontSize.s12),
                            borderSide: const BorderSide(
                                color: Colors.pinkAccent, width: 2)),
                        fillColor: Colors.pink,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(AppFontSize.s12),
                          borderSide: const BorderSide(
                              color: Colors.pink,
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
                  stream: _registerViewModel.outputIsAllUserDataInputsValid,
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
                            _registerViewModel.registerUser();
                          }
                        : null,
                    child: Text(
                      AppStrings.registerTitleString,
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
                      onPressed: () {
                        Get.toNamed(ConstantsRoutes.forgotPasswordRoute);
                      },
                    ),
                    TextButton(
                      child: Text(AppStrings.loginString,
                          style: GoogleFonts.lato(
                            color: Colors.orange,
                            fontWeight: FontWeight.bold,
                          )),
                      style: TextButton.styleFrom(
                        primary: Colors.white,
                        backgroundColor: Colors.transparent,
                        shadowColor: Colors.red,
                      ),
                      onPressed: () {
                        Get.toNamed(ConstantsRoutes.loginRoute);
                      },
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _registerViewModel.dispose();
    super.dispose();
  }
}
