import 'package:get/get.dart';
import 'package:giphy_med365/modules/home/home_repository.dart';
import 'package:giphy_med365/modules/home/model/gif_model.dart';
import 'package:giphy_med365/shared/controllers/controller_base.dart';
import 'package:mobx/mobx.dart';

part 'home_controller.g.dart';

class HomeController = _HomeBase with _$HomeController;

abstract class _HomeBase extends ControllerBase with Store {

  HomeRepository repo = HomeRepository();

  @observable
  GifModel gifs;

  @observable
  bool isLoading = false;

  int offset = 0;


  _HomeBase(){
    getGif();
  }

  @action
  Future<Null> getGif() async {
    try {
      if (isBusy) return;

      isBusy = true;

      gifs = await repo.getGifs(offset: offset);
    } catch (e) {
      rethrow;
    } finally {
      isBusy = false;
    }
  }

  @action
  Future<Null> loadMoreGifs() async {
    try {

      offset += 20;
      isLoading = true;

      GifModel moreGifs = await repo.getGifs(offset: offset);

      gifs.data.addAll(moreGifs.data);
    } catch (e) {
      rethrow;
    } finally {
      isBusy = false;
      isLoading = false;
    }
  }

  @action
  Future<Null> searchGifs(String text) async {
    try {
      if (isBusy) return;

      isBusy = true;
      offset = 0;

      text == null || text.isEmpty
          ? gifs = await repo.getGifs(offset: offset)
          : gifs = await repo.searchGifs(offset: offset, search: text);
    } catch (e) {
      rethrow;
    } finally {
      isBusy = false;
      isLoading = false;
    }
  }

  @action
  Future<Null> saveGifs(String name, String url) async {
    try {
      if (isBusy) return;

      isBusy = true;
      offset = 0;

      gifs = await repo.saveGifs(name: name, url: url);
    } catch (e) {
      rethrow;
    } finally {
      isBusy = false;
      isLoading = false;
    }
  }

  @action
  Future<Null> editGifs(String name, String url) async {
    try {
      if (isBusy) return;

      isBusy = true;
      offset = 0;

      gifs = await repo.editGifs(name: name, url: url);
    } catch (e) {
      rethrow;
    } finally {
      isBusy = false;
      isLoading = false;
    }
  }

  @action
  Future<Null> deleteGifs(String url) async {
    try {
      if (isBusy) return;

      isBusy = true;
      offset = 0;

      gifs = await repo.deleteGifs(url: url);
    } catch (e) {
      rethrow;
    } finally {
      isBusy = false;
      isLoading = false;
    }
  }
}
