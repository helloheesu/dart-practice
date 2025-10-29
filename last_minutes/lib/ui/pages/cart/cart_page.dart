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
          return Column(
            children: [
              Expanded(
                child: store.items.isEmpty
                    ? const Center(child: Text('장바구니가 비었습니다.'))
                    : ListView.separated(
                        padding: const EdgeInsets.all(16),
                        itemCount: store.items.length,
                        separatorBuilder: (_, __) => const Divider(height: 16),
                        itemBuilder: (_, i) {
                          final item = store.items[i];
                          return ListTile(
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 8,
                            ),
                            title: Text(item.product.title),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '수량 ${item.quantity} · ${formatMinutes(item.product.minutes)}',
                                ),
                                const SizedBox(height: 6),
                                Row(
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 8,
                                        vertical: 4,
                                      ),
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(20),
                                        border: Border.all(
                                          color: AppColors.surfaceBorder,
                                        ),
                                      ),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          IconButton(
                                            visualDensity:
                                                VisualDensity.compact,
                                            iconSize: 18,
                                            style: IconButton.styleFrom(
                                              backgroundColor:
                                                  AppColors.chipUnselectedBg,
                                              foregroundColor:
                                                  AppColors.chipText,
                                            ),
                                            onPressed: () => CartStore.instance
                                                .decrement(item.product),
                                            icon: const Icon(Icons.remove),
                                          ),
                                          Text(
                                            item.quantity.toString(),
                                            style: const TextStyle(
                                              fontWeight: FontWeight.w700,
                                              color: AppColors.chipText,
                                            ),
                                          ),
                                          IconButton(
                                            visualDensity:
                                                VisualDensity.compact,
                                            iconSize: 18,
                                            style: IconButton.styleFrom(
                                              backgroundColor:
                                                  AppColors.chipSelectedBg,
                                              foregroundColor: Colors.white,
                                            ),
                                            onPressed: () => CartStore.instance
                                                .increment(item.product),
                                            icon: const Icon(Icons.add),
                                          ),
                                        ],
                                      ),
                                    ),
                                    const Spacer(),
                                    IconButton(
                                      tooltip: '삭제',
                                      onPressed: () => store.removeAt(i),
                                      icon: const Icon(Icons.delete_outline),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            trailing: Text(
                              formatMinutes(
                                item.product.minutes * item.quantity,
                              ),
                              style: const TextStyle(
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            leading: CircleAvatar(
                              backgroundColor: AppColors.chipUnselectedBg,
                              foregroundColor: AppColors.muted,
                              child: Text(item.quantity.toString()),
                            ),
                          );
                        },
                      ),
              ),
              SafeArea(
                top: false,
                minimum: const EdgeInsets.all(12),
                child: FutureBuilder<int>(
                  future: NotificationService.instance.getRemainingMinutes(),
                  builder: (context, snapshot) {
                    final remaining = snapshot.data ?? 0;
                    final hasActive = remaining > 0;

                    // If cart empty and no active alarm, show nothing at bottom
                    if (store.items.isEmpty && !hasActive) {
                      return const SizedBox.shrink();
                    }

                    final showTotalRow = store.items.isNotEmpty;
                    final buttonLabel = hasActive
                        ? (store.items.isEmpty
                              ? '알람 취소 (${remaining}분 남음)'
                              : '알람 수정 (${remaining}분 남음)')
                        : AppStrings.reserve;

                    return Column(
                      children: [
                        if (showTotalRow) ...[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                AppStrings.totalTime,
                                style: TextStyle(fontWeight: FontWeight.w700),
                              ),
                              Text(
                                formatMinutes(store.totalMinutes),
                                style: const TextStyle(
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 12),
                        ],
                        SizedBox(
                          width: double.infinity,
                          child: FilledButton.icon(
                            style: FilledButton.styleFrom(
                              backgroundColor: AppColors.chipSelectedBg,
                              foregroundColor: Colors.white,
                            ),
                            icon: const Icon(Icons.alarm),
                            label: Text(buttonLabel),
                            onPressed: () async {
                              if (hasActive && store.items.isEmpty) {
                                await NotificationService.instance.stop();
                                if (!context.mounted) return;
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(content: Text('알람이 취소되었습니다.')),
                                );
                                return;
                              }

                              final minutes = store.totalMinutes;
                              await NotificationService.instance
                                  .scheduleAfterMinutes(
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
                                      onPressed: () =>
                                          Navigator.of(context).pop(),
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
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
