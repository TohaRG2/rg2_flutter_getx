
import 'package:rg2/models/phases.dart';

class Cll implements Phase {
  @override
  int count = cll_title.length;

  @override
  String phase = "CLL";

  @override
  List<String> titles() => cll_title;

  @override
  List<String> icons() => cll_icon;

  @override
  List<String> descriptions() => cll_descr;

  @override
  List<String> urls() => cll_url;

  @override
  List<String> comments() => List.filled(count, "");

///==================================================

    static const cll_title = [
        cll_st0_title,

        cll_st1_title,
        cll_st3_title,
        cll_st5_title,
        cll_st7_title,
        cll_st9_title,
        cll_st11_title,

        cll_st2_title,
        cll_st4_title,
        cll_st6_title,
        cll_st8_title,
        cll_st10_title,
        cll_st12_title,

        cll_st13_title,
        cll_st14_title,
        cll_st15_title,
        cll_st16_title,
        cll_st17_title,
        cll_st18_title,
        cll_st19_title,
        cll_st20_title,
        cll_st21_title,
        cll_st22_title,
        cll_st23_title,
        cll_st24_title,
        cll_st25_title,
        cll_st26_title,
        cll_st27_title,
        cll_st28_title,
        cll_st29_title,
        cll_st30_title,
        cll_st31_title,
        cll_st32_title,
        cll_st33_title,
        cll_st34_title,
        cll_st35_title,
        cll_st36_title,
        cll_st37_title,
        cll_st38_title,
        cll_st39_title,
        cll_st40_title,
        cll_st41_title,
    ];

    static const cll_icon = [
        "cll",
        "cll_1",
        "cll_3",
        "cll_5",
        "cll_7",
        "cll_9",
        "cll_11",
        "cll_2",
        "cll_4",
        "cll_6",
        "cll_8",
        "cll_10",
        "cll_12",
        "cll_13",
        "cll_14",
        "cll_15",
        "cll_16",
        "cll_17",
        "cll_18",
        "cll_19",
        "cll_20",
        "cll_21",
        "cll_22",
        "cll_23",
        "cll_24",
        "cll_25",
        "cll_26",
        "cll_27",
        "cll_28",
        "cll_29",
        "cll_30",
        "cll_31",
        "cll_32",
        "cll_33",
        "cll_34",
        "cll_35",
        "cll_36",
        "cll_37",
        "cll_38",
        "cll_39",
        "cll_40",
        "cll_41",
    ];

    static const cll_descr = [
        cll_st0_descr,

        cll_st1_descr,
        cll_st3_descr,
        cll_st5_descr,
        cll_st7_descr,
        cll_st9_descr,
        cll_st11_descr,

        cll_st2_descr,
        cll_st4_descr,
        cll_st6_descr,
        cll_st8_descr,
        cll_st10_descr,
        cll_st12_descr,

        cll_st13_descr,
        cll_st14_descr,
        cll_st15_descr,
        cll_st16_descr,
        cll_st17_descr,
        cll_st18_descr,

        cll_st19_descr,
        cll_st20_descr,
        cll_st21_descr,
        cll_st22_descr,
        cll_st23_descr,
        cll_st24_descr,

        cll_st25_descr,
        cll_st26_descr,
        cll_st27_descr,
        cll_st28_descr,
        cll_st29_descr,
        cll_st30_descr,

        cll_st31_descr,
        cll_st32_descr,
        cll_st33_descr,
        cll_st34_descr,
        cll_st35_descr,
        cll_st36_descr,

        cll_st37_descr,
        cll_st38_descr,
        cll_st39_descr,
        cll_st40_descr,

        cll_st41_descr,

    ];

    static const cll_url = [
        cll_st0_url,
        cll_st1_url,
        cll_st3_url,
        cll_st5_url,
        cll_st7_url,
        cll_st9_url,
        cll_st11_url,

        cll_st2_url,
        cll_st4_url,
        cll_st6_url,
        cll_st8_url,
        cll_st10_url,
        cll_st12_url,

        cll_st13_url,
        cll_st14_url,
        cll_st15_url,
        cll_st16_url,
        cll_st17_url,
        cll_st18_url,
        cll_st19_url,
        cll_st20_url,
        cll_st21_url,
        cll_st22_url,
        cll_st23_url,
        cll_st24_url,
        cll_st25_url,
        cll_st26_url,
        cll_st27_url,
        cll_st28_url,
        cll_st29_url,
        cll_st30_url,
        cll_st31_url,
        cll_st32_url,
        cll_st33_url,
        cll_st34_url,
        cll_st35_url,
        cll_st36_url,
        cll_st37_url,
        cll_st38_url,
        cll_st39_url,
        cll_st40_url,
        cll_st41_url,
    ];

    static const cll_comment = [
        cll_st0_comment,

        cll_st1_comment,
        cll_st3_comment,
        cll_st5_comment,
        cll_st7_comment,
        cll_st9_comment,
        cll_st11_comment,

        cll_st2_comment,
        cll_st4_comment,
        cll_st6_comment,
        cll_st8_comment,
        cll_st10_comment,
        cll_st12_comment,

        cll_st13_comment,
        cll_st14_comment,
        cll_st15_comment,
        cll_st16_comment,
        cll_st17_comment,
        cll_st18_comment,
        cll_st19_comment,
        cll_st20_comment,
        cll_st21_comment,
        cll_st22_comment,
        cll_st23_comment,
        cll_st24_comment,
        cll_st25_comment,
        cll_st26_comment,
        cll_st27_comment,
        cll_st28_comment,
        cll_st29_comment,
        cll_st30_comment,
        cll_st31_comment,
        cll_st32_comment,
        cll_st33_comment,
        cll_st34_comment,
        cll_st35_comment,
        cll_st36_comment,
        cll_st37_comment,
        cll_st38_comment,
        cll_st39_comment,
        cll_st40_comment,
        cll_st41_comment,
    ];
    
