// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$RegisterController on _RegisterController, Store {
  late final _$statusAtom =
      Atom(name: '_RegisterController.status', context: context);

  @override
  int? get status {
    _$statusAtom.reportRead();
    return super.status;
  }

  @override
  set status(int? value) {
    _$statusAtom.reportWrite(value, super.status, () {
      super.status = value;
    });
  }

  late final _$mensagemAtom =
      Atom(name: '_RegisterController.mensagem', context: context);

  @override
  String get mensagem {
    _$mensagemAtom.reportRead();
    return super.mensagem;
  }

  @override
  set mensagem(String value) {
    _$mensagemAtom.reportWrite(value, super.mensagem, () {
      super.mensagem = value;
    });
  }

  late final _$onSubmittedAsyncAction =
      AsyncAction('_RegisterController.onSubmitted', context: context);

  @override
  Future<int?> onSubmitted(
      {required dynamic login,
      required dynamic email,
      required dynamic phone,
      required dynamic senha,
      required dynamic confirmaSenha}) {
    return _$onSubmittedAsyncAction.run(() => super.onSubmitted(
        login: login,
        email: email,
        phone: phone,
        senha: senha,
        confirmaSenha: confirmaSenha));
  }

  late final _$_RegisterControllerActionController =
      ActionController(name: '_RegisterController', context: context);

  @override
  dynamic setMensagem() {
    final _$actionInfo = _$_RegisterControllerActionController.startAction(
        name: '_RegisterController.setMensagem');
    try {
      return super.setMensagem();
    } finally {
      _$_RegisterControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setMensagemNull() {
    final _$actionInfo = _$_RegisterControllerActionController.startAction(
        name: '_RegisterController.setMensagemNull');
    try {
      return super.setMensagemNull();
    } finally {
      _$_RegisterControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
status: ${status},
mensagem: ${mensagem}
    ''';
  }
}
