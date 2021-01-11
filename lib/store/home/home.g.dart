// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeController on _HomeControllerBase, Store {
  final _$listaImagensAtom = Atom(name: '_HomeControllerBase.listaImagens');

  @override
  ObservableList<String> get listaImagens {
    _$listaImagensAtom.reportRead();
    return super.listaImagens;
  }

  @override
  set listaImagens(ObservableList<String> value) {
    _$listaImagensAtom.reportWrite(value, super.listaImagens, () {
      super.listaImagens = value;
    });
  }

  final _$fileAtom = Atom(name: '_HomeControllerBase.file');

  @override
  String get file {
    _$fileAtom.reportRead();
    return super.file;
  }

  @override
  set file(String value) {
    _$fileAtom.reportWrite(value, super.file, () {
      super.file = value;
    });
  }

  final _$_fileChangeAtom = Atom(name: '_HomeControllerBase._fileChange');

  @override
  bool get _fileChange {
    _$_fileChangeAtom.reportRead();
    return super._fileChange;
  }

  @override
  set _fileChange(bool value) {
    _$_fileChangeAtom.reportWrite(value, super._fileChange, () {
      super._fileChange = value;
    });
  }

  final _$getImageAsyncAction = AsyncAction('_HomeControllerBase.getImage');

  @override
  Future<dynamic> getImage(BuildContext context) {
    return _$getImageAsyncAction.run(() => super.getImage(context));
  }

  final _$getImageGalleryAsyncAction =
      AsyncAction('_HomeControllerBase.getImageGallery');

  @override
  Future<dynamic> getImageGallery(BuildContext context) {
    return _$getImageGalleryAsyncAction
        .run(() => super.getImageGallery(context));
  }

  @override
  String toString() {
    return '''
listaImagens: ${listaImagens},
file: ${file}
    ''';
  }
}
