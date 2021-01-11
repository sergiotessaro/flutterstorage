// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'firebase.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$FireHandler on _FireHandlerBase, Store {
  final _$loadingAtom = Atom(name: '_FireHandlerBase.loading');

  @override
  bool get loading {
    _$loadingAtom.reportRead();
    return super.loading;
  }

  @override
  set loading(bool value) {
    _$loadingAtom.reportWrite(value, super.loading, () {
      super.loading = value;
    });
  }

  final _$imagensThumbListAtom =
      Atom(name: '_FireHandlerBase.imagensThumbList');

  @override
  ObservableList<Map<String, dynamic>> get imagensThumbList {
    _$imagensThumbListAtom.reportRead();
    return super.imagensThumbList;
  }

  @override
  set imagensThumbList(ObservableList<Map<String, dynamic>> value) {
    _$imagensThumbListAtom.reportWrite(value, super.imagensThumbList, () {
      super.imagensThumbList = value;
    });
  }

  final _$imagensListAtom = Atom(name: '_FireHandlerBase.imagensList');

  @override
  ObservableList<Map<String, dynamic>> get imagensList {
    _$imagensListAtom.reportRead();
    return super.imagensList;
  }

  @override
  set imagensList(ObservableList<Map<String, dynamic>> value) {
    _$imagensListAtom.reportWrite(value, super.imagensList, () {
      super.imagensList = value;
    });
  }

  @override
  String toString() {
    return '''
loading: ${loading},
imagensThumbList: ${imagensThumbList},
imagensList: ${imagensList}
    ''';
  }
}
