
import 'package:rg2/models/phases.dart';

class AdvF2L implements Phase {
  @override
  int count = adv_f2l_title.length;

  @override
  String phase = "ADV_F2L";

  @override
  List<String> titles() => adv_f2l_title;

  @override
  List<String> icons() => adv_f2l_icon;

  @override
  List<String> descriptions() => adv_f2l_descr;

  @override
  List<String> urls() => adv_f2l_url;

  @override
  List<String> comments() => List.filled(count, "");

///==================================================

    static const adv_f2l_title = [
        adv_f2l_st2_title,
        adv_f2l_st3_title,
        adv_f2l_st4_title,
        adv_f2l_st5_title,
    ];

    static const adv_f2l_icon = [
        "adv_f2l_1",
        "adv_f2l_2_1",
        "adv_f2l_3_1",
        "adv_f2l_4_1",
    ];

    static const adv_f2l_descr = [
        adv_f2l_st2_descr,
        adv_f2l_st3_descr,
        adv_f2l_st4_descr,
        adv_f2l_st5_descr,
    ];

    static const adv_f2l_url = [
        adv_f2l_st2_url,
        adv_f2l_st3_url,
        adv_f2l_st4_url,
        adv_f2l_st5_url,
    ];

    static const adv_f2l_st2_title = "Advanced F2L";
    static const adv_f2l_st2_descr = """
    <p>Серия видеороликов Advanced F2L от Кристофера Олсона
    <a href="http://www.cyotheking.com/about">Christopher Olson</a> - подразумевает, что вы уже
    собираете кубик используя Интуитивный или Жизненный F2L.</p>

    <p>В предыдущих частях (Интуитивном и Жизненном F2L) для упрощения понимания мы всегда подгоняли парня в ближний правый
    угол, подгоняли к нему его квартиру и делали различные перехваты. Т.е. перед выполнением
    непосредственно алгоритма делали установочные ходы (setup move). Если же вы хотите собирать кубик
    действительно быстро, то надо стараться сводить эти установочные ходы к минимуму, а лучше стараться
    и вовсе их избегать. Смотрите данные видео, раздел Expert F2L, а так же видео сборок от профессионалов (например
    <a href="https://www.youtube.com/watch?v=l6B2rh7tem4&list=PLI24ciRbl8BW8ybKSDsDzrSbSOx6pt1Pm">на канале JPerm</a>
    или <a href="rg2://ytplay?time=1:25&link=oq_QN7VJUxo">на канале Криса</a>
    </p>

    <p>Оригинальное видео на английском и ситуации в нем никак не упорядочены,
    но надеюсь, что с моими комментариями и картинками (превьюшками ситуаций) все будет понятно и
    вы легко сможете найти нужную ситуацию.</p>

    <p>1. Первая ситуация - <a href="rg2://ytplay?time=0:25&link=WIFh0sXDkMM">пара</a>
    около своей квартиры, но и пара и квартира на задней стороне слева. Обычно вы сделали бы перехват
    (ход y\') и левый английский пиф-паф или первый левый базовый алгоритм, но есть другой вариант: </p>
    <p style="text-align:center"><img src="adv_f2l_1_1.xml"  width="210"></p>
    <b><a href="rg2://ytplay?time=0:40&link=WIFh0sXDkMM&alg=Lw_U_L\'_U\'_M\'">Алгоритм:</a> Lw U L\' U\' M\'</b><br/>
    Можно использовать зеркальный алгоритм и для классического случая из <b>Части Ф</b>, когда пара и квартира спереди:<br/>
    <b><a href="rg2://ytplay?time=0:48&link=WIFh0sXDkMM&alg=Rw_U_R\'_U\'_M">Алгоритм:</a> Rw U R\' U\' M</b>

    <p>2. Вторая ситуация - <a href="rg2://ytplay?time=0:56&link=WIFh0sXDkMM">снова пара</a>
    на задней грани около своей квартиры, но уже справа.</p>
    <p style="text-align:center"><img src="adv_f2l_1_2.xml"  width="100"></p>
    <b><a href="rg2://ytplay?time=0:40&link=WIFh0sXDkMM&alg=Rw\'_U\'_R_U_M\'">Алгоритм:</a> Rw\' U\' R U M\'</b>

    <p>3. Третья ситуация - <a href="rg2://ytplay?time=1:10&link=WIFh0sXDkMM">пара</a>
    на передней грани слева, а квартира ее сзади справа. Можно сделать U2 и привести к ситуации 2, но
    как обычно есть и другой вариант.</p>
    <p style="text-align:center"><img src="adv_f2l_1_3.xml"  width="100"></p>
    <b><a href="rg2://ytplay?time=1:15&link=WIFh0sXDkMM&alg=R2_F_R_F\'_R">Алгоритм:</a> R2 F R F\' R</b>

    <p>4. Четвертая ситуация - <a href="rg2://ytplay?time=1:26&link=WIFh0sXDkMM">девушка</a>
    дома, но перевернута, парень с завышенной самооценкой справа сзади. Опять же можно использовать
    и вместо обычного алгоритма, только первым ходом поставить парня назад, пусть и разбив пару. Данный
    алгоритм быстрее, т.к. в нем нет двойных кручений.</p>
    <p style="text-align:center"><img src="adv_f2l_1_4.xml"  width="100"></p>
    <b><a href="rg2://ytplay?time=1:33&link=WIFh0sXDkMM&alg=(R\'_F_R_F\')_R_U\'_R\'">Алгоритм:</a> (R\' F R F\') R U\' R\'</b>

    <p>5. Пятая ситуация - <a href="rg2://ytplay?time=1:49&link=WIFh0sXDkMM">пара</a>
    в своем доме, но перевернута, а дом находится справа сзади.</p>
    <p style="text-align:center"><img src="adv_f2l_1_5.xml"  width="100"></p>
    <b><a href="rg2://ytplay?time=1:55&link=WIFh0sXDkMM&alg=R\'_U_R\'_F_R_F\'_R">Алгоритм:</a> R\' U R\' F R F\' R</b>

    <p>6. Шестая ситуация - <a href="rg2://ytplay?time=2:07&link=WIFh0sXDkMM">парень</a>
    с завышенной самооценкой, девушка сзади него и они совместимы. Ускорение для <b>Части Ж</b>. Без
    двойных кручений и перехватов, а так же с удобным фингертриксом (если второй ход делать
    указательным пальцем левой руки). За счет этого выполняется
    <a href="rg2://ytplay?time=2:26&link=WIFh0sXDkMM">быстрее,</a> чем алгоритм из
    <a href="rg2://ytplay?time=2:39&link=WIFh0sXDkMM"><b>Части Ж</b></a>, хотя, когда
    квартира находится справа сзади, лучше использовать алгоритм с двойным кручением, а не
    делать перехват <b>y</b>.</p>
    <p style="text-align:center"><img src="adv_f2l_1_6.xml"  width="210"></p>
    <b><a href="rg2://ytplay?time=2:14&link=WIFh0sXDkMM&alg=(F_U_R_U\'_R\'_F\')_R_U\'_R\'">Алгоритм:</a> (F U R U\' R\' F\') R U\' R\'</b><br/>
    <b><a href="rg2://ytplay?time=2:32&link=WIFh0sXDkMM">Алгоритм для квартиры сзади:</a> (U2 R2 U2 R) U R\' U R2</b>

    <p>7. Седьмая <a href="rg2://ytplay?time=2:42&link=WIFh0sXDkMM">ситуация</a>
    из <b>Части Е</b>, альтернативный вариант c удобным фингертриксом из стандартного положения рук.
    Максимкин алгоритм вроде бы и короче, но мне кажется что данный алгоритм быстрее.</p>
    <p style="text-align:center"><img src="adv_f2l_1_7.xml"  width="100"></p>
    <b><a href="rg2://ytplay?time=2:47&link=WIFh0sXDkMM&alg=U2_(R_U_R\'_U\')_R_U\'_R\'_U2_R_U\'_R\'">Алгоритм:</a> U2 (R U R\' U\') R U\' R\' U2 R U\' R\'</b><br/>
    или старый <b><a href="rg2://ytplay?time=3:07&link=WIFh0sXDkMM&alg=(U2_R2_U2_R\')_U\'_R_U\'_R2">Алгоритм:</a> (U2 R2 U2 R\') U\' R U\' R2</b><br/>

    <p>8. Восьмая <a href="rg2://ytplay?time=3:22&link=WIFh0sXDkMM">ситуация</a>
    из <b>Части Л</b>, альтернативный вариант без перехватов, и сложным, но очень быстрым
    <a href="rg2://ytplay?time=3:37&link=WIFh0sXDkMM">фингертриксом</a>. С очень
    нестандартным начальным положением рук - правая рука как при стандартном положении, а вот у
    левой большой палец сверху.</p>
    <p style="text-align:center"><img src="adv_f2l_1_8.xml"  width="100"></p>
    <b><a href="rg2://ytplay?time=3:27&link=WIFh0sXDkMM&alg=(R_B_L_U\')_L\'_B\'_R\'">Алгоритм:</a> (R B L U\') L\' B\' R\'</b><br/>
    или тоже самое, но в другой интерпретации:<br/>
    <b>(Lw U Rw U\') Rw\' U\' Lw\'</b>

    <p>9. Девятая <a href="rg2://ytplay?time=3:40&link=WIFh0sXDkMM">ситуация</a>
    из <b>Части Т</b>, но квартира спереди слева или просто зеркальная предыдущей ситуации. Опять же
    очень быстрый и удобный алгоритм.</p>
    <p style="text-align:center"><img src="adv_f2l_1_9.xml"  width="100"></p>
    <b><a href="rg2://ytplay?time=3:47&link=WIFh0sXDkMM&alg=M_U\'_R\'_F_R_U_M\'">Алгоритм:</a> M U\' R\' F R U M\'</b><br/>
    ну или вместо неудобного <b>М</b>, можно сделать <b>Rw\' R</b>.
    <p>Еще один вариант из ускорения 3.8 без вращения средней грани (M).</p>
    <b><a href="rg2://ytplay?time=2:28&link=IL7VMSTatAA&alg=F_U\'_(R_U\'_R\')_U2_F\'">Алгоритм:</a> F U\' (R U\' R\') U2 F\'</b>

    <p>10. Десятая ситуация - <a href="rg2://ytplay?time=4:10&link=WIFh0sXDkMM">парень</a>
    наглый на первом этаже, девушка на втором этаже, на своем месте, но перевернута. Можно
    пиф-пафом привести ситуацию к шестому ускорению, а можно использовать
    <a href="rg2://ytplay?time=4:23&link=WIFh0sXDkMM">быстрый</a>
    алгоритм с жирными включениями и выключениями света и привести ситуацию к трехходовке из <b>Части Х</b>.</p>
    <p style="text-align:center"><img src="adv_f2l_1_10.xml"  width="100"></p>
    <p><b><a href="rg2://ytplay?time=4:16&link=WIFh0sXDkMM&alg=Rw_U\'_Rw\'_U2_Rw_U_Rw\'_(R_U_R\')">Алгоритм:</a> Rw U\' Rw\' U2 Rw U Rw\' (R U R\')</b></p>

    <p>11. Одиннадцатая <a href="rg2://ytplay?time=4:10&link=WIFh0sXDkMM">ситуация</a>
    зеркальная десятой. Все тоже самое, парень смотрящий на нас и перевернутая девушка на своем месте,
    но все это слева. Начальное положение рук как при пиф-пафе. Кстати чтобы получить данную ситуацию,
    можно сделать алгоритм из ускорения 10 на собранном F2L. И напротив чтобы получить ситуацию 10,
    выполнить данный алгоритм.</p>
    <p style="text-align:center"><img src="adv_f2l_1_11.xml"  width="100"></p>
    <b><a href="rg2://ytplay?time=4:31&link=WIFh0sXDkMM&alg=F_R_U2_R\'_F\'_(L\'_U\'_L)">Алгоритм:</a> F R U2 R\' F\' (L\' U\' L)</b>

    <p>12. Двенадцатая <a href="rg2://ytplay?time=4:43&link=WIFh0sXDkMM">ситуация</a>
    - все аналогично предыдущей, но квартира спереди справа. В этом случае делаем алгоритм обратный
    ситуации 10.</p>
    <p style="text-align:center"><img src="adv_f2l_1_12.xml"  width="100"></p>
    <b><a href="rg2://ytplay?time=4:49&link=WIFh0sXDkMM&alg=(R_U\'_R\')_Rw_U\'_Rw\'_U2_Rw_U_Rw\'">Алгоритм:</a> (R U\' R\') Rw U\' Rw\' U2 Rw U Rw\'</b>

    <p>13. Тринадцатая <a href="rg2://ytplay?time=5:00&link=WIFh0sXDkMM">ситуация</a>
    - скромный парень на 3 этаже, девушка на втором в своей квартире, но перевернута, а квартира
    справа сзади. Можно было поднять девушку на третий этаж, увести на заднюю грань, вернуть парня
    на третий этаж, подвести к нему квартиру и заселить в 3 хода. А можно сделать это удобно и
    <a href="rg2://ytplay?time=5:15&link=WIFh0sXDkMM">быстро.</a></p>
    <p style="text-align:center"><img src="adv_f2l_1_13.xml"  width="100"></p>
    <b><a href="rg2://ytplay?time=5:10&link=WIFh0sXDkMM&alg=(R\'_F)_R\'_F\'_R_U\'_R">Алгоритм:</a> (R\' F) R\' F\' R U\' R</b>

    <p>14. Четырнадцатая <a href="rg2://ytplay?time=5:20&link=WIFh0sXDkMM">ситуация</a>
    из <b>Части В-3</b>. Парень с завышенной самооценкой, девушка на третьем этаже слева напротив своей
    грани. Но квартира у них спереди слева. Очень короткий и
    <a href="rg2://ytplay?time=5:41&link=WIFh0sXDkMM">быстрый</a> алгоритм.</p>
    <p style="text-align:center"><img src="adv_f2l_1_14.xml"  width="100"></p>
    <b><a href="rg2://ytplay?time=5:35&link=WIFh0sXDkMM&alg=F_R_U2_R\'_F\'">Алгоритм:</a> F R U2 R\' F\'</b>
    <p>Если же угол и квартира справа, то лучше использовать алгоритм из ускорений 3.4</p>
    <p style="text-align:center"><img src="adv_f2l_3_4.xml"  width="100"></p>
    <b><a href="rg2://ytplay?time=1:21&link=IL7VMSTatAA&alg=(Rw_U\'_Rw\')_U2_(Rw_U_Rw\')">Алгоритм:</a> (Rw U\' Rw\') U2 (Rw U Rw\')</b>

    <p>15. Пятнадцатая <a href="rg2://ytplay?time=5:44&link=WIFh0sXDkMM">ситуация</a>
    ускорение для <b>Ромашки направо</b>, т.е. одной из ситуаций, когда парень уже на своем месте,
    а девушка на третьем этаже. Вот только стебель ромашки должен быть слева (на картинке не видно).
    Очень простой и быстрый алгоритм: жирный пиф-паф, жирный английский пиф-паф.
    <p style="text-align:center"><img src="adv_f2l_1_15.xml"  width="100"></p>
    <b><a href="rg2://ytplay?time=5:54&link=WIFh0sXDkMM&alg=(Rw_U_Rw\'_U\')_(Rw\'_F_Rw_F\')">Алгоритм:</a> (Rw U Rw\' U\') (Rw\' F Rw F\')</b>

    """;
    static const adv_f2l_st2_url = "WIFh0sXDkMM";

