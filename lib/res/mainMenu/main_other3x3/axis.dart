
import 'package:rg2_flutter_getx/models/phases.dart';

class Axis implements Phase {
  @override
  int count = axis_title.length;

  @override
  String phase = "AXIS";

  @override
  List<String> titles() => axis_title;

  @override
  List<String> icons() => axis_icon;

  @override
  List<String> descriptions() => axis_descr;

  @override
  List<String> urls() => axis_url;

  @override
  List<String> comments() => List.filled(count, "");

///==================================================


    static const axis_title = [
        axis_st1_title,
        axis_st2_title,
        axis_st3_title,
        axis_st4_title,
        axis_st5_title,
        axis_st6_title,
        axis_st7_title,
        axis_st8_title,
    ];

    static const axis_icon = [
        "axis_1_4",
        "axis_2_1",
        "axis_3",
        "axis_4",
        "axis_5",
        "axis_6",
        "axis_7",
        "axis_8",
    ];
    
    static const axis_descr = [
        axis_st1_descr,
        axis_st2_descr,
        axis_st3_descr,
        axis_st4_descr,
        axis_st5_descr,
        axis_st6_descr,
        axis_st7_descr,
        axis_st8_descr,
    ];


    static const axis_url = [
        axis_st1_url,
        axis_st2_url,
        axis_st3_url,
        axis_st4_url,
        axis_st5_url,
        axis_st6_url,
        axis_st7_url,
        axis_st8_url,
    ];

