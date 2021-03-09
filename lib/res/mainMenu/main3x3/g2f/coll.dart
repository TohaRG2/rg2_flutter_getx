
import 'package:rg2/models/phases.dart';

class Coll implements Phase {
  @override
  int count = coll_title.length;

  @override
  String phase = "COLL";

  @override
  List<String> titles() => coll_title;

  @override
  List<String> icons() => coll_icon;

  @override
  List<String> descriptions() => coll_descr;

  @override
  List<String> urls() => coll_url;

  @override
  List<String> comments() => List.filled(count, "");

///==================================================

    static const coll_title = [
        coll_st0_title,
        coll_st1_title,
        coll_st2_title,
        coll_st3_title,
        coll_st4_title,
        coll_st5_title,
        coll_st6_title,
        coll_st7_title,
        coll_st8_title,
        coll_st9_title,
        coll_st10_title,
        coll_st11_title,
        coll_st12_title,
        coll_st13_title,
        coll_st14_title,
        coll_st15_title,
        coll_st16_title,
        coll_st17_title,
        coll_st18_title,
        coll_st19_title,
        coll_st20_title,
        coll_st21_title,
        coll_st22_title,
        coll_st23_title,
        coll_st24_title,
        coll_st25_title,
        coll_st26_title,
        coll_st27_title,
        coll_st28_title,
        coll_st29_title,
    ];

    static const coll_icon = [
        "coll",
        "coll_1",
        "coll_2",
        "coll_3",
        "coll_4",
        "coll_5",
        "coll_6",
        "coll_7",
        "coll_8",
        "coll_9",
        "coll_10",
        "coll_11",
        "coll_12",
        "coll_13",
        "coll_14",
        "coll_15",
        "coll_16",
        "coll_17",
        "coll_18",
        "coll_19",
        "coll_20",
        "coll_21",
        "coll_22",
        "coll_23",
        "coll_24",
        "coll_25",
        "coll_26",
        "coll_27",
        "coll_28",
        "coll_29",
    ];

    static const coll_descr = [
        coll_st0_descr,
        coll_st1_descr,
        coll_st2_descr,
        coll_st3_descr,
        coll_st4_descr,
        coll_st5_descr,
        coll_st6_descr,
        coll_st7_descr,
        coll_st8_descr,
        coll_st9_descr,
        coll_st10_descr,
        coll_st11_descr,
        coll_st12_descr,
        coll_st13_descr,
        coll_st14_descr,
        coll_st15_descr,
        coll_st16_descr,
        coll_st17_descr,
        coll_st18_descr,
        coll_st19_descr,
        coll_st20_descr,
        coll_st21_descr,
        coll_st22_descr,
        coll_st23_descr,
        coll_st24_descr,
        coll_st25_descr,
        coll_st26_descr,
        coll_st27_descr,
        coll_st28_descr,
        coll_st29_descr,
    ];

    static const coll_url = [
        coll_st0_url,
        coll_st1_url,
        coll_st2_url,
        coll_st3_url,
        coll_st4_url,
        coll_st5_url,
        coll_st6_url,
        coll_st7_url,
        coll_st8_url,
        coll_st9_url,
        coll_st10_url,
        coll_st11_url,
        coll_st12_url,
        coll_st13_url,
        coll_st14_url,
        coll_st15_url,
        coll_st16_url,
        coll_st17_url,
        coll_st18_url,
        coll_st19_url,
        coll_st20_url,
        coll_st21_url,
        coll_st22_url,
        coll_st23_url,
        coll_st24_url,
        coll_st25_url,
        coll_st26_url,
        coll_st27_url,
        coll_st28_url,
        coll_st29_url,
    ];

    static const coll_comment = [
        coll_st0_comment,
        coll_st1_comment,
        coll_st2_comment,
        coll_st3_comment,
        coll_st4_comment,
        coll_st5_comment,
        coll_st6_comment,
        coll_st7_comment,
        coll_st8_comment,
        coll_st9_comment,
        coll_st10_comment,
        coll_st11_comment,
        coll_st12_comment,
        coll_st13_comment,
        coll_st14_comment,
        coll_st15_comment,
        coll_st16_comment,
        coll_st17_comment,
        coll_st18_comment,
        coll_st19_comment,
        coll_st20_comment,
        coll_st21_comment,
        coll_st22_comment,
        coll_st23_comment,
        coll_st24_comment,
        coll_st25_comment,
        coll_st26_comment,
        coll_st27_comment,
        coll_st28_comment,
        coll_st29_comment,
    ];
    
