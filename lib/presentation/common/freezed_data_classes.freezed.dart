// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'freezed_data_classes.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$LoginObjectTearOff {
  const _$LoginObjectTearOff();

  _LoginObject call(String userName, String userPassword) {
    return _LoginObject(
      userName,
      userPassword,
    );
  }
}

/// @nodoc
const $LoginObject = _$LoginObjectTearOff();

/// @nodoc
mixin _$LoginObject {
  String get userName => throw _privateConstructorUsedError;
  String get userPassword => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $LoginObjectCopyWith<LoginObject> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoginObjectCopyWith<$Res> {
  factory $LoginObjectCopyWith(
          LoginObject value, $Res Function(LoginObject) then) =
      _$LoginObjectCopyWithImpl<$Res>;
  $Res call({String userName, String userPassword});
}

/// @nodoc
class _$LoginObjectCopyWithImpl<$Res> implements $LoginObjectCopyWith<$Res> {
  _$LoginObjectCopyWithImpl(this._value, this._then);

  final LoginObject _value;
  // ignore: unused_field
  final $Res Function(LoginObject) _then;

  @override
  $Res call({
    Object? userName = freezed,
    Object? userPassword = freezed,
  }) {
    return _then(_value.copyWith(
      userName: userName == freezed
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      userPassword: userPassword == freezed
          ? _value.userPassword
          : userPassword // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$LoginObjectCopyWith<$Res>
    implements $LoginObjectCopyWith<$Res> {
  factory _$LoginObjectCopyWith(
          _LoginObject value, $Res Function(_LoginObject) then) =
      __$LoginObjectCopyWithImpl<$Res>;
  @override
  $Res call({String userName, String userPassword});
}

/// @nodoc
class __$LoginObjectCopyWithImpl<$Res> extends _$LoginObjectCopyWithImpl<$Res>
    implements _$LoginObjectCopyWith<$Res> {
  __$LoginObjectCopyWithImpl(
      _LoginObject _value, $Res Function(_LoginObject) _then)
      : super(_value, (v) => _then(v as _LoginObject));

  @override
  _LoginObject get _value => super._value as _LoginObject;

  @override
  $Res call({
    Object? userName = freezed,
    Object? userPassword = freezed,
  }) {
    return _then(_LoginObject(
      userName == freezed
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      userPassword == freezed
          ? _value.userPassword
          : userPassword // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_LoginObject implements _LoginObject {
  _$_LoginObject(this.userName, this.userPassword);

  @override
  final String userName;
  @override
  final String userPassword;

  @override
  String toString() {
    return 'LoginObject(userName: $userName, userPassword: $userPassword)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _LoginObject &&
            (identical(other.userName, userName) ||
                const DeepCollectionEquality()
                    .equals(other.userName, userName)) &&
            (identical(other.userPassword, userPassword) ||
                const DeepCollectionEquality()
                    .equals(other.userPassword, userPassword)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(userName) ^
      const DeepCollectionEquality().hash(userPassword);

  @JsonKey(ignore: true)
  @override
  _$LoginObjectCopyWith<_LoginObject> get copyWith =>
      __$LoginObjectCopyWithImpl<_LoginObject>(this, _$identity);
}

abstract class _LoginObject implements LoginObject {
  factory _LoginObject(String userName, String userPassword) = _$_LoginObject;

  @override
  String get userName => throw _privateConstructorUsedError;
  @override
  String get userPassword => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$LoginObjectCopyWith<_LoginObject> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
class _$RegisterObjectTearOff {
  const _$RegisterObjectTearOff();

  _RegisterObject call(String userName, String userEmail, String userPhone,
      String userSex, String userPassword) {
    return _RegisterObject(
      userName,
      userEmail,
      userPhone,
      userSex,
      userPassword,
    );
  }
}

/// @nodoc
const $RegisterObject = _$RegisterObjectTearOff();

/// @nodoc
mixin _$RegisterObject {
  String get userName => throw _privateConstructorUsedError;
  String get userEmail => throw _privateConstructorUsedError;
  String get userPhone => throw _privateConstructorUsedError;
  String get userSex => throw _privateConstructorUsedError;
  String get userPassword => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $RegisterObjectCopyWith<RegisterObject> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RegisterObjectCopyWith<$Res> {
  factory $RegisterObjectCopyWith(
          RegisterObject value, $Res Function(RegisterObject) then) =
      _$RegisterObjectCopyWithImpl<$Res>;
  $Res call(
      {String userName,
      String userEmail,
      String userPhone,
      String userSex,
      String userPassword});
}

/// @nodoc
class _$RegisterObjectCopyWithImpl<$Res>
    implements $RegisterObjectCopyWith<$Res> {
  _$RegisterObjectCopyWithImpl(this._value, this._then);

  final RegisterObject _value;
  // ignore: unused_field
  final $Res Function(RegisterObject) _then;

  @override
  $Res call({
    Object? userName = freezed,
    Object? userEmail = freezed,
    Object? userPhone = freezed,
    Object? userSex = freezed,
    Object? userPassword = freezed,
  }) {
    return _then(_value.copyWith(
      userName: userName == freezed
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      userEmail: userEmail == freezed
          ? _value.userEmail
          : userEmail // ignore: cast_nullable_to_non_nullable
              as String,
      userPhone: userPhone == freezed
          ? _value.userPhone
          : userPhone // ignore: cast_nullable_to_non_nullable
              as String,
      userSex: userSex == freezed
          ? _value.userSex
          : userSex // ignore: cast_nullable_to_non_nullable
              as String,
      userPassword: userPassword == freezed
          ? _value.userPassword
          : userPassword // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$RegisterObjectCopyWith<$Res>
    implements $RegisterObjectCopyWith<$Res> {
  factory _$RegisterObjectCopyWith(
          _RegisterObject value, $Res Function(_RegisterObject) then) =
      __$RegisterObjectCopyWithImpl<$Res>;
  @override
  $Res call(
      {String userName,
      String userEmail,
      String userPhone,
      String userSex,
      String userPassword});
}

/// @nodoc
class __$RegisterObjectCopyWithImpl<$Res>
    extends _$RegisterObjectCopyWithImpl<$Res>
    implements _$RegisterObjectCopyWith<$Res> {
  __$RegisterObjectCopyWithImpl(
      _RegisterObject _value, $Res Function(_RegisterObject) _then)
      : super(_value, (v) => _then(v as _RegisterObject));

  @override
  _RegisterObject get _value => super._value as _RegisterObject;

  @override
  $Res call({
    Object? userName = freezed,
    Object? userEmail = freezed,
    Object? userPhone = freezed,
    Object? userSex = freezed,
    Object? userPassword = freezed,
  }) {
    return _then(_RegisterObject(
      userName == freezed
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      userEmail == freezed
          ? _value.userEmail
          : userEmail // ignore: cast_nullable_to_non_nullable
              as String,
      userPhone == freezed
          ? _value.userPhone
          : userPhone // ignore: cast_nullable_to_non_nullable
              as String,
      userSex == freezed
          ? _value.userSex
          : userSex // ignore: cast_nullable_to_non_nullable
              as String,
      userPassword == freezed
          ? _value.userPassword
          : userPassword // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_RegisterObject implements _RegisterObject {
  _$_RegisterObject(this.userName, this.userEmail, this.userPhone, this.userSex,
      this.userPassword);

  @override
  final String userName;
  @override
  final String userEmail;
  @override
  final String userPhone;
  @override
  final String userSex;
  @override
  final String userPassword;

  @override
  String toString() {
    return 'RegisterObject(userName: $userName, userEmail: $userEmail, userPhone: $userPhone, userSex: $userSex, userPassword: $userPassword)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _RegisterObject &&
            (identical(other.userName, userName) ||
                const DeepCollectionEquality()
                    .equals(other.userName, userName)) &&
            (identical(other.userEmail, userEmail) ||
                const DeepCollectionEquality()
                    .equals(other.userEmail, userEmail)) &&
            (identical(other.userPhone, userPhone) ||
                const DeepCollectionEquality()
                    .equals(other.userPhone, userPhone)) &&
            (identical(other.userSex, userSex) ||
                const DeepCollectionEquality()
                    .equals(other.userSex, userSex)) &&
            (identical(other.userPassword, userPassword) ||
                const DeepCollectionEquality()
                    .equals(other.userPassword, userPassword)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(userName) ^
      const DeepCollectionEquality().hash(userEmail) ^
      const DeepCollectionEquality().hash(userPhone) ^
      const DeepCollectionEquality().hash(userSex) ^
      const DeepCollectionEquality().hash(userPassword);

  @JsonKey(ignore: true)
  @override
  _$RegisterObjectCopyWith<_RegisterObject> get copyWith =>
      __$RegisterObjectCopyWithImpl<_RegisterObject>(this, _$identity);
}

abstract class _RegisterObject implements RegisterObject {
  factory _RegisterObject(String userName, String userEmail, String userPhone,
      String userSex, String userPassword) = _$_RegisterObject;

  @override
  String get userName => throw _privateConstructorUsedError;
  @override
  String get userEmail => throw _privateConstructorUsedError;
  @override
  String get userPhone => throw _privateConstructorUsedError;
  @override
  String get userSex => throw _privateConstructorUsedError;
  @override
  String get userPassword => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$RegisterObjectCopyWith<_RegisterObject> get copyWith =>
      throw _privateConstructorUsedError;
}
