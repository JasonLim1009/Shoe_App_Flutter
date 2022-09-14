import 'package:flutter/material.dart';
import 'package:untitled1/core/const.dart';
import 'package:untitled1/core/flutter_icons.dart';
import 'package:untitled1/models/shoe_model.dart';
import 'package:untitled1/pages/detail_page.dart';
import 'package:untitled1/widgets/app_clipper.dart';
import 'dart:math' as math;


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<ShoeModel> shoeList = ShoeModel.list;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Icon(
          FlutterIcons.menu,
          color: Colors.black,
        ),
      ),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                    'Categories',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 32,
                  ),
                ),
                IconButton(
                  onPressed: null,
                  icon: Icon(
                    FlutterIcons.search,
                    color: Colors.black26,
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 300,
            margin: EdgeInsets.symmetric(vertical: 16),
            child: ListView.builder(
                itemCount: shoeList.length,
                scrollDirection: Axis.horizontal,
                physics: BouncingScrollPhysics(),
                padding: EdgeInsets.symmetric(horizontal: 16),
                itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) => DetailPage(
                        shoeList[index],
                      ),
                    ),
                  );
                },
                child: Container(
                  width: 230,
                  margin: EdgeInsets.only(right: 16),
                  child: Stack(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(top: 25),
                        child: _buildBackground(index, 230),
                      ),
                      Positioned(
                        bottom: 130,
                        right: 10,
                        child: Hero(
                          tag: 'hero${shoeList[index].imgPath}',
                          child: Transform.rotate(
                            angle: -math.pi / 7,
                            child: Image(
                              width: 230,
                              image: AssetImage('assets/${shoeList[index].imgPath}'
                            ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
              },
            ),
          ),
          SizedBox(height: 16,),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                    'Just for you',
                  style: TextStyle(
                    color: Colors.black54,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'view all',
                  style: TextStyle(
                    color: AppColors.greenColor,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 24,),
          ...shoeList.map((data) {
            return GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => DetailPage(
                      data,
                    ),
                  ),
                );
              },
              child: Container(
                margin: EdgeInsets.only(left: 16, right: 16, bottom: 10),
                padding: EdgeInsets.symmetric(vertical: 16, horizontal: 24),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(25),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      spreadRadius: 1,
                      blurRadius: 10,
                    ),
                  ],
                ),
                child: Row(
                  children: <Widget>[
                    Image(
                      image: AssetImage('assets/${data.imgPath}'),
                      width: 100,
                      height: 60,
                    ),
                    SizedBox(width: 16,),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            width: MediaQuery.of(context).size.width * 4,
                            child: Text(
                                '${data.name}',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Text(
                              '${data.brand}',
                            style: TextStyle(
                              color: Colors.black38,
                              height: 1.5,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12.0),
                      child: Text(
                        '\$${data.price.toInt()}' + '\.00',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },),
        ],
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
          color: Colors.grey[200],
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              spreadRadius: 1,
              blurRadius: 10,
            ),
          ],
        ),
        child: BottomNavigationBar(
          selectedItemColor: AppColors.greenColor,
          unselectedItemColor: Colors.black26,
          currentIndex: 1,
          type: BottomNavigationBarType.fixed,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          backgroundColor: Colors.transparent,
          elevation: 0,
          items: [
          BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(FlutterIcons.compass),
              ),
              label: ''
          ),
          BottomNavigationBarItem(
              icon: Icon(
                  FlutterIcons.format_list_numbered),
              label: ''
          ),
          BottomNavigationBarItem(
              icon: Icon(
                  FlutterIcons.bag),
              label: ''
          ),
          BottomNavigationBarItem(
              icon: Icon(
                  FlutterIcons.person_outline),
              label: ''
          ),
        ],
        ),
      ),
    );
  }

  Widget _buildBackground(int index, double width) {
    return ClipPath(
                clipper: AppClipper(
                    cornerSize: 25,
                    diagonalHeight: 100,
                    roundedBottom: false,
                ),
                child: Container(
                  color: shoeList[index].color,
                  width: 230,
                  child: Stack(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(top: 20.0),
                              child: Icon(
                                shoeList[index].brand == 'Nike'
                                    ? FlutterIcons.done
                                    // ? FlutterIcons.canadian_maple_leaf
                                    : FlutterIcons.stars,
                                size: 30,
                                color: Colors.white,
                              ),
                            ),
                            Expanded(child: SizedBox()),
                            Container(
                              width: 125,
                              child: Text(
                                '${shoeList[index].name}',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            Text(
                              '\$' + '${shoeList[index].price}' + '\0',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 16,),
                          ],
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            color: AppColors.greenColor,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                            ),
                          ),
                          child: Center(
                            child: Icon(
                              FlutterIcons.add,
                              color: Colors.red,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
  }
}