    static const adv_f2l_st3_title = "Advanced F2L 2.0";
    static const adv_f2l_st3_descr = """
    <p>Вторая часть ускорений F2L от Кристофера Олсона <a href="http://www.cyotheking.com/about">Christopher Olson.</a></p>

    <p>1. Первая <a href="rg2://ytplay?time=0:12&link=28Ln2lfkD9U">ситуация.</a>
    Ускорение для классической \"ромашки налево\", но только для случая, когда задняя правая пара
    еще не на своем месте. Короткий, удобный супербыстрый алгоритм. </p>
    <p style="text-align:center"><img src="adv_f2l_2_1.xml"  width="100"></p>
    <b><a href="rg2://ytplay?time=0:29&link=28Ln2lfkD9U&alg=R2_U\'_R\'_U_R2">Алгоритм:</a> R2 U\' R\' U R2</b>

    <p>2. Вторая <a href="rg2://ytplay?time=0:35&link=28Ln2lfkD9U">ситуация.</a>
    Противоположная предыдущей, для классической \"ромашки направо\", но опять только для случая, когда
    передняя правая пара еще не на своем месте.</p>
    <p style="text-align:center"><img src="adv_f2l_2_2.xml"  width="100"></p>
    <b><a href="rg2://ytplay?time=0:46&link=28Ln2lfkD9U&alg=R2_U_R_U\'_R2">Алгоритм:</a> R2 U R U\' R2</b>

    <p>3. Третья <a href="rg2://ytplay?time=0:53&link=28Ln2lfkD9U">ситуация.</a>
    Вариант для <b>Части Т</b>, но пара стоит слева. Вариант без перехватов и Dw кручений.</p>
    <p style="text-align:center"><img src="adv_f2l_2_3.xml"  width="100"></p>
    <b><a href="rg2://ytplay?time=1:05&link=28Ln2lfkD9U&alg=F_(U_R_U\'_R\')_F\'_R_U_R\'">Алгоритм:</a> F (U R U\' R\') F\' R U R\'</b>

    <p>4. Четвертая <a href="rg2://ytplay?time=1:11&link=28Ln2lfkD9U">ситуация.</a>
    Вариант для классической <b>Части Т</b>.</p>
    <p style="text-align:center"><img src="adv_f2l_2_4.xml"  width="100"></p>
    <b><a href="rg2://ytplay?time=1:15&link=28Ln2lfkD9U&alg=x\'_R2_U\'_R\'_U_R\'_x_U2_R_U\'_R\'">Алгоритм:</a> x\' R2 U\' R\' U R\' x U2 R U\' R\'<br/> или немного по другому: Lw R U\' R\' U Lw\' U2 R U\' R\'</b>

    <p>5. Пятая <a href="rg2://ytplay?time=1:22&link=28Ln2lfkD9U">ситуация.</a>
    Казалось бы что тут ускорять, если данная ситуация решается в 3 хода. Но в данной ситуации можно
    сразу поставить на место и ребра (EO - Edge Orientation), тем самым упростив себе OLL, а может и
    совсем его пропустив. Т.е. если у вас пара как на картинке и только одна левая верхняя грань
    ориентирована как надо (желтой вверх), то можно выполнить данный алгоритм. По сути
    он объединяет два хорошо знакомых алгоритма английский пиф-паф и палку - (R\' F R <b>F\') (F</b> R U R\' U\' F\'), но
    без ненужных \"из Лондона\" и \"в Лондон\") на стыке.</p>
    <p style="text-align:center"><img src="adv_f2l_2_5.xml"  width="100"></p>
    <b><a href="rg2://ytplay?time=1:35&link=28Ln2lfkD9U&alg=R\'_F_R2_U_R\'_U\'_F\'">Алгоритм:</a> R\' F R2 U R\' U\' F\'</b>

    <p>6. Шестая <a href="rg2://ytplay?time=1:41&link=28Ln2lfkD9U">ситуация.</a>
    Можно ходом U\' привести ситуацию к первому ускорению первой части, но в данном случае, обратите
    внимание еще и на ребра, т.е. снова EO - в действии. Если ориентировано только одно дальнее ребро,
    то все ребра для OLL встанут на место.<br/>
    К тому же, алгоритм без перехватов и с очень удобным
    фингертриксом, поэтому можно использовать и как основной алгоритм для <b>Части Ф</b>.</p>
    <p style="text-align:center"><img src="adv_f2l_2_6.xml"  width="100"></p>
    <b><a href="rg2://ytplay?time=1:56&link=28Ln2lfkD9U&alg=R\'_D\'_Rw_U\'_Rw\'_D_R">Алгоритм:</a> R\' D\' Rw U\' Rw\' D R</b>

    <p>7. Седьмая <a href="rg2://ytplay?time=2:00&link=28Ln2lfkD9U">ситуация.</a>
    И снова казалось бы что тут ускорять, перехват и установка в 2 хода. Но опять обращаем внимание
    на ребра верхней грани. И снова если только одно дальнее ребро ориентировано как надо, лучше
    выполнить очень похожий на предыдущий алгоритм.</p>
    <p style="text-align:center"><img src="adv_f2l_2_7.xml"  width="100"></p>
    <b><a href="rg2://ytplay?time=2:09&link=28Ln2lfkD9U&alg=R\'_D\'_Rw_U\'_Rw\'_D_R">Алгоритм:</a> R\' D\' Rw U\' Rw\' D R</b>

    <p>8. Восьмая <a href="rg2://ytplay?time=2:13&link=28Ln2lfkD9U">ситуация.</a>
    Редкая ситуация, но можно пропустить OLL и сразу перейти к PLL. Очень похоже на <b>Носик</b>,
    только начинается c выключения света, а потом заселяем в 4 хода. Обратите внимание, что лучше
    выполнять из стандартного положения рук, а нижнюю грань в обоих случаях крутить левой рукой.</p>
    <p style="text-align:center"><img src="adv_f2l_2_8.xml"  width="100"></p>
    <b><a href="rg2://ytplay?time=2:22&link=28Ln2lfkD9U&alg=(R\'_D\'_R_U\'_R\'_D_R)_(U_R_U\'_R\')">Алгоритм:</a> (R\' D\' R U\' R\' D R) (U R U\' R\')</b>

    <p>9. Девятая <a href="rg2://ytplay?time=2:28&link=28Ln2lfkD9U">ситуация.</a>
    Еще одна ситуация, когда легко пропустить OLL. Быстрый и удобный алгоритм, который можно использовать
    и как основной для <b>Части Е</b>.</p>
    <p style="text-align:center"><img src="adv_f2l_2_9.xml"  width="100"></p>
    <b><a href="rg2://ytplay?time=2:38&link=28Ln2lfkD9U&alg=(R_U\'_R2_D\'_R_U2_R\'_D_R)">Алгоритм:</a> (R U\' R2 D\' R U2 R\' D R)</b>

    <p>10. Десятая <a href="rg2://ytplay?time=2:43&link=28Ln2lfkD9U">ситуация.</a>
    Очень полезный алгоритм, для ситуации когда угол на своем месте, ребро тоже на своем, но перевернуто.
    Это будет гораздо быстрее, чем сначала поднимать пару на верхний слой, а потом решать эту пару, но
    данный алгоритм можно применять только, когда задняя правая пара не на своем месте (как в ускорении 1).</p>
    <p style="text-align:center"><img src="adv_f2l_2_10.xml"  width="100"></p>
    <b><a href="rg2://ytplay?time=3:03&link=28Ln2lfkD9U&alg=D\'_R\'_F_R_F\'_R_U\'_R\'_D">Алгоритм:</a> D\' R\' F R F\' R U\' R\' D</b>

    <p>Или алгоритм для данной ситуации, когда задняя пара уже на своем месте (спасибо Алексею Великанову).
    С удобным фингертриксом, если выполнять из стандартного положения рук, а двойные вращения крыши
    делать левой рукой.<br/>
    <b>Алгоритм: (R U2) R\' U R U2 R\' U (F\' U\' F)</b></p>

    <p>11. Одиннадцатая <a href="rg2://ytplay?time=3:13&link=28Ln2lfkD9U">ситуация.</a>
    Обычно в такой ситуации вы бы сделали U2, перехват и т.д. Но можно обойтись и без перехвата.</p>
    <p style="text-align:center"><img src="adv_f2l_2_11.xml"  width="100"></p>
    <b><a href="rg2://ytplay?time=3:22&link=28Ln2lfkD9U&alg=Rw\'_U_R_U\'_R\'_U\'_Rw">Алгоритм:</a> Rw\' U R U\' R\' U\' Rw</b>

    <p>12. Двенадцатая <a href="rg2://ytplay?time=3:27&link=28Ln2lfkD9U">ситуация.</a>
    Еще один алгоритм для <b>Части Ф</b> с OLL скипом. Тоже быстрый и удобный алгоритм.</p>
    <p style="text-align:center"><img src="adv_f2l_2_12.xml"  width="100"></p>
    <b><a href="rg2://ytplay?time=3:43&link=28Ln2lfkD9U&alg=Rw\'_D\'_Rw_U\'_Rw\'_D_Rw">Алгоритм:</a> Rw\' D\' Rw U\' Rw\' D Rw</b>

    """;
    static const adv_f2l_st3_url = "28Ln2lfkD9U";

