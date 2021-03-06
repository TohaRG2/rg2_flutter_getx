
import 'package:rg2/models/phases.dart';

class Cross implements Phase {
  @override
  int count = cross_title.length;

  @override
  String phase = "CROSS";

  @override
  List<String> titles() => cross_title;

  @override
  List<String> icons() => cross_icon;

  @override
  List<String> descriptions() => cross_descr;

  @override
  List<String> urls() => cross_url;

  @override
  List<String> comments() => List.filled(count, "");

///==================================================

    static const cross_title = [
        cross_st1_title,
        cross_st2_title,
        cross_st3_title,
    ];

    static const cross_icon = [
        "cross_1",
        "cross_2",
        "cross_3",
    ];

    static const cross_descr = [
        cross_st1_descr,
        cross_st2_descr,
        cross_st3_descr,

    ];

    static const cross_url = [
        cross_st1_url,
        cross_st2_url,
        cross_st3_url,

    ];


  static const cross_st1_title = "Крест за 8 ходов";
  static const cross_st1_descr = """
        <p>Как я уже писал в постскриптуме к кресту своей методики для начинающих, крест из любого
        положения собирается за <a href="rg2://ytplay?time=0:25&link=O83G5WyDRcs">8 ходов</a>
        или меньше. И лучше собирать его сразу снизу, в этом случае не понадобится тратить время на
        переворот кубика, когда крест будет собран. Забудьте про боковой хват от Максима - хотите
        собирать быстро, собирайте крест снизу.</p>

        <p>Поскольку на этапе сборки креста много свободы вращений и много вариантов взаимного
        расположения элементов креста, то тут нет четких алгоритмов, только советы по сборке.</p>

        <p><a href="rg2://ytplay?time=1:26&link=O83G5WyDRcs"><b>Совет №1</b></a> -
        при сборке креста <b>не обращайте внимание на центры</b>, т.е. не нужно совмещать
        центры с ребрами креста до и после установки каждого элемента, как это делается в методике
        для начинающих. Соберите крест, и только после сборки всего креста совместите центры с ребрами.</p>

        <p><a href="rg2://ytplay?time=2:21&link=O83G5WyDRcs"><b>Совет №2</b></a> -
        <b>используйте трехходовки</b> для перемещения ребра с третьего этажа
        в подвал или ребра на втором этаже, но стоящего на противоположной стороне. Не бойтесь сдвинуть
        уже установленное ребро первым ходом, третьим вы его вернете на место.</p>

        <p><a href="rg2://ytplay?time=3:27&link=O83G5WyDRcs"><b>Совет №3</b></a> -
        <b>используйте один элемент, чтобы установить другой.</b>
        Суть этого совета, в том, что для установки одного элемента, можно использовать ходы установки
        другого. Смотрите видео с примерами и учитесь продумывать последовательность установки элементов.
        Вот еще пример от <a href="rg2://ytplay?time=1:59&link=IWXpkfwimo0">Дилана Ванга.</a></p>

        <p><a href="rg2://ytplay?time=4:14&link=O83G5WyDRcs"><b>Совет №4</b></a> -
        <b>не подгоняйте элемент к нужному месту креста,
        подгоните крест к элементу</b>. Особенно, когда нужный элемент находится на втором этаже,
        гораздо проще повернуть крест и установить элемент в один ход, а затем при необходимости
        вернуть крест на место.</p>

        <p><a href="rg2://ytplay?time=4:43&link=O83G5WyDRcs"><b>Совет №5</b></a> -
        <b>продумывайте все ходы установки креста,
        во время предварительного осмотра кубика</b>. Т.е. к тому моменту, как вы начали крутить
        кубик, у вас уже должен быть продуман план установки ВСЕХ элементов креста. Вы должны четко
        понимать, где какой элемент креста находится после каждого вашего хода. Естественно, для
        этого вам придется много тренироваться. Данный навык позволит вам во время сборки креста
        уже начать просчитывать пары для F2L, тем самым развивать ваш <b>Look ahead</b> (взгляд в
        будущее).</p>

        <p><a href="rg2://ytplay?time=6:37&link=O83G5WyDRcs"><b>Совет №6</b></a> -
        <b>Кандидат на установку в последнюю очередь</b>. Если белое ребро уже дружит со своим цветным
        центром, то это потенциальный кандидат на установку в последнюю очередь. В этом случае, вам
        не придется доворачивать нижнюю грань после установки всех ребер, совмещая крест с боковыми
        ребрами.</p>

        <p><a href="rg2://ytplay?time=8:00&link=O83G5WyDRcs"><b>Совет №7</b></a> -
        <b>Регулярные тренировки</b>. Выделите на тренировки несколько минут в день. Занимайтесь
        пусть понемногу, но каждый день.</p>

        <p><a href="rg2://ytplay?time=8:13&link=O83G5WyDRcs"><b>Совет №8</b></a> -
        <b>Смотрите примеры решений</b>. Не ограничивайтесь просмотром
        данных видео, посмотрите примеры сборок от других спидкуберов. Учитесь узнавать ситуации
        и решать их быстро.</p>
    """;
  static const cross_st1_url = "O83G5WyDRcs";