    static const axis_st1_title = "1. Первый крест";
    static const axis_st1_descr = """
        <p><a href="rg2://ytplay?time=0:09&link=ENLnPS2eqPg">Axis cube,</a> очень необычная головоломка,
        в русскоязычном варианте его иногда называют ненормальный куб. Почему куб думаю понятно,
        ведь в собранном виде головоломка представляет из себя куб. А почему он ненормальный
        довольно легко понять, всего лишь перемешав его. Буквально после нескольких движений
        красивый ровный куб превращается во что-то невообразимое.</p>

        <p><i>Данная обучалка рассчитана на тех, кто уже умеет собирать кубик Рубика 3х3, желательно
        по моему методу или методу Максима Чечнева, т.к. я буду использовать мнемонические обозначения
        вращений, применяемые в этих методиках. Кому-то они могут показаться дурацкими, но поверьте,
        что они очень помогают не сбиться при выполнении длинных алгоритмов, особенно в таких
        головоломках как эта. Но если вы умеете собирать каким-то другим методом, то
        надеюсь тоже сможете во всем разобраться. А вот если вы еще не умеете собирать трешку, то сначала
        обязательно научитесь это делать.</i></p>

        <p>Чтобы понять, как собирать данную головоломку, давайте посмотрим на то,
        <a href="rg2://ytplay?time=1:21&link=ENLnPS2eqPg">из чего она состоит.</a>
        А состоит она из тех же элементов, что и обычный кубик Рубика 3х3. Вот только с идентификацией
        всех этих элементов тут все немного, а поначалу даже много, сложнее, чем в простом кубике.</p>

        <p>Как и у обычного кубика здесь есть <a href="rg2://ytplay?time=1:44&link=ENLnPS2eqPg">шесть центров,</a>
        но центры тут не одноцветные и не плоские.
        А двухцветные, при том еще и состоящие из двух разноцветных, маленьких, и что немало важно,
        неравнобедренных треугольников.</p>
        <p style="text-align:center"><img src="axis_1_1.xml"></p>

        <p>Как и в кубике есть <a href="rg2://ytplay?time=2:28&link=ENLnPS2eqPg">12 ребер,</a>
        но с их идентификацией все еще сложнее, чем с центрами.
        Дело в том, что ребра в этой головоломке бывают двух типов. Одноцветные в форме трапеции
        и двухцветные с двумя большими треугольниками. Причем к каждому центру в собранном кубике
        подходят по два одноцветных трапецевидных ребра и по два двухцветных.</p>
        <p style="text-align:center"><img src="axis_1_2.xml"></p>

        <p><a href="rg2://ytplay?time=3:40&link=ENLnPS2eqPg">С углами</a>
        все тоже не так однозначно, как в кубике 3х3. Здесь тоже восемь углов, но шесть из
        них одноцветные, большие, равнобедренные треугольники, а два угла - трехцветные, похожие на углы скьюба.</p>
        <p style="text-align:center"><img src="axis_1_3.xml"></p>

        <p>Заметьте, что два трехцветных угла полностью противоположны друг другу, у них нет одинаковых цветов.</p>

        <p>Вот вроде и все, что касается механики axis cube и ее сравнения с механикой обычного кубика 3х3.</p>

        <p><a href="rg2://ytplay?time=6:40&link=ENLnPS2eqPg">Собирается данная головоломка</a>
        аналогично кубику 3х3, но сразу скажу, что методика сборки
        Максима Чечнева тут не подойдет, а почему не подойдет, я расскажу чуть позже. Как и в
        кубике 3х3 начнем с выбора центра, помним, что центры это элементы с двумя маленькими
        неравнобедренными треугольниками. Например, <a href="rg2://ytplay?time=6:54&link=ENLnPS2eqPg">начнем с бело-зеленого центра.</a>
        Дальше, как и в трешке, нам необходимо собрать крест. А поскольку центр у нас двухцветный и стороны
        треугольников креста отличаются по размеру, то мы можем сразу собрать <a href="rg2://ytplay?time=7:16&link=ENLnPS2eqPg">правильный крест.</a>
        Т.е. мы не будем делать дядей и тетей, а ориентируясь только на выбранный изначально центр, будем
        ставить к нему ребра сразу на свои места. К короткой стороне треугольника нужно поставить
        соответствующее по цвету трапецевидное ребро, а к длинной двухцветное. Причем, как не
        сложно догадаться, поставить их надо так, чтобы они совмещались с этим центром
        <a href="rg2://ytplay?time=8:53&link=ENLnPS2eqPg">(дружили между собой).</a>
        Примерно вот так.</p>
        <p style="text-align:center"><img src="axis_1_4.xml"></p>

        <p>Первым делом ищем нужные нам элементы <a href="rg2://ytplay?time=11:13&link=ENLnPS2eqPg">на втором этаже,</a>
        но вот вопрос как в этой головоломке
        найти второй этаж и что мы там должны найти? Возьмите головоломку выбранным центром вверх и
        постарайтесь где-то в середине головоломки найти еще один центр. Теперь поверните ее так,
        чтобы этот второй найденный центр смотрел прямо на вас. Например так.</p>
        <p style="text-align:center"><img src="axis_1_5.xml"></p>

        <p>Вы должны четко увидеть крест, состоящий из центра и четырех ребер. Соответственно то, что
        находится над горизонтально стоящими ребрами будет третий этаж, горизонтальные ребра это
        второй этаж, а то, что ниже, это первый этаж. При всех вращениях данной головоломки старайтесь
        ориентироваться именно по ребрам и всегда докручивать куб так, чтобы видеть крест.</p>

        <p>Второй этаж нашли, теперь начинаем искать на нем одноцветные трапеции белого или зеленого
        цвета, т.к. начали мы с бело-зеленого угла. Если находим, то ходом R или F\' ставим сразу
        на свое место на верхней грани, предварительно повернув в нужное положение верхний центр.
        Если эти трапеции находятся не на втором этаже, то сначала мы их ставим на второй этаж,
        а потом уже на крышу на свое место. Если что-то из текста непонятно, посмотрите как это
        делать <a href="rg2://ytplay?time=12:06&link=ENLnPS2eqPg">в видео.</a></p>

        <p>Два элемента креста поставили. Еще два элемента креста у нас двухцветные,
        <a href="rg2://ytplay?time=10:12&link=ENLnPS2eqPg">но как же определить,</a>
        какие элементы нам надо искать? На самом деле все просто, если мы начали с бело-зеленого центра,
        то, нам нужны бело-какое-то и зелено-какое-то ребро. В Axis cube по два двухцветных ребра каждого
        цвета, т.е. два двухцветных ребра с белым, два с зеленым и т.д. Так вот нам нужно ребро, НЕ
        содержащее цвет противоположный второму цвету центра. Т.е. НЕ бело-синее и НЕ зелено-желтое.
        Находим бело-оранжевое и зелено-оранжевое ребра и ставим их на свои места к выбранному центру.
        </p>

        Будем считать, что первый этап мы выполнили.
    """;
    static const axis_st1_url = "ENLnPS2eqPg";

