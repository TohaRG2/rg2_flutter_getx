
import 'package:rg2_flutter_getx/models/phases.dart';

class Pyraminx implements Phase {
  @override
  int count = pyraminx_title.length;

  @override
  String phase = "PYRAMINX";

  @override
  List<String> titles() => pyraminx_title;

  @override
  List<String> icons() => pyraminx_icon;

  @override
  List<String> descriptions() => pyraminx_descr;

  @override
  List<String> urls() => pyraminx_url;

  @override
  List<String> comments() => List.filled(count, "");

///==================================================


    static const pyraminx_title = [
        pyraminx_st1_title,
        pyraminx_st2_title,
        pyraminx_st3_title,
        pyraminx_st4_title,
    ];

    static const pyraminx_icon = [
        "pyraminx_1",
        "pyraminx_2",
        "pyraminx_3",
        "pyraminx_4",
    ];
    
    static const pyraminx_descr = [
        pyraminx_st1_descr,
        pyraminx_st2_descr,
        pyraminx_st3_descr,
        pyraminx_st4_descr,
    ];


    static const pyraminx_url = [
        pyraminx_st1_url,
        pyraminx_st2_url,
        pyraminx_st3_url,
        pyraminx_st4_url,
    ];
    
    static const pyraminx_st1_title = "Этап 1. Ориентация уголков.";
    static const pyraminx_st1_descr = """
        <p>Пирамидка довольно простая головоломка и очень многие ее могут собрать интуитивно.
        На кубик Рубика она мало чем похожа, но все же сходства есть.
        Обе эти головоломки имеют три группы деталей. Давайте их рассмотрим, так как они не
        совсем такие, как в кубике.</p>
        <p>Первая группа деталей - <b>Уголки</b>. Как и в кубике у них три стороны.</p>

        <p style="text-align:center"><img src="pyraminx_1_1.xml"></p>

        <p>Вторая группа - <b>Ребра</b>, опять же как и в кубике - у них две стороны.</p>

        <p style="text-align:center"><img src="pyraminx_1_2.xml"></p>

        <p>А вот третья группа - <b>Радиаторы</b>. Чем-то похожа на центры, причем скорее кубика 4х4,
        а не 3х3. Данные элементы так же как и в кубике 4х4 имеют одну сторону и не фиксированы на
        своих местах, но их тут всего лишь по три штуки каждого цвета.</p>
        <p style="text-align:center"><img src="pyraminx_1_3.xml"></p>

        <p>Ну а почему называются <a href="rg2://ytplay?time=3:38&link=Tcg2BMHxFY8"><b>Радиаторы</b> думаю понятно.</a></p>

        <p style="text-align:center"><img src="pyraminx_1_4.xml"></p>

        <p>Теперь перейдем непосредственно к сборке. И на первом этапе мы будем работать с уголками.
        Задача этого этапа  - совместить уголки с их радиаторами. Сделать это очень просто:
        Ставим пирамидку любой <a href="rg2://ytplay?time=6:20&link=Tcg2BMHxFY8">гранью к себе</a>
        и смотрим на верхний уголок и радиатор.</p>

        <p style="text-align:center"><img src="pyraminx_1_5.xml"> => <img src="pyraminx_1_6.xml"></p>

        <p>И крутим верхний уголок, пока он не совпадёт с радиатором по цвету. Далее переворачиваем
        пирамидку так, чтобы наверху был другой уголок не совпадающий с радиатором по цвету и крутим его,
        чтобы он с радиатором совпал.</p>
        <p>Повторить данные действия для всех оставшихся несовпадающих уголков. Должна
        получится приблизительно <a href="rg2://ytplay?time=8:11&link=Tcg2BMHxFY8">такая ситуация.</a></p>

        <p style="text-align:center"><img src="pyraminx_1_7.xml"></p>

        <p>Вот и весь первый этап.</p>
    """;
    static const pyraminx_st1_url = "Tcg2BMHxFY8";

