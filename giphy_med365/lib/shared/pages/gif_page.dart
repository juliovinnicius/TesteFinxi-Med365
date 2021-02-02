import 'package:flutter/material.dart';
import 'package:giphy_med365/modules/home/home_controller.dart';
import 'package:giphy_med365/modules/home/home_module.dart';
import 'package:giphy_med365/modules/home/model/gif_model.dart';

class GifPage extends StatelessWidget {

  Data gifData;
  final HomeController controller = HomeModule.to.bloc<HomeController>();

  GifPage( this.gifData );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
        title: Text(
          gifData.title,
          style: TextStyle(
            color: Colors.white
          ),
        ),
        backgroundColor: Colors.black,
        actions: <Widget>[
          IconButton(
            icon: Icon( Icons.share ),
            onPressed: (){},
          ),
        ],
      ),
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Image.network(gifData.images.fixedHeight.url),
          ),
          SizedBox(height: 20,),
          Container(
            width: 125,
            child: RaisedButton(
                color: Colors.white,
                onPressed: () async{
                  await controller.saveGifs(gifData.title, gifData.images.fixedHeight.url);
                },
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                    side: BorderSide(
                        color: Colors.white
                    )),
                child: Text(
                  'Salvar',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                  ),
                )
            ),
          ),
          Container(
            width: 125,
            child: RaisedButton(
                color: Colors.white,
                onPressed: () async{
                  await controller.editGifs(gifData.title, gifData.images.fixedHeight.url);
                },
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                    side: BorderSide(
                        color: Colors.white
                    )),
                child: Text(
                  'Editar',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                  ),
                )
            ),
          ),
          Container(
            width: 125,
            child: RaisedButton(
              color: Colors.red,
              onPressed: () async{
                await controller.deleteGifs(gifData.images.fixedHeight.url);
              },
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                  side: BorderSide(
                      color: Colors.red
                  )),
              child: Text(
                'Deletar',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                ),
              )
              ),
            ),
        ],
      )
      // Center(
      //   child: Image.network(gifData.images.fixedHeight.url),
      //   //_gifData["images"]["fixed_height"]["url"]
      // ),
    );
  }
}