    static const axis_st2_title = "2. Разворот смежных центров";
    static const axis_st2_descr = """
        <p>На втором этапе  <a href="rg2://ytplay?time=12:40&link=ENLnPS2eqPg">необходимо развернуть центры</a>
        второго слоя так, чтобы они совпадали с ребрами,
        установленными на предыдущем этапе, т.е. дружили с ними.</p>
        <p style="text-align:center"><img src="axis_2_1.xml"></p>

        <p>Пожалуй, это самый простой этап в сборке Axis cube, хотя аналогичного ему  этапа в обычном кубике
        3х3 нет, т.к. там центры не требуется заставлять дружить с ребрами. Для начала надо
        <a href="rg2://ytplay?time=13:06&link=ENLnPS2eqPg">поставить центры к своим ребрам,</a>
        т.е. так, чтобы у каждого центра был цвет ребра,
        <a href="rg2://ytplay?time=13:46&link=ENLnPS2eqPg">которое к нему подходит.</a>
        Если мы начали с бело-зеленого центра, то к БЕЛОМУ трапецевидному ребру надо подогнать
        БЕЛО-красный центр, к ЗЕЛЕНОМУ ребру - ЗЕЛЕНО-красный центр, к бело-ОРАНЖЕВОМУ ребру
        ОРАНЖЕВО-синий центр и к зелено-ОРАНЖЕВОМУ ребру ОРАНЖЕВО-желтый центр.</p>

        <p>Теперь эти центры надо развернуть так, чтобы они совпадали с ребрами, т.е. надо их подружить.
        <a href="rg2://ytplay?time=14:24&link=ENLnPS2eqPg">Сделать это очень просто.</a>
        Держим кубик выбранным изначально центром вверх, а центром, который
        нужно подружить с ребром, справа. Опускаем ребро сверху вниз (крутим правую грань на 180 градусов, т.е. R2),
        ставим наше ребро, которое оказалось внизу на переднюю грань (делаем D\') и теперь поворачиваем
        правую грань так, чтобы при возвращении ребра на правую грань оно дружило с центром. Тут
        все делается методом проб и ошибок, ничего страшного, если не получится сделать это сразу.
        Повернули правую грань, попробовали подогнать ребро, если не подошло, то снова увели ребро
        на переднюю грань и еще повернули правую, снова попробовали. Как совпало, крутим правую грань
        на 180 градусов (R2) - ребро должно подружиться и с верхним центром и с правым.
        Подгоняем направо другой недружный центр и повторяем операцию.</p>

        <p><b>Алгоритм: R2 D\' {R} D R2</b></p>
    """;
    static const axis_st2_url = "ENLnPS2eqPg";

    static const axis_st3_title = "3. Первый слой";
    static const axis_st3_descr = """
        <p>В обычном кубике, после сборки креста, мы ставили на свои места углы нижнего слоя, вот и здесь
        теперь <a href="rg2://ytplay?time=17:40&link=ENLnPS2eqPg">займемся тем же самым.</a>
        Но помним, что углы в Axis cube немного странные, да еще и бывают
        двух типов. И на данном этапе нам надо будет поставить на свое место три угла в форме одноцветных
        больших треугольников и один трехцветный угол.</p>

        <p>Делаем все аналогично четвертому этапу методики для начинающих обычного кубика 3х3.
        Переворачиваем куб собранным крестом вниз, находим
        интересующий нас уголок <a href="rg2://ytplay?time=19:09&link=ENLnPS2eqPg">на третьем этаже,</a>
        подгоняем его к своей квартире и просто начинаем делать
        пиф-пафы до тех пор, пока уголок не встанет на свое место правильно, т.к. в данной
        головоломке определить какой у нас угол наглый, с завышенной самооценкой или скромный, очень
        не просто, но если загонять угол на место пиф-пафами особо и не нужно. Хотя, если уголок
        выключением света встает <a href="rg2://ytplay?time=21:53&link=ENLnPS2eqPg">как бы на место,</a>
        то можно воспользоваться английскийм пиф-пафом.</p>

        <p style="text-align:center"><img src="axis_3_1.xml">=><img src="axis_3_2.xml"></p>

        Если уголка на третьем этаже нет, значит он на первом, находим его и выгоняем на третий, тем же
        пиф-пафом.

        <p><b>Алгоритм: R U R\' U\'</b></p>
    """;
    static const axis_st3_url = "ENLnPS2eqPg";

