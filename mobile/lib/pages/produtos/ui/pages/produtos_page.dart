import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:mobile/pages/produtos/ui/controllers/produtos_controller.dart';
import 'package:mobile/shared/pages/master_page.dart';
import 'package:mobile/widgets/carousel_item.dart';

class ProdutosPage extends StatefulWidget {
  const ProdutosPage({super.key});

  @override
  State<ProdutosPage> createState() => _ProdutosPageState();
}

class _ProdutosPageState extends State<ProdutosPage> {
  late ProdutosController controller;

  @override
  void initState() {
    super.initState();
    controller = GetIt.I.get();
    controller.getProdutos();
  }

  @override
  Widget build(BuildContext context) {
    return MasterPage(
      child: Observer(
        builder: (BuildContext context) => controller.produtoEntity == null
            ? const Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircularProgressIndicator(
                      strokeWidth: 2,
                    ),
                  ],
                ),
              )
            : Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: Image.asset('assets/images/tatooine.png'),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 20, right: 20, top: 30),
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
                    items: [
                      CarouselItem(
                        image: 'assets/images/r2d2_cor.png',
                        nome: controller.produtoEntity![0]['name'],
                        preco: controller.produtoEntity![0]['price'],
                      ),
                      CarouselItem(
                        image: 'assets/images/bb8.png',
                        nome: controller.produtoEntity![1]['name'],
                        preco: controller.produtoEntity![1]['price'],
                      ),
                      CarouselItem(
                        image: 'assets/images/d0.png',
                        nome: controller.produtoEntity![2]['name'],
                        preco: controller.produtoEntity![2]['price'],
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
                    padding:
                        const EdgeInsets.only(left: 20, right: 20, top: 30),
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
                    items: [
                      CarouselItem(
                        image: 'assets/images/pneu.png',
                        nome: controller.produtoEntity![3]['name'],
                        preco: controller.produtoEntity![3]['price'],
                      ),
                      CarouselItem(
                        image: 'assets/images/suporte.png',
                        nome: controller.produtoEntity![4]['name'],
                        preco: controller.produtoEntity![4]['price'],
                      ),
                      CarouselItem(
                        image: 'assets/images/controle.png',
                        nome: controller.produtoEntity![5]['name'],
                        preco: controller.produtoEntity![5]['price'],
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
