import 'package:dio/dio.dart';
import 'package:giphy_med365/modules/home/model/gif_model.dart';


class HomeRepository {

  Future<GifModel> getGifs({int offset}) async {
    try {
      var url = 'https://api.giphy.com/v1/gifs/trending?api_key=tnEwjarYoLbuiszkvNGrb3My0tqPHXi0&limit=20&offset=$offset&rating=G';
      Response response = await Dio().get(url);

      return GifModel.fromJson(response.data);
    } catch (e) {
      throw e;
    }
  }
  Future<GifModel> searchGifs({int offset, String search}) async {
    try {
      var url = 'https://api.giphy.com/v1/gifs/search?api_key=tnEwjarYoLbuiszkvNGrb3My0tqPHXi0&q=$search&limit=20&offset=$offset&rating=g&lang=pt';
      Response response = await Dio().get(url);

      return GifModel.fromJson(response.data);
    } catch (e) {
      throw e;
    }
  }

  Future<Null> saveGifs({String name, String url}) async {
    try {
      var url = 'URL para salvar gif';
      await Dio().post(url, data:({"name": name, "url": url}));
    } catch (e) {
      throw e;
    }
  }

  Future<Null> editGifs({String name, String url}) async {
    try {
      var url = 'URL para salvar gif';
      await Dio().post(url, data:({"name": name, "url": url}));
    } catch (e) {
      throw e;
    }
  }

  Future<Null> deleteGifs({String url}) async {
    try {
      var url = 'URL para salvar gif';
      await Dio().delete(url, data:({"url": url}));
    } catch (e) {
      throw e;
    }
  }
}