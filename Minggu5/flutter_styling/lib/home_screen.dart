import 'package:flutter/material.dart';
import 'package:flutter_styling/folder_screen.dart';
import 'package:flutter_styling/recent_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var _pageIndex = 0;

  final _pages = const [FolderScreen(), RecentScreen()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_pageIndex],
      appBar: AppBar(
        title: const Text('Drawer Styling'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const UserAccountsDrawerHeader(
              accountName: Text('Faruk Maulana'),
              accountEmail: Text('farukmicros@gmail.com'),
              currentAccountPicture: CircleAvatar(
                backgroundImage:
                    NetworkImage('https://picsum.photos/200?random=1'),
              ),
              otherAccountsPictures: [
                CircleAvatar(
                  backgroundImage:
                      NetworkImage('https://picsum.photos/200?random=2'),
                ),
                CircleAvatar(
                  backgroundImage:
                      NetworkImage('https://picsum.photos/200?random=3'),
                ),
              ],
            ),
            ListTile(
              selected: _pageIndex == 0 ? true : false,
              leading: const Icon(Icons.folder),
              title: const Text(
                'My file',
              ),
              onTap: () {
                setState(() => _pageIndex = 0);
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.group),
              title: const Text(
                'Shared with me',
              ),
              onTap: () {},
            ),
            ListTile(
              selected: _pageIndex == 1 ? true : false,
              leading: const Icon(Icons.access_time),
              title: const Text(
                'Recent',
              ),
              onTap: () {
                setState(() => _pageIndex = 1);
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.delete),
              title: const Text(
                'Trash',
              ),
              onTap: () {},
            ),
            const Divider(),
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Labels',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.black54,
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.bookmark),
              title: const Text('Family'),
              onTap: () {},
            )
          ],
        ),
      ),
    );
  }
}