    static const coll_st0_title = "Введение";
    static const coll_st0_descr = """
        <p>Если вы выучили весь OLL, пора переходить к <b>COLL</b>, что расшифровывается как
        Corners & OLL (углы и OLL). Результат выполнения данных алгоритмов - PLL с углами на своих местах,
        т.е. окошки, рельсы, шахматы или PLL скип. Есть расширенный вариант COLL, который называется
        OLLCP (OLL & Corner Permutation). Отличие их в том, что OLLCP это набор алгоритмов для любой
        OLL ситуации, а COLL только для ситуации, когда желтый крест уже собран. Т.е. <b>COLL</b>
        это варианты алгоритмов для базовых OLL ситуаций, по 6 для каждой, минус 2 алгоритма
        для HTB+ (двойных глаз), где их всего четыре, итого получается 40 алгоритмов. Но на самом деле,
        вам не придется учить столько алгоритмов, т.к. для некоторых ситуаций сочетание COLL + EPLL
        не имеет смысла, т.к. быстрее будет сделать обычный OLL, а потом обычный PLL.</p>

        <p>Почему вообще стоит учить COLL? Ведь многие скажут, что это не стоит усилий, т.к. этапов сборки последнего
        слоя остается всё равно два, а еще нужно дополнительное время на распознавание ситуаций.</p>

        <p>1. COLL значительно увеличивает вероятность PLL скипа.</p>

        <p>2. Если даже вы не получили скип, то будет одна из простых реберных Edge PLL ситуаций (EPLL): окошки, рельсы или шахматы,
        определение которых даже по двум сторонам не составляет труда и происходит значительно быстрее,
        чем остальных PLL ситуаций.</p>

        <p>3. Дополнительного времени для определения ситуации практически не требуется (при должном уровне
        тренировок), т.к. ситуации COLL легко определяются из стандартного положения для данной OLL
        ситуации.</p>

        <p>4. Уменьшается количество ходов перед/после PLL алгоритмом (AUF), за счет уменьшения количества ситуаций,
        которые могут выпасть и изучения дополнительных PLL алгоритмов для разных начальных положений.
        Например, окошки легко делаются как из положения тройным блоком к себе, так и от себя.</p>

        <p>Определение COLL ситуации происходит по смежности, схожести либо противоположности наклеек
        угловых элементов. Постараюсь привести эскизы ситуаций, именно для тех положений, из которых
        наиболее легко определяется COLL ситуация, а также дать текстовое описание определения
        этих ситуаций.</p>

        <p>Если вы используете какой-то свой алгоритм, то вы его можете задать в поле \"Свой комментарий
        (алгоритм)\" к этапу, после этого он отобразится и в списке этапов.</p>

        Еще больше алгоритмов COLL вы можете найти <a href=https://speedcubing.ru/tutorial/3x3x3/pro/coll>тут.</a>

    """;
    static const coll_st0_url = "t3KcPrjmJJ4";
    static const coll_st0_comment = "Тут можно задать свой алгоритм или любой другой текст";

    ///<!-- ================= Глазки ======================= -->

    static const coll_st1_title = "Глазки #1";
    static const coll_st1_descr = """
        <p><a href="rg2://ytplay?time=0:04&link=CFIQMKxJP4k">Как распознать:</a> из ситуации глазками от себя: на вас смотрят одинаковые глазки, а две
        верхние дальние наклейки разного цвета.</p>

        <p>Делаем северо-западную Акулу, потом простую Рыбку.</p>
        <p style="text-align:center"><img src="coll_1.xml" width="100"></p>

        <a href="rg2://ytplay?time=0:08&link=CFIQMKxJP4k&alg=(R\'_U\'_R_U\')_R\'_U2_R_(R_U_R\'_U)_R_U2_R\'">Алгоритм:</a> <b>(R\' U\' R U\') R\' U2 R (R U R\' U) R U2 R\'</b><br/>
        или тот же алгоритм, но в чуть другой записи:<br/>
        <b>(R\' U\' R U\') R\' U2 R2 U R\' U R U2 R\'</b>
    """;
    static const coll_st1_url = "CFIQMKxJP4k";
    static const coll_st1_comment = "(R\' U\' R U\') R\' U2 R2 U R\' U R U2 R\'";

