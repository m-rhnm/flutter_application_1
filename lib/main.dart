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
        dividerColor:  Color.fromARGB(100, 255, 255, 255),
        dividerTheme: DividerThemeData(indent: 32,endIndent: 32,),
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

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('curriculum vitae')),
      body: Column(
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
                Icon(CupertinoIcons.heart,color: Theme.of(context).primaryColor,),
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
          Divider()
        ],
      ),
    );
  }
}
