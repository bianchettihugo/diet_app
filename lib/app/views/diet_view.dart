import 'dart:math';

import 'package:diet_app/core/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class DietView extends StatefulWidget {
  const DietView({super.key});

  @override
  State<DietView> createState() => _DietViewState();
}

class _DietViewState extends State<DietView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: context.theme.colorScheme.primary,
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              color: context.theme.scaffoldBackgroundColor,
              padding: const EdgeInsets.only(top: 30),
              width: double.maxFinite,
              height: 250,
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 15),
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                width: double.maxFinite,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: context.theme.primaryColor,
                ),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          '90,85%',
                          textAlign: TextAlign.center,
                          style: context.text.displaySmall?.copyWith(
                            fontWeight: FontWeight.w600,
                            color: context.theme.colorScheme.onPrimary,
                          ),
                        ),
                        const SizedBox(height: 3),
                        Text(
                          'Refeições dentro da dieta',
                          textAlign: TextAlign.center,
                          style: context.text.bodyMedium?.copyWith(
                            color: context.theme.colorScheme.onPrimary,
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    Lottie.asset('assets/mix.json', width: 132),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.separated(
                itemCount: 18,
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.symmetric(horizontal: 15),
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 13),
                itemBuilder: (context, index) {
                  final randomTime =
                      (Random().nextInt(24) + 1).toString().padLeft(2, '0');
                  final complete = Random().nextInt(2);
                  return ListTile(
                    tileColor: context.theme.cardColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 4,
                    ),
                    leading: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(
                          width: 60,
                          child: Text(
                            '$randomTime:00',
                            style: context.text.bodyMedium.bold,
                          ),
                        ),
                        Container(
                          width: 1,
                          height: 20,
                          color: context.theme.dividerColor,
                        ),
                      ],
                    ),
                    title: Text(
                      'Whey protein com leite $index',
                      style: context.text.bodyMedium,
                    ),
                    trailing: Container(
                      width: 10,
                      height: 10,
                      decoration: BoxDecoration(
                        color: (complete == 0
                                ? context.theme.primaryColor
                                : context.theme.colorScheme.inversePrimary)
                            .withOpacity(0.5),
                        shape: BoxShape.circle,
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