    static const cll_st0_title = "Введение";
    static const cll_st0_descr = """
        <p>CLL <a href="rg2://ytplay?time=0:15&link=n06bmpfoTJk">(Corners of Last Layer)</a>
        - метод сборки кубика 2х2, который объединяет этапы OLL и PLL для
        последнего слоя, т.е. позволяет собрать верхний слой из любой ситуации в один алгоритм.
        Можно конечно применить алгоритмы из COLL для трешки, но поскольку в двушке нет ребер, то
        зачастую в CLL есть более короткие и удобные варианты. Этот метод является частью метода FULL EG.</p>

        <p>Определение ситуации в CLL, как и в COLL ситуациях, происходит по смежности, схожести
        либо противоположности наклеек угловых элементов. Постараюсь привести эскизы ситуаций,
        именно для тех положений, из которых наиболее легко определяется CLL ситуация, а также
        дать текстовое описание определения этих ситуаций. Именно поэтому в превьюшках приведены
        трехмерные картинки кубиков на которых выделены только необходмые для определения
        ситуации элементы.</p>

        <p>В основе данных обучалок видео от Яна Корзюка, за что ему большое спасибо.
        Если вы используете какой-то свой алгоритм, то вы его можете задать в поле \"Свой комментарий
        (алгоритм)\" к этапу, после этого он отобразится и в списке этапов.</p>
    """;
    static const cll_st0_url = "n06bmpfoTJk";
    static const cll_st0_comment = "";

    ///<!-- ================= Рыбки и Акулы ======================= -->

    static const cll_st1_title = "Рыбка (Sune) ОП!";
    static const cll_st1_descr = """
        <p>Начнем с Рыбок и Акул. Для данных алгоритмов из положений приведенных на картинках достаточно
        посмотреть на налейки сбоку от наклеек цвета верхней стороны (на картинках указаны \"желтым\") и на
        наклейку стоящую <a href="rg2://ytplay?time=1:31&link=n06bmpfoTJk">между \"желтыми\".</a>
        Первым делом сравниваем между собой две наклейки стоящие <b>рядом
        с желтым</b>, а потом наклейку стоящую <b>между желтыми</b> и наклейку стоящую <b>рядом с желтой</b> на передней
        грани кубика. Поскольку Акулы и Рыбки по сути являются зеркальными случаями друг друга, то
        учить удобнее Акулы с Рыбками соответствующими парами.</p>

        <p>В данном случае у нас первая пара Одинаковая, а вторая Противоположная, поэтому назовем эту
        ситуацию - Рыбка ОП!.</p>
        <p style="text-align:center"><img src="cll_1.xml"></p>

        <p><a href="rg2://ytplay?time=2:12&link=n06bmpfoTJk&alg=U\'_L\'_U2_L_U_L\'_U_L">Алгоритм:</a> <b>U\' L\' U2 L U L\' U L</b></p>

        <p>Как смоделировать: выполнить Акулу ОП!. <b>U R U2\' R\' U\' R U\' R\'</b></p>
    """;
    static const cll_st1_url = "n06bmpfoTJk";
    static const cll_st1_comment = "U\' L\' U2 L U L\' U L";

    static const cll_st2_title = "Акула (AntiSune) ОП!";
    static const cll_st2_descr = """
        <p>В данном случае у нас первая пара Одинаковая, а вторая Противоположная, значит это
        <a href="rg2://ytplay?time=1:47&link=n06bmpfoTJk">Акула ОП!.</a></p>
        <p style="text-align:center"><img src="cll_2.xml"></p>

        <p><a href="rg2://ytplay?time=1:56&link=n06bmpfoTJk&alg=U_R_U2\'_R\'_U\'_R_U\'_R\'">Алгоритм:</a> <b>U R U2\' R\' U\' R U\' R\'</b></p>

        <p>Как смоделировать: выполнить Акулу ОП!. <b>U\' L\' U2 L U L\' U L</b></p>
    """;
    static const cll_st2_url = "n06bmpfoTJk";
    static const cll_st2_comment = "U R U2\' R\' U\' R U\' R\'";

    static const cll_st3_title = "Рыбка (Sune) ПОп";
    static const cll_st3_descr = """
        <p>Первая пара Противоположная, а вторая Одинаковая, значит это
        <a href="rg2://ytplay?time=3:07&link=n06bmpfoTJk">Рыбка ПОп.</a> Довольно непростой для
        исполнения алгоритм.</p>
        <p style="text-align:center"><img src="cll_3.xml"></p>

        <p><a href="rg2://ytplay?time=3:11&link=n06bmpfoTJk&alg=U_(R\'_F_R2_F\'_R)_(U2_R\'_U\'_R2)">Алгоритм:</a> <b>U (R\' F R2 F\' R) (U2 R\' U\' R2)</b></p>

        <p>Или: <b>R U R\' U R\' F R F\' R U2 R\'</b></p>

        <p>Как смоделировать: выполнить Акулу ПОп. <b>R U2 R\' U\' R U\' F R F\' U\' R\'</b></p>
    """;
    static const cll_st3_url = "n06bmpfoTJk";
    static const cll_st3_comment = "U (R\' F R2 F\' R) (U2 R\' U\' R2)";

    static const cll_st4_title = "Акула (AntiSune) ПОп";
    static const cll_st4_descr = """
        <p>Первая пара Противоположная, а вторая Одинаковая, значит это
        <a href="rg2://ytplay?time=2:43&link=n06bmpfoTJk">Акула ПОп.</a></p>
        <p style="text-align:center"><img src="cll_4.xml"></p>

        <p><a href="rg2://ytplay?time=2:49&link=n06bmpfoTJk&alg=R_U2_R\'_U\'_R_U\'_F_R_F\'_U\'_R\'">Алгоритм:</a> <b>R U2 R\' U\' R U\' F R F\' U\' R\'</b></p>

        <p>Как смоделировать: выполнить Рыбку ПОп. <b>U (R\' F R2 F\' R) (U2 R\' U\' R2)</b></p>
    """;
    static const cll_st4_url = "n06bmpfoTJk";
    static const cll_st4_comment = "R U2 R\' U\' R U\' F R F\' U\' R\'";

