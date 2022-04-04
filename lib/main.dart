import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BelajarAppBar(),
    );
  }
}

class BelajarAppBar extends StatelessWidget {
  final List image = [
    Image.network('https://i.ytimg.com/vi/aPrXjzst6Ew/movieposter_en.jpg'),
    Image.network('https://static1.colliderimages.com/wordpress/wp-content/uploads/2022/01/The-Best-Movie-Franchises-To-Binge-Watch.jpg'),
    Image.network('https://cdn.hyprop.co.za/movies/images/5618/5618-1-3-3-1637863988.jpg?w=493.5&webp'),
  ];
  final List title = [
    'Venom',
    'Avengers End Game',
    'Spider Man No Way Home',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: 2,
        child: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                expandedHeight: 200.0,
                floating: false,
                pinned: true,
                flexibleSpace: FlexibleSpaceBar(
                  centerTitle: true,
                  title: Text("Movies APP",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                      )),
                  background: Image(
                    image: AssetImage('assets/images/movies.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SliverPersistentHeader(
                pinned: true,
                delegate: _SliverAppBarDelegate(
                  TabBar(
                    labelColor: Colors.black87,
                    unselectedLabelColor: Colors.grey,
                    tabs: [
                      new Tab(icon: new Icon(Icons.link), text: "Links"),
                      new Tab(icon: new Icon(Icons.collections), text: "Gallery"),
                    ],
                  ),
                ),
              ),
            ];
          },
          body: Center(
              child: TabBarView(children: [
            Icon(Icons.flight, size: 350),
            ListView.builder(
              itemBuilder: (context, index) {
                return Container(
                    margin: EdgeInsets.all(18),
                    child: Card(
                        child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        ClipRRect(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(8.0),
                              topRight: Radius.circular(8.0),
                            ),
                            child: image[index]),
                        ListTile(
                            title: Text(
                          title[index],
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                        ))
                      ],
                    )));
              },
              itemCount: image.length,
            )
            // Icon(Icons.directions_car, size: 350),
          ])),
        ),
      ),
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate(this._tabBar);

  final TabBar _tabBar;

  @override
  double get minExtent => _tabBar.preferredSize.height;
  @override
  double get maxExtent => _tabBar.preferredSize.height;

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return new Container(
      child: _tabBar,
    );
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return false;
  }
}