    static const adv_f2l_st4_title = "Advanced F2L 3.0";
    static const adv_f2l_st4_descr = """
    <p>Третья часть ускорений F2L от Кристофера Олсона <a href="http://www.cyotheking.com/about">Christopher Olson.</a></p>

    <p>1. Первая <a href="rg2://ytplay?time=0:40&link=IL7VMSTatAA">ситуация.</a>
    Очень полезное ускорение, позволяющее обойтись без перехвата когда квартира справа сзади, угол над
    квартирой, ребро на передней грани, но они совместимы. </p>
    <p style="text-align:center"><img src="adv_f2l_3_1.xml"  width="100"></p>
    <b><a href="rg2://ytplay?time=0:47&link=IL7VMSTatAA&alg=Rw_U2_R2_U\'_R2_U\'_Rw\'">Алгоритм:</a> Rw U2 R2 U\' R2 U\' Rw\'</b>

    <p>2. Вторая <a href="rg2://ytplay?time=0:53&link=IL7VMSTatAA">ситуация.</a>
    Можно конечно ходом U привести ситуацию к \"Ромашке налево\", а можно сделать удивительно быстрый
    и удобный алгоритм.</p>
    <p style="text-align:center"><img src="adv_f2l_3_2.xml"  width="100"></p>
    <b><a href="rg2://ytplay?time=1:02&link=IL7VMSTatAA&alg=F\'_(R_U_R\'_U\')_R\'_F_R">Алгоритм:</a> F\' (R U R\' U\') R\' F R</b>

    <p>3. Третья <a href="rg2://ytplay?time=1:08&link=IL7VMSTatAA">ситуация.</a>
    Классическая \"Ромашка налево\". Тоже быстрый и более удобный чем ромашка алгоритм.</p>
    <p style="text-align:center"><img src="adv_f2l_3_3.xml"  width="100"></p>
    <b><a href="rg2://ytplay?time=1:12&link=IL7VMSTatAA&alg=R\'_F\'_R_(U_R_U\'_R\')_F">Алгоритм:</a> R\' F\' R (U R U\' R\') F</b>

    <p>4. Четвертая <a href="rg2://ytplay?time=1:17&link=IL7VMSTatAA">ситуация.</a>
    И снова все быстро, без перехватов и вращений передней грани. </p>
    <p style="text-align:center"><img src="adv_f2l_3_4.xml"  width="100"></p>
    <b><a href="rg2://ytplay?time=1:21&link=IL7VMSTatAA&alg=(Rw_U\'_Rw\')_U2_(Rw_U_Rw\')">Алгоритм:</a> (Rw U\' Rw\') U2 (Rw U Rw\')</b>
    <p>Для квартиры и угла слева, вот такой алгоритм из ускорения 1.14</p>
    <p style="text-align:center"><img src="adv_f2l_1_14.xml"  width="100"></p>
    <b><a href="rg2://ytplay?time=5:35&link=WIFh0sXDkMM&alg=F_R_U2_R\'_F\'">Алгоритм:</a> F R U2 R\' F\'</b>


    <p>5. Пятая <a href="rg2://ytplay?time=1:28&link=IL7VMSTatAA">ситуация.</a>
    Еще одно ускорение к серии ускорений из предыдущей части, касающихся ориентации ребер или скипу OLL.</p>
    <p style="text-align:center"><img src="adv_f2l_3_5.xml"  width="100"></p>
    <b><a href="rg2://ytplay?time=1:41&link=IL7VMSTatAA&alg=R\'_D\'_(Rw_U_Rw\')_D_R2_U_R\'">Алгоритм:</a> R\' D\' (Rw U Rw\') D R2 U R\'</b>

    <p>6. Шестая <a href="rg2://ytplay?time=1:47&link=IL7VMSTatAA">ситуация.</a>
    Можно конечно сделать U, перехват и ускорение 1.7 или 2.9. А можно и такой красивый алгоритм.</p>
    <p style="text-align:center"><img src="adv_f2l_3_6.xml"  width="100"></p>
    <b><a href="rg2://ytplay?time=1:50&link=IL7VMSTatAA&alg=R\'_F_R\'_F\'_R2_U\'_(R\'_U_R)">Алгоритм:</a> R\' F R\' F\' R2 U\' (R\' U R)</b>

    <p>7. Седьмая <a href="rg2://ytplay?time=1:57&link=IL7VMSTatAA">ситуация.</a>
    В классическом F2L надо либо поднять пару наверх неудобно (F F\') либо ставить неудобно через (B B\').
    Поэтому лучше вот таким алгоритмом, ну или поднять левой (опустить жирно правую) и воспользоваться
    ускорением 1.2</p>
    <p style="text-align:center"><img src="adv_f2l_3_7.xml"  width="100"></p>
    <b><a href="rg2://ytplay?time=2:01&link=IL7VMSTatAA&alg=R\'_(F_U\'_F\')_R">Алгоритм:</a> R\' (F U\' F\') R</b><br/>
    или с использованием ускорения из первой части <b><a href="rg2://ytplay?time=2:16&link=IL7VMSTatAA&alg=Rw\'_F_U\'_R_U_M\'">Алгоритм:</a> Rw\' F U\' R U M\'</b>

    <p>8. Восьмая <a href="rg2://ytplay?time=2:20&link=IL7VMSTatAA">ситуация.</a>
    Еще один вариант для ситуации из ускорения 1.9, но без вращения средней грани (M).</p>
    <p style="text-align:center"><img src="adv_f2l_3_8.xml"  width="100"></p>
    <b><a href="rg2://ytplay?time=2:28&link=IL7VMSTatAA&alg=F_U\'_(R_U\'_R\')_U2_F\'">Алгоритм:</a> F U\' (R U\' R\') U2 F\'</b>

    <p>9. Девятая <a href="rg2://ytplay?time=2:33&link=IL7VMSTatAA">ситуация.</a>
    Вместо U и трех пиф-пафов можно и чуть быстрее. </p>
    <p style="text-align:center"><img src="adv_f2l_3_9.xml"  width="100"></p>
    <b><a href="rg2://ytplay?time=2:44&link=IL7VMSTatAA&alg=(F_R\'_F\'_R)_U\'_(R_U\'_R\')">Алгоритм:</a> (F R\' F\' R) U\' (R U\' R\')</b>

    <p>10. Десятая <a href="rg2://ytplay?time=2:51&link=IL7VMSTatAA">ситуация.</a>
    Один из моих любимых алгоритмов. Быстро, красиво и удобно тренировать
    (повтор алгоритма возвращает все на место).</p>
    <p style="text-align:center"><img src="adv_f2l_3_10.xml"  width="100"></p>
    <b><a href="rg2://ytplay?time=2:57&link=IL7VMSTatAA&alg=(R2_D\')_F2_(D_R2)">Алгоритм:</a> (R2 D\') F2 (D R2)</b>

    """;
    static const adv_f2l_st4_url = "IL7VMSTatAA";

