import 'package:flutter/material.dart';
import 'package:mobile/widgets/container_principal.dart';

class CarouselItem extends StatelessWidget {
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
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ContainerPrincipal(
          loginOrRegister: 0,
          child: Image.asset(
            image,
            fit: BoxFit.cover,
            height: height ?? MediaQuery.of(context).size.height * 0.18,
            width: width,
          ),
        ),
        Text(
          nome,
          style: const TextStyle(color: Colors.white, fontSize: 16),
        ),
        Text(
          preco,
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
