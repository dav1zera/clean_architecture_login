// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_store.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $HomeStore = BindInject(
  (i) => HomeStore(),
  isSingleton: true,
  isLazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeStore on _HomeStoreBase, Store {
  final _$adressAtom = Atom(name: '_HomeStoreBase.adress');

  @override
  AdressEntity? get adress {
    _$adressAtom.reportRead();
    return super.adress;
  }

  @override
  set adress(AdressEntity? value) {
    _$adressAtom.reportWrite(value, super.adress, () {
      super.adress = value;
    });
  }

  @override
  String toString() {
    return '''
adress: ${adress}
    ''';
  }
}