    static const coll_st2_title = "Глазки #2";
    static const coll_st2_descr = """
        <p><a href="rg2://ytplay?time=0:21&link=CFIQMKxJP4k">Как распознать:</a> из ситуации глазками от себя: на вас смотрят одинаковые глазки, а две
        верхние дальние наклейки одинакового цвета.</p>

        <p>Выключаем свет, Австралия, Включаем свет.</p>
        <p style="text-align:center"><img src="coll_2.xml" width="100"></p>

        <a href="rg2://ytplay?time=0:28&link=CFIQMKxJP4k&alg=R\'_(F_R_U\'_R\'_U\'_R_U_R\'_F\'_R_U_R\'_U\'_R\'_F_R_F\')_R">Алгоритм:</a> <b>R\' (F R U\' R\' U\' R U R\' F\' R U R\' U\' R\' F R F\') R</b>
    """;
    static const coll_st2_url = "CFIQMKxJP4k";
    static const coll_st2_comment = "R\' (F R U\' R\' U\' R U R\' F\' R U R\' U\' R\' F R F\') R";

    static const coll_st3_title = "Глазки #3";
    static const coll_st3_descr = """
        <p><a href="rg2://ytplay?time=0:39&link=CFIQMKxJP4k">Как распознать:</a> из ситуации глазками от себя: наклейка уголка смотрящая на вас справа и
        дальняя верхняя левая наклейка - одинаковые, а дальняя верхняя правая смежная с ними.</p>

        <p>Очень похоже на алгоритм из Ускорения N13, только все движения в противоположную сторону,
        ну и начальное положение тоже противоположное, т.е. глазками от себя.</p>
        <p style="text-align:center"><img src="coll_3.xml" width="100"></p>

        <a href="rg2://ytplay?time=0:43&link=CFIQMKxJP4k&alg=R2_D\'_R_U2_R\'_D_R_U2_R">Алгоритм:</a> <b>R2 D\' R U2 R\' D R U2 R</b>
    """;
    static const coll_st3_url = "CFIQMKxJP4k";
    static const coll_st3_comment = "R2 D\' R U2 R\' D R U2 R";

    static const coll_st4_title = "Глазки #4";
    static const coll_st4_descr = """
       <p><a href="rg2://ytplay?time=0:56&link=CFIQMKxJP4k">Как распознать:</a> из ситуации глазками от себя: наклейка уголка смотрящая на вас слева и
        дальняя верхняя правая наклейка - одинаковые, а дальняя верхняя левая смежная с ними. Ну или
        можно так: пара наискосок и две противоположных наклейки.</p>

        <p>Делаем предыдущий алгоритм слева. Или второй вариант, разворачиваем к себе и делаем
        алгоритм из Ускорения N13.</p>
        <p style="text-align:center"><img src="coll_4.xml" width="100"></p>

        <a href="rg2://ytplay?time=1:00&link=CFIQMKxJP4k">Алгоритм1:</a> <b>L2 D L\' U2 L D\'L\' U2 L\'</b><br>
        <a href="rg2://ytplay?time=1:08&link=CFIQMKxJP4k">Алгоритм2:</a> <b>y2 R2\' D R\' U2 R D\' R\' U2 R\'</b>
    """;
    static const coll_st4_url = "CFIQMKxJP4k";
    static const coll_st4_comment = "y2 R2\' D R\' U2 R D\' R\' U2 R\'";

    static const coll_st5_title = "Глазки #5";
    static const coll_st5_descr = """
       <p><a href="rg2://ytplay?time=1:23&link=CFIQMKxJP4k">Как распознать:</a> из ситуации глазками от себя: две противоположные пары стоящие наискосок.</p>

        <p>Странный алгоритм: В Лондон, странный пиф-паф, странная рыбка, из Лондона. Да и фингертрикс
        для него тоже немного странный, начинается с необычного вращения передней грани, зато потом
        все очень удобно.</p>
        <p style="text-align:center"><img src="coll_5.xml" width="100"></p>

        <a href="rg2://ytplay?time=1:26&link=CFIQMKxJP4k&alg=F_(R_U\'_R\'_U)_(R_U_R\'_U_R_U\'_R\')_F\'">Алгоритм:</a> <b>F (R U\' R\' U) (R U R\' U R U\' R\') F\'</b>

        <p>Ну или можно использовать вот такой алгоритм:</p>

        <p>Алгоритм: <b>x\' (R2 D2 R\' U2 R D2 R\' U2 R\') x</b></p>
    """;
    static const coll_st5_url = "CFIQMKxJP4k";
    static const coll_st5_comment = "F R U\' R\' U R U R\' U R U\' R\' F\'";

