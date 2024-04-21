import 'package:code_hero/src/core/interactor/stories/character_store.dart';
import 'package:code_hero/src/core/interactor/utils/responsive_layout.dart';
import 'package:code_hero/src/modules/home/ui/pages/desktop_page.dart';
import 'package:code_hero/src/modules/home/ui/pages/mobile_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  CharacterStore store = Modular.get<CharacterStore>();

  @override
  void initState() {
    store.getCharacters();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      desktop: DesktopPage(
        store: store,
      ),
      mobile: MobilePage(
        store: store,
      ),
    );
  }
}
