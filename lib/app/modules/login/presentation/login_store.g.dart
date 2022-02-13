// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_store.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $LoginStore = BindInject(
  (i) => LoginStore(),
  isSingleton: true,
  isLazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$LoginStore on _LoginStoreBase, Store {
  final _$statusDescriptionAtom =
      Atom(name: '_LoginStoreBase.statusDescription');

  @override
  String? get statusDescription {
    _$statusDescriptionAtom.reportRead();
    return super.statusDescription;
  }

  @override
  set statusDescription(String? value) {
    _$statusDescriptionAtom.reportWrite(value, super.statusDescription, () {
      super.statusDescription = value;
    });
  }

  @override
  String toString() {
    return '''
statusDescription: ${statusDescription}
    ''';
  }
}
