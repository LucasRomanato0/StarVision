import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:mobile/shared/pages/master_page.dart';
import 'package:mobile/widgets/carousel_item.dart';

class ProdutosPage extends StatefulWidget {
  const ProdutosPage({super.key});

  @override
  State<ProdutosPage> createState() => _ProdutosPageState();
}

class _ProdutosPageState extends State<ProdutosPage> {
  @override
  Widget build(BuildContext context) {
    return MasterPage(
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
                nome: 'Controle de movimento',
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
    );
  }
}
