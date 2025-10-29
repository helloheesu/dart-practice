import 'package:flutter/material.dart';
import '../../../core/utils/format.dart';
import '../../../data/repository/cart_store.dart';
import '../../../core/theme/app_theme.dart';
import '../../../core/notifications/notification_service.dart';
import '../../../core/constants/strings.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final store = CartStore.instance;
    return Scaffold(
      appBar: AppBar(title: const Text(AppStrings.cart)),
      body: AnimatedBuilder(
        animation: store,
        builder: (context, _) {
          if (store.items.isEmpty) {
            return const Center(child: Text('장바구니가 비었습니다.'));
          }
          return Column(
            children: [
              Expanded(
                child: ListView.separated(
                  padding: const EdgeInsets.all(16),
                  itemCount: store.items.length,
                  separatorBuilder: (_, __) => const Divider(height: 16),
                  itemBuilder: (_, i) {
                    final item = store.items[i];
                    return ListTile(
                      contentPadding: const EdgeInsets.symmetric(horizontal: 8),
                      title: Text(item.product.title),
                      subtitle: Text(
                        '수량 ${item.quantity} · ${formatMinutes(item.product.minutes)}',
                      ),
                      trailing: Text(
                        formatMinutes(item.product.minutes * item.quantity),
                        style: const TextStyle(fontWeight: FontWeight.w700),
                      ),
                      leading: CircleAvatar(
                        backgroundColor: AppColors.chipUnselectedBg,
                        foregroundColor: AppColors.muted,
                        child: Text(item.quantity.toString()),
                      ),
                      onLongPress: () => store.removeAt(i),
                    );
                  },
                ),
              ),
              SafeArea(
                top: false,
                minimum: const EdgeInsets.all(12),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          AppStrings.totalTime,
                          style: TextStyle(fontWeight: FontWeight.w700),
                        ),
                        Text(
                          formatMinutes(store.totalMinutes),
                          style: const TextStyle(fontWeight: FontWeight.w800),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    SizedBox(
                      width: double.infinity,
                      child: FilledButton.icon(
                        style: FilledButton.styleFrom(
                          backgroundColor: AppColors.chipSelectedBg,
                          foregroundColor: Colors.white,
                        ),
                        icon: const Icon(Icons.alarm),
                        label: const Text(AppStrings.reserve),
                        onPressed: () async {
                          final minutes = store.totalMinutes;
                          await NotificationService.instance.scheduleAfterMinutes(
                            minutes: minutes,
                            title: AppStrings.alarmTitle,
                            body:
                                '${formatMinutes(minutes)}${AppStrings.alarmElapsedSuffix}',
                          );

                          if (!context.mounted) return;

                          await showDialog(
                            context: context,
                            builder: (_) => AlertDialog(
                              title: const Text(AppStrings.reservationDone),
                              content: Text(
                                '총 ${formatMinutes(minutes)}${AppStrings.alarmReservedSuffix}',
                              ),
                              actions: [
                                TextButton(
                                  onPressed: () => Navigator.of(context).pop(),
                                  child: const Text('확인'),
                                ),
                              ],
                            ),
                          );
                          store.clear();
                          if (context.mounted &&
                              Navigator.of(context).canPop()) {
                            Navigator.of(context).pop();
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
