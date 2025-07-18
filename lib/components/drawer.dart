import 'package:flutter/material.dart';
import '../galler.dart';
import '../list.dart';
import 'package:get/get.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({super.key});

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(color: Colors.teal),
            child: Text('Drawer Header'),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Home'),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, '/');
            },
          ),
          ListTile(
            leading: const Icon(Icons.photo_library),
            title: const Text('Gallery'),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => GalleryPage(
                    imagePaths: [
                      'assets/images/1.jpg',
                      'assets/images/2.jpg',
                      'assets/images/3.jpg',
                      'assets/images/4.jpg',
                      'assets/images/5.jpg',
                      'assets/images/6.jpg',
                      'assets/images/7.jpg',
                      'assets/images/8.jpg',
                      'assets/images/9.jpg',
                    ],
                  ),
                ),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.list),
            title: const Text('List'),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ListPage()),
              );
            },
          ),
        ],
      ),
    );
  }
}