    static const adv_f2l_st5_title = "Advanced F2L 4.0";
    static const adv_f2l_st5_descr = """
    <p>Четвертая часть ускорений F2L от Кристофера Олсона <a href="http://www.cyotheking.com/about">Christopher Olson.</a></p>

    <p>1. Первая <a href="rg2://ytplay?time=0:32&link=zstdjvprOAg">ситуация.</a>
    Вроде и ускорять нечего U2 и загнать в три хода, но можно воспользоваться и чуть более длинным,
    но на самом деле более быстрым алгоритмом, к тому же без вращения левой грани.</p>
    <p style="text-align:center"><img src="adv_f2l_4_1.xml"  width="100"></p>
    <b><a href="rg2://ytplay?time=0:47&link=zstdjvprOAg&alg=R\'_F_(R_U_R\')_F\'_R">Алгоритм:</a> R\' F (R U R\') F\' R</b>

    <p>2. Вторая <a href="rg2://ytplay?time=1:03&link=zstdjvprOAg">ситуация.</a>
    Двойное ускорение. Можно использовать как \"Ромашку направо\" для передней грани и в случае,
    если надо переставить ребро на втором этаже справа налево.</p>
    <p style="text-align:center"><img src="adv_f2l_4_2.xml"  width="100"></p>
    <b><a href="rg2://ytplay?time=1:08&link=zstdjvprOAg&alg=F_(Rw_U_Rw\'_U\')_F\'">Алгоритм:</a> F (Rw U Rw\' U\') F\'</b>

    <p>3. Третья <a href="rg2://ytplay?time=1:22&link=zstdjvprOAg">ситуация.</a>
    Зеркальное предыдущему ускорение. Можно использовать как \"Ромашку налево\" и если надо переставить ребро на
    втором этаже слева направо.</p>
    <p style="text-align:center"><img src="adv_f2l_4_3.xml"  width="100"></p>
    <b><a href="rg2://ytplay?time=1:24&link=zstdjvprOAg&alg=F_(U_Rw_U\'_Rw\')_F\'">Алгоритм:</a> F (U Rw U\' Rw\') F\'</b>

    <p>4. Четвертая <a href="rg2://ytplay?time=1:29&link=zstdjvprOAg">ситуация.</a>
    Чтобы не делать два перехвата, можно сделать такой не простой для запоминания алгоритм. </p>
    <p style="text-align:center"><img src="adv_f2l_4_4.xml"  width="100"></p>
    <b><a href="rg2://ytplay?time=1:38&link=zstdjvprOAg&alg=R\'_U\'_R\'_D\'_R_U_R\'_D_R_U\'_R">Алгоритм:</a> R\' U\' R\' D\' R U R\' D R U\' R</b>

    <p>5. Пятая <a href="rg2://ytplay?time=1:45&link=zstdjvprOAg">ситуация.</a>
    Обратите внимание, что квартира в данном случае находится слева сзади. Т.е. либо сделать перехват
    (y) и Максимкин алгоритм уже без первого хода U2, либо вот так без перехватов.</p>
    <p style="text-align:center"><img src="adv_f2l_4_5.xml"  width="100"></p>
    <b><a href="rg2://ytplay?time=1:50&link=zstdjvprOAg&alg=Rw_U_R\'_U_R_U2_B_Rw\'">Алгоритм:</a> Rw U R\' U R U2 B Rw\'</b>

    <p>6. Шестая <a href="rg2://ytplay?time=2:10&link=zstdjvprOAg">ситуация.</a>
    Вот так красиво подгоняем ребро к углу (алгоритмом обратным ускорению 1.1) и заселяем в три хода.</p>
    <p style="text-align:center"><img src="adv_f2l_4_6.xml"  width="100"></p>
    <b><a href="rg2://ytplay?time=2:17&link=zstdjvprOAg&alg=(M\'_U_R_U\'_Rw\')_R_U\'_R\'">Алгоритм:</a> (M\' U R U\' Rw\') R U\' R\'</b>

    <p>7. Седьмая <a href="rg2://ytplay?time=2:25&link=zstdjvprOAg">ситуация.</a>
    Вроде бы неудобная ситуация и ребро и угол не на третьем этаже, но вот как просто можно ее решить.</p>
    <p style="text-align:center"><img src="adv_f2l_4_7.xml"  width="100"></p>
    <b><a href="rg2://ytplay?time=2:50&link=zstdjvprOAg&alg=R\'_F_R_U\'_F\'_R_U\'_R\'">Алгоритм:</a> R\' F R U\' F\' R U\' R\'</b>

    <p>8. Восьмая <a href="rg2://ytplay?time=2:55&link=zstdjvprOAg">ситуация.</a>
    Опять же куда быстрее чем U, два пиф-пафа, перехват и еще пиф-паф.</p>
    <p style="text-align:center"><img src="adv_f2l_4_8.xml"  width="100"></p>
    <b><a href="rg2://ytplay?time=2:59&link=zstdjvprOAg&alg=R\'_F_R2_U\'_R\'_U2_F\'">Алгоритм:</a> R\' F R2 U\' R\' U2 F\'</b>

    <p>9. Девятая <a href="rg2://ytplay?time=3:07&link=zstdjvprOAg">ситуация.</a>
    Ну и как же обойтись без скипа OLL. Еще один алгоритм для легко определяемой ситуации, позволяющий
    перейти сразу к PLL.</p>
    <p style="text-align:center"><img src="adv_f2l_4_9.xml"  width="100"></p>
    <b><a href="rg2://ytplay?time=3:17&link=zstdjvprOAg&alg=F_(U_R_U\'_R\')_F\'_R_U_R\'">Алгоритм:</a> F (U R U\' R\') F\' R U R\'</b>

    <p>10. Десятая <a href="rg2://ytplay?time=3:35&link=zstdjvprOAg">ситуация.</a>
    И так вроде не сложная ситуация, но можно ее решить только через кручение удобных U и R, без Лондонов.</p>
    <p style="text-align:center"><img src="adv_f2l_4_10.xml"  width="100"></p>
    <b><a href="rg2://ytplay?time=3:44&link=zstdjvprOAg&alg=R\'_U\'_(R2_U_R2)_U\'_R">Алгоритм:</a> R\' U\' (R2 U R2) U\' R</b>

    """;
    static const adv_f2l_st5_url = "zstdjvprOAg";
}