    static const cll_st5_title = "Рыбка (Sune) ОСь";
    static const cll_st5_descr = """
        <p>Первая пара Одинаковая, а вторая Смежная, значит это
        <a href="rg2://ytplay?time=4:03&link=n06bmpfoTJk">Рыбка ОСь.</a></p>
        <p style="text-align:center"><img src="cll_5.xml"></p>

        <p><a href="rg2://ytplay?time=4:06&link=n06bmpfoTJk&alg=U2\'_R_U\'_L\'_U_R\'_U\'_L">Алгоритм:</a> <b>U2\' R U\' L\' U R\' U\' L</b></p>

        <p>Как смоделировать: выполнить Акулу ОСь. <b>U2 L\' U R U\' L U R\'</b></p>
    """;
    static const cll_st5_url = "n06bmpfoTJk";
    static const cll_st5_comment = "U2\' R U\' L\' U R\' U\' L";

    static const cll_st6_title = "Акула (AntiSune) ОСь";
    static const cll_st6_descr = """
        <p>Первая пара Одинаковая, а вторая Смежная, значит это
        <a href="rg2://ytplay?time=3:47&link=n06bmpfoTJk">Акула ОСь.</a></p>
        <p style="text-align:center"><img src="cll_6.xml"></p>

        <p><a href="rg2://ytplay?time=3:54&link=n06bmpfoTJk&alg=U2_L\'_U_R_U\'_L_U_R\'">Алгоритм:</a> <b>U2 L\' U R U\' L U R\'</b></p>

        <p>Как смоделировать: выполнить Рыбку ОСь. <b>U2\' R U\' L\' U R\' U\' L</b></p>
    """;
    static const cll_st6_url = "n06bmpfoTJk";
    static const cll_st6_comment = "U2 L\' U R U\' L U R\'";

    static const cll_st7_title = "Рыбка (Sune) СОс";
    static const cll_st7_descr = """
        <p>Первая пара Смежная, а вторая Одинаковая, значит это
        <a href="rg2://ytplay?time=5:17&link=n06bmpfoTJk">Рыбка СОс</a> или СОль. По
        сути противоположна Акуле ПСих.</p>
        <p style="text-align:center"><img src="cll_7.xml"></p>

        <p><a href="rg2://ytplay?time=5:21&link=n06bmpfoTJk&alg=U2\'_R\'_F2_R_U2\'_R_U\'_R\'_F">Алгоритм:</a> <b>U2\' R\' F2 R U2\' R U\' R\' F</b></p>

        <p>Как смоделировать: выполнить Акулу ПСих. <b>U2\' F\' R U R\' U2\' R\' F2 R<b></p>
    """;
    static const cll_st7_url = "n06bmpfoTJk";
    static const cll_st7_comment = "U2\' R\' F2 R U2\' R U\' R\' F";

    static const cll_st8_title = "Акула (AntiSune) СОс";
    static const cll_st8_descr = """
        <p>Первая пара Смежная, а вторая Одинаковая, значит это
        <a href="rg2://ytplay?time=4:36&link=n06bmpfoTJk">Акула СОс.</a>
        В отличие от других пар Рыбка/Акула, при выполнении данного алгоритма на собранном кубике
        получится <a href="rg2://ytplay?time=4:15&link=n06bmpfoTJk">Рыбка ПСих,</a> а не СОс.</p>
        <p style="text-align:center"><img src="cll_8.xml"></p>

        <p><a href="rg2://ytplay?time=4:40&link=n06bmpfoTJk&alg=U2\'_R_U2_R\'_U2_R\'_F_R_F\'">Алгоритм:</a> <b>U2\' R U2 R\' U2 R\' F R F\'</b></p>

        <p>Как смоделировать: выполнить Рыбку ПСих. <b>F R U R\' U2\' F\' U\' R\' F R</b></p>
    """;
    static const cll_st8_url = "n06bmpfoTJk";
    static const cll_st8_comment = "U2\' R U2 R\' U2 R\' F R F\'";

    static const cll_st9_title = "Рыбка (Sune) ПСих";
    static const cll_st9_descr = """
        <p>Первая пара Противоположная, а вторая Смежная, значит это
        <a href="rg2://ytplay?time=4:51&link=n06bmpfoTJk">Рыбка ПСих.</a></p>
        <p style="text-align:center"><img src="cll_9.xml"></p>

        <p><a href="rg2://ytplay?time=4:54&link=n06bmpfoTJk&alg=F_R_U_R\'_U2\'_F\'_U\'_R\'_F_R">Алгоритм:</a> <b>F R U R\' U2\' F\' U\' R\' F R</b></p>

        <p>Как смоделировать: выполнить Акулу СОс. <b>U2\' R U2 R\' U2 R\' F R F\'</b></p>
    """;
    static const cll_st9_url = "n06bmpfoTJk";
    static const cll_st9_comment = "F R U R\' U2\' F\' U\' R\' F R";

    static const cll_st10_title = "Акула (AntiSune) ПСих";
    static const cll_st10_descr = """
        <p>Первая пара Противоположная, а вторая Смежная, значит это
        <a href="rg2://ytplay?time=5:04&link=n06bmpfoTJk">Акула ПСих.</a></p>
        <p style="text-align:center"><img src="cll_10.xml"></p>

        <p><a href="rg2://ytplay?time=5:11&link=n06bmpfoTJk&alg=U2\'_F\'_R_U_R\'_U2\'_R\'_F2_R">Алгоритм:</a> <b>U2\' F\' R U R\' U2\' R\' F2 R</b></p>

        <p>Как смоделировать: выполнить Рыбку СОс. <b>U2\' R\' F2 R U2\' R U\' R\' F</b></p>
    """;
    static const cll_st10_url = "n06bmpfoTJk";
    static const cll_st10_comment = "U2\' F\' R U R\' U2\' R\' F2 R";