  static const cross_st2_title = "Примеры сборок креста";
  static const cross_st2_descr = """
        <p>Вот для примера <a href="rg2://ytplay?time=8:25&link=O83G5WyDRcs">4 ситуации:</a></p>

        <p><a href="rg2://scrmbl?scram=L2_D_B2_F\'_L\'_B\'_R2_F2_B_R2_D_B">1. Скрамбл</a>
        (белой вверх, зеленой к себе): <br/><b>L2 D B2 F\' L\' B\' R2 F2 B R2 D B</b>,
        кубик должен выглядеть так:</p>
        <p style="text-align:center"><img src="cross_2_1.xml"></p>

        <p><a href="rg2://ytplay?time=8:31&link=O83G5WyDRcs">Решение</a> (желтой вверх, зеленой к себе):<br/>
        1. Подводим место для установки синего ребра. (D\')<br/>
        2. Ставим синее ребро, тем самым поставив оранжевое к его месту для установки.(R2)<br/>
        3. Ставим оранжевое ребро, тем самым подняв зеленое куда надо.(F)<br/>
        4. Ставим зеленое.(L)<br/>
        5. Совмещаем крест с центрами.(D)<br/><br/>

        Алгоритм: <b>D\' R2 F L D</b></p>

        <a href="rg2://scrmbl?scram=U2_R_L_U_L\'_B_D_R\'_F2_B_U\'_R_D_B_D">2. Скрамбл</a>
        (белой вверх, зеленой к себе): <br/><b>U2 R L U L\' B D R\' F2 B U\' R D B D</b>,
        кубик должен выглядеть так:</p>
        <p style="text-align:center"><img src="cross_2_2.xml"></p>

        <p><a href="rg2://ytplay?time=9:59&link=O83G5WyDRcs">Решение</a> (желтой вверх, зеленой к себе):<br/>
        1. Ставим оранжевое ребро на место. (R B\')<br/>
        2. Ставим зеленое. (R2)<br/>
        3. Синее переводим на второй этаж в удобное место. (L\')<br/>
        4. Подгоняем место синего (совмещая крест с центрами). (D\')<br/>
        5. Ставим синее ребро. (B)<br/><br/>

        Алгоритм: <b>R B\' R2 L\' D\' B</b></p>

        <p><a href="rg2://scrmbl?scram=R2_D_R_D_U_L_R2_D2_B\'_F\'_R\'_D\'">3. Скрамбл</a>
        (белой вверх, зеленой к себе) <br/><b>R2 D R D U L R2 D2 B\' F\' R\' D\'</b>,
        кубик должен выглядеть так:</p>
        <p style="text-align:center"><img src="cross_2_3.xml"></p>

        <p><a href="rg2://ytplay?time=11:19&link=O83G5WyDRcs">Решение</a> (желтой вверх, зеленой к себе):<br/>
        1. Подготовим зеленое ребро для установки, но пока ставить не будем.(R\')<br/>
        2. Поставим на место красное ребро.(B\' L\')<br/>
        3. Вот теперь, уже поставим на место зеленое ребро, и выгоним оранжевое наверх.(F)<br/>
        4. Ставим синее.(B\')<br/>
        5. Подгоняем оранжевое к своей грани и ставим его на место.(U\' R2)<br/><br/>

        Алгоритм: <b>R\' B\' L\' F B\' U\' R2</b></p>

        <p><a href="rg2://scrmbl?scram=R_D\'_B2_R\'_L2_F_B\'_L\'_U_L_U_F2_L\'_R\'">4. Скрамбл</a>
        (белой вверх, зеленой к себе): <br/><b>R D\' B2 R\' L2 F B\' L\' U L U F2 L\' R\'</b>,
        кубик должен выглядеть так:</p>
        <p style="text-align:center"><img src="cross_2_4.xml"></p>

        <p><a href="rg2://ytplay?time=13:10&link=O83G5WyDRcs">Решение</a> (желтой вверх, зеленой к себе):<br/>
        1. Ставим красное ребро. (L\' B)<br/>
        2. Ставим синее и зеленое в удобные позиции и освобождаем нижнюю для вращения. (R)<br/>
        3. Ставим красное на свое место. (D)<br/>
        4. Ставим зеленое и синее на места. (F B\')<br/>
        5. Ставим оранжевое. (R2)<br/><br/>

        Алгоритм: <b>L\' B R D F B\' R2</b></p>
    """;
  static const cross_st2_url = "O83G5WyDRcs";