    static const coll_st6_title = "Глазки #6";
    static const coll_st6_descr = """
        <p><a href="rg2://ytplay?time=1:46&link=CFIQMKxJP4k">Как распознать:</a> из ситуации глазками от себя: передние наклейки разные, а задние
        одинаковые.</p>

        <p>Просто выучите новый алгоритм. :)</p>
        <p style="text-align:center"><img src="coll_6.xml" width="100"></p>

        <a href="rg2://ytplay?time=1:51&link=CFIQMKxJP4k&alg=R2_D\'_R_U_R\'_D_R_U_R_U\'_R\'_U\'_R">Алгоритм:</a> <b>R2 D\' R U R\' D R U R U\' R\' U\' R</b>
    """;
    static const coll_st6_url = "CFIQMKxJP4k";
    static const coll_st6_comment = "R2 D\' R U R\' D R U R U\' R\' U\' R";

    ///<!-- ================= Ушки ======================= -->

    static const coll_st7_title = "Ушки #1";
    static const coll_st7_descr = """
        <p><a href="rg2://ytplay?time=0:02&link=rVrNZWbnXTg">Как распознать:</a> из ситуации ушками от себя: пара на передней грани и противоположная
        пара на задней верхней грани.</p>

        <p>Выполняем северо-восточную (обычную) Акулу, потом юго-восточную Рыбку. Ну или обычную Акулу,
        крутим крышу и обычную Рыбку.</p>
        <p style="text-align:center"><img src="coll_7.xml" width="100"></p>

        <a href="rg2://ytplay?time=0:07&link=rVrNZWbnXTg">Алгоритм 1:</a> <b>(R U2 R\' U\' R U\' R\')(R\' U2\' R U R\' U R)</b>
        Алгоритм2: <b>(R U2 R\' U\' R U\' R\') U (R U R\' U R U2 R\')</b>
    """;
    static const coll_st7_url = "rVrNZWbnXTg";
    static const coll_st7_comment = "(R U2 R\' U\' R U\' R2\' U2\' R U R\' U R)";

    static const coll_st8_title = "Ушки #2";
    static const coll_st8_descr = """
        <p><a href="rg2://ytplay?time=0:20&link=rVrNZWbnXTg">Как распознать:</a> из ситуации ушками от себя: пара на передней грани, разные наклейки
        сзади.</p>

        <p>Достаем и разбиваем правую заднюю F2L пару, делаем U2, собираем и загоняем пару на место,
        ставим на место левую переднюю пару.</p>
        <p style="text-align:center"><img src="coll_8.xml" width="100"></p>

        <a href="rg2://ytplay?time=0:23&link=rVrNZWbnXTg&alg=(R\'_U_R)_U2_(R\'_L\'_U_R)_U\'_L">Алгоритм:</a> <b>(R\' U R) U2 (R\' L\' U R) U\' L</b>
    """;
    static const coll_st8_url = "rVrNZWbnXTg";
    static const coll_st8_comment = "(R\' U R) U2 (R\' L\' U R) U\' L";

    static const coll_st9_title = "Ушки #3";
    static const coll_st9_descr = """
        <p><a href="rg2://ytplay?time=0:41&link=rVrNZWbnXTg">Как распознать:</a> из ситуации ушками от себя: слева пара, справа разные наклейки.</p>

        <p>Развернуть ушками налево и сделать пиф-паф, английский пиф-паф с первыми жирными ходами.</p>
        <p style="text-align:center"><img src="coll_9.xml" width="100"></p>

        <a href="rg2://ytplay?time=0:45&link=rVrNZWbnXTg&alg=U\'_(Rw_U_R\'_U\')_(Rw\'_F_R_F\')">Алгоритм:</a> <b>U\' (Rw U R\' U\') (Rw\' F R F\')</b>
    """;
    static const coll_st9_url = "rVrNZWbnXTg";
    static const coll_st9_comment = "U\' (Rw U R\' U\') (Rw\' F R F\')";

    static const coll_st10_title = "Ушки #4";
    static const coll_st10_descr = """
        <p><a href="rg2://ytplay?time=0:58&link=rVrNZWbnXTg">Как распознать:</a> из ситуации ушками от себя: пара справа, а слева разные наклейки.</p>

        <p>Предыдущий алгоритм, но слева. Второй алгоритм через правую руку. И третий вариант, для
        данной ситуации - алгоритм из ускорения N8.</p>
        <p style="text-align:center"><img src="coll_10.xml" width="100"></p>

        <a href="rg2://ytplay?time=1:02&link=rVrNZWbnXTg">Алгоритм 1:</a> <b>U (Lw\' U\' L U) (Lw F\' L\' F)</b><br/><br/>

        Алгоритм 2: <b>U R\' F\' Rw U R U\' Rw\' F</b><br/><br/>

        <a href="rg2://ytplay?time=6:50&link=gbuLeCv_fRM">Алгоритм 3:</a> <b>x (D\' R\' U R D R\' U\' R) x\'</b>
    """;
    static const coll_st10_url = "rVrNZWbnXTg";
    static const coll_st10_comment = "U R\' F\' Rw U R U\' Rw\' F";