    static const cll_st11_title = "Рыбка (Sune) СПам";
    static const cll_st11_descr = """
        <p>Первая пара Смежная, а вторая Противоположная, значит это
        <a href="rg2://ytplay?time=5:46&link=n06bmpfoTJk">Рыбка СПам.</a></p>
        <p style="text-align:center"><img src="cll_11.xml"></p>

        <p><a href="rg2://ytplay?time=5:47&link=n06bmpfoTJk&alg=(R_U\'_R_U\')_(R\'_U_R\'_U\')_F_R\'_F\'">Алгоритм:</a> <b>(R U\' R U\') (R\' U R\' U\') F R\' F\'</b><br/>
        или <b>(R U\' R U\') (R\' U R\' U\') y R U\' R\'</b></p>

        <p>Как смоделировать: выполнить Акулу СПам. <b>F R F\' U R U\' R U R\' U R\'</b></p>
    """;
    static const cll_st11_url = "n06bmpfoTJk";
    static const cll_st11_comment = "(R U\' R U\') (R\' U R\' U\') F R\' F\'";

    static const cll_st12_title = "Акула (AntiSune) СПам";
    static const cll_st12_descr = """
        <p>Первая пара Смежная, а вторая Противоположная, значит это
        <a href="rg2://ytplay?time=5:28&link=n06bmpfoTJk">Акула СПам.</a></p>
        <p style="text-align:center"><img src="cll_12.xml"></p>

        <p><a href="rg2://ytplay?time=5:38&link=n06bmpfoTJk&alg=F_R_F\'_U_R_U\'_R_U_R\'_U_R\'">Алгоритм:</a> <b>F R F\' U R U\' R U R\' U R\'</b></p>

        <p>Как смоделировать: выполнить Рыбку СПам. <b>(R U\' R U\') (R\' U R\' U\') F R\' F\'</b></p>
    """;
    static const cll_st12_url = "n06bmpfoTJk";
    static const cll_st12_comment = "F R F\' U R U\' R U R\' U R\'";

    ///<!-- ================= Носики ======================= -->

    static const cll_st13_title = "Носик (L-OLL) СПлин";
    static const cll_st13_descr = """
        Для <a href="rg2://ytplay?time=6:12&link=n06bmpfoTJk">Носиков (L-OLL)</a> первым делом смотрим на две верхние наклейки, а потом на левую
        верхнюю и левую переднюю. Т.е. вот такой Носик (Смежные, Противоположные), будет
        <a href="rg2://ytplay?time=6:38&link=n06bmpfoTJk">Носик СПлин.</a>
        <p style="text-align:center"><img src="cll_13.xml"></p>

        <p><a href="rg2://ytplay?time=6:46&link=n06bmpfoTJk&alg=R2\'_U\'_R_U2_R\'_U2\'_R_U\'_R2">Алгоритм:</a> <b>R2\' U\' R U2 R\' U2\' R U\' R2</b></p>

        <p>Как смоделировать: выполнить алгоритм еще раз. <b>R2\' U\' R U2 R\' U2\' R U\' R2</b></p>

    """;
    static const cll_st13_url = "n06bmpfoTJk";
    static const cll_st13_comment = "R2\' U\' R U2 R\' U2\' R U\' R2";

    static const cll_st14_title = "Носик (L-OLL) СОль";
    static const cll_st14_descr = """
        Первая пара Смежная, а вторая Одинаковая, значит это <a href="rg2://ytplay?time=7:11&link=n06bmpfoTJk">Носик СОль.</a>
        <p style="text-align:center"><img src="cll_14.xml"></p>

        <p><a href="rg2://ytplay?time=7:23&link=n06bmpfoTJk&alg=U\'_R_U2\'_R2\'_F_R_F\'_R_U2\'_R\'">Алгоритм:</a> <b>U\' R U2\' R2\' F R F\' R U2\' R\'</b></p>

        <p>Как смоделировать: выполнить алгоритм еще раз. <b>U\' R U2\' R2\' F R F\' R U2\' R\'</b></p>
    """;
    static const cll_st14_url = "n06bmpfoTJk";
    static const cll_st14_comment = "U\' R U2\' R2\' F R F\' R U2\' R\'";

    static const cll_st15_title = "Носик (L-OLL) ОПал";
    static const cll_st15_descr = """
        Первая пара Одинаковая, а вторая Противоположная, значит это
        <a href="rg2://ytplay?time=8:01&link=n06bmpfoTJk">Носик ОПал.</a>
        <p style="text-align:center"><img src="cll_15.xml"></p>

        <p><a href="rg2://ytplay?time=8:11&link=n06bmpfoTJk&alg=R\'_U2_R_U\'_R\'_U2_R_U\'_F_R_F\'">Алгоритм:</a> <b>R\' U2 R U\' R\' U2 R U\' F R F\'</b></p>

        <p>Как смоделировать: выполнить Глазки Бэкслэш. <b>U\' R2 U R\' U\' R2 U\' F\' U2 F</b></p>
    """;
    static const cll_st15_url = "n06bmpfoTJk";
    static const cll_st15_comment = "R\' U2 R U\' R\' U2 R U\' F R F\'";

    static const cll_st16_title = "Носик (L-OLL) ОСел";
    static const cll_st16_descr = """
        Первая пара Одинаковая, а вторая Смежная, значит это <a href="rg2://ytplay?time=8:58&link=n06bmpfoTJk">Носик ОСел.</a>
        <p style="text-align:center"><img src="cll_16.xml"></p>

        <p><a href="rg2://ytplay?time=9:08&link=n06bmpfoTJk&alg=R_U2\'_R2\'_F2_R_U_R\'_F2_R_F\'">Алгоритм:</a> <b>R U2\' R2\' F2 R U R\' F2 R F\'</b></p>

        <p>Как смоделировать: выполнить Глазки Cлэш. <b>(R\' F R U\') y\' (R U2 R\' U\' R U2 R\')</b></p>
    """;
    static const cll_st16_url = "n06bmpfoTJk";
    static const cll_st16_comment = "R U2\' R2\' F2 R U R\' F2 R F\'";

    static const cll_st17_title = "Носик (L-OLL) ПикСель";
    static const cll_st17_descr = """
        Первая пара Противоположная, а вторая Смежная, значит это <a href="rg2://ytplay?time=9:57&link=n06bmpfoTJk">Носик ПикСель.</a>
        <p style="text-align:center"><img src="cll_17.xml"></p>

        <p><a href="rg2://ytplay?time=10:11&link=n06bmpfoTJk&alg=U_R\'_U2\'_R_U2\'_F_R_F\'">Алгоритм:</a> <b>U R\' U2\' R U2\' F R F\'</b></p>

        <p>Как смоделировать: выполнить Ушки Печенька. <b>U\' R U R\' U\' R\' F R F\'</b></p>
    """;
    static const cll_st17_url = "n06bmpfoTJk";
    static const cll_st17_comment = "U R\' U2\' R U2\' F R F\'";

