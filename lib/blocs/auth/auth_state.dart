class AuthState {
  String email;
  String password;
  String passwordRe;
  bool isCorrect;
  bool canGo;
  String id;
  String errorText;

  AuthState(
      {this.email,
      this.password,
      this.passwordRe,
      this.isCorrect,
      this.canGo,
      this.id,
      this.errorText});

  factory AuthState.empty() {
    return AuthState(
        email: "",
        password: "",
        isCorrect: false,
        canGo: false,
        id: "",
        errorText: "",
        passwordRe: "");
  }

  AuthState copyWith(
      {String email,
      String password,
      String passwordRe,
      bool isCorrect,
      bool canGo,
      bool errorLogin,
      String id,
      String errorText}) {
    return AuthState(
        email: email ?? this.email,
        password: password ?? this.password,
        passwordRe: passwordRe ?? this.passwordRe,
        isCorrect: isCorrect ?? this.isCorrect,
        canGo: canGo ?? this.canGo,
        id: id ?? this.id,
        errorText: errorText ?? this.errorText);
  }
}
