import 'package:flutter/material.dart';

List<Item> item = [
  Item(
      imgUrl: "https://sample-videos.com/img/Sample-jpg-image-50kb.jpg",
      title: "wallpaper"),
  Item(
      imgUrl: "https://sample-videos.com/img/Sample-jpg-image-50kb.jpg",
      title: "wallpaper"),
  Item(
      imgUrl: "https://sample-videos.com/img/Sample-jpg-image-50kb.jpg",
      title: "wallpaper"),
  Item(
      imgUrl: "https://sample-videos.com/img/Sample-jpg-image-50kb.jpg",
      title: "wallpaper"),
  Item(
      imgUrl: "https://sample-videos.com/img/Sample-jpg-image-50kb.jpg",
      title: "wallpaper"),
  Item(
      imgUrl: "https://sample-videos.com/img/Sample-jpg-image-50kb.jpg",
      title: "wallpaper"),
  Item(
      imgUrl: "https://sample-videos.com/img/Sample-jpg-image-50kb.jpg",
      title: "wallpaper"),
];

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // static RectTween _createRectTween(Rect begin, Rect end) {
  //   return QuadraticRectTween(begin: begin, end: end);
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Animation'),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 200,
          ),
          SizedBox(
            height: 300,
            child: GridView.builder(
              itemCount: item.length,
              itemBuilder: (_, index) {
                return Container(
                  margin: EdgeInsets.symmetric(vertical: 10),
                  child: ListTile(
                    minVerticalPadding: 10.0,
                    onTap: () {
                      Navigator.push(
                          context,
                          PageRouteBuilder(
                            transitionDuration: Duration(seconds: 1),
                            pageBuilder: (BuildContext context,
                                Animation<double> animation,
                                Animation<double> secondaryAnimation) {
                              return Description(
                                imgUrl: item[index].imgUrl,
                                tag: index,
                              );
                            },
                            // builder: (context) {
                            // return Description(
                            //   imgUrl: item[index].imgUrl,
                            //   tag: index,
                            // );
                            //}
                          ));
                    },
                    title: Text(item[index].title),
                    leading: Hero(
                      tag: index,
                      // createRectTween: _createRectTween,
                      child: Image.network(item[index].imgUrl),
                    ),
                  ),
                );
              },
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  crossAxisSpacing: 4.0,
                  mainAxisSpacing: 4.0),
            ),
          ),
        ],
      ),
    );
  }
}

class Description extends StatefulWidget {
  final imgUrl;
  final tag;
  Description({required this.imgUrl, this.tag});

  @override
  _DescriptionState createState() => _DescriptionState();
}

class _DescriptionState extends State<Description> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Card(
              child: Container(
                height: 100,
                width: 100,
                child: Hero(
                  tag: widget.tag,
                  child: Image.network(widget.imgUrl),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Item {
  final imgUrl;
  final title;
  Item({this.title, this.imgUrl});
}
