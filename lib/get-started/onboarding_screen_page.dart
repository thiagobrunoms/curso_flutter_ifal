import 'package:curso_ifal_flutter/get-started/onboarding_page_content.dart';
import 'package:flutter/material.dart';

class OnBoardingPage extends StatelessWidget {
  int pageIndex = 1;
  PageController pageController = PageController();

  OnBoardingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: PageView(
          controller: pageController,
          children: [
            OnboardingPageContent(
              imagePath: 'assets/images/onboarding - dentists-front.png',
              title: 'Seja encontrado por novos pacientes próximos a você!',
              description:
                  'Através da nossa ferramenta de busca e localização, qualquer usuário pode encontrar seu perfil e informações da sua clínica',
              pageController: pageController,
              pageIndex: pageIndex++,
              pagesLength: 3,
            ),
            OnboardingPageContent(
              imagePath: 'assets/images/onboarding - appointment.png',
              title: 'Receba pedidos de agendamento dos usuários!',
              description:
                  'Seus futuros pacientes ou pacientes em tratamento poderão solicitar agendamentos de consultas. Você poderá aceitar ou reagendar!',
              pageController: pageController,
              pageIndex: pageIndex++,
              pagesLength: 3,
            ),
            OnboardingPageContent(
              imagePath: 'assets/images/onboarding - videocall.png',
              title: 'Faça consultas por video-chamada!',
              description:
                  'Você não precisa mais dar seu número de contato pessoal aos pacientes. Agora você faz consultas básicas por video-chamada diretamente com seus pacientes.',
              pageController: pageController,
              pageIndex: pageIndex++,
              pagesLength: 3,
            ),
          ],
        ),
      ),
    );
  }
}