    static const cll_st18_title = "Носик (L-OLL) ПОинт";
    static const cll_st18_descr = """
        Первая пара Противоположная, а вторая Одинаковая, значит это <a href="rg2://ytplay?time=11:00&link=n06bmpfoTJk">Носик ПОинт.</a>
        <p style="text-align:center"><img src="cll_18.xml"></p>

        <p><a href="rg2://ytplay?time=11:09&link=n06bmpfoTJk&alg=F\'_(R_U_R\'_U\')_R\'_F_R">Алгоритм:</a> <b>F\' (R U R\' U\') R\' F R</b></p>

        <p>Как смоделировать: выполнить Ушки Брауни. <b>(R U R\' U\') F\' U\' F</b></p>
    """;
    static const cll_st18_url = "n06bmpfoTJk";
    static const cll_st18_comment = "F\' (R U R\' U\') R\' F R";


    ///<!-- ================= Глазки ======================= -->

    static const cll_st19_title = "Глазки (U-OLL) Бэкслэш";
    static const cll_st19_descr = """
        <p>В Глазках первым делом смотрим на пару левой/верхней/дальней и правой/ближней наклеек. А затем
        на пару левой/верхней/ближней и правой/дальней наклеек.</p>

        <p>Если первая пара Одинаковая, а вторая Противоположная, то это
        <a href="rg2://ytplay?time=8:26&link=n06bmpfoTJk">Глазки Бэкслэш</a> (по первой паре).</p>

        <p style="text-align:center"><img src="cll_19.xml"></p>

        <p><a href="rg2://ytplay?time=8:11&link=n06bmpfoTJk&alg=U\'_R2_U_R\'_U\'_R2_U\'_F\'_U2_F">Алгоритм:</a> <b>U\' R2 U R\' U\' R2 U\' F\' U2 F</b></p>

        <p>Как смоделировать: выполнить Носик ОПал. <b>R\' U2 R U\' R\' U2 R U\' F R F\'</b></p>
    """;
    static const cll_st19_url = "n06bmpfoTJk";
    static const cll_st19_comment = "U\' R2 U R\' U\' R2 U\' F\' U2 F";

    static const cll_st20_title = "Глазки (U-OLL) Cлэш";
    static const cll_st20_descr = """
        <p>Если первая пара Противоположная, а вторая Одинаковая, то это
        <a href="rg2://ytplay?time=9:19&link=n06bmpfoTJk">Глазки Слэш</a> (по второй паре).</p>

        <p style="text-align:center"><img src="cll_20.xml"></p>

        <p><a href="rg2://ytplay?time=9:31&link=n06bmpfoTJk&alg=(R\'_F_R_U\')_y\'_(R_U2_R\'_U\'_R_U2_R\')">Алгоритм:</a> <b>(R\' F R U\') y\' (R U2 R\' U\' R U2 R\')</b></p>

        <p>Как смоделировать: выполнить Носик ОСел. <b>R U2\' R2\' F2 R U R\' F2 R F\'</b></p>
    """;
    static const cll_st20_url = "n06bmpfoTJk";
    static const cll_st20_comment = "(R\' F R U\') y\' (R U2 R\' U\' R U2 R\')";

    static const cll_st21_title = "Глазки (U-OLL) ЮПи";
    static const cll_st21_descr = """
        <p>Две смежных пары, если смотреть как на все Глазки, или пара на правой грани, а слева разные наклейки.
        Получается Ю-ОЛЛ с буквой П, поэтому <a href="rg2://ytplay?time=11:47&link=n06bmpfoTJk">Глазки ЮПи.</a></p>

        <p style="text-align:center"><img src="cll_21.xml"></p>

        <p><a href="rg2://ytplay?time=12:03&link=n06bmpfoTJk&alg=U_R\'_F_U\'_R_U\'_R\'_U2\'_F2_R">Алгоритм:</a> <b>U R\' F U\' R U\' R\' U2\' F2 R</b></p>

        <p>Как смоделировать: выполнить Ушки Кола. <b>U R\' U R\' F U\' R U F2 R2</b></p>
    """;
    static const cll_st21_url = "n06bmpfoTJk";
    static const cll_st21_comment = "U R\' F U\' R U\' R\' U2\' F2 R";

    static const cll_st22_title = "Глазки (U-OLL) ЮнИкс";
    static const cll_st22_descr = """
        <p>Две Одинаковые пары, Ю-ОЛЛ иксом, поэтому <a href="rg2://ytplay?time=12:37&link=n06bmpfoTJk">ЮнИкс.</a></p>

        <p style="text-align:center"><img src="cll_22.xml"></p>

        <p><a href="rg2://ytplay?time=12:47&link=n06bmpfoTJk&alg=U_x_R_U\'_R_U\'_R\'_U_L\'_U\'_L">Алгоритм:</a> <b>U x R U\' R U\' R\' U L\' U\' L</b></p>

        <p>Как смоделировать: выполнить Ушки Ракета. <b>R\' U\' F R F\' U R U\' R U R\'</b></p>
    """;
    static const cll_st22_url = "n06bmpfoTJk";
    static const cll_st22_comment = "U x R U\' R U\' R\' U L\' U\' L";


    static const cll_st23_title = "Глазки (U-OLL) Хэтчбек";
    static const cll_st23_descr = """
        <p>Две противоположные пары. Или на правой грани пара и сверху пара одинаковых, значит это
        <a href="rg2://ytplay?time=13:22&link=n06bmpfoTJk">Хэтчбек.</a></p>

        <p style="text-align:center"><img src="cll_23.xml"></p>

        <p><a href="rg2://ytplay?time=13:36&link=n06bmpfoTJk&alg=U\'_F_R_U_R\'_U2\'_F\'_R_U\'_R\'_F">Алгоритм:</a> <b>U\' F R U R\' U2\' F\' R U\' R\' F</b></p>

        <p>Как смоделировать: выполнить алгоритм еще раз. <b>U\' F R U R\' U2\' F\' R U\' R\' F</b></p>
    """;
    static const cll_st23_url = "n06bmpfoTJk";
    static const cll_st23_comment = "U\' F R U R\' U2\' F\' R U\' R\' F";

