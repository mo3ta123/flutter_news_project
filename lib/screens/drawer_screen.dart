import 'package:flutter/material.dart';
import '/widgets/post_widget.dart';
import '/widgets/categorie_drawer_tile.dart';
import '/services/news_api.dart';

class DrawerScreen extends StatefulWidget {
  const DrawerScreen({Key? key}) : super(key: key);

  @override
  State<DrawerScreen> createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
  bool _loading = true;

  List<dynamic> _list = [];
  @override
  void initState() {
    super.initState();
  }

  void _onPressed(String categorie) {
    fetchData(categorie).then((value) {
      setState(() {
        if (value != null) {
          _loading = false;
          _list = value;
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.black),
          title: Text(
            'News app',
            style: Theme.of(context).textTheme.headline6,
          ),
          backgroundColor: Colors.white),
      drawer: Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        width: 230,
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            SizedBox(
              height: 60,
              child: DrawerHeader(
                decoration: const BoxDecoration(
                  color: Colors.white,
                ),
                child: Text(
                  'Categories',
                  style: Theme.of(context).textTheme.headline6,
                ),
              ),
            ),
            InkWell(
              onTap: () {
                _loading = true;
                _onPressed('business');
              },
              child: const DrawerTile(
                icon: Icon(
                  Icons.account_balance,
                  color: Colors.black,
                ),
                title: 'Business',
              ),
            ),
            InkWell(
              onTap: () {
                _loading = true;
                _onPressed('general');
              },
              child: const DrawerTile(
                icon: Icon(
                  Icons.account_tree,
                  color: Colors.black,
                ),
                title: 'General',
              ),
            ),
            InkWell(
              onTap: () {
                _loading = true;
                _onPressed('entertainment');
              },
              child: const DrawerTile(
                icon: Icon(
                  Icons.accessibility_new,
                  color: Colors.black,
                ),
                title: 'Entertainment',
              ),
            ),
            InkWell(
              onTap: () {
                _loading = true;
                _onPressed('health');
              },
              child: const DrawerTile(
                icon: Icon(
                  Icons.health_and_safety_outlined,
                  color: Colors.black,
                ),
                title: 'Health',
              ),
            ),
          ],
        ),
      ),
      body: (_loading)
          ? const Center(
              child: CircularProgressIndicator(
                color: Colors.black,
              ),
            )
          : ListView.builder(
              itemCount: _list.length,
              itemBuilder: ((context, index) {
                return PostTile(jsonMap: _list[index]);
              }),
            ),
    );
  }
}
