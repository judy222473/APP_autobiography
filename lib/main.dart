import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

final player = AudioPlayer()..setReleaseMode(ReleaseMode.loop);

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final tabs = [
    screen1(),
    screen2(),
    screen3(),
  ];

  int previousIndex = 0;
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    if (currentIndex == 0) player.play(AssetSource("1.mp3"));
    return MaterialApp(
      title: '我的自傳',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('我的自傳'),
        ),
        body: tabs[currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.blue,
          selectedItemColor: Colors.white,
          selectedFontSize: 18,
          unselectedFontSize: 14,
          iconSize: 30,
          currentIndex: currentIndex,
          items: [
            BottomNavigationBarItem(
              icon: currentIndex == 0
                  ? const FaIcon(FontAwesomeIcons.person, size: 40.0)
                  : const FaIcon(FontAwesomeIcons.person, size: 30.0),
              // 替换为另一个图标
              label: '自我介紹',
            ),
            const BottomNavigationBarItem(
              icon: Icon(Icons.school),
              label: '學習歷程',
            ),
            const BottomNavigationBarItem(
              icon: Icon(Icons.schedule_outlined),
              label: '學習計畫',
            ),
          ],
          onTap: (index) {
            setState(() {
              previousIndex = currentIndex;
              currentIndex = index;
              if (index == 0) {
                if (previousIndex == currentIndex) player.resume();
                player.stop();
                player.play(AssetSource('1.mp3'));
              }
              if (index == 1) {
                if (previousIndex == currentIndex) player.resume();
                player.stop();
                player.play(AssetSource('2.mp3'));
              }
              if (index == 2) {
                if (previousIndex == currentIndex) player.resume();
                player.stop();
                player.play(AssetSource('3.mp3'));
              }
            });
          },
        ),
      ),
    );
  }
}

class screen1 extends StatelessWidget {
  final String s1 =
      "從高中時代開始，我便踏入了程式設計的世界，並在這條道路上堅持不懈地學習與成長，直至大學三年級。在這漫長卻充滿挑戰的學習過程中，雖然我尚未有特別突出的成就，但每一次的編碼與解碼，每一行的代碼，都鑄造了我堅實的技術基礎，並深深影響了我的思維方式。我對程式設計的熱情並未止步於課堂之內，業餘時間我熱衷於參與程式競賽，挑戰各種複雜的題目。這不僅是我的興趣，也是我技能提升的重要途徑。除此之外，搖滾音樂亦是我生活中不可或缺的一部分。搖滾樂的節奏與程式碼的邏輯，兩者在我的世界裡和諧共存。我的人生理念是“一天要比一天好”。這句話激勵我持續進步，不斷超越昨日的自己。雖然我的旅程中尚未遭遇顯著的轉折點，但我相信，正是這種持續的積累與進步，將會引領我走向更加燦爛的未來。";

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              border: Border.all(color: Colors.deepPurple, width: 5),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(95),
              child: Image.asset('images/avatar.jpg',
                  height: 200, width: 200, fit: BoxFit.cover),
            ),
          ),
          const SizedBox(height: 10),
          const Padding(
            padding: EdgeInsets.fromLTRB(20, 30, 20, 20),
            child: Text(
              'Who am I',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.deepPurple,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(20),
            margin: const EdgeInsets.fromLTRB(30, 0, 30, 50),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.deepPurple, width: 3),
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    offset: const Offset(6, 6),
                    blurRadius: 8),
              ],
            ),
            child: Text(
              s1,
              style: const TextStyle(fontSize: 18, height: 1.5),
            ),
          ),
        ],
      ),
    );
  }
}

class screen2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            const Text(
              '學習歷程概覽',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            // 深坑國小
            schoolSection('深坑國小', '2008年 - 2014年', 'images/深坑國小.jpg'),
            // 深坑國中
            schoolSection('深坑國中', '2014年 - 2017年', 'images/深坑國中.png'),
            // 內湖高工
            schoolSection('內湖高工', '2017年 - 2020年', 'images/內湖高工.png'),
            Text(
              '參加北市科展和網頁技能競賽，均獲佳作',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 10),
            // 高雄科技大學
            schoolSection('高雄科技大學', '2020年 - 至今', 'images/高科大.jpg'),
            Text(
              '參加康輔社',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget schoolSection(String schoolName, String years, String imagePath) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          '$schoolName：$years',
          style: TextStyle(fontSize: 18),
        ),
        SizedBox(height: 5),
        Image.asset(
          imagePath,
          width: 50,
          height: 50,
          fit: BoxFit.cover,
        ),
        SizedBox(height: 10),
      ],
    );
  }
}

class screen3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(children: [
          // 其他部分的代碼保持不變...
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                '大一學習目標',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          SizedBox(height: 10),
          Expanded(
            // 使用 Expanded 小部件
            child: ListView(
              children: [
                ListTile(
                  leading: Icon(Icons.check_circle_outline),
                  title: Text('學好英文'),
                ),
                ListTile(
                  leading: Icon(Icons.check_circle_outline),
                  title: Text('Leetcode 500題'),
                ),
                ListTile(
                  leading: Icon(Icons.check_circle_outline),
                  title: Text('班牌前10'),
                ),
              ],
            ),
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                '大二學習目標',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          SizedBox(height: 10),
          Expanded(
            // 使用 Expanded 小部件
            child: ListView(
              children: [
                ListTile(
                  leading: Icon(Icons.check_circle_outline),
                  title: Text('學Vue'),
                ),
                ListTile(
                  leading: Icon(Icons.check_circle_outline),
                  title: Text('英語畢業門檻'),
                ),
                ListTile(
                  leading: Icon(Icons.check_circle_outline),
                  title: Text('嘗試接專案'),
                ),
              ],
            ),
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                '大三學習目標',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          SizedBox(height: 10),
          Expanded(
            // 使用 Expanded 小部件
            child: ListView(
              children: [
                ListTile(
                  leading: Icon(Icons.check_circle_outline),
                  title: Text('完成專題'),
                ),
                ListTile(
                  leading: Icon(Icons.check_circle_outline),
                  title: Text('班排前10'),
                ),
                ListTile(
                  leading: Icon(Icons.check_circle_outline),
                  title: Text('準備推甄'),
                ),
              ],
            ),
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                '大四學習目標',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          SizedBox(height: 10),
          Expanded(
            // 使用 Expanded 小部件
            child: ListView(
              children: [
                ListTile(
                  leading: Icon(Icons.check_circle_outline),
                  title: Text('校外實習'),
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
