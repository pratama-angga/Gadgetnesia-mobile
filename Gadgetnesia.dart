import 'dart:html';
import 'package:flutter/material.dart';
void main() {
runApp(const MyApp());
}
class MyApp extends StatelessWidget {
const MyApp({super.key});
@override
Widget build(BuildContext context) {
return MaterialApp(
debugShowCheckedModeBanner: false,
theme: ThemeData(
primarySwatch: Colors.blue,
),
home: const MainScreen(title: 'Homepage Gadgetnesia'),
);
}
}
class MainScreen extends StatefulWidget {
const MainScreen({super.key, required this.title});
final String title;
  @override
State<MainScreen> createState() => _MainScreenState();
}
class _MainScreenState extends State<MainScreen> {
int _selectedNavbar = 0;
int _selectedIndex = 0;
void _onItemTapped(int index) {
setState(() {
_selectedIndex = index;
});
}
void _changeSelectedNavBar(int index) {
setState(() {
_selectedNavbar = index;
});
}
List<Widget> _widgetOptions = <Widget>[
Beranda(),
Kategori(),
Terbaru(),
ProfilePage(),
];
  
  @override
Widget build(BuildContext context) {
return Scaffold(
appBar: AppBar(
backgroundColor: Colors.orange,
actions: <Widget>[
IconButton(
  icon: Icon(
Icons.search,
color: Colors.white,
),
onPressed: () {},
),
],
titleSpacing: 12,
title: Row(
children: [
Text('Gadgetnseia')
],
),
  flexibleSpace: Container(
decoration: BoxDecoration(
gradient: LinearGradient(
begin: Alignment.topLeft,
end: Alignment.bottomRight,
colors: <Color>[Colors.lightBlue, Colors.indigo])),
),
),
drawer: Drawer(
child: ListView(
padding: EdgeInsets.zero,
children: [
ListTile(
leading: Icon(
Icons.email,
),
title: const Text('Terbaru'),
onTap: () {
Navigator.pop(context);
},
),
ListTile(
leading: Icon(
Icons.person,
),
  title: const Text('Profil'),
onTap: () {
Navigator.pop(context);
},
),
ListTile(
leading: Icon(
Icons.login,
),
title: const Text('Masuk'),
onTap: () {
Navigator.pop(context);
  },
),
],
),
),
bottomNavigationBar: BottomNavigationBar(
type: BottomNavigationBarType.fixed,
currentIndex: _selectedIndex,
showSelectedLabels: false,
showUnselectedLabels: false,
backgroundColor: Colors.lightBlue,
selectedItemColor: Colors.white,
  items: const <BottomNavigationBarItem>[
BottomNavigationBarItem(
icon: Icon(Icons.home),
label: 'Beranda',
),
BottomNavigationBarItem(
icon: Icon(Icons.assignment),
label: 'Kategori',
),
BottomNavigationBarItem(
icon: Icon(Icons.mail),
label: 'Terbaru',
),
BottomNavigationBarItem(
icon: Icon(Icons.person),
label: 'Profil',
),
], //New
onTap: (index) {
setState(() {
_selectedIndex = index;
});
},
),
body: Stack(
children: [
_buildOffstageNavigator(0),
_buildOffstageNavigator(1),
_buildOffstageNavigator(2),
_buildOffstageNavigator(3),
],
),
);
}
  Map<String, WidgetBuilder> _routeBuilders(BuildContext context, int index) {
return {
'/': (context) {
return [
Beranda(),
Kategori(),
Terbaru(),
ProfilePage(),
  ].elementAt(index);
},
};
}
Widget _buildOffstageNavigator(int index) {
var routeBuilders = _routeBuilders(context, index);
return Offstage(
offstage: _selectedIndex != index,
child: Navigator(
onGenerateRoute: (routeSettings) {
return MaterialPageRoute(
builder: (context) => routeBuilders[routeSettings.name]!(context),
);
},
),
);
}
}
class Beranda extends StatelessWidget {
@override
Widget build(BuildContext context) {
return Scaffold(
body: ListView.builder(
        itemBuilder: (context, index) {
          return ListTile(
            leading: Container(
              color: Colors.grey[200],
              height: 100,
              width: 100,
              child: Image.network('https://i.postimg.cc/mZndnxvF/ipon-2.png',
                      width: 100,
                      fit: BoxFit.cover,
                    )
            ),
            title: Text('Spesifikasi Iphone 13 Pro Max',
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            subtitle: Text('Iphone 13 Pro Max udah rilis nih. Berikut Spesifikasi lengkapnya.',
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            onTap: () {
              Navigator.push(
context, MaterialPageRoute(builder: (context) => Screen2()));
            },
          );
        },
      ),
);
}
}
class Kategori extends StatelessWidget {
@override
Widget build(BuildContext context) {
return Scaffold(
  appBar: AppBar(
  title: Text('Kategori')
            ),
body: ListView.builder(
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('Handphone',
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            onTap: () {
              Navigator.push(
context, MaterialPageRoute(builder: (context) => Screen2()));
            },
          );
        },
      ),
);
}
}

class Terbaru extends StatelessWidget {
@override
Widget build(BuildContext context) {
return Scaffold(
  appBar: AppBar(
  title: Text('Artikel Baru')
            ),
body: ListView.builder(
        itemBuilder: (context, index) {
          return ListTile(
            leading: Container(
              color: Colors.grey[200],
              height: 100,
              width: 100,
              child: Image.network('https://i.postimg.cc/7LQPzYRL/lenovo-tpad-240.png',
                      width: 100,
                      fit: BoxFit.cover,
                    )
            ),
            title: Text('Lenovo Thinkpad T240',
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            subtitle: Text('Lenovo memiliki seri laptop Thinkpad T240. Berikut Penjelasan lengkapnya.',
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            onTap: () {
              Navigator.push(
context, MaterialPageRoute(builder: (context) => Screen2()));
            },
          );
        },
      ),
);
}
}
class ProfilePage extends StatelessWidget {
@override
Widget build(BuildContext context) {
return Container(
color: Colors.black,
child: Column(
mainAxisAlignment: MainAxisAlignment.center,
children: <Widget>[
Container(
child: Text(
'ini konten akun',
style: TextStyle(color: Colors.white, fontSize: 20),
),
margin: EdgeInsets.all(16),
),
  ElevatedButton(
onPressed: () {
Navigator.push(
context, MaterialPageRoute(builder: (context) => Screen2()));
},
child: Text('halaman selanjutnya'),
),
],
  ),
);
}
}
class Screen2 extends StatelessWidget {
@override
Widget build(BuildContext context) {
return Scaffold(
body: Container(
color: Colors.black,
alignment: Alignment.center,
child: Column(
mainAxisAlignment: MainAxisAlignment.center,
children: <Widget>[
Container(
child: Text(
'ini halaman selanjutnya',
style: TextStyle(color: Colors.white, fontSize: 20),
),
margin: EdgeInsets.all(16),
),
ElevatedButton(
onPressed: () {
Navigator.pop(context);
},
child: Text('kembali'),
),
],
),
),
);
}
}