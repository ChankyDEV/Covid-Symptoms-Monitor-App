// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'logged_in_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$LoggedInStateTearOff {
  const _$LoggedInStateTearOff();

// ignore: unused_element
  Unauthenticated unauthenticated() {
    return const Unauthenticated();
  }

// ignore: unused_element
  Login login(User user) {
    return Login(
      user,
    );
  }

// ignore: unused_element
  Register register(User user) {
    return Register(
      user,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $LoggedInState = _$LoggedInStateTearOff();

/// @nodoc
mixin _$LoggedInState {
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult unauthenticated(),
    @required TResult login(User user),
    @required TResult register(User user),
  });
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult unauthenticated(),
    TResult login(User user),
    TResult register(User user),
    @required TResult orElse(),
  });
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult unauthenticated(Unauthenticated value),
    @required TResult login(Login value),
    @required TResult register(Register value),
  });
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult unauthenticated(Unauthenticated value),
    TResult login(Login value),
    TResult register(Register value),
    @required TResult orElse(),
  });
}

/// @nodoc
abstract class $LoggedInStateCopyWith<$Res> {
  factory $LoggedInStateCopyWith(
          LoggedInState value, $Res Function(LoggedInState) then) =
      _$LoggedInStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$LoggedInStateCopyWithImpl<$Res>
    implements $LoggedInStateCopyWith<$Res> {
  _$LoggedInStateCopyWithImpl(this._value, this._then);

  final LoggedInState _value;
  // ignore: unused_field
  final $Res Function(LoggedInState) _then;
}

/// @nodoc
abstract class $UnauthenticatedCopyWith<$Res> {
  factory $UnauthenticatedCopyWith(
          Unauthenticated value, $Res Function(Unauthenticated) then) =
      _$UnauthenticatedCopyWithImpl<$Res>;
}

/// @nodoc
class _$UnauthenticatedCopyWithImpl<$Res>
    extends _$LoggedInStateCopyWithImpl<$Res>
    implements $UnauthenticatedCopyWith<$Res> {
  _$UnauthenticatedCopyWithImpl(
      Unauthenticated _value, $Res Function(Unauthenticated) _then)
      : super(_value, (v) => _then(v as Unauthenticated));

  @override
  Unauthenticated get _value => super._value as Unauthenticated;
}

/// @nodoc
class _$Unauthenticated implements Unauthenticated {
  const _$Unauthenticated();

  @override
  String toString() {
    return 'LoggedInState.unauthenticated()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is Unauthenticated);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult unauthenticated(),
    @required TResult login(User user),
    @required TResult register(User user),
  }) {
    assert(unauthenticated != null);
    assert(login != null);
    assert(register != null);
    return unauthenticated();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult unauthenticated(),
    TResult login(User user),
    TResult register(User user),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (unauthenticated != null) {
      return unauthenticated();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult unauthenticated(Unauthenticated value),
    @required TResult login(Login value),
    @required TResult register(Register value),
  }) {
    assert(unauthenticated != null);
    assert(login != null);
    assert(register != null);
    return unauthenticated(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult unauthenticated(Unauthenticated value),
    TResult login(Login value),
    TResult register(Register value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (unauthenticated != null) {
      return unauthenticated(this);
    }
    return orElse();
  }
}

abstract class Unauthenticated implements LoggedInState {
  const factory Unauthenticated() = _$Unauthenticated;
}

/// @nodoc
abstract class $LoginCopyWith<$Res> {
  factory $LoginCopyWith(Login value, $Res Function(Login) then) =
      _$LoginCopyWithImpl<$Res>;
  $Res call({User user});
}

/// @nodoc
class _$LoginCopyWithImpl<$Res> extends _$LoggedInStateCopyWithImpl<$Res>
    implements $LoginCopyWith<$Res> {
  _$LoginCopyWithImpl(Login _value, $Res Function(Login) _then)
      : super(_value, (v) => _then(v as Login));

  @override
  Login get _value => super._value as Login;

  @override
  $Res call({
    Object user = freezed,
  }) {
    return _then(Login(
      user == freezed ? _value.user : user as User,
    ));
  }
}

/// @nodoc
class _$Login implements Login {
  const _$Login(this.user) : assert(user != null);

  @override
  final User user;

  @override
  String toString() {
    return 'LoggedInState.login(user: $user)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is Login &&
            (identical(other.user, user) ||
                const DeepCollectionEquality().equals(other.user, user)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(user);

  @JsonKey(ignore: true)
  @override
  $LoginCopyWith<Login> get copyWith =>
      _$LoginCopyWithImpl<Login>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult unauthenticated(),
    @required TResult login(User user),
    @required TResult register(User user),
  }) {
    assert(unauthenticated != null);
    assert(login != null);
    assert(register != null);
    return login(user);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult unauthenticated(),
    TResult login(User user),
    TResult register(User user),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (login != null) {
      return login(user);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult unauthenticated(Unauthenticated value),
    @required TResult login(Login value),
    @required TResult register(Register value),
  }) {
    assert(unauthenticated != null);
    assert(login != null);
    assert(register != null);
    return login(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult unauthenticated(Unauthenticated value),
    TResult login(Login value),
    TResult register(Register value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (login != null) {
      return login(this);
    }
    return orElse();
  }
}

abstract class Login implements LoggedInState {
  const factory Login(User user) = _$Login;

  User get user;
  @JsonKey(ignore: true)
  $LoginCopyWith<Login> get copyWith;
}

/// @nodoc
abstract class $RegisterCopyWith<$Res> {
  factory $RegisterCopyWith(Register value, $Res Function(Register) then) =
      _$RegisterCopyWithImpl<$Res>;
  $Res call({User user});
}

/// @nodoc
class _$RegisterCopyWithImpl<$Res> extends _$LoggedInStateCopyWithImpl<$Res>
    implements $RegisterCopyWith<$Res> {
  _$RegisterCopyWithImpl(Register _value, $Res Function(Register) _then)
      : super(_value, (v) => _then(v as Register));

  @override
  Register get _value => super._value as Register;

  @override
  $Res call({
    Object user = freezed,
  }) {
    return _then(Register(
      user == freezed ? _value.user : user as User,
    ));
  }
}

/// @nodoc
class _$Register implements Register {
  const _$Register(this.user) : assert(user != null);

  @override
  final User user;

  @override
  String toString() {
    return 'LoggedInState.register(user: $user)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is Register &&
            (identical(other.user, user) ||
                const DeepCollectionEquality().equals(other.user, user)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(user);

  @JsonKey(ignore: true)
  @override
  $RegisterCopyWith<Register> get copyWith =>
      _$RegisterCopyWithImpl<Register>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult unauthenticated(),
    @required TResult login(User user),
    @required TResult register(User user),
  }) {
    assert(unauthenticated != null);
    assert(login != null);
    assert(register != null);
    return register(user);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult unauthenticated(),
    TResult login(User user),
    TResult register(User user),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (register != null) {
      return register(user);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult unauthenticated(Unauthenticated value),
    @required TResult login(Login value),
    @required TResult register(Register value),
  }) {
    assert(unauthenticated != null);
    assert(login != null);
    assert(register != null);
    return register(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult unauthenticated(Unauthenticated value),
    TResult login(Login value),
    TResult register(Register value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (register != null) {
      return register(this);
    }
    return orElse();
  }
}

abstract class Register implements LoggedInState {
  const factory Register(User user) = _$Register;

  User get user;
  @JsonKey(ignore: true)
  $RegisterCopyWith<Register> get copyWith;
}