    static const cll_st24_title = "Глазки (U-OLL) Юла (Фруруф)";
    static const cll_st24_descr = """
        <p> Сверху пара одинаковых, а справа пара Противоположных, значит это самый обычный
        <a href="rg2://ytplay?time=14:12&link=n06bmpfoTJk">Фруруф (Юла).</a></p>

        <p style="text-align:center"><img src="cll_24.xml"></p>

        <p><a href="rg2://ytplay?time=14:21&link=n06bmpfoTJk&alg=F_(R_U_R\'_U\')_F\'">Алгоритм:</a> <b>F (R U R\' U\') F\'</b></p>

        <p>Как смоделировать: выполнить алгоритм еще раз. <b></b></p>
    """;
    static const cll_st24_url = "n06bmpfoTJk";
    static const cll_st24_comment = "F (R U R\' U\') F\'";

    ///<!-- ================= Ушки ======================= -->

    static const cll_st25_title = "Ушки (T-OLL) Печенька";
    static const cll_st25_descr = """
        <p>В Ушках <a href="rg2://ytplay?time=10:22&link=n06bmpfoTJk">первым делом смотрим</a> на
        левую пару верхней и передней наклеек. А затем на правую пару верхней и передней наклеек.</p>

        <p>Если первая пара Одинаковая, а вторая Противоположная, то это
        <a href="rg2://ytplay?time=10:31&link=n06bmpfoTJk">Ушки Печенька.</a>
        Почему печенька - посмотрите в видео.</p>

        <p style="text-align:center"><img src="cll_25.xml"></p>

        <p><a href="rg2://ytplay?time=10:50&link=n06bmpfoTJk&alg=U\'_(R_U_R\'_U\')_(R\'_F_R_F\')">Алгоритм:</a> <b>U\' (R U R\' U\') (R\' F R F\')</b></p>

        <p>Как смоделировать: выполнить Носик ПикСель. <b>U\' (R U R\' U\') (R\' F R F\')</b></p>
    """;
    static const cll_st25_url = "n06bmpfoTJk";
    static const cll_st25_comment = "U\' R U R\' U\' R\' F R F\'";

    static const cll_st26_title = "Ушки (T-OLL) Брауни";
    static const cll_st26_descr = """
        <p>Если первая пара Противоположная, а вторая Одинаковая, то это
        <a href="rg2://ytplay?time=11:23&link=n06bmpfoTJk">Ушки Брауни.</a></p>

        <p style="text-align:center"><img src="cll_26.xml"></p>

        <p><a href="rg2://ytplay?time=11:30&link=n06bmpfoTJk&alg=(R_U_R\'_U\')_F\'_U\'_F">Алгоритм:</a> <b>(R U R\' U\') F\' U\' F</b></p>

        <p>Как смоделировать: выполнить Носик ПОинт. <b>F\' (R U R\' U\') R\' F R</b></p>
    """;
    static const cll_st26_url = "n06bmpfoTJk";
    static const cll_st26_comment = "(R U R\' U\') F\' U\' F";

    static const cll_st27_title = "Ушки (T-OLL) Кола";
    static const cll_st27_descr = """
        <p>Если первая пара Противоположная, и вторая Противоположная, то это
        <a href="rg2://ytplay?time=12:14&link=n06bmpfoTJk">Ушки Кола.</a>
        Поскольку парный с Глазками ЮПи.</p>

        <p style="text-align:center"><img src="cll_27.xml"></p>

        <p><a href="rg2://ytplay?time=12:22&link=n06bmpfoTJk&alg=U_R\'_U_R\'_F_U\'_R_U_F2_R2">Алгоритм:</a> <b>U R\' U R\' F U\' R U F2 R2</b></p>

        <p>Как смоделировать: выполнить Глазки ЮПи. <b>U R\' F U\' R U\' R\' U2\' F2 R</b></p>
    """;
    static const cll_st27_url = "n06bmpfoTJk";
    static const cll_st27_comment = "U R\' U R\' F U\' R U F2 R2";

    static const cll_st28_title = "Ушки (T-OLL) Ракета";
    static const cll_st28_descr = """
        <p>Если пара Одинаковых сзади, и Противоположные наклейки на передней грани, то это
        <a href="rg2://ytplay?time=13:00&link=n06bmpfoTJk">Ушки Ракета.</a></p>

        <p style="text-align:center"><img src="cll_28.xml"></p>

        <p><a href="rg2://ytplay?time=13:11&link=n06bmpfoTJk&alg=R\'_U\'_F_R_F\'_U_R_U\'_R_U_R\'">Алгоритм:</a> <b>R\' U\' F R F\' U R U\' R U R\'</b></p>

        <p>Как смоделировать: выполнить Глазки Юникс. <b>U x R U\' R U\' R\' U L\' U\' L</b></p>
    """;
    static const cll_st28_url = "n06bmpfoTJk";
    static const cll_st28_comment = "R\' U\' F R F\' U R U\' R U R\'";

    static const cll_st29_title = "Ушки (T-OLL) Бэг";
    static const cll_st29_descr = """
        <p>Похоже на Ракету, но пара Одинаковых наклеек на передней грани, значит это
        <a href="rg2://ytplay?time=13:46&link=n06bmpfoTJk">Бэг (Сумка).</a></p>

        <p style="text-align:center"><img src="cll_29.xml"></p>

        <p><a href="rg2://ytplay?time=13:55&link=n06bmpfoTJk&alg=R\'_U_R_U2\'_R2\'_F_R_F\'_R">Алгоритм:</a> <b>R\' U R U2\' R2\' F R F\' R</b></p>

        <p>Как смоделировать: выполнить алгоритм еще раз. <b>R\' U R U2\' R2\' F R F\' R</b></p>
    """;
    static const cll_st29_url = "n06bmpfoTJk";
    static const cll_st29_comment = "R\' U R U2\' R2\' F R F\' R";

