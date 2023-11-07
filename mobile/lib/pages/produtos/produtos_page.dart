import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:mobile/app_routes.dart';
import 'package:mobile/shared/app_colors.dart';
import 'package:mobile/widgets/carousel_item.dart';
import 'package:mobile/widgets/text_field_appbar.dart';

class ProdutosPage extends StatefulWidget {
  ProdutosPage({super.key});

  @override
  State<ProdutosPage> createState() => _ProdutosPageState();
}

class _ProdutosPageState extends State<ProdutosPage> {
  List<DropdownMenuItem> list = [
    const DropdownMenuItem(
      value: 'São Paulo',
      child: Text(
        'São Paulo, SP',
        style: TextStyle(
          color: Colors.white,
          fontSize: 18,
        ),
      ),
    ),
    const DropdownMenuItem(
      value: 'Rio de Janeiro',
      child: Text('Rio de Janeiro, RJ'),
    ),
    const DropdownMenuItem(
      value: 'Minas Gerais',
      child: Text('Belo Horizonte, MG'),
    ),
    const DropdownMenuItem(
      value: 'Espirito Santo',
      child: Text('Vitoria, ES'),
    ),
    const DropdownMenuItem(
      value: 'Bahia',
      child: Text('Salvador, BA'),
    ),
    const DropdownMenuItem(
      value: 'Brasilia',
      child: Text('Brasilia, DF'),
    ),
    const DropdownMenuItem(
      value: 'Rio Grande do Sul',
      child: Text('Santa Catarina, RS'),
    ),
  ];

  var _dropDownValue;

  void dropDownCallback(String? selectedValue) {
    if (selectedValue is String) {
      setState(() {
        _dropDownValue = selectedValue;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.azulEscuro,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.azulClaro,
        toolbarHeight: MediaQuery.of(context).size.height * 0.2,
        flexibleSpace: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const TextFieldAppBar(),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.2,
                      height: MediaQuery.of(context).size.height * 0.1,
                      child: IconButton(
                        onPressed: () {
                          Navigator.pushNamed(context, AppRoutes.login);
                        },
                        icon: Image.asset(
                          'assets/images/logo.png',
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10, left: 20),
                child: Row(
                  children: [
                    const Icon(
                      Icons.location_on_outlined,
                      color: Colors.white,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: DropdownButton(
                        items: list,
                        value: _dropDownValue,
                        hint: list[0].child,
                        onChanged: (value) {
                          dropDownCallback(value);
                        },
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                        dropdownColor: AppColors.azulClaro,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: Image.asset('assets/images/tatooine.png'),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 30),
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: const Text(
                  'Droids',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                  ),
                ),
              ),
            ),
            CarouselSlider(
              items: const [
                CarouselItem(
                  image: 'assets/images/r2d2_cor.png',
                  nome: 'Droid R2D2 padrão',
                  preco: 'R\$499,99',
                ),
                CarouselItem(
                  image: 'assets/images/bb8.png',
                  nome: 'Droid BB8 padrão',
                  preco: 'R\$299,99',
                ),
                CarouselItem(
                  image: 'assets/images/d0.png',
                  nome: 'Droid D-0 desgastado',
                  preco: 'R\$189,99',
                ),
              ],
              options: CarouselOptions(
                enableInfiniteScroll: true,
                viewportFraction: 0.5,
                enlargeCenterPage: true,
                enlargeStrategy: CenterPageEnlargeStrategy.height,
                height: MediaQuery.of(context).size.height * 0.4,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 30),
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: const Text(
                  'Acessórios',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                  ),
                ),
              ),
            ),
            CarouselSlider(
              items: const [
                CarouselItem(
                  image: 'assets/images/pneu.png',
                  nome: 'Rodas extras R2D2 padrão',
                  preco: 'R\$59,99',
                ),
                CarouselItem(
                  image: 'assets/images/suporte.png',
                  nome: 'Suporte para carregar droid',
                  preco: 'R\$100,00',
                ),
                CarouselItem(
                  image: 'assets/images/controle.png',
                  nome: 'Droid D-0 desgastado',
                  preco: 'R\$169,99',
                ),
              ],
              options: CarouselOptions(
                enableInfiniteScroll: true,
                viewportFraction: 0.5,
                enlargeCenterPage: true,
                enlargeStrategy: CenterPageEnlargeStrategy.height,
                height: MediaQuery.of(context).size.height * 0.4,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