    static const coll_st11_title = "Ушки #5";
    static const coll_st11_descr = """
        <p><a href="rg2://ytplay?time=1:15&link=rVrNZWbnXTg">Как распознать:</a> из ситуации ушками от себя: пара сзади, а спереди разные наклейки.</p>

        <p>В Лондон, пиф-паф, рыбный пиф-паф с обратными ходами крыши, пиф-паф без последнего хода, из Лондона.</p>
        <p style="text-align:center"><img src="coll_11.xml" width="100"></p>

        <a href="rg2://ytplay?time=1:20&link=rVrNZWbnXTg&alg=U2_(F_(R_U_R\'_U\')_(R_U\'_R\'_U\')_R_U_R\'_F\')">Алгоритм:</a> <b>U2 (F (R U R\' U\') (R U\' R\' U\') R U R\' F\')</b>
    """;
    static const coll_st11_url = "rVrNZWbnXTg";
    static const coll_st11_comment = "U2 (F (R U R\' U\') (R U\' R\' U\') R U R\' F\')";

    static const coll_st12_title = "Ушки #6";
    static const coll_st12_descr = """
        <p><a href="rg2://ytplay?time=1:40&link=rVrNZWbnXTg">Как распознать:</a> из ситуации ушками от себя: пара справа и пара слева.</p>

        <p>В видео алгоритм написан неверно.</p>
        <p style="text-align:center"><img src="coll_12.xml" width="100"></p>

        <a href="rg2://ytplay?time=1:46&link=rVrNZWbnXTg&alg=R\'_U_R2_D_Rw\'_U2_Rw_D\'_R2_U\'_R">Алгоритм:</a> <b>R\' U R2 D Rw\' U2 Rw D\' R2 U\' R</b>
    """;
    static const coll_st12_url = "rVrNZWbnXTg";
    static const coll_st12_comment = "R\' U R2 D Rw\' U2 Rw D\' R2 U\' R";

    ///<!-- ================= Носики ======================= -->

    static const coll_st13_title = "Носик #1";
    static const coll_st13_descr = """
        <p><a href="rg2://ytplay?time=0:03&link=U0dP8MJw-Ig">Как распознать:</a> из ситуации как на картинке: справа две противоположные, слева
        смежная наклейка.</p>

        <p>1. Крыша дважды, первые четыре хода Акулы, два пиф-пафа, последние три хода Акулы.<br/>
        2. Ну или еще один вариант, уже другой Акулы с двумя пиф-пафами в середине.
        </p>
        <p style="text-align:center"><img src="coll_13.xml" width="100"></p>

        <p><a href="rg2://ytplay?time=0:10&link=U0dP8MJw-Ig">Алгоритм 1:</a> <b>U2 (R U2 R\' U\' (R U R\' U\')2 R U\' R\')</b><br/><br/>
        <a href="rg2://ytplay?time=0:29&link=U0dP8MJw-Ig">Алгоритм 2:</a> <b>U (R\' U2 (R U R\' U\')2 R U R\' U R)</b></p>
    """;
    static const coll_st13_url = "U0dP8MJw-Ig";
    static const coll_st13_comment = "U2 (R U2 R\' U\' (R U R\' U\')2 R U\' R\')";

    static const coll_st14_title = "Носик #2";
    static const coll_st14_descr = """
        <p><a href="rg2://ytplay?time=0:49&link=U0dP8MJw-Ig">Как распознать:</a> из ситуации как на картинке: диагональные одинаковые, на
        передней грани справа смежная наклейка.</p>

        <p></p>
        <p style="text-align:center"><img src="coll_14.xml" width="100"></p>

        <a href="rg2://ytplay?time=0:52&link=U0dP8MJw-Ig&alg=R_U2_R_D_R\'_U2_R_D\'_R2">Алгоритм:</a> <b>R U2 R D R\' U2 R D\' R2</b>
    """;
    static const coll_st14_url = "U0dP8MJw-Ig";
    static const coll_st14_comment = "R U2 R D R\' U2 R D\' R2";