    static const cll_st30_title = "Ушки (T-OLL) Труба";
    static const cll_st30_descr = """
        <p>Пара Одинаковых слева и пара справа. Алгоритм называется
        <a href="rg2://ytplay?time=14:28&link=n06bmpfoTJk">Труба.</a></p>

        <p style="text-align:center"><img src="cll_30.xml"></p>

        <p><a href="rg2://ytplay?time=14:41&link=n06bmpfoTJk&alg=F_U\'_R_U2_R\'_U\'_F2_R_U_R\'">Алгоритм:</a> <b>F U\' R U2 R\' U\' F2 R U R\'</b></p>

        <p>Как смоделировать: выполнить алгоритм еще раз. <b>F U\' R U2 R\' U\' F2 R U R\'</b></p>
    """;
    static const cll_st30_url = "n06bmpfoTJk";
    static const cll_st30_comment = "F U\' R U2 R\' U\' F2 R U R\'";

    ///<!-- ================= Вертолеты ======================= -->

    static const cll_st31_title = "Вертолет (Pi-OLL) Якудза";
    static const cll_st31_descr = """
        <p>Вертолеты определяются из стандартного положения по цветам
        <a href="rg2://ytplay?time=14:50&link=n06bmpfoTJk">верхних наклеек.</a>
        В данном случае правая пара Одинаковая, а левая Противоположная - алгоритм называется
        <a href="rg2://ytplay?time=14:58&link=n06bmpfoTJk">Якудза или двойной Фруруф.</a></p>

        <p style="text-align:center"><img src="cll_31.xml"></p>

        <p><a href="rg2://ytplay?time=15:07&link=n06bmpfoTJk&alg=F_(R_U_R\'_U\')2_F\'">Алгоритм:</a> <b>F (R U R\' U\')2 F\'</b></p>

        <p>Как смоделировать: выполнить алгоритм еще раз. <b>F (R U R\' U\')2 F\'</b></p>
    """;
    static const cll_st31_url = "n06bmpfoTJk";
    static const cll_st31_comment = "F (R U R\' U\')2 F\'";

    static const cll_st32_title = "Вертолет (Pi-OLL) Коза-Ностра";
    static const cll_st32_descr = """
        <p>Противополжный предыдущему: правая пара Противоположная, а левая Одинаковая. Алгоритм
        называется <a href="rg2://ytplay?time=15:18&link=n06bmpfoTJk">Коза-Ностра.</a></p>

        <p style="text-align:center"><img src="cll_32.xml"></p>

        <p><a href="rg2://ytplay?time=15:25&link=n06bmpfoTJk&alg=R\'_F\'_R_U\'_R\'_F_U\'_F_U_R">Алгоритм:</a> <b>R\' F\' R U\' R\' F U\' F U R</b></p>

        <p>Как смоделировать: выполнить алгоритм еще раз. <b>R\' F\' R U\' R\' F U\' F U R</b></p>
    """;
    static const cll_st32_url = "n06bmpfoTJk";
    static const cll_st32_comment = "R\' F\' R U\' R\' F U\' F U R";

    static const cll_st33_title = "Вертолет (Pi-OLL) Правша";
    static const cll_st33_descr = """
        <p>Пара Одинаковых стоит по-диагонали (Слэш), две оставшиеся противоположные. Алгоритм
        называется <a href="rg2://ytplay?time=15:36&link=n06bmpfoTJk">Правша.</a></p>

        <p style="text-align:center"><img src="cll_33.xml"></p>

        <p><a href="rg2://ytplay?time=15:49&link=n06bmpfoTJk&alg=R_U2_R\'_U\'_R_U_R\'_U2\'_R\'_F_R_F\'">Алгоритм:</a> <b>R U2 R\' U\' R U R\' U2\' R\' F R F\'</b></p>

        <p>Как смоделировать: выполнить Левшу. <b>F U\' R\' F2 R U\' F2 R U2 R\'</b></p>
    """;
    static const cll_st33_url = "n06bmpfoTJk";
    static const cll_st33_comment = "R U2 R\' U\' R U R\' U2\' R\' F R F\'";

    static const cll_st34_title = "Вертолет (Pi-OLL) Левша";
    static const cll_st34_descr = """
        <p>Похоже на предыдущий, только пара Одинаковых располагается как БэкСлэш, а две оставшиеся
        наклейки также противоположные. Соответственно, алгоритм называется
        <a href="rg2://ytplay?time=15:56&link=n06bmpfoTJk">Левша.</a></p>

        <p style="text-align:center"><img src="cll_34.xml"></p>

        <p><a href="rg2://ytplay?time=16:03&link=n06bmpfoTJk&alg=F_U\'_R\'_F2_R_U\'_F2_R_U2_R\'">Алгоритм:</a> <b>F U\' R\' F2 R U\' F2 R U2 R\'</b></p>

        <p>Как смоделировать: выполнить Правшу. <b>R U2 R\' U\' R U R\' U2\' R\' F R F\'</b></p>
    """;
    static const cll_st34_url = "n06bmpfoTJk";
    static const cll_st34_comment = "F U\' R\' F2 R U\' F2 R U2 R\'";

    static const cll_st35_title = "Вертолет (Pi-OLL) Мэн";
    static const cll_st35_descr = """
        <p>Две вертикальные пары. Алгоритм называется <a href="rg2://ytplay?time=16:25&link=n06bmpfoTJk">Мэн.</a></p>

        <p style="text-align:center"><img src="cll_35.xml"></p>

        <p><a href="rg2://ytplay?time=16:34&link=n06bmpfoTJk&alg=R_U\'_R\'_F_R\'_F_R_U_R\'_F_R">Алгоритм:</a> <b>R U\' R\' F R\' F R U R\' F R</b></p>

        <p>Как смоделировать: выполнить Майю. <b>R U\' R\' F U2\' R2\' F R U\' R</b></p>
    """;
    static const cll_st35_url = "n06bmpfoTJk";
    static const cll_st35_comment = "R U\' R\' F R\' F R U R\' F R";

