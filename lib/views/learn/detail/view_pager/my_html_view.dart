import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:rg2/views/learn/detail/controller/learn_detail_controller.dart';
import 'package:rg2/views/shared/url_helper.dart';
import 'package:rg2/utils/my_logger.dart';


/// Виджет для отображения HTML с поддержкой локальных изображений из assets
class MyHtmlView extends StatelessWidget {
  final int _curPageNumber;

  const MyHtmlView({
    Key? key,
    required int curPageNumber,
  })  : _curPageNumber = curPageNumber,
        super(key: key);


  @override
  Widget build(BuildContext context) {
    final controller = Get.find<LearnDetailController>();
    final assetPath = controller.getAssetPath();
    final description = controller.currentItems[_curPageNumber].description;
    
    // Нормализуем HTML текст (заменяем пути к картинкам)
    final htmlText = UrlHelper.getNormalHtmlTextFromDescription(description, assetPath);
    
    logPrint("MyHtmlView - assetPath: $assetPath");
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: [
        Html(
          data: htmlText,
          style: {
            "a": Style(
              color: Get.theme.colorScheme.primary,
            ),
            "h5": Style(
              textAlign: TextAlign.center,
              fontSize: FontSize.large
            ),
            "img": Style(
              display: Display.block,
            ),
          },
          onLinkTap: (url, _, __) {
            UrlHelper.onUrlTap(url ?? "");
          },
          extensions: [
            /// Кастомный рендеринг тегов <img> — загрузка из assets
            TagExtension(
              tagsToExtend: {"img"},
              builder: (extensionContext) {
                // Получаем apath - путь к asset папке (добавляется в url_helper.dart)
                final assetPath = extensionContext.attributes['apath'] ?? '';
                // Получаем src - имя файла картинки
                final src = extensionContext.attributes['src'] ?? '';
                
                if (src.isEmpty) return const SizedBox.shrink();
                
                logPrint("MyHtmlView - assetPath: '$assetPath', src: '$src'");
                
                // Формируем полный путь к файлу
                final fullPath = assetPath.isNotEmpty ? '$assetPath/$src' : src;

                // Получить width атрибут если задан
                final widthAttr = extensionContext.attributes['width'];
                final widthPercent = widthAttr != null ? double.tryParse(widthAttr.replaceAll('%', '')) : null;
                
                return _AssetHtmlImage(
                  src: fullPath,
                  widthPercent: widthPercent,
                );
              },
            ),
          ],
        ),
      ],
    );
  }
}


/// Виджет для отображения изображения из assets по имени файла
class _AssetHtmlImage extends StatelessWidget {
  final String src;
  final double? widthPercent;

  const _AssetHtmlImage({
    Key? key,
    required this.src,
    this.widthPercent,
  });

  @override
  Widget build(BuildContext context) {
    // Нормализовать имя файла:
    // 1. Заменить .xml на .png
    // 2. Если расширения нет вообще - добавить .png
    var normalizedSrc = src.replaceAll(
      RegExp(r'\.(xml)$', caseSensitive: false),
      '.png',
    );
    
    // Проверяем есть ли расширение файла (точка с последующими символами после последнего слэша)
    final fileName = normalizedSrc.contains('/')
        ? normalizedSrc.substring(normalizedSrc.lastIndexOf('/') + 1)
        : normalizedSrc;
    
    // Если в имени файла нет точки - добавляем .png
    if (!fileName.contains('.')) {
      normalizedSrc = '$normalizedSrc.png';
    }

    // Путь к asset (src уже содержит путь вида main3x3/rozov/rozov_1_1.png)
    final assetPath = 'assets/images/$normalizedSrc';
    logPrint("MyHtmlView - Rendering image: $assetPath");

    return LayoutBuilder(
      builder: (context, constraints) {
        final width = widthPercent != null
            ? constraints.maxWidth * (widthPercent! / 100)
            : null;

        return Image.asset(
          assetPath,
          width: width,
          fit: BoxFit.contain,
          errorBuilder: (context, error, stackTrace) {
            logPrint("MyHtmlView - Error loading image: $src");
            logPrint("MyHtmlView - Error: $error");
            return _buildErrorWidget(assetPath);
          },
        );
      },
    );
  }

  Widget _buildErrorWidget(String path) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.red.shade50,
        border: Border.all(color: Colors.red.shade200),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.broken_image_outlined, color: Colors.red, size: 32),
          const SizedBox(height: 4),
          Text(
            'Ошибка: $path',
            style: const TextStyle(color: Colors.red, fontSize: 10),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