    static const pyraminx_st2_title = "Этап 2. Расстановка радиаторов.";
    static const pyraminx_st2_descr = """
        <p>На этом этапе, как уже многие догадались, мы будем расставлять радиаторы, а вместе с ними и уголки,
        на свои места. У нас должно получится
        <a href="rg2://ytplay?time=7:42&link=Azxl2S_FVpk">некое подобие креста</a> кубика 3х3.
        <p style="text-align:center"><img src="pyraminx_2_1.xml"></p>

        <p>Для начала выберем цвет грани с которой начнем сборку.
        <a href="rg2://ytplay?time=0:52&link=Azxl2S_FVpk">Например красный.</a>
        Теперь найдем три радиатора с углами выбранного цвета,
        т.к. углы у нас уже совмещены со своими радиаторами. Теперь поставьте пальцы
        <a href="rg2://ytplay?time=1:05&link=Azxl2S_FVpk">на эти уголки.</a>
        Нам это нужно чтобы найти сторону, на которой будут находится наши радиаторы.
        Т.к. в отличие от центров кубика 4х4, радиатор нельзя поставить на абсолютно
        любую сторону, т.е. расположение сторон в
        <a href="rg2://ytplay?time=2:43&link=Azxl2S_FVpk">пирамидке фиксировано.</a></p>

        <p style="text-align:center"><img src="pyraminx_2_2.xml"></p>

        <p>Желтыми точками отмечены места для пальцев. Сторона на которой стоят все три пальца
        и будет <a href="rg2://ytplay?time=3:41&link=Azxl2S_FVpk">нужной нам стороной.</a></p>

        <p>Теперь все что нам осталось сделать -
        <a href="rg2://ytplay?time=4:40&link=Azxl2S_FVpk">повернуть большие углы</a> с радиаторами так, чтобы каждый
        радиатор стоял на своём месте <a href="rg2://ytplay?time=5:13&link=Azxl2S_FVpk">(встал на свою сторону).</a>

        <p style="text-align:center"><img src="pyraminx_2_3.xml"> => <img src="pyraminx_2_4.xml"></p>

        <p>На этом второй этап окончен.</p>
    """;
    static const pyraminx_st2_url = "Azxl2S_FVpk";

    static const pyraminx_st3_title = "Этап 3. Сборка основания";
    static const pyraminx_st3_descr = """
        <p>Продолжаем работать с той стороной пирамидки, на которой на прошлом этапе поставили на свое место
        радиаторы. На этом этапе нашей задачей является сборка основания или
        <a href="rg2://ytplay?time=10:30&link=nAT6_FdZF3w">нижнего слоя пирамидки.</a></p>
        <p style="text-align:center"><img src="pyraminx_3_1.xml"></p>

        <p>Как наверно уже понятно из картинки, ставим пирамидку так, чтобы собираемая
        <a href="rg2://ytplay?time=1:57&link=nAT6_FdZF3w">сторона была внизу.</a><br/><br/>

        Для сборки основания нам осталось собрать только ребра на нижнем слое, поэтому нам
        нужно найти хотя бы одно такое ребро. Сначала ищем ребро с цветом нижней стороны (в данном случае красной)
        <a href="rg2://ytplay?time=2:12&link=nAT6_FdZF3w">на втором этаже.</a>
        Если находим, то ставим пирамидку так, чтобы это ребро смотрело цветом нижней стороны не на нас,
        а вбок, т.е. вправо или <a href="rg2://ytplay?time=2:20&link=nAT6_FdZF3w">влево от нас.</a><br/>
        Теперь крутим нижнюю грань так, чтобы она совпала с цветом наклейки ребра,
        <a href="rg2://ytplay?time=5:35&link=nAT6_FdZF3w">смотрящей на нас.</a>
        Должна получиться одна из этих ситуаций:</p>
        <p style="text-align:center"><img src="pyraminx_3_2.xml"> или <img src="pyraminx_3_3.xml"></p>

        <p>Ну и теперь поставим это ребро <a href="rg2://ytplay?time=4:48&link=nAT6_FdZF3w">на свое место.</a>
        Для этого поднимаем большой угол с противоположной
        стороны от ребра, крутим верхние два слоя в сторону поднятого угла и возвращаем
        <a href="rg2://ytplay?time=4:57&link=nAT6_FdZF3w">угол на место.</a><br/><br/>

        Если <a href="rg2://ytplay?time=3:15&link=TGUNoe8Bt_w">записывать формулами</a>
        то, для ситуации, когда наше ребро стоит справа:</p>
        <p style="text-align:center"><img src="pyraminx_3_2.xml"></p>

        <b><a href="rg2://ytplay?time=5:58&link=nAT6_FdZF3w&alg=L\'_U_L">Алгоритм:</a> L\' U L</b><br/><br/>

        А для ситуации, когда ребро слева:
        <p style="text-align:center"><img src="pyraminx_3_3.xml"></p>

        <b><a href="rg2://ytplay?time=4:57&link=nAT6_FdZF3w&alg=R_U\'_R\'">Алгоритм:</a> R U\' R\'</b>

        Повторяем для всех ребер цвета нижней стороны находящихся на втором этаже.

        <p>Ну и если нижний слой еще не весь собран, а нужных ребер на
        <a href="rg2://ytplay?time=8:51&link=nAT6_FdZF3w">втором этаже нет,</a> то значит
        они находятся на первом этаже или в подвале. В этом случае загоняем на место нужного нам
        ребра любое другое, тем самым подняв нужное ребро на второй этаж, т.е.
        <a href="rg2://ytplay?time=9:05&link=nAT6_FdZF3w">выкорчевываем его.</a>
        А что делать с ребром когда оно на втором этаже, мы уже знаем.
        </p>

    """;
    static const pyraminx_st3_url = "nAT6_FdZF3w";