    static const axis_st4_title = "4. Второй слой";
    static const axis_st4_descr = """
        <p><a href="rg2://ytplay?time=22:28&link=ENLnPS2eqPg">На данном этапе</a> начинаются
        отличия от методики Максима, а все дело в том, что поставить
        ребро с третьего на второй этаж при помощи \"ромашек\" в данной головоломке не получится. Точнее
        ребро то встанет, но при этом еще и провернется правый центр, т.е. мы испортим все то, что
        делали на втором этапе. Поэтому воспользуемся старым добрым алгоритмом классической методики
        для новичков.</p>

        <p>Нам необходимо поставить на свои места
        <a href="rg2://ytplay?time=28:26&link=ENLnPS2eqPg">два одноцветных и два двухцветных ребра.</a>
        Смотрим на цвета центра, вокруг которого еще ничего не собрано,
        в нашем случае это будет желто-синий центр. Значит нас интересуют одноцветные ребра, не содержащие
        этих цветов (красное и оранжевое), а двухцветные ребра - у которых один цвет совпадает, а другой
        противоположен цветам этого центра, т.е. желто-зеленое и сине-белое ребро. Ну или для двухцветных
        ребер, можно ориентироваться по уже стоящим центрам,
        <a href="rg2://ytplay?time=28:40&link=ENLnPS2eqPg">как на видео.</a></p>

        <p>Как уже было сказано выше, воспользуемся алгоритмом из
        <a href="https://soberi-kubik.ru/data/Nauka_i_jizn_1983-05.pdf">классической методики</a> для новичков,
        только <a href="rg2://ytplay?time=25:26&link=ENLnPS2eqPg">адаптируем его</a>
        для положения, когда уже собранный слой находится снизу, а не сверху.
        Первое, что нам нужно сделать, это поставить ребро на третьем слое в нужное положение, т.е.
        собрать <a href="rg2://ytplay?time=25:47&link=ENLnPS2eqPg">стебель ромашки</a>
        (хоть дальше мы ее делать и не будем). Но в этой головоломке, в
        отличие от простого кубика или того же Mirror Blocks\'a, не так просто понять, получился
        стебель ромашки или нет. Просто поставьте ребро на третьем этаже
        <a href="rg2://ytplay?time=26:26&link=ENLnPS2eqPg">к центру справа</a>
        от его места на втором этаже,</p>
        <p style="text-align:center"><img src="axis_4_1.xml"></p>

        <p>немного поверните головоломку так, чтобы ребро оказалось на правой грани и в один ход
        <a href="rg2://ytplay?time=26:36&link=ENLnPS2eqPg">попробуйте поставить ребро</a>
        на свое место (R\'), если оно
        встает правильно, значит стебель получился,
        <a href="rg2://ytplay?time=30:36&link=ENLnPS2eqPg">если неправильно,</a>
        значит ребро нужно поставить слева от его места.</p>

        <p>С начальным положением ребра определились. Теперь берем головоломку так, чтобы это ребро
        смотрело прямо на нас.</p>
        <p style="text-align:center"><img src="axis_4_2.xml"></p>

        <p>И выполняем очень интуитивно понятный, хотя и не очень удобный для исполнения, особенно
        в этой головоломке,
        <a href="rg2://ytplay?time=27:25&link=ENLnPS2eqPg">алгоритм.</a>
        Отводим ребро от своего места (крутим крышу), поднимаем место наверх,
        возвращаем крышу назад, опускаем поднятую грань, крутим крышу туда же, куда и последний
        раз, поднимаем место, но уже через переднюю грань, возвращаем крышу, возвращаем переднюю
        грань.</p>

        <p>Для любителей разных историй, можно запомнить
        <a href="rg2://ytplay?time=31:15&link=ENLnPS2eqPg">например так:</a></p>

        <p>Представьте, что вы спите, но у вас над ухом жужжит комар и
        у вас от этого едет крыша, причем именно уезжает, т.е. ребро отводим от его места подальше.
        Вы просыпаетесь и включаете свет (с той стороны, где находится место ребра), убиваете комара
        и крыша едет обратно (встает на место), выключаете свет и снова ложитесь спать (крыша продолжает
        ехать в ту сторону, куда ехала последний раз), и вам снится, что вы почему-то возвращаетесь
        из Лондона, от этого вы просыпаетесь (вы же туда не уезжали) и крыша встает на место.
        Ну и доворот передней грани, чтобы поставить все на место.</p>

        <p style="text-align:center">Алгоритм для <a href="rg2://ytplay?time=31:15&link=ENLnPS2eqPg">места справа:</a><br/>
        <img src="axis_4_3.xml"><br/>
        <b>(U R U\' R\') (U\' F\' U F)</b></p>

        <p style="text-align:center">Алгоритм для <a href="rg2://ytplay?time=27:25&link=ENLnPS2eqPg">места слева:</a><br/>
        <img src="axis_4_4.xml"><br/>
        <b>(U\' L\' U L) (U F U\' F\')</b></p>

        <p>В ситуации, когда ребро уже на <a href="rg2://ytplay?time=33:37&link=ENLnPS2eqPg">своем месте, но перевернуто,</a>
        делаем все так же, как и в простом кубике.
        Просто загоняем туда любое другое ребро, а потом ставим нужное ребро уже правильно.</p>
    """;
    static const axis_st4_url = "ENLnPS2eqPg";

