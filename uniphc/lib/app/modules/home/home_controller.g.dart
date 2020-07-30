// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeController on _HomeControllerBase, Store {
  final _$listadeAtividadesAtom =
      Atom(name: '_HomeControllerBase.listadeAtividades');

  @override
  List<AtividadeModel> get listadeAtividades {
    _$listadeAtividadesAtom.reportRead();
    return super.listadeAtividades;
  }

  @override
  set listadeAtividades(List<AtividadeModel> value) {
    _$listadeAtividadesAtom.reportWrite(value, super.listadeAtividades, () {
      super.listadeAtividades = value;
    });
  }

  @override
  String toString() {
    return '''
listadeAtividades: ${listadeAtividades}
    ''';
  }
}
