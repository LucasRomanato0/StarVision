import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:mobile/app_routes.dart';
import 'package:mobile/pages/cart/ui/controllers/cart_controller.dart';
import 'package:mobile/pages/cart/ui/widgets/cart_widget.dart';
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
                children: controller.cartEntity == null
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
                          padding: const EdgeInsets.only(top: 8),
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            height: 2,
                            decoration: BoxDecoration(
                              color: AppColors.azulBorda,
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                        ),
                        SizedBox(
                          // height: MediaQuery.of(context).size.height * 0.3,
                          height: controller.cartEntity!.length == 1
                              ? MediaQuery.of(context).size.height * 0.15
                              : controller.cartEntity!.length == 2
                                  ? MediaQuery.of(context).size.height * 0.3
                                  : MediaQuery.of(context).size.height * 0.45,
                          child: ListView.builder(
                            padding: const EdgeInsets.only(top: 8),
                            itemBuilder: (context, index) {
                              return CartWidget(
                                // image: 'assets/images/bb8.png',
                                image: controller.cartEntity![index]["product"]
                                            [0]["id"] ==
                                        1
                                    ? 'assets/images/r2d2_cor.png'
                                    : controller.cartEntity![index]["product"]
                                                [0]["id"] ==
                                            2
                                        ? 'assets/images/bb8.png'
                                        : controller.cartEntity![index]
                                                    ["product"][0]["id"] ==
                                                3
                                            ? 'assets/images/d0.png'
                                            : controller.cartEntity![index]
                                                        ["product"][0]["id"] ==
                                                    4
                                                ? 'assets/images/pneu.png'
                                                : controller.cartEntity![index]
                                                                ["product"][0]
                                                            ["id"] ==
                                                        5
                                                    ? 'assets/images/suporte.png'
                                                    : 'assets/images/controle.png',
                                name: controller.cartEntity![index]["product"]
                                    [0]["name"],
                                price: controller.cartEntity![index]["product"]
                                    [0]["price"],
                                qtd: controller.cartEntity![index]["qtd"],
                              );
                            },
                            itemCount: controller.cartEntity!.length,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(50, 8, 50, 0),
                          child: BotaoAmarelo(
                            onPressed: () {},
                            text: 'Fechar pedido',
                            size: 25,
                          ),
                        ),
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