    static const coll_st15_title = "Носик #3";
    static const coll_st15_descr = """
        <p><a href="rg2://ytplay?time=1:03&link=U0dP8MJw-Ig">Как распознать:</a> из ситуации на картинке: диагональные одинаковые, на
        передней грани справа противоположная наклейка.</p>

        <p>Повернуть крышу и выполнить предыдущий алгоритм слева или справа, но все ходы в другую сторону.</p>
        <p style="text-align:center"><img src="coll_15.xml" width="100"></p>

        <a href="rg2://ytplay?time=1:09&link=U0dP8MJw-Ig">Алгоритм 1:</a> <b>U (L\' U2 L\' D\' L U2 L\' D L2)</b><br/><br/>
        <a href="rg2://ytplay?time=1:18&link=U0dP8MJw-Ig">Алгоритм 2:</a> <b>U\' (R\' U2 R\' D\' R U2 R\' D R2)</b>
    """;
    static const coll_st15_url = "U0dP8MJw-Ig";
    static const coll_st15_comment = "U\' (R\' U2 R\' D\' R U2 R\' D R2)";

    static const coll_st16_title = "Носик #4";
    static const coll_st16_descr = """
        <p><a href="rg2://ytplay?time=1:34&link=U0dP8MJw-Ig">Как распознать:</a> из ситуации на картинке: правые одинаковые, левая смежная.</p>

        <p>Крыша дважды, два хода против часовой, первые 10 ходов Юга, свет дважды.</p>
        <p style="text-align:center"><img src="coll_16.xml" width="100"></p>

        <a href="rg2://ytplay?time=1:37&link=U0dP8MJw-Ig&alg=U2_(R\'_U\'_(R_U_R\'_F\'_R_U_R\'_U\'_R\'_F)_R2)">Алгоритм:</a> <b>U2 (R\' U\' (R U R\' F\' R U R\' U\' R\' F) R2)</b>
    """;
    static const coll_st16_url = "U0dP8MJw-Ig";
    static const coll_st16_comment = "U2 (R\' U\' (R U R\' F\' R U R\' U\' R\' F) R2)";

    static const coll_st17_title = "Носик #5";
    static const coll_st17_descr = """
        <p><a href="rg2://ytplay?time=1:55&link=U0dP8MJw-Ig">Как распознать:</a> из ситуации на картинке: диагональные противоположны, передняя смежная.</p>

        <p>На самом деле, очень удобный и быстрый алгоритм, хотя и с вращениями задней грани.</p>
        <p style="text-align:center"><img src="coll_17.xml" width="100"></p>

        <a href="rg2://ytplay?time=2:01&link=U0dP8MJw-Ig&alg=R\'_F_R_B\'_R\'_F\'_R_B">Алгоритм:</a> <b>R\' F R B\' R\' F\' R B</b>
    """;
    static const coll_st17_url = "U0dP8MJw-Ig";
    static const coll_st17_comment = "R\' F R B\' R\' F\' R B";

    static const coll_st18_title = "Носик #6";
    static const coll_st18_descr = """
        <p><a href="rg2://ytplay?time=2:12&link=U0dP8MJw-Ig">Как распознать:</a> из ситуации на картинке: диагональные противоположны, справа пара.</p>

        <p>Кажется, что алгоритм очень неудобный, т.к. нужно крутить и правую, и левую, да еще и переднюю грани.
        На самом деле, очень удобный фингертрикс.</p>
        <p style="text-align:center"><img src="coll_18.xml" width="100"></p>

        <a href="rg2://ytplay?time=2:22&link=U0dP8MJw-Ig&alg=F_R\'_F\'_L_F_R_F\'_L\'">Алгоритм:</a> <b>F R\' F\' L F R F\' L\'</b>
    """;
    static const coll_st18_url = "U0dP8MJw-Ig";
    static const coll_st18_comment = "F R\' F\' L F R F\' L\'";


    ///<!-- ================= НТВ+ ======================= -->

    static const coll_st19_title = "НТВ+ #1";
    static const coll_st19_descr = """
        <p><a href="rg2://ytplay?time=0:03&link=GJ7nsaOvwbM">Как распознать:</a> из ситуации глазками к себе: справа пара и слева пара (вертикальные пары).</p>

        <p>Акула с пиф-пафом посередине.</p>
        <p style="text-align:center"><img src="coll_19.xml" width="100"></p>

        <a href="rg2://ytplay?time=0:07&link=GJ7nsaOvwbM&alg=R_U2_R\'_U\'_(R_U_R\'_U\')_R_U\'_R\'">Алгоритм:</a> <b>R U2 R\' U\' (R U R\' U\') R U\' R\'</b>
    """;
    static const coll_st19_url = "GJ7nsaOvwbM";
    static const coll_st19_comment = "R U2 R\' U\' (R U R\' U\') R U\' R\'";