    static const axis_st5_title = "5. Ориентация элементов верхнего креста";
    static const axis_st5_descr = """
        <p>Теперь, как и в обычном кубике, нам надо собрать
        <a href="rg2://ytplay?time=34:12&link=ENLnPS2eqPg">крест на верхнем слое.</a>
        Но как вы уже понимаете,
        в Axis cube с этим все немного сложнее. <a href="rg2://ytplay?time=34:30&link=ENLnPS2eqPg">Чтобы понять,</a>
        какой из реберных элементов
        верхнего слоя ориентирован правильно, а какой нет, нужно подогнать один из элементов креста
        к своему месту и запомнить правильно он ориентирован или нет. Затем, подогнать к своему
        месту следующий элемент креста и запомнить его ориентацию. Выполнить
        то же самое для третьего и четвертого элемента креста. А чтобы легче было запоминать, можно,
        например, <a href="rg2://ytplay?time=34:50&link=ENLnPS2eqPg">поставить палец</a>
        на правильно ориентированный элемент и держать его там, пока проверяете
        остальные элементы.</p>

        <p>С ориентированием ребер определились.
        Как и на шестом этапе обычного кубика нам может достаться одна из
        <a href="rg2://ytplay?time=36:17&link=ENLnPS2eqPg">трех ситуаций:</a>
         \"Пуля\", \"Бумеранг\" или \"Палка\". И решаются они точно так же, как и в кубике 3х3: В Лондон, нужное
        количество пиф-пафов, из Лондона. Очень трудно передать в статичных картинках все
        ситуации, как это может выглядеть поэтому если что-то непонятно, посмотрите обзор ситуаций
        в видео.</p>

        <p>Алгоритм для Палки: <b>F (R U R\' U\') F\'</b></p>

        <p>Алгоритм для Бумеранга: <b>F (R U R\' U\') (R U R\' U\') F\'</b></p>

        <p>Алгоритм для Пули: <b>F (R U R\' U\') F\' U2 F (R U R\' U\') (R U R\' U\') F\'</b><br/>
        или более короткий, но чуть более сложный в исполнении алгоритм, т.к. надо крутить средний слой:<br/>
        <b>F (R U R\' U\') S (R U R\' U\') Fw\'</b></p>

        После выполнения данного этапа должно получиться что-то <a href="rg2://ytplay?time=37:54&link=ENLnPS2eqPg">типа этого:</a>
        <p style="text-align:center"><img src="axis_5.xml"></p>

    """;
    static const axis_st5_url = "ENLnPS2eqPg";

