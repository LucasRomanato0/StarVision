import 'package:flutter/material.dart';
import 'package:mobile/shared/app_colors.dart';

class CartWidget extends StatelessWidget {
  final String image;
  final String name;
  final String price;
  final int qtd;
  const CartWidget({
    super.key,
    required this.image,
    required this.name,
    required this.price,
    required this.qtd,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      child: Row(
        children: [
          Image.asset(
            image,
            width: MediaQuery.of(context).size.width * 0.2,
            fit: BoxFit.cover,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
              Text(
                price,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const Text(
                'em até 3x sem juros',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                ),
              ),
              Text(
                'Estimativa de envio de 4 a 5 dias.',
                style: TextStyle(
                  color: AppColors.amarelo,
                  fontSize: 15,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5),
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: AppColors.azulBorda,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        'Qtd: $qtd',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                        ),
                      ),
                    ),
                    linha(context),
                    Text(
                      'Excluir',
                      style:
                          TextStyle(color: AppColors.azulBorda, fontSize: 9),
                    ),
                    linha(context),
                    Text(
                      'Salvar para mais tarde',
                      style:
                          TextStyle(color: AppColors.azulBorda, fontSize: 9),
                    ),
                    linha(context),
                    Text(
                      'Compartilhar',
                      style:
                          TextStyle(color: AppColors.azulBorda, fontSize: 9),
                    ),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}

Widget linha(BuildContext context) {
  return Container(
    width: 2,
    height: MediaQuery.of(context).size.height * (0.035),
    margin: const EdgeInsets.symmetric(horizontal: 5),
    decoration: BoxDecoration(
      color: AppColors.azulBorda,
      borderRadius: BorderRadius.circular(20),
    ),
  );
}
