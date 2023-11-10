import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:mobile/app_routes.dart';
import 'package:mobile/pages/cart/ui/controllers/cart_controller.dart';
import 'package:mobile/shared/app_colors.dart';
import 'package:mobile/shared/pages/master_page.dart';
import 'package:mobile/widgets/botao_amarelo.dart';
import 'package:mobile/pages/produtos/ui/widgets/carousel_item.dart';
import 'package:mobile/widgets/container_principal.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  late CartController controller;

  @override
  void initState() {
    super.initState();
    controller = GetIt.I.get();
    controller.getCart();
  }

  @override
  Widget build(BuildContext context) {
    return MasterPage(
      child: Center(
        child: Observer(
          builder: (BuildContext context) => Column(
            children: [
              ContainerPrincipal(
                width: MediaQuery.of(context).size.width,
                loginOrRegister: 1,
                children: controller.status == 404
                    ? [
                        Image.asset('assets/images/carrinho.png'),
                        const Text(
                          'Seu carrinho está vazio :(',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ]
                    : [
                        const Row(
                          children: [
                            Text(
                              "Carrinho de compas",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 30),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 25, top: 8),
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            height: 2,
                            decoration: BoxDecoration(
                              color: AppColors.azulBorda,
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                        ),
                        const ContainerPrincipal(
                          loginOrRegister: 1,
                          children: [],
                        )
                      ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 30),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: const Text(
                    'Você pode gostar:',
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
                    id: 1,
                    image: 'assets/images/controle.png',
                    nome: 'Controle de movimento',
                    preco: 'R\$169,99',
                  ),
                  CarouselItem(
                    id: 1,
                    image: 'assets/images/bb8.png',
                    nome: 'Droid BB8 padrão',
                    preco: 'R\$299,99',
                  ),
                  CarouselItem(
                    id: 1,
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
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: BotaoAmarelo(
                  onPressed: () {
                    Navigator.pushNamed(
                      context,
                      AppRoutes.navigationBar,
                    );
                  },
                  text: 'Continuar comprando',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
