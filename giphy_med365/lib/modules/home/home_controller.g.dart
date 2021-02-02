// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeController on _HomeBase, Store {
  final _$gifsAtom = Atom(name: '_HomeBase.gifs');

  @override
  GifModel get gifs {
    _$gifsAtom.reportRead();
    return super.gifs;
  }

  @override
  set gifs(GifModel value) {
    _$gifsAtom.reportWrite(value, super.gifs, () {
      super.gifs = value;
    });
  }

  final _$isLoadingAtom = Atom(name: '_HomeBase.isLoading');

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  final _$getGifAsyncAction = AsyncAction('_HomeBase.getGif');

  @override
  Future<Null> getGif() {
    return _$getGifAsyncAction.run(() => super.getGif());
  }

  final _$loadMoreGifsAsyncAction = AsyncAction('_HomeBase.loadMoreGifs');

  @override
  Future<Null> loadMoreGifs() {
    return _$loadMoreGifsAsyncAction.run(() => super.loadMoreGifs());
  }

  final _$searchGifsAsyncAction = AsyncAction('_HomeBase.searchGifs');

  @override
  Future<Null> searchGifs(String text) {
    return _$searchGifsAsyncAction.run(() => super.searchGifs(text));
  }

  final _$saveGifsAsyncAction = AsyncAction('_HomeBase.saveGifs');

  @override
  Future<Null> saveGifs(String name, String url) {
    return _$saveGifsAsyncAction.run(() => super.saveGifs(name, url));
  }

  final _$editGifsAsyncAction = AsyncAction('_HomeBase.editGifs');

  @override
  Future<Null> editGifs(String name, String url) {
    return _$editGifsAsyncAction.run(() => super.editGifs(name, url));
  }

  final _$deleteGifsAsyncAction = AsyncAction('_HomeBase.deleteGifs');

  @override
  Future<Null> deleteGifs(String url) {
    return _$deleteGifsAsyncAction.run(() => super.deleteGifs(url));
  }

  @override
  String toString() {
    return '''
gifs: ${gifs},
isLoading: ${isLoading}
    ''';
  }
}