  static const cross_st3_title = "Примеры сборок креста";
  static const cross_st3_descr = """
        <p>Вот еще для примера <a href="rg2://ytplay?time=5:23&link=IWXpkfwimo0">4 ситуации от JPerm</a>:</p>
        1. Скрамбл из стандартного положения белый верх, зеленый фронт:<br/>
         <b>B2 D2 U\' R2 F2 D2 R2 U\' R2 B2 D2 B U\' L D2 B L\' R\' D\' B D\'</b> кубик должен
         выглядеть так:<br/>
         <p style="text-align:center"><img src="cross_3_1.xml"></p>
         и вот как в данном случае можно
         <a href="rg2://ytplay?time=5:35&link=IWXpkfwimo0">решить</a> крест:<br/>
         1. первым ходом поставить белозеленое ребро на место<br/>
         2. теперь повернуть крест под установку белооранжевого ребра (совет №4)<br/>
         3. используем совет №3 и поворачиваем левую грань, но только на 90 градусов<br/>
         4. ставим белосинее ребро в 3 хода, попутно установив белооранжевое<br/>
         7. совмещаем крест со своими центрами<br/>
         т.е. если взять кубик желтой стороной вверх, зеленой к себе, то алгоритм выглядит так:<br/>
         <b>R\' D L U L F\' D2</b> - крест собран в 7 ходов. И вот как это выглядит
         <a href="rg2://ytplay?time=6:13&link=IWXpkfwimo0">быстро</a><br/><br/>

        2. Еще один скрамбл:
        <b>B2 R2 B U2 F\' U2 B2 R2 F\' L2 U2 L U\' R\' B U\' L D2 F D\' F</b> кубик должен
        выглядеть так:<br/>
        <p style="text-align:center"><img src="cross_3_2.xml"></p>
        и вот
        <a href="rg2://ytplay?time=6:20&link=IWXpkfwimo0">вариант</a> решения:<br/>
        Поскольку белосинее ребро совмещено со своим центром, то им лучше закончить крест, т.к. в
        этом случае не придется совмещать крест с центрами (они совместятся автоматически).
        Поэтому:<br/>
        Наченем с установки белооранжевого и белозеленого ребра в 3 хода, и т.к. у нас белокрасное
         ребро встало не на свое место еще в 3 хода поставим его на место, подгоняем пустое место
         креста к синей грани и ставим белосинее ребро на свое место. Все.
         Т.е. если взять красной стороной к себе, то получится:<br/>
         <b>(R F L) (R D\' R\') D\' L2</b> - крест собран за 8 ходов. И вот как это выглядит
         <a href="rg2://ytplay?time=6:55&link=IWXpkfwimo0">быстро</a><br/><br/>

         3. Третий скрамбл:
         <b>D\' B U D2 R F U2 L\' B R2 U2 R2 B2 U D R2 F2 D2 B2 D2</b> кубик должен выглядеть так:<br/>
         <p style="text-align:center"><img src="cross_3_3.xml"></p>
         и вот как в данном случае можно
         <a href="rg2://ytplay?time=7:02&link=IWXpkfwimo0">решить</a> крест:<br/>
         В данном случае у нас оранжевое ребро уже совмещено со своим центром, поэтому его
         лучше поставить последним. А синее стоит на своем месте (напротив зеленого), но перевернуто,
         поэтому с него и начнем, поднимем его на второй этаж. Теперь повернем крест так, чтобы
         в один ход поставить крсное ребро, а затем синее, поставив тем самым оранжевое на 2 этаж.
         Подгоняем крест и ставим на место оранжевое ребро.
         Т.е. если взять оранжевой стороной к себе, то получится:<br/>
         <b>L\' D R\' F\' D F\'</b> - крест собран всего за 6 ходов. И вот как это выглядит
         <a href="rg2://ytplay?time=7:38&link=IWXpkfwimo0">быстро</a><br/><br/>

         4. Четвертый скрамбл:
         <b>B L U\' R D\' L U2 F\' U\' R2 B2 L2 D B2 U D2 R2 F2</b> кубик должен выглядеть так:<br/>
         <p style="text-align:center"><img src="cross_3_4.xml"></p>

         и вот как в данном случае можно
         <a href="rg2://ytplay?time=7:45&link=IWXpkfwimo0">решить</a> крест:<br/>
         Видим, что оранжевое ребро уже на месте, красное удачно стоит напротив оранжевого и
         ставится в один ход. Синее можно поставить в 3 хода, а вот зеленое стоит напротив своей грани.
         Поэтому: первым ходом конечно поставим на место красное ребро, теперь в три хода ставим
         синее, подводим двойным кручением крест под зеленое ребро и ставим его в один ход.
         Т.е. если взять красной стороной к себе, то получится:<br/>
         <b>R L F\' L\' D2 F\' D</b> - крест собран 7 ходов. И вот как это выглядит
         <a href="rg2://ytplay?time=8:25&link=IWXpkfwimo0">быстро</a><br/><br/>

        <p>P.S. Можете воспользоваться генератором скрамблов, чтобы разбирать кубик (крест) не
        случайным образом, а по скрамблу с возможностью повторить ситуацию. И кстати, для тренировки
        креста по скрамблам, не обязательно собирать весь кубик целиком. Достаточно собранного
        креста. </p>

        <p>Еще несколько сложных 8 ходовых вариантов решения креста можно найти в
        <a href="rg2://ytplay?time=0:00&link=F4ju-U9OhdA">данном видео</a>
        от JPerm. Также можете использовать приложение для Андроид TwistyTimer,
        которое подсказывает несколько вариантов для решения креста.
        </p>
    """;
  static const cross_st3_url = "IWXpkfwimo0";
}