    static const cll_st36_title = "Вертолет (Pi-OLL) СуперМэн";
    static const cll_st36_descr = """
        <p>Две пары с Одинаковыми наклейками стоящими крест накрест. Алгоритм называется
        <a href="rg2://ytplay?time=17:09&link=n06bmpfoTJk">СуперМэн.</a></p>

        <p style="text-align:center"><img src="cll_36.xml"></p>

        <p><a href="rg2://ytplay?time=17:29&link=n06bmpfoTJk&alg=(U\'_R_U\'_R_U\'_R\'_U_R\')_y_(R_U2_R\')">Алгоритм:</a> <b>(U\' R U\' R U\' R\' U R\') y (R U2 R\')</b></p>

        <p>Как смоделировать: выполнить Инь-Ян. <b>(R U R\' U2\' R U2\' R\' U) y\' (R\' U\' R)</b></p>
    """;
    static const cll_st36_url = "n06bmpfoTJk";
    static const cll_st36_comment = "(U\' R U\' R U\' R\' U R\') y (R U2 R\')";

    ///<!-- ================= НТВ+ ======================= -->

    static const cll_st37_title = "НТВ+ (H-OLL) Майа";
    static const cll_st37_descr = """
        <p>Как и для вертолетов, определять ситуацию будем по четырем наклейкам на верхней грани.
        Передняя пара Одинаковые наклейки, задняя противоположные. Алгоритм называется
        <a href="rg2://ytplay?time=16:47&link=n06bmpfoTJk">Майя.</a></p>

        <p style="text-align:center"><img src="cll_37.xml"></p>

        <p><a href="rg2://ytplay?time=16:58&link=n06bmpfoTJk&alg=R_U\'_R\'_F_U2\'_R2\'_F_R_U\'_R">Алгоритм:</a> <b>R U\' R\' F U2\' R2\' F R U\' R</b></p>

        <p>Как смоделировать: выполнить Мэна. <b>R U\' R\' F R\' F R U R\' F R</b></p>
    """;
    static const cll_st37_url = "n06bmpfoTJk";
    static const cll_st37_comment = "R U\' R\' F U2\' R2\' F R U\' R";

    static const cll_st38_title = "НТВ+ (H-OLL) Инь-Ян";
    static const cll_st38_descr = """
        <p>Пара Одинаковых справа, а слева пара Противоположных наклеек. Алгоритм называется
        <a href="rg2://ytplay?time=17:40&link=n06bmpfoTJk">Инь-Ян.</a></p>

        <p style="text-align:center"><img src="cll_38.xml"></p>

        <p><a href="rg2://ytplay?time=17:42&link=n06bmpfoTJk&alg=(R_U_R\'_U2\'_R_U2\'_R\'_U)_y\'_(R\'_U\'_R)">Алгоритм:</a> <b>(R U R\' U2\' R U2\' R\' U) y\' (R\' U\' R)</b></p>

        <p>Как смоделировать: выполнить СуперМэна. <b>(U\' R U\' R U\' R\' U R\') y (R U2 R\')</b></p>
    """;
    static const cll_st38_url = "n06bmpfoTJk";
    static const cll_st38_comment = "(R U R\' U2\' R U2\' R\' U) y\' (R\' U\' R)";

    static const cll_st39_title = "НТВ+ (H-OLL) БэтМэн";
    static const cll_st39_descr = """
        <p>Две вертикальных пары. Алгоритм называется <a href="rg2://ytplay?time=18:01&link=n06bmpfoTJk">БэтМэн.</a></p>

        <p style="text-align:center"><img src="cll_39.xml"></p>

        <p><a href="rg2://ytplay?time=18:08&link=n06bmpfoTJk&alg=R2\'_U2\'_R_U2\'_R2">Алгоритм:</a> <b>R2\' U2\' R U2\' R2</b></p>

        <p>Как смоделировать: выполнить алгоритм еще раз. <b>R2\' U2\' R U2\' R2</b></p>
    """;
    static const cll_st39_url = "n06bmpfoTJk";
    static const cll_st39_comment = "R2\' U2\' R U2\' R2";

    static const cll_st40_title = "НТВ+ (H-OLL) Ортега";
    static const cll_st40_descr = """
        <p>Две горизонтальных пары. Алгоритм называется
        <a href="rg2://ytplay?time=18:18&link=n06bmpfoTJk">Ортега.</a> Либо выполнить тройной Фруруф.</p>

        <p style="text-align:center"><img src="cll_40.xml"></p>

        <p><a href="rg2://ytplay?time=18:23&link=n06bmpfoTJk&alg=F2_R\'_F2_R2_U2\'_R\'_F2">Алгоритм:</a> <b>F2 R\' F2 R2 U2\' R\' F2</b></p>

        <p>Как смоделировать: выполнить алгоритм еще раз. <b>F2 R\' F2 R2 U2\' R\' F2</b></p>
    """;
    static const cll_st40_url = "n06bmpfoTJk";
    static const cll_st40_comment = "F2 R\' F2 R2 U2\' R\' F2";

    static const cll_st41_title = "Чистый PLL";
    static const cll_st41_descr = """
        <p>Случаи, когда верхняя сторона собрана, а слой не собран, рассмотрены в методике Фридрих
        и Ортега.</p>

        <p style="text-align:center"><img src="cll_41.xml"></p>

        <p>Если нет глазок - <a href="rg2://ytplay?time=18:56&link=n06bmpfoTJk">алгоритм:</a> <b>(R U\' R\' U\') F2 (U\' R U R\') D R2</b></p>

        <p>Если есть глазки - <a href="rg2://ytplay?time=19:28&link=n06bmpfoTJk">алгоритм:</a> <b>R U2 R\' U\' R U2 L\' U R\' U\' L</b><br/>
        или для <a href="rg2://ytplay?time=19:45&link=n06bmpfoTJk">глазок сзади:</a> <b>(R\' F) R\' F2 R U\' R\' F2 R2</b></p>
    """;
    static const cll_st41_url = "n06bmpfoTJk";
    static const cll_st41_comment = "";


}