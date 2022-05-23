


import 'package:flutter/material.dart';
import 'package:projek_akhir_prakmobile/model/heroesModel.dart';
import 'package:projek_akhir_prakmobile/service/heroes_source.dart';
import 'package:projek_akhir_prakmobile/view/heroesDetail.dart';


class listHeroes extends StatefulWidget {
  const listHeroes({Key? key}) : super(key: key);

  @override
  _listHeroesState createState() => _listHeroesState();
}

class _listHeroesState extends State<listHeroes> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('List Heroes Dota 2'),
        ),
        body: Column(
          children: [

          ],
        ),
      ),
    );
  }

  Widget _buildListHeroes() {
    return Container(
      child: FutureBuilder(
        future: HeroesSource.instance.loadHeroes(),
        builder: (
            BuildContext context,
            AsyncSnapshot<dynamic> snapshot,
            ) {
          if (snapshot.hasError) {
            return _buildErrorSection();
          }
          if (snapshot.hasData) {
            heroesModel HeroesModels =
            heroesModel.fromJson(snapshot.data);
            return _buildSuccessSection(HeroesModels);
            // return _buildPokemonData(pokemonListModel);
          }
          return _buildLoadingSection();
        },
      ),
    );
}

  Widget _buildErrorSection() {
    return Text("Error");
  }

  Widget _buildEmptySection() {
    return Text("Empty");
  }

  Widget _buildLoadingSection() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _buildSuccessSection(heroesModel data) {

    return SafeArea(
        child: Column(
          children: [
            Padding(padding: EdgeInsets.symmetric(vertical: 10)),
            Text("Pokemon",
              style: TextStyle(fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,letterSpacing: 10),
            ),
            Container(
              padding: EdgeInsets.only(top: 20),
              height: 650,
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 300,
                    childAspectRatio: 2 / 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10),
                    //itemCount: data.name?.length,
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) {
                        return heroesDetail(
                          idHeroes: "${data.id?[index]}",
                        );
                      }));
                    },
                    //child: _buildItemPokemonList("${data.results?[index].name}"),
                    //child: _buildViewPokemonList("${data.results?[index].name}"),
                  );
                  // return _buildItemCountries("${data.results?[index].name}");
                },
              ),
            ),
          ],
        )

    );
  }
