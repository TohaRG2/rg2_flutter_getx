
import 'package:rg2/models/phases.dart';

class Blind4x4 implements Phase {
  @override
  int count = blind_4x4_title.length;

  @override
  String phase = "BLIND_4X4";

  @override
  List<String> titles() => blind_4x4_title;

  @override
  List<String> icons() => blind_4x4_icon;

  @override
  List<String> descriptions() => blind_4x4_descr;

  @override
  List<String> urls() => blind_4x4_url;

  @override
  List<String> comments() => List.filled(count, "");

///==================================================

    static const blind_4x4_title = [
        blind_4x4_st1_title,
        blind_4x4_st2_title,
        blind_4x4_st3_title,
        blind_4x4_st4_title,
        blind_4x4_st5_title,
        blind_4x4_st6_title,
    ];

    static const blind_4x4_icon = [
        "blind_4x4_1",
        "blind_4x4_2",
        "blind_4x4_3",
        "blind_4x4_4",
        "blind_4x4_5",
        "blind_4x4_6",
    ];

    static const blind_4x4_descr = [
        blind_4x4_st1_descr,
        blind_4x4_st2_descr,
        blind_4x4_st3_descr,
        blind_4x4_st4_descr,
        blind_4x4_st5_descr,
        blind_4x4_st6_descr,
    ];

    static const blind_4x4_url = [
        blind_4x4_st1_url,
        blind_4x4_st2_url,
        blind_4x4_st3_url,
        blind_4x4_st4_url,
        blind_4x4_st5_url,
        blind_4x4_st6_url,
    ];

    static const blind_4x4_st1_title = "Часть 1. Принципы сборки";
    static const blind_4x4_st1_descr = """
        <p>Из этой серии видео вы узнаете, как собрать кубик Рубика 4 на 4 с закрытыми глазами.
        Данная обучалка рассчитана на тех, кто уже умеет собирать кубик 3 на 3 с закрытыми глазами.
        Словами очень сложно передать, что необходимо делать, поэтому в комментариях к данному
        циклу лишь краткое описание того, о чем видео. Плюс алгоритмы, скрамблы и несколько картинок
        для упрощения понимания/запоминания. В остальном, рекомендую посмотреть видео.</p>

        <p>Спасибо Белоусову Тимофею за идею и огромную помощь в подготовке этой обучалки.</p>

        <p>Если у вас есть идеи, что можно/нужно дописать к какому-нибудь из этапов, присылайте на почту
        <a href="mailto:rubicsguide@yandex.ru">rubicsguide@yandex.ru</a></p>

        <p>Меняем местами <a href="rg2://ytplay?time=6:42&link=8CpDAdF_CY4&alg=l\'_U2_l_d2_l\'_U2_l_d2">3 центровых элемента:</a></p>

        <p style="text-align:center"><img src="blind_4x4_1_1.xml" width="30%%"> => y => <img src="blind_4x4_1_2.xml" width="30%%"></p>

        <p><b><a href="rg2://ytplay?time=6:02&link=8CpDAdF_CY4&alg=l\'_U2_l_d2_l\'_U2_l_d2">Алгоритм:</a> l\' U2 l d2 l\' U2 l d2</b></p>

        <p>Меняем местами два ребра, находящиеся друг напротив друга:</p>

        <p style="text-align:center"><img src="blind_4x4_1_4.xml" width="30%%"></p>

        <p><b><a href="rg2://ytplay?time=7:23&link=8CpDAdF_CY4&alg=l\'_U2_l\'_U2_F2_l\'_F2_r_U2_r\'_U2_l2">Алгоритм:</a> l\' U2 l\' U2 F2 l\' F2 r U2 r\' U2 l2</b></p>

        <p>Меняем местами 2 ребра рядом (Студент).</p>

        <p style="text-align:center"><img src="blind_4x4_1_3.xml" width="30%%"></p>

        <b><a href="rg2://ytplay?time=9:01&link=8CpDAdF_CY4&alg=r2_B2_(U2_l_U2_r\'_U2_r_U2_F2_r_F2_l\')B2_r2">Алгоритм:</a> r2 B2 (U2 l U2 r\' U2 r U2 F2 r F2 l\') B2 r2</b></p>

        <p>Сборка углов почти ничем не отличается от их сборки на кубике 3 на 3. Только при нечётном количестве
         циклов необходимо сделать <b>паритет</b>.</p>

        <p><b><a href="rg2://ytplay?time=11:48&link=8CpDAdF_CY4&alg=(r2_U2_r2_Uw2_r2_Uw2_U2)_y_(R\'_U_R\'_U\'_R\'_U\'_R\'_U_R_U_R2)">Алгоритм</a>:
        (r2 U2 r2 Uw2 r2 Uw2 U2) y (R\' U R\' U\' R\' U\' R\' U R U R2)</b></p>

        <p>P.S.Строчные буквы означают вращение ТОЛЬКО среднего слоя. Возможно, кому-то такая система записи
        покажется нестандартной, но в последующих видео этой обучалки её будет использовать Максим
        Чечнев, и, чтобы никто не запутался, она используется и здесь.</p>
        """;
    static const blind_4x4_st1_url = "8CpDAdF_CY4";

    static const blind_4x4_st2_title = "Часть 2. Углы";
    static const blind_4x4_st2_descr = """
        <p>Пример сборки углов.</p>

        <p><a href="rg2://ytplay?time=0:46&link=W-ITYZBSe1g">Скрамбл</a> в видео: <b>U\' D R\' U L2 F D2 L U\' R F R2 F2 D2 B U2 R2 B2 R2 Uw2 B Uw2 U\' F2 B\' Rw2 U
         Fw2 F\' B D2 R D\' Rw Uw2 D R2 U Rw\' Fw\' Rw2 Uw B\'</b></p>
    """;
    static const blind_4x4_st2_url = "W-ITYZBSe1g";

    static const blind_4x4_st3_title = "Часть 3. Запоминание рёбер";
    static const blind_4x4_st3_descr = """
       <p>Буфер и корзина рёбер на кубике 4 на 4, а также составление цепочки для рёбер.</p>

       <p>Скрамбл: из предыдущей части.<br/>
       <b>Фраза:</b> ЛИЁК АЮ ПыШное ОБлако ЭРик МаЗал СоЦиалистический УКаз ГВардеец ЖЯ ГоХа ФХ.</p>
    """;
    static const blind_4x4_st3_url = "b79_zALckJI";

    static const blind_4x4_st4_title = "Часть 4. Сборка рёбер";
    static const blind_4x4_st4_descr = """
        <p>Сборка рёбер по составленной в предыдущей части цепочке.</p>
    """;
    static const blind_4x4_st4_url = "o_GONzhxCEA";

    static const blind_4x4_st5_title = "Часть 5. Установочные ходы на рёбра";
    static const blind_4x4_st5_descr = """
        <p>Установочные ходы для рёбер в кубике 4 на 4.</p>
    """;
    static const blind_4x4_st5_url = "kohksrZslUA";

    static const blind_4x4_st6_title = "Часть 6. Запоминание и сборка центров";
    static const blind_4x4_st6_descr = """
        <p>Азбука, установочные ходы и цепочка для центров.</p>

        <p>Скрамбл в видео: из предыдущих частей.<br/>
        <b>Фраза:</b> КА ОВ ШаГает ЛиФт ЕЦ ЮМор ЯРик ЗГ<br/>
        ОСНОВНОЙ алгоритм(у которого есть 6 вариаций):<br/>
        <b>l\' U2 l d2 l\' U2 l d2</b>
    """;
    static const blind_4x4_st6_url = "aCKK5Ca41gE";

}