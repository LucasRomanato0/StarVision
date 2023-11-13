import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:mobile/pages/produtos/ui/controllers/produtos_controller.dart';
import 'package:mobile/shared/app_colors.dart';
import 'package:mobile/widgets/container_principal.dart';

class CarouselItem extends StatefulWidget {
  final int id;
  final String image;
  final String nome;
  final String preco;
  final double? width;
  final double? height;
  const CarouselItem({
    super.key,
    required this.image,
    required this.nome,
    required this.preco,
    this.height,
    this.width,
    required this.id,
  });

  @override
  State<CarouselItem> createState() => _CarouselItemState();
}

class _CarouselItemState extends State<CarouselItem> {
  late ProdutosController controller;

  @override
  void initState() {
    super.initState();
    controller = GetIt.I.get();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ContainerPrincipal(
          loginOrRegister: 0,
          child: ElevatedButton(
            onPressed: () {
              controller.addProduct(widget.id);
            },
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(AppColors.azulClaro),
              elevation: MaterialStateProperty.all(0),
            ),
            child: Image.asset(
              widget.image,
              fit: BoxFit.cover,
              height:
                  widget.height ?? MediaQuery.of(context).size.height * 0.18,
              width: widget.width,
            ),
          ),
        ),
        Text(
          widget.nome,
          style: const TextStyle(color: Colors.white, fontSize: 16),
        ),
        Text(
          widget.preco,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
