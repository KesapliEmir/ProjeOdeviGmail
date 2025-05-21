import 'package:flutter/material.dart';

void main() {
  runApp(Gmail());
}

class Gmail extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gmail',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.red,
          brightness: Brightness.light,
        ),
      ),
      home: GmailHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class GmailHomePage extends StatefulWidget {
  @override
  _GmailHomePageState createState() => _GmailHomePageState();
}


class _GmailHomePageState extends State<GmailHomePage> {
  int _selectedIndex = 0;

  final List<Map<String, dynamic>> messages = [
    {
      'sender': 'Bilgilendirme',
      'title': 'Haber',
      'subtitle': 'Son gelişmeler haberler hakkında bilgiler.',
      'date': '21 Mar',
      'color': const Color.fromARGB(255, 223, 206, 54),
    },
    {
      'sender': 'Emirhan Kaplan',
      'title': '(Konu Yok)',
      'subtitle': '',
      'date': '20 Mar',
      'color': Colors.green,
    },
    {
      'sender': 'Trendyol',
      'title': 'Trendyol E',
      'subtitle': 'Türkiyenin en sevilen e-ticaret....',
      'date': '19 Mar',
      'color': Colors.orange,
    },
    {
      'sender': 'Instagram',
      'title': 'Instagram uygulamasına yeni...',
      'subtitle': 'Merhaba emirhan,ınstagram..',
      'date': '18 Mar',
      'color': Colors.red,
    },
    {
      'sender': 'Spor Gündemi Haber',
      'title': 'Spor Gündemi',
      'subtitle': 'Bugünün maç sonuçları ve önemli gelişmeler.',
      'date': '17 Mar',
      'color': Colors.lightGreen,
    },
    {
      'sender': 'Filmler',
      'title': 'Film Önerileri',
      'subtitle': 'Haftanın en çok izlenen filmleri ve yorumları.',
      'date': '16 Mar',
      'color': Colors.pinkAccent,
    },
    {
      'sender': 'Midas ',
      'title': 'Midas Şifre Yenileme',
      'subtitle': 'Şifre kodunuz 23...',
      'date': '15 Mar',
      'color': Colors.amber,
    },
  ];

  void _onBottomItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      print(index == 0 ? 'Posta tıklandı' : 'Takvim tıklandı');

    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70),
        child: AppBar(
          backgroundColor: Colors.white,
          surfaceTintColor: Colors.transparent,
          elevation: 0,
          automaticallyImplyLeading: false,
          flexibleSpace: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.menu, color: Colors.black),
                    onPressed: () {
                      print('Menü tıklandı');
                    },
                  ),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey.shade400),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        children: [
                          Icon(Icons.search, color: Colors.grey),
                          SizedBox(width: 8),
                          Expanded(
                            child: TextField(
                              decoration: InputDecoration(
                                hintText: 'Maillerde ara',
                                border: InputBorder.none,
                              ),
                              onTap: () {
                                print('Arama çubuğu tıklandı');
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  IconButton(
                    icon: CircleAvatar(
                      backgroundColor: const Color.fromARGB(255, 255, 0, 0),
                      child: Icon(Icons.person, color: Colors.white),
                    ),
                    onPressed: () {
                      print('Profil tıklandı');
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),

          body: ListView(
       children: [
       ListTile(
      contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      leading: CircleAvatar(
        backgroundColor: Colors.green,
        child: Icon(Icons.local_offer, color: Colors.white, size: 18),
      ),
      title: Text(
        "Tanıtımlar",
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      subtitle: Text("Team..."),
      onTap: () {
        print("Tanıtımlar tıklandı");
      },
    ),


           ListTile(
           contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
           leading: CircleAvatar(
           backgroundColor: Colors.blue,
           child: Icon(Icons.people, color: Colors.white, size: 18),
           ),
           title: Text(
          "Sosyal",
         style: TextStyle(fontWeight: FontWeight.bold),
          ),
         subtitle: Text("Instagram'da ts-bjk..."),
         onTap: () {
         print("Sosyal tıklandı");
      },
    ),
    Divider(),
         ...messages.map((message) {
         return Column(
         children: [
          ListTile(
            contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
            leading: CircleAvatar(
              backgroundColor: message['color'],
              child: Text(
                message['sender'][0],
                style: TextStyle(color: Colors.white),
              ),
            ),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  message['sender'],
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  message['date'],
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                ),
              ],
            ),
              subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  message['title'],
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
                Text(
                  message['subtitle'],
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
            trailing: IconButton(
              icon: Icon(Icons.star_border),
              onPressed: () {},
            ),
            onTap: () {},
          ),
          Divider(),
        ],
      );
    }).toList(),
  ],
),


      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print('Yeni mesaj butonu tıklandı');
        },
        child: Icon(Icons.edit),
        backgroundColor: Color.fromARGB(255, 3, 252, 252),
      ),
      bottomNavigationBar: BottomNavigationBar(
      backgroundColor: Colors.white, 
      currentIndex: _selectedIndex,
      onTap: _onBottomItemTapped,
      selectedItemColor: Color.fromARGB(255, 19, 41, 236),
      unselectedItemColor: Colors.grey,
      items: [
      BottomNavigationBarItem(icon: Icon(Icons.mail), label: 'Posta'),
      BottomNavigationBarItem(
      icon: Icon(Icons.calendar_today),
      label: 'Takvim',
        ),
       ],
      ),
    );
  }
}
