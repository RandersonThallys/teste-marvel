import 'package:code_hero/src/core/interactor/utils/responsive_layout.dart';
import 'package:code_hero/src/modules/character/interactor/character_details_store.dart';
import 'package:code_hero/src/modules/character/interactor/states/character_details_page_state.dart';
import 'package:code_hero/src/modules/character/ui/pages/desktop_page.dart';
import 'package:code_hero/src/modules/character/ui/pages/mobile_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

class CharacterDetailsPage extends StatefulWidget {
  const CharacterDetailsPage({super.key});

  @override
  State<CharacterDetailsPage> createState() => _CharacterDetailsPageState();
}

class _CharacterDetailsPageState extends State<CharacterDetailsPage> {
  var store = Modular.get<CharacterDetailsStore>();
  @override
  void initState() {
    store.getCharacterDetails(id: Modular.args.data);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      if (store.state is SuccessCharacterDetailsPageState) {
        return ResponsiveLayout(
          desktop: DesktopPage(
            character: store.state.character,
          ),
          mobile: MobilePage(
            character: store.state.character,
          ),
        );
      } else {
        return const Scaffold(
          body: Center(
            child: CircularProgressIndicator(),
          ),
        );
      }
    });
  }
}
