import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Colors.amber,
        accentColor: Color(0xff000029),
        textTheme: TextTheme(
          headline1: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
          headline6: TextStyle(fontSize: 31.0, fontStyle: FontStyle.normal),
          headline5: TextStyle(
              fontSize: 31.0, fontStyle: FontStyle.normal, color: Colors.white),
          bodyText2: TextStyle(fontSize: 14.0, fontFamily: 'Hind'),
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final Color background = Theme.of(context).primaryColor;
    final Color fill = Theme.of(context).accentColor;
    final List<Color> gradient = [
      background,
      background,
      fill,
      fill,
    ];
    final double fillStop = 360 / size.height;
    final List<double> stops = [0.0, fillStop, fillStop, 1.0];
    return Scaffold(
      body: Container(
        width: size.width,
        height: size.height,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: gradient,
            stops: stops,
            end: Alignment.bottomCenter,
            begin: Alignment.topCenter,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 23),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  top: 50,
                ),
                child: SvgPicture.asset('assets/images/logo_black.svg'),
              ),
              // #region CHARACTERS
              Align(
                alignment: Alignment.centerLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Characters',
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    Container(
                      width: 150,
                      transform: Matrix4.translationValues(0.0, -2.0, 0.0),
                      child: Divider(
                        thickness: 1,
                        color: Theme.of(context).accentColor,
                      ),
                    ),
                    Container(
                      width: 200,
                      transform: Matrix4.translationValues(0.0, -10.0, 0.0),
                      child: Divider(
                        thickness: 1,
                        color: Theme.of(context).accentColor,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: size.height * 0.27,
                width: size.width,
                child: new ListView(
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    CustomCard(
                        "luke skywalker",
                        '',
                        "https://starwars-visualguide.com/assets/img/characters/1.jpg",
                        size.height * 0.27,
                        context),
                    CustomCard(
                        "Leia Organa",
                        '',
                        "https://starwars-visualguide.com/assets/img/characters/5.jpg",
                        size.height * 0.27,
                        context),
                    CustomCard(
                        "Darth Vader",
                        '',
                        "https://starwars-visualguide.com/assets/img/characters/4.jpg",
                        size.height * 0.27,
                        context),
                    CustomCard(
                        "Obi-Wan Kenobi",
                        '',
                        "https://starwars-visualguide.com/assets/img/characters/6.jpg",
                        size.height * 0.27,
                        context),
                  ],
                ),
              ),
              // #endregion
              // #region MOVIES
              Align(
                alignment: Alignment.centerLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Movies',
                      style: Theme.of(context).textTheme.headline5,
                    ),
                  ],
                ),
              ),
              Container(
                height: size.height * 0.27,
                width: size.width,
                child: new ListView(
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    CustomCard(
                        "Episode IV: A New Hope",
                        'George Lucas',
                        "https://starwars-visualguide.com/assets/img/films/1.jpg",
                        size.height * 0.27,
                        context),
                    CustomCard(
                        "Episode V: The Empire Strikes Back",
                        'George Lucas',
                        "https://starwars-visualguide.com/assets/img/films/2.jpg",
                        size.height * 0.27,
                        context),
                    CustomCard(
                        "Episode VI: Return of the Jedi",
                        'Richard Marquand',
                        "https://starwars-visualguide.com/assets/img/films/3.jpg",
                        size.height * 0.27,
                        context),
                  ],
                ),
              ),
              // #endregion
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: size.height * 0.1,
        width: size.width,
        child: BottomNavigationBar(
          backgroundColor: Theme.of(context).primaryColor,
          selectedItemColor: Theme.of(context).accentColor,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Container(
                width: 25,
                height: 25,
                child: SvgPicture.asset(
                  "assets/images/home.svg",
                ),
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Container(
                width: 25,
                height: 25,
                child: SvgPicture.asset(
                  "assets/images/people.svg",
                ),
              ),
              label: 'People',
            ),
            BottomNavigationBarItem(
              icon: Container(
                width: 30,
                height: 30,
                child: SvgPicture.asset(
                  "assets/images/films.svg",
                ),
              ),
              label: 'Films',
            ),
          ],
        ),
      ),
    );
  }
}

Widget CustomCard(String name, String subtitle, String imgPath, double height,
    BuildContext context) {
  return InkWell(
    onTap: () {
      return CustomModal(context, name, imgPath, height);
    },
    child: Padding(
      padding: const EdgeInsets.all(5.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(20.0),
            child: Image.network(
              imgPath,
              height: height * 0.8,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(
            height: 5.0,
          ),
          SizedBox(
            width: 125,
            child: Text(
              name.toUpperCase(),
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              softWrap: false,
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 10.0),
              textAlign: TextAlign.start,
            ),
          ),
          Text(
            subtitle.toUpperCase(),
            style: TextStyle(
                color: Colors.amber,
                fontWeight: FontWeight.bold,
                fontSize: 8.0),
            textAlign: TextAlign.start,
          ),
        ],
      ),
    ),
  );
}

Widget CustomModal(
    BuildContext context, String name, String imgPath, double height) {
  showModalBottomSheet(
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (context) => Container(
      height: MediaQuery.of(context).size.height * 0.75,
      decoration: new BoxDecoration(
        color: Colors.white,
        borderRadius: new BorderRadius.only(
          topLeft: const Radius.circular(25.0),
          topRight: const Radius.circular(25.0),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: Theme.of(context).textTheme.headline4,
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20.0),
                    child: Image.network(
                      imgPath,
                      height: height * 0.8,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: Column(
                      children: [
                        Text('Lucas ipsum dolor sit '),
                        Text('Lucas ipsum dolor sit '),
                        Text('Lucas ipsum dolor sit '),
                      ],
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                  '''Lucas ipsum dolor sit amet chirrpa ree-yees briqualon anthos skakoan jabba di noghri organa kanos. Owen celegian whill wicket yané darth. Obi-wan miraluka k-3po jan sola jango. Vestara kit bren vilim mohc. Luke wol codru-ji secura antonio. Barriss bertroff organa axmis kubaz sola. Hutta quinlan maris saché olié whiphid givin yowza wicket. Darth yoda fey’lya owen. Dunwell defel taun twi’lek jan vurk. Mirialan dunhausen taung mustafarian cade. Troig ima-gun davin anomid. Tyber tano borvo ki-adi-mundi cassio ebe oola.Lucas ipsum dolor sit amet chirrpa ree-yees briqualon anthos skakoan jabba di noghri organa kanos. Owen celegian whill wicket yané darth. Obi-wan miraluka k-3po jan sola jango. Vestara kit bren vilim mohc. Luke wol codru-ji secura antonio. Barriss bertroff organa axmis kubaz sola. Hutta quinlan maris saché olié whiphid givin yowza wicket. Darth yoda fey’lya owen. Dunwell defel taun twi’lek jan vurk. Mirialan dunhausen taung mustafarian cade. Troig ima-gun davin anomid. Tyber tano borvo ki-adi-mundi cassio ebe oola.''')
            ],
          ),
        ),
      ),
    ),
    context: context,
  );
}
