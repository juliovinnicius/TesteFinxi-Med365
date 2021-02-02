import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:giphy_med365/modules/home/home_controller.dart';
import 'package:giphy_med365/modules/home/home_module.dart';
import 'package:giphy_med365/shared/pages/gif_page.dart';
import 'package:responsive_widgets/responsive_widgets.dart';
import 'package:transparent_image/transparent_image.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomeController controller = HomeModule.to.bloc<HomeController>();

  ScrollController scrollController = ScrollController();
  TextEditingController textController = TextEditingController();

  @override
  void initState() {
    super.initState();
    scrollController.addListener(() async {
      if (scrollController.offset ==
          scrollController.position.maxScrollExtent) {
        await controller.loadMoreGifs();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) => controller.isBusy
          ? Scaffold(
              backgroundColor: Colors.black,
              body: Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                  strokeWidth: 5.0,
                ),
              ))
          : Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.black,
                title: Image.network(
                    "https://developers.giphy.com/static/img/dev-logo-lg.7404c00322a8.gif"),
                centerTitle: true,
              ),
              backgroundColor: Colors.black,
              body: ContainerResponsive(
                child: Column(
                  children: [
                    TextField(
                      controller: textController,
                      decoration: InputDecoration(
                        labelText: "Pesquise aqui",
                        labelStyle: TextStyle(color: Colors.white),
                        border: OutlineInputBorder(),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white)),
                      ),
                      style: TextStyle(color: Colors.white, fontSize: 18.0),
                      textAlign: TextAlign.center,
                      onSubmitted: (text) {
                        controller.searchGifs(text);
                      },
                    ),
                    SizedBox(height: 10,),
                    Expanded(
                      flex: 1,
                      child: GridView.builder(
                        controller: scrollController,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 10.0,
                          mainAxisSpacing: 10.0,
                        ),
                        itemCount: controller.gifs.data.length,
                        itemBuilder: (context, i) {
                          return GestureDetector(
                            child: FadeInImage.memoryNetwork(
                              placeholder: kTransparentImage,
                              image: controller
                                  .gifs.data[i].images.fixedHeight.url,
                              //snapshot.data["data"][index]["images"]["fixed_height"]["url"],
                              height: 300.0,
                              fit: BoxFit.cover,
                            ),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => GifPage(controller.gifs.data[i])),
                              );
                            },
                          );
                        },
                      ),
                    ),
                    controller.isLoading
                        ? Center(
                            child: Container(
                              margin: EdgeInsets.only(top: 10, bottom: 10),
                              child: CircularProgressIndicator(
                                valueColor:
                                    AlwaysStoppedAnimation<Color>(Colors.white),
                              ),
                            ),
                          )
                        : Container()
                  ],
                ),
              )),
    );
  }
}