    static const axis_st6_title = "6. Делаем крест правильным";
    static const axis_st6_descr = """
        <p>Если в обычном кубике 3х3 <a href="rg2://ytplay?time=38:32&link=ENLnPS2eqPg">следующим этапом</a>
        после ориентации креста было правильнее/лучше/проще/быстрее
        заняться ориентацией углов, то в Axis cube займемся, как и в классической методике сборки
        кубика, расстановкой ребер. В Axis cube это означает, что нам надо подружить все ребра
        с верхним центром.</p>

        <p>Для этого воспользуемся алгоритмом перестановки ребер из
        <a href="rg2://ytplay?time=39:02&link=ENLnPS2eqPg">классической методики.</a>
        Для тех, кто знаком с Ускорениями для начинающих от Максима Чечнева, этот алгоритм известен под
        названием \"Рыбка\". В продвинутых методиках сборки кубика 3х3 он применяется для ориентации углов,
        но поскольку углы нас пока не интересуют, то применим его по старинке, для перестановки ребер.</p>

        <p>В обычном кубике при расстановке ребер мы ориентировались по центрам второго слоя, а
        тут будем ориентироваться по верхнему центру. Т.е. если там нам надо было повернуть крышу так,
        чтобы только одно ребро совпадало со своим центром и сделать \"Рыбку\", то тут так сделать не
        получится, т.к. крыша будет поворачиваться вместе с центром, относительно которого нам и надо
        выстраивать ребра. Поэтому смотрим на верхний центр и ищем ребра, которые с ним дружат. И тут
        возможны всего лишь <a href="rg2://ytplay?time=40:04&link=ENLnPS2eqPg">два варианта:</a></p>

        <p>1. <a href="rg2://ytplay?time=40:08&link=ENLnPS2eqPg">Ни одно ребро не дружит</a> с верхним центром.</p>
        <p style="text-align:center"><img src="axis_6_1.xml"></p>

        <p>В этом случае, сначала делаем Рыбку из любого положения, получаем ситуацию, когда одно ребро
        дружит с верхним центром.</p>

        <p>2. <a href="rg2://ytplay?time=40:39&link=ENLnPS2eqPg">Одно ребро дружит</a> с верхним центром.</p>
        <p style="text-align:center"><img src="axis_6_2.xml"></p>

        <p>Берем головоломку этим ребром к себе и делаем \"Рыбку\". Если после этого все ребра не
        подружились с верхним центром, то делаем \"Рыбку\"
        <a href="rg2://ytplay?time=41:53&link=ENLnPS2eqPg">еще раз.</a></p>

        <p>Алгоритм: <b>(R U R\' U) R U2 R\'</b></p>

        Все ребра должны подружиться с центром, что означает, что они стоят на своих местах, возможно
        потребуется лишь <a href="rg2://ytplay?time=42:21&link=ENLnPS2eqPg">доворот крыши.</a>
        Т.е. получим вот такую ситуацию:
        <p style="text-align:center"><img src="axis_6.xml"></p>

    """;
    static const axis_st6_url = "ENLnPS2eqPg";

