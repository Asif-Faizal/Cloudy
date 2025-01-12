import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigoAccent),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _selectedCity = 'London';

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('lib/core/assets/sunny.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          centerTitle: false,
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              width: 200,
              child: Row(
                children: [
                  Icon(
                    Icons.location_on,
                    size: 25,
                    color: Colors.white,
                  ),
                  SizedBox(width: 10),
                  DropdownButton<String>(
                    value: _selectedCity,
                    icon: SizedBox(),
                    elevation: 0,
                    dropdownColor: Colors.black.withOpacity(
                        0.6), // Set to transparent since we'll use MenuStyle
                    style: TextStyle(color: Colors.white),
                    menuMaxHeight: 200,
                    menuWidth: MediaQuery.of(context).size.width - 100,
                    onChanged: (String? newValue) {
                      setState(() {
                        _selectedCity = newValue!;
                      });
                    },
                    items: <String>['London', 'Tokyo', 'Bangalore']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(
                          value,
                          style: GoogleFonts.bebasNeue(fontSize: 25),
                        ),
                      );
                    }).toList(),
                  )
                ],
              ),
            ),
          ),
          actions: [
            IconButton(
              icon: Icon(Icons.list, color: Colors.white),
              onPressed: () {},
            ),
            SizedBox(width: 20)
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 105.0, horizontal: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'JAN 13 16:22',
                style: GoogleFonts.aBeeZee(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Stack(
                children: [
                  Text(
                    '16°C',
                    style: GoogleFonts.bebasNeue(
                      color: Colors.white,
                      fontSize: 100,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: Text(
                        'SUNNY',
                        style: GoogleFonts.bebasNeue(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(height: 20),
              Card(
                elevation: 0,
                color: Colors.black.withOpacity(0.25),
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(16),
                  child: GridView.builder(
                    padding: EdgeInsets.zero,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      childAspectRatio: 1.5, // Adjusted for better item sizing
                    ),
                    itemCount: 4,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      List<String> labels = [
                        'Humidity',
                        'Wind',
                        'Precipitation',
                        'Cloud'
                      ];
                      List<String> values = ['75%', '5 km/h', '10%', '50%'];

                      return _buildCardItem(labels[index], values[index]);
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCardItem(String label, String value) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.25),
          border: Border.all(width: 2, color: Colors.white),
          borderRadius: BorderRadius.circular(8)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              label,
              style: GoogleFonts.aBeeZee(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              value,
              style: GoogleFonts.bebasNeue(
                color: Colors.white,
                fontSize: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