    static const coll_st20_title = "НТВ+ #2";
    static const coll_st20_descr = """
        <p><a href="rg2://ytplay?time=0:18&link=GJ7nsaOvwbM">Как распознать:</a> из ситуации глазками к себе: пара спереди и пара сзади (горизонтальные пары).</p>

        <p>Классический вариант решения с тремя пиф-пафами.</p>
        <p style="text-align:center"><img src="coll_20.xml" width="100"></p>

        <a href="rg2://ytplay?time=0:21&link=GJ7nsaOvwbM&alg=F_(R_U_R\'_U\')3_F\'">Алгоритм:</a> <b>F (R U R\' U\')3 F\'</b>
    """;
    static const coll_st20_url = "GJ7nsaOvwbM";
    static const coll_st20_comment = "F (R U R\' U\')3 F\'";

    static const coll_st21_title = "НТВ+ #3";
    static const coll_st21_descr = """
        <p><a href="rg2://ytplay?time=0:29&link=GJ7nsaOvwbM">Как распознать:</a> из ситуации глазками к себе: горизонтальная пара и две разных.</p>

        <p>Поставить парой направо и начать с рыбного пиф-пафа.</p>
        <p style="text-align:center"><img src="coll_21.xml" width="100"></p>

        <a href="rg2://ytplay?time=0:34&link=GJ7nsaOvwbM&alg={U}_(R_U_R\'_U)_R_U_L\'_U_R\'_U\'_L">Алгоритм:</a> <b>{U} (R U R\' U) R U L\' U R\' U\' L</b>
    """;
    static const coll_st21_url = "GJ7nsaOvwbM";
    static const coll_st21_comment = "{U} (R U R\' U) R U L\' U R\' U\' L";

    static const coll_st22_title = "НТВ+ #4";
    static const coll_st22_descr = """
        <p><a href="rg2://ytplay?time=0:47&link=GJ7nsaOvwbM">Как распознать:</a> из ситуации глазками к себе: вертикальная пара и две разных.</p>

        <p>Поставить парой к себе.</p>
        <p style="text-align:center"><img src="coll_22.xml" width="100"></p>

        <a href="rg2://ytplay?time=0:50&link=GJ7nsaOvwbM&alg={U}_F_(R_U\'_R\'_U_R_U2_R\'_U\'_R_U_R\'_U\')_F\'">Алгоритм:</a> <b>{U} F (R U\' R\' U R U2 R\' U\' R U R\' U\') F\'</b>
    """;
    static const coll_st22_url = "GJ7nsaOvwbM";
    static const coll_st22_comment = "{U} F (R U\' R\' U R U2 R\' U\' R U R\' U\') F\'";


    ///<!-- ================= Вертолеты ======================= -->

    static const coll_st23_title = "Вертолет #1";
    static const coll_st23_descr = """
        <p><a href="rg2://ytplay?time=0:03&link=YTpCBRiAuow">Как распознать:</a> из ситуации глазками налево: пара справа, слева разные наклейки.</p>

        <p>Обычный вертолет.</p>
        <p style="text-align:center"><img src="coll_23.xml" width="100"></p>

        <a href="rg2://ytplay?time=0:14&link=YTpCBRiAuow&alg=R_U2\'_R2\'_U\'_R2_U\'_R2\'_U2\'_R">Алгоритм:</a> <b>R U2\' R2\' U\' R2 U\' R2\' U2\' R</b>
    """;
    static const coll_st23_url = "YTpCBRiAuow";
    static const coll_st23_comment = "R U2\' R2\' U\' R2 U\' R2\' U2\' R";

    static const coll_st24_title = "Вертолет #2";
    static const coll_st24_descr = """
        <p><a href="rg2://ytplay?time=0:22&link=YTpCBRiAuow">Как распознать:</a> из ситуации глазками налево: левая ближняя и правая дальняя одинаковые,
        а две оставшиеся разные.</p>

        <p>Пиф-паф, три хода английского пиф-пафа, еще два пиф-пафа, завершаем английский пиф-паф.</p>
        <p style="text-align:center"><img src="coll_24.xml" width="100"></p>

        <a href="rg2://ytplay?time=0:29&link=YTpCBRiAuow&alg=(R_U_R\'_U\')_R\'_F_R_(R_U_R\'_U\')2_F\'">Алгоритм:</a> <b>(R U R\' U\') R\' F R (R U R\' U\')2 F\'</b>
    """;
    static const coll_st24_url = "YTpCBRiAuow";
    static const coll_st24_comment = "(R U R\' U\') R\' F R (R U R\' U\')2 F\'";

