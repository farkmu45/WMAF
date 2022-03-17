import 'package:flutter/material.dart';
import 'package:test1/chat_model.dart';
import 'package:test1/drawer_list_tile.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Telegram'),
        actions: const [Icon(Icons.search)],
      ),
      drawer: Drawer(
        child: ListView(
          padding: const EdgeInsets.all(0.0),
          children: const [
            UserAccountsDrawerHeader(
              accountName: Text('Faruk Maulana'),
              accountEmail: Text('farukmicros@gmail.com'),
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage('assets/images/user_profile.jpg'),
              ),
            ),
            DrawerListTile(
              iconData: Icons.group,
              title: 'New Group',
            ),
            DrawerListTile(
              iconData: Icons.lock,
              title: 'New Secret Group',
            ),
            DrawerListTile(
              iconData: Icons.notifications,
              title: 'New Channel Chat',
            ),
            DrawerListTile(
              iconData: Icons.contacts,
              title: 'Contacts',
            ),
            DrawerListTile(
              iconData: Icons.bookmark_border,
              title: 'Saved Messages',
            ),
            DrawerListTile(
              iconData: Icons.phone,
              title: 'Calls',
            )
          ],
        ),
      ),
      body: ListView.separated(
        itemBuilder: (context, index) => (ListTile(
          leading: CircleAvatar(
            radius: 28,
            backgroundImage: NetworkImage(items[index].profileUrl),
          ),
          title: Text(
            items[index].name,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          subtitle: Text(items[index].message),
          trailing: Text(items[index].time),
        )),
        separatorBuilder: (context, index) => (const Divider()),
        itemCount: items.length,
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(
          Icons.create,
          color: Colors.white,
        ),
        backgroundColor: const Color(0xFF65A9E0),
        onPressed: () {},
      ),
    );
  }
}
