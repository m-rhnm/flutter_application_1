import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Color surfaceColor = Color(0x0dffffff);
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        //
        primarySwatch: Colors.blueGrey,
        primaryColor: Colors.pink.shade400,
        brightness: Brightness.dark,
        dividerColor: surfaceColor,
        scaffoldBackgroundColor: Color.fromARGB(255, 30, 30, 30),
        appBarTheme: AppBarTheme(backgroundColor: Colors.black),
        textTheme: GoogleFonts.latoTextTheme().copyWith(
          bodyMedium: TextStyle(fontSize: 15, color: Colors.white),
          bodyLarge: TextStyle(
            fontSize: 13,
            color: Color.fromARGB(200, 255, 255, 255),
          ),
          titleLarge: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
          titleMedium: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        useMaterial3: false,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

enum SkillType { photoshop, xD, illustrator, afterEffects, lightRoom }

class _MyHomePageState extends State<MyHomePage> {
  SkillType skillType = SkillType.photoshop;
  void onSkillTap(SkillType type) {
    setState(() {
      skillType = type;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('curriculum vitae')),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(32.0),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    'images/profile_image.png',
                    width: 60,
                    height: 60,
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'mohamad rahnama',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      SizedBox(height: 2),
                      Text('software engineer'),
                      SizedBox(height: 4),
                      Row(
                        children: [
                          Icon(
                            size: 18,
                            CupertinoIcons.location,
                            color: Theme.of(context).textTheme.bodyLarge!.color,
                          ),
                          SizedBox(width: 4),
                          Text(
                            "tehran, iran",
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Icon(
                  CupertinoIcons.heart,
                  color: Theme.of(context).primaryColor,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(32, 0, 32, 16),
            child: Text(
              "this text its just for testing,this text its just for testing,this text its just for testing,this text its just for testing,this text its just for testing,this text its just for testing,this text its just for testing,",
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ),
          Divider(),
          Padding(
            padding: const EdgeInsets.fromLTRB(32, 16, 32, 12),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Skills',
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(width: 2),
                Icon(CupertinoIcons.chevron_down, size: 12),
              ],
            ),
          ),
          SizedBox(height: 8),
          Center(
            child: Wrap(
              direction: Axis.horizontal,
              spacing: 8,
              runSpacing: 8,
              children: [
                skill(
                  type: SkillType.photoshop,
                  title: 'photoshop',
                  imagePath: 'images/app_icon_01.png',
                  shadowColor: Colors.blue,
                  isactive: skillType == SkillType.photoshop,
                  onTap: () => onSkillTap(SkillType.photoshop),
                ),
                skill(
                  type: SkillType.xD,
                  title: 'Adobe XD',
                  imagePath: 'images/app_icon_05.png',
                  shadowColor: Colors.pink,
                  isactive: skillType == SkillType.xD,
                  onTap: () => onSkillTap(SkillType.xD),
                ),
                skill(
                  type: SkillType.illustrator,
                  title: 'illustrator',
                  imagePath: 'images/app_icon_04.png',
                  shadowColor: Colors.orangeAccent,
                  isactive: skillType == SkillType.illustrator,
                  onTap: () => onSkillTap(SkillType.illustrator),
                ),
                skill(
                  type: SkillType.afterEffects,
                  title: 'afterEffects',
                  imagePath: 'images/app_icon_03.png',
                  shadowColor: Colors.blue.shade700,
                  isactive: skillType == SkillType.afterEffects,
                  onTap: () => onSkillTap(SkillType.afterEffects),
                ),
                skill(
                  type: SkillType.lightRoom,
                  title: 'lightroom',
                  imagePath: 'images/app_icon_02.png',
                  shadowColor: Colors.blue,
                  isactive: skillType == SkillType.lightRoom,
                  onTap: () => onSkillTap(SkillType.lightRoom),
                ),
              ],
            ),
          ),
          Divider(),
        ],
      ),
    );
  }
}

class skill extends StatelessWidget {
  final SkillType type;
  final String imagePath;
  final String title;
  final Color shadowColor;
  final bool isactive;
  final Function() onTap;

  const skill({
    super.key,
    required this.type,
    required this.imagePath,
    required this.title,
    required this.shadowColor,
    required this.isactive,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(20),
      onTap: onTap,
      child: Container(
        width: 110,
        height: 110,
        decoration: isactive
            ? BoxDecoration(
                color: Theme.of(context).dividerColor,
                borderRadius: BorderRadius.circular(20),
              )
            : null,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration: isactive ? BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: shadowColor.withValues(alpha: 0.5),
                    blurRadius: 20,
                  ),
                ],
              ) : null,
              child: Image.asset(imagePath, width: 40, height: 40),
            ),
            SizedBox(height: 8),
            Text(title),
          ],
        ),
      ),
    );
  }
}