    static const pyraminx_st4_title = "Этап 4. Ребра среднего слоя ";
    static const pyraminx_st4_descr = """
        Осталось поставить на свои места только ребра среднего слоя (второго этажа). А чтобы
        это сделать, надо понять какие из них находятся не на своем месте. Для этого надо
        поставить верхние радиаторы и уголок (ромбики) <a href="rg2://ytplay?time=0:59&link=jwg4-0rwQyw"> на места.</a>
        Сделать это очень просто - покрутить
        два верхних слоя так, чтобы на любой из сторон все радиаторы
        <a href="rg2://ytplay?time=1:14&link=jwg4-0rwQyw">оказались одного цвета.</a>
        Остальные встанут на свои места <a href="rg2://ytplay?time=1:26&link=jwg4-0rwQyw">автоматически.</a>
        <p style="text-align:center"><img src="pyraminx_4_1.xml"></p>

        <p>И теперь должна быть четко видна ситуация с ребрами. Этих ситуаций 3 основных вида:</p>

        <p><b>1. Все три ребра стоят не на своем месте,
        <a href="rg2://ytplay?time=2:25&link=jwg4-0rwQyw">но нет глазок.</a></b></p>

        В этом случае нужно поставить пирамидку так, чтобы она смотрела ребром, которое
        <a href="rg2://ytplay?time=3:00&link=jwg4-0rwQyw">не сходится с обеих сторон</a>
        со сторонами пирамидки, от себя.
        <p style="text-align:center"><img src="pyraminx_4_2.xml"><br/>
        <a href="rg2://ytplay?time=3:39&link=jwg4-0rwQyw">вот таким ребром от себя</a></p>

        <p>И теперь посмотреть на переднюю сторону и найти там предателя (наклейку отличную от
        других) справа или слева.<br/><br/>

        <b>1.1 <a href="rg2://ytplay?time=3:57&link=jwg4-0rwQyw">Правый предатель.</a></b></p>
        <p style="text-align:center"><img src="pyraminx_4_3.xml"></p>

        <p>Стреляем в предателя. Делаем <a href="rg2://ytplay?time=4:20&link=TGUNoe8Bt_w">пирамидный пиф-паф.</a>
        И поскольку у нас предатель справа, то и <a href="rg2://ytplay?time=4:33&link=jwg4-0rwQyw">пиф-паф справа.</a>
        после которого, у нас на второй этаж
        <a href="rg2://ytplay?time=4:48&link=jwg4-0rwQyw">вылезает ребро нижней грани,</a>
        которое ставим на место, <a href="rg2://ytplay?time=5:06&link=jwg4-0rwQyw">как на 3-ем этапе.</a>
        Profit!<br/><br/>

        <b>Алгоритм: (R\' L R L\') U\' (L\' U L)</b></p>

        <b>1.2 <a href="rg2://ytplay?time=7:19&link=jwg4-0rwQyw">Левый предатель.</a></b></p>
        <p style="text-align:center"><img src="pyraminx_4_4.xml"></p>

        <p><a href="rg2://ytplay?time=7:46&link=jwg4-0rwQyw">Аналогично</a> правому предателю.
        Но поскольку он слева, то и стреляем в него
        <a href="rg2://ytplay?time=4:54&link=TGUNoe8Bt_w">левым пирамидным пиф-пафом,</a>
        после которого, у нас опять же на второй этаж

        <a href="rg2://ytplay?time=7:58&link=jwg4-0rwQyw">вылезает ребро нижней грани,</a>
        которое ставим на место, <a href="rg2://ytplay?time=8:04&link=jwg4-0rwQyw">как на 3-ем этапе.</a>
        Profit!<br/><br/>

        <b>Алгоритм: (L R\' L\' R) U (R U\' R\')</b></p>

        <p><b>2. <a href="rg2://ytplay?time=12:00&link=jwg4-0rwQyw">Глазки со всех сторон.</a></b><p>
        Еще одна ситуация, когда все три ребра находятся не на своем месте, но отличить ее от других
        не составляет труда. С любой стороны глазки, соответственно и как держать пирамидку на данном
        этапе не имеет значения, главное собранной гранью вниз.
        <p style="text-align:center"><img src="pyraminx_4_5.xml"></p>

        Очень простой алгоритм. Крутим попеременно правую и верхнюю грани пирамидки. Причем правую крутим попеременно
        <a href="rg2://ytplay?time=12:14&link=jwg4-0rwQyw">то вниз, то вверх.</a>
        А верхнюю <a href="rg2://ytplay?time=12:44&link=jwg4-0rwQyw">только против часовой</a>.
        Начинаем с правой. И как всегда на данном этапе - с движения вниз.<br/>
        Если пирамидка не собралась
        <a href="rg2://ytplay?time=13:33&link=jwg4-0rwQyw">с первого раза,</a> то значит
        <a href="rg2://ytplay?time=13:42&link=jwg4-0rwQyw">соберется со второго.</a><br/><br/>

        <b><a href="rg2://ytplay?time=12:52&link=jwg4-0rwQyw&alg=R\'_U\'_R_U\'_R\'_U\'_R">Алгоритм:</a> R\' U\' R U\' R\' U\' R</b></p>

        <p><b>3. <a href="rg2://ytplay?time=9:20&link=jwg4-0rwQyw">Два предателя.</a></b><p>

        Если только одно из ребер
        <a href="rg2://ytplay?time=9:29&link=jwg4-0rwQyw">правильно ориентировано,</a>
        значит оно опять же отличается от остальных и поставить его надо как и в первом случае -
        <a href="rg2://ytplay?time=9:40&link=jwg4-0rwQyw">от себя подальше.</a>
        Спереди в этом случае будут <b>Два предателя</b>.
        <p style="text-align:center"><img src="pyraminx_4_6.xml"></p>

        <p>Ситуация очень похожа на ситуацию с одним предателем.
        <a href="rg2://ytplay?time=10:38&link=jwg4-0rwQyw">Стреляем</a> в любого из предателей
        любым пиф-пафом,
        <a href="rg2://ytplay?time=4:20&link=TGUNoe8Bt_w">хоть правым</a>,
        <a href="rg2://ytplay?time=4:54&link=TGUNoe8Bt_w">хоть левым.</a>
        Тем самым поднимая ребро с нижнего слоя, а вот
        устанавливаем это ребро на свое место уже другим алгоритмом. Сначала отводим верх в другую сторону,
        т.е. ставим элемент цветом нижнего слоя
        <a href="rg2://ytplay?time=10:48&link=jwg4-0rwQyw">не вбок, а назад.</a>
        А потом как и раньше: поднимаем, загоняем, отпускаем.<br/><br/>

        <b><a href="rg2://ytplay?time=11:14&link=jwg4-0rwQyw&alg=(R\'_L_R_L\')_U_(L\'_U\'_L)">Алгоритм:</a> (R\' L R L\') U (L\' U\' L)</b></p>

        Profit!!

    """;
    static const pyraminx_st4_url = "jwg4-0rwQyw";


}
