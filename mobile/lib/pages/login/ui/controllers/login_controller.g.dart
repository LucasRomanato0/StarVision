// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$LoginController on _LoginController, Store {
  late final _$statusAtom =
      Atom(name: '_LoginController.status', context: context);

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
      Atom(name: '_LoginController.mensagem', context: context);

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

  late final _$mensagemNullAtom =
      Atom(name: '_LoginController.mensagemNull', context: context);

  @override
  String get mensagemNull {
    _$mensagemNullAtom.reportRead();
    return super.mensagemNull;
  }

  @override
  set mensagemNull(String value) {
    _$mensagemNullAtom.reportWrite(value, super.mensagemNull, () {
      super.mensagemNull = value;
    });
  }

  late final _$onSubmittedAsyncAction =
      AsyncAction('_LoginController.onSubmitted', context: context);

  @override
  Future<int?> onSubmitted(
      {required dynamic email, required dynamic password}) {
    return _$onSubmittedAsyncAction
        .run(() => super.onSubmitted(email: email, password: password));
  }

  late final _$_LoginControllerActionController =
      ActionController(name: '_LoginController', context: context);

  @override
  dynamic setMensagem() {
    final _$actionInfo = _$_LoginControllerActionController.startAction(
        name: '_LoginController.setMensagem');
    try {
      return super.setMensagem();
    } finally {
      _$_LoginControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setMensagemNull() {
    final _$actionInfo = _$_LoginControllerActionController.startAction(
        name: '_LoginController.setMensagemNull');
    try {
      return super.setMensagemNull();
    } finally {
      _$_LoginControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
status: ${status},
mensagem: ${mensagem},
mensagemNull: ${mensagemNull}
    ''';
  }
}
