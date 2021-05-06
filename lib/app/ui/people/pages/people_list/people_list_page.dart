import 'package:flutter/material.dart';
import 'package:flutter_dojo/app/ui/people/pages/people_list/people_list_controller.dart';
import 'package:flutter_dojo/app/ui/theme/app_theme.dart';
import 'package:flutter_dojo/common/injected/module.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/svg.dart';

class PeopleListPage extends StatelessWidget {
  final _controller = getIt.get<PeopleListController>();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final fillStop = 300 / size.height;
    final colors = [primaryColor, primaryColor, accentColor, accentColor];
    final stops = [0.0, fillStop, fillStop, 1.0];
    return Scaffold(
      body: Container(
        height: size.height,
        decoration: BoxDecoration(
            gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          stops: stops,
          colors: colors,
        )),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 50),
              child: Center(
                  child: SvgPicture.asset('assets/images/logo_black.svg')),
            ),
            Container(
              margin: EdgeInsets.only(left: 16),
              child: Text(
                'Characters',
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
            Container(
              width: 150.0,
              transform: Matrix4.translationValues(0.0, -5.0, 0.0),
              margin: EdgeInsets.only(left: 16, top: 2),
              child: Divider(
                height: 1,
                thickness: 1,
              ),
            ),
            Container(
              width: 200.0,
              margin: EdgeInsets.only(left: 16),
              transform: Matrix4.translationValues(0.0, -10.0, 0.0),
              child: Divider(
                height: 1,
                thickness: 1,
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 5),
              height: size.height * 0.3,
              child: Observer(
                builder: (_) {
                  return ListView.builder(
                    padding: EdgeInsets.symmetric(horizontal: 6),
                    scrollDirection: Axis.horizontal,
                    itemCount: _controller.store.people.length,
                    itemBuilder: (BuildContext context, int index) {
                      if (_controller.store.people == null ||
                          _controller.store.people.isEmpty) {
                        return CircularProgressIndicator();
                      }

                      var people = _controller.store.people[index];

                      return Container(
                        margin: EdgeInsets.symmetric(horizontal: 6),
                        child: GestureDetector(
                          onTap: () => CustomModal(
                              context,
                              people.name.toUpperCase(),
                              'https://starwars-visualguide.com/assets/img/characters/${(index + 1).toString()}.jpg',
                              size.height * 0.23),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: size.width * 0.34,
                                height: size.height * 0.23,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: FadeInImage.assetNetwork(
                                    placeholder: 'assets/images/loading.gif',
                                    image:
                                        'https://starwars-visualguide.com/assets/img/characters/${(index + 1).toString()}.jpg',
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                people.name.toUpperCase(),
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: size.height * 0.13,
        width: size.width,
        child: BottomNavigationBar(
            backgroundColor: Theme.of(context).primaryColor,
            selectedItemColor: Theme.of(context).accentColor,
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Container(
                  width: 25,
                  height: 25,
                  child: SvgPicture.asset("assets/images/home.svg"),
                ),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Container(
                  width: 30,
                  height: 30,
                  child: SvgPicture.asset("assets/images/people.svg"),
                ),
                label: 'Characters',
              ),
              BottomNavigationBarItem(
                icon: Container(
                  width: 30,
                  height: 30,
                  child: SvgPicture.asset("assets/images/films.svg"),
                ),
                label: 'Movies',
              )
            ]),
      ),
    );
  }
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