    static const coll_st25_title = "Вертолет #3";
    static const coll_st25_descr = """
        <p><a href="rg2://ytplay?time=0:43&link=YTpCBRiAuow">Как распознать:</a> из ситуации глазками налево: правая ближняя и левая дальняя одинаковые,
        а две оставшиеся разные.</p>

        <p>Повернуть ушками к себе, в Лондон, два обратных пиф-пафа, выключили свет, из Лондона, включили свет и обратный пиф-паф.
        Или алгоритм с четырмя двойными кручениями.</p>
        <p style="text-align:center"><img src="coll_25.xml" width="100"></p>

        <a href="rg2://ytplay?time=0:45&link=YTpCBRiAuow">Алгоритм 1:</a> <b>U F (U R U\' R\')2 (R\' F\' R) (U R U\' R\')</b><br/><br/>
        <a href="rg2://ytplay?time=1:00&link=YTpCBRiAuow">Алгоритм 2:</a> <b>R\' F2 R U2 R U2 R\' F2 U\' (R U\' R\')</b>
    """;
    static const coll_st25_url = "YTpCBRiAuow";
    static const coll_st25_comment = "U F (U R U\' R\')2 (R\' F\' R) (U R U\' R\')";

    static const coll_st26_title = "Вертолет #4";
    static const coll_st26_descr = """
        <p><a href="rg2://ytplay?time=1:14&link=YTpCBRiAuow">Как распознать:</a> из ситуации глазками налево: две вертикальные пары.</p>

        <p style="text-align:center"><img src="coll_26.xml" width="100"></p>

        <a href="rg2://ytplay?time=1:16&link=YTpCBRiAuow&alg=R_U\'_L\'_U_R\'_U_L_U_L\'_U_L">Алгоритм:</a> <b>R U\' L\' U R\' U L U L\' U L</b>
    """;
    static const coll_st26_url = "YTpCBRiAuow";
    static const coll_st26_comment = "R U\' L\' U R\' U L U L\' U L";

    static const coll_st27_title = "Вертолет #5";
    static const coll_st27_descr = """
        <p><a href="rg2://ytplay?time=1:26&link=YTpCBRiAuow">Как распознать:</a> из ситуации глазками налево: две диагональные пары.</p>

        <p>10 первых ходов светофора, уводим и загоняем F2L пару.</p>
        <p style="text-align:center"><img src="coll_27.xml" width="100"></p>

        <a href="rg2://ytplay?time=1:32&link=YTpCBRiAuow&alg=(R\'_U\'_F\')_(R_U_R\'_U\')_R\'_F_R2_(U2_R\'_U2_R)">Алгоритм:</a> <b>(R\' U\' F\') (R U R\' U\') R\' F R2 (U2 R\' U2 R)</b>
    """;
    static const coll_st27_url = "YTpCBRiAuow";
    static const coll_st27_comment = "(R\' U\' F\') (R U R\' U\') R\' F R2 (U2 R\' U2 R)";

    static const coll_st28_title = "Вертолет #6";
    static const coll_st28_descr = """
        <p><a href="rg2://ytplay?time=1:46&link=YTpCBRiAuow">Как распознать:</a> из ситуации глазками налево: пара над глазками, над ушками разные
        наклейки.</p>

        <p>Длинный и не очень удобный алгоритм, изначально лучше взять большим пальцем правой руки сверху.</p>
        <p style="text-align:center"><img src="coll_28.xml" width="100"></p>

        <a href="rg2://ytplay?time=2:09&link=YTpCBRiAuow&alg=R2\'_D\'_R_U_R\'_D_R_U_R_U\'_R\'_U_R_U_R\'_U_R">Алгоритм:</a> <b>R2\' D\' R U R\' D R U R U\' R\' U R U R\' U R</b>
    """;
    static const coll_st28_url = "YTpCBRiAuow";
    static const coll_st28_comment = "R2\' D\' R U R\' D R U R U\' R\' U R U R\' U R";


    ///<!-- ================= Рыбки ======================= -->

    static const coll_st29_title = "Рыбки/Акулы";
    static const coll_st29_descr = """
        <p>Чтобы не было вопросов, где же Рыбки и Акулы - на самом деле, для данных ситуаций, обычный
        семиходовый очень быстрый OLL + обычный PLL будут быстрее, чем COLL + EPLL.
        Хотя если есть желание, то вы всегда можете найти алгоритмы для
        данных ситуаций вот <a href=https://speedcubing.ru/tutorial/3x3x3/pro/coll>тут.</a></p>

    """;
    static const coll_st29_url = "";
    static const coll_st29_comment = "";

}