import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/l10n/app_localizations_en.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'l10n/app_localizations.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ThemeMode themeMode = ThemeMode.dark;
  final Locale _locale = Locale('fa');
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // Color surfaceColor = Color(0x0dffffff);
    // Color primaryColor = Colors.pink.shade400;
    return MaterialApp(
      title: 'Flutter Demo',
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: AppLocalizations.supportedLocales,
      locale:_locale,
      theme: themeMode == ThemeMode.dark
          ? MyAppThemeConfig.dark().getTheme(_locale.languageCode)
          : MyAppThemeConfig.light().getTheme(_locale.languageCode),
      home: MyHomePage(
        toggleThemeMood: () {
          setState(() {
            if (themeMode == ThemeMode.dark) {
              themeMode = ThemeMode.light;
            } else {
              themeMode = ThemeMode.dark;
            }
          });
        },
      ),
    );
  }
}

class MyAppThemeConfig {
  static const String faPrimaryFontFamily = "Yekan";
  final Color primaryColor = Colors.pink.shade400;
  final Color primaryTextColor;
  final Color secondaryTextcolor;
  final Color surfaceColor;
  final Color backgroundColor;
  final Color appBarColor;
  final Brightness brightness;

  MyAppThemeConfig.dark()
    : primaryTextColor = Colors.white,
      secondaryTextcolor = Colors.white70,
      surfaceColor = Color(0x0dffffff),
      backgroundColor = Color.fromARGB(255, 30, 30, 30),
      appBarColor = Colors.black,
      brightness = Brightness.dark;

  MyAppThemeConfig.light()
    : primaryTextColor = Colors.grey.shade900,
      secondaryTextcolor = Colors.grey.shade900.withValues(alpha: 0.8),
      surfaceColor = Color.fromARGB(255, 252, 252, 252),
      backgroundColor = Color(0x0d000000),
      appBarColor = Color.fromARGB(255, 235, 235, 235),
      brightness = Brightness.light;

  ThemeData getTheme(String languageCode) {
    return ThemeData(
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
      primaryColor: primaryColor,
      brightness: brightness,
      dividerColor: surfaceColor,
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          backgroundColor: WidgetStatePropertyAll(primaryColor),
        ),
      ),
      scaffoldBackgroundColor: backgroundColor,
      appBarTheme: AppBarTheme(
        elevation: 0,
        backgroundColor: appBarColor,
        foregroundColor: primaryTextColor,
      ),
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none,
        ),
        filled: true,
        fillColor: surfaceColor,
      ),
      textTheme: languageCode=="en"?enPrimaryTextTheme:faPrimaryTextTheme,
      useMaterial3: false,
    );
  }

  TextTheme get enPrimaryTextTheme => GoogleFonts.latoTextTheme().copyWith(
    bodyMedium: TextStyle(fontSize: 15, color: primaryTextColor),
    bodyLarge: TextStyle(fontSize: 13, color: secondaryTextcolor),
    titleLarge: TextStyle(fontWeight: FontWeight.bold, color: primaryTextColor),
    titleMedium: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.bold,
      color: primaryTextColor,
    ),
  );

  TextTheme get faPrimaryTextTheme => TextTheme(
    bodyMedium: TextStyle(
      fontSize: 15,
      color: primaryTextColor,
      fontFamily: faPrimaryFontFamily,
    ),
    bodyLarge: TextStyle(
      fontSize: 13,
      height: 1.2,
      color: secondaryTextcolor,
      fontFamily: faPrimaryFontFamily,
    //caption: TextStyle(fontFamily: faPrimaryFontFamily),
    ),
    titleLarge: TextStyle(
      fontWeight: FontWeight.bold,
      color: primaryTextColor,
      fontFamily: faPrimaryFontFamily,
    ),
    titleMedium: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.bold,
      color: primaryTextColor,
      fontFamily: faPrimaryFontFamily,
    ),
  );
}

class MyHomePage extends StatefulWidget {
  final Function() toggleThemeMood;

  const MyHomePage({super.key, required this.toggleThemeMood});

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
    final localization = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(
        title: Text(localization.profileTitle),
        actions: [
          Icon(CupertinoIcons.chat_bubble),
          SizedBox(width: 4),
          InkWell(
            onTap: widget.toggleThemeMood,
            child: Icon(CupertinoIcons.ellipsis_vertical),
          ),
        ],
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
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
                          localization.name,
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        SizedBox(height: 2),
                        Text(localization.job),
                        SizedBox(height: 4),
                        Row(
                          children: [
                            Icon(
                              size: 18,
                              CupertinoIcons.location,
                              color: Theme.of(
                                context,
                              ).textTheme.bodyLarge!.color,
                            ),
                            SizedBox(width: 4),
                            Text(
                              localization.location,
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
                localization.summary,
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
                    localization.skillTitle,

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
            Padding(
              padding: const EdgeInsets.fromLTRB(32, 16, 32, 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    localization.informtionTitle,
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 12),
                  TextField(
                    decoration: InputDecoration(
                      labelText: localization.email,

                      prefixIcon: Icon(CupertinoIcons.at, size: 20),
                    ),
                  ),
                  SizedBox(height: 8),
                  TextField(
                    decoration: InputDecoration(
                      labelText: localization.pass,

                      prefixIcon: Icon(CupertinoIcons.lock_circle, size: 20),
                    ),
                  ),
                  SizedBox(height: 10),
                  SizedBox(
                    width: double.infinity,
                    height: 48,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text(localization.submit),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
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
              decoration: isactive
                  ? BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: shadowColor.withValues(alpha: 0.5),
                          blurRadius: 20,
                        ),
                      ],
                    )
                  : null,
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