    static const axis_st7_title = "7. Расстановка углов";
    static const axis_st7_descr = """
        <p>Т.к. в <a href="rg2://ytplay?time=42:40&link=ENLnPS2eqPg">Axis cube есть проблемы</a>
        с определением ориентации углов, т.е. определить как ориентирован
        угол, пока он стоит не на своем месте, довольно не просто. Зато очень легко понять, на своем
        месте угол или нет, т.к. три угла одноцветные, а четвертый отличается от них формой. Поэтому
        сначала будем расставлять все углы <a href="rg2://ytplay?time=43:21&link=ENLnPS2eqPg">на свои места.</a></p>

        <p>В принципе, можете воспользоваться любым PLL алгоритмом \"Треугольник\". Но поскольку большинство
        спидкуберов запоминают алгоритмы руками, а в данной головоломке выполнить фингертрикс от
        простой трешки довольно проблематично, то предлагаю воспользоваться алгоритмом 9-го этапа из
        методики для начинающих Максима Чечнева с легко запоминающейся присказкой.</p>

        <p>На данном этапе в большинстве случаев у вас будет получаться
        ситуация, когда только один из углов стоит на своем месте. Нужно повернуть кубик так, чтобы
        данный угол оказался <a href="rg2://ytplay?time=44:44&link=ENLnPS2eqPg">внизу, сзади, слева,</a>
        при этом крыша тоже осталась слева. Если же не на
        месте все четыре угла, то просто поворачиваем крышей налево, делаем алгоритм, один из углов
        обязательно встает на свое место и тогда уже берем головоломку так, как было сказано выше.
        </p>

        <p style="text-align:center"><img src="axis_7_1.xml"></p>

        <p>И теперь <a href="rg2://ytplay?time=45:38&link=ENLnPS2eqPg">вспоминаем историю:</a><br/>
        У нас случился сердечный приступ. Нам делают
        \"разряд\" <b>(КРУТИМ КРЫШУ 2 РАЗА)</b>, и <b>СВЕТ</b> у нас перед глазами <b>ВКЛЮЧАЕТСЯ</b>,
        но нам зачем-то снова делают \"разряд\" <b>(КРЫША 2 РАЗА)</b>, и <b>СВЕТ</b> перед глазами
        <b>ВЫКЛЮЧАЕТСЯ</b>, поэтому нас отправляют <b>на 2 ГОДА В ЛОНДОН</b> на лечение. В Лондоне
        нам сразу делают \"разряд\" <b>(КРЫША 2 РАЗА)</b>, и свет перед нами опять включается, но
        поскольку мы в Лондоне, то и <b>СВЕТ ВКЛЮЧАЕТСЯ СЛЕВА</b>, нам опять делают \"разряд\"
        <b>(КРЫША 2 РАЗА)</b>, и Лондонский <b>СВЕТ СЛЕВА ВЫКЛЮЧАЕТСЯ</b>. Возвращаемся из
        <b>ДОЛГОЙ поездки В ЛОНДОН</b> (переднюю грань крутим 2 раза).</p>

        <p>Алгоритм: <b>(U2 R U2 R\') F2 (U2 L\' U2 L) F2</b></p>

        <p>Если углы не встали на свои места с первого раза, значит встанут со второго, нужно просто
        <a href="rg2://ytplay?time=46:30&link=ENLnPS2eqPg">повторить данный алгоритм.</a></p>

    """;
    static const axis_st7_url = "ENLnPS2eqPg";

    static const axis_st8_title = "8. Разворот углов";
    static const axis_st8_descr = """
        <p>После того, как все углы встали на свои места, осталось их только <a href="rg2://ytplay?time=47:31&link=ENLnPS2eqPg">развернуть.</a>
        И чтобы не сбить со своих мест ребра и центры, разворот будем делать, как на 7-ом этапе методики
        для начинающих, т.е. пиф-пафами.</p>

        <p><a href="rg2://ytplay?time=47:52&link=ENLnPS2eqPg">Держим кубик,</a>
        как на предыдущем этапе и смотрим ему в \"глаз\". Если там уголок развернут не как надо,
        то делаем два пиф-пафа. Снова смотрим в \"глаз\", если он
        <a href="rg2://ytplay?time=49:10&link=ENLnPS2eqPg">не встал на место,</a> то делаем еще
        два пиф-пафа. Подгоняем движением левой грани в \"глаз\" следующий неверно ориентированный
        угол и снова делаем пиф-пафы. Повторяем, пока все уголки не будут
        <a href="rg2://ytplay?time=50:32&link=ENLnPS2eqPg">развернуты как надо.</a><p>

        Profit!
    """;
    static const axis_st8_url = "ENLnPS2eqPg";

}
