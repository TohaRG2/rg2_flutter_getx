
import 'package:rg2/models/phases.dart';

class SquareStar implements Phase {
  @override
  int count = sq_star_title.length;

  @override
  String phase = "SQ_STAR";

  @override
  List<String> titles() => sq_star_title;

  @override
  List<String> icons() => sq_star_icon;

  @override
  List<String> descriptions() => sq_star_descr;

  @override
  List<String> urls() => sq_star_url;

  @override
  List<String> comments() => List.filled(count, "");

///==================================================


    static const sq_star_title = [
        sq_star_st1_title,
        sq_star_st2_title,
        sq_star_st3_title,
        sq_star_st4_title,
        sq_star_st5_title,
    ];

    static const sq_star_icon = [
        "sq_star_1",
        "sq_star_2",
        "sq_star_3",
        "sq_star_4",
        "sq_star_5",
    ];
    
    static const sq_star_descr = [
        sq_star_st1_descr,
        sq_star_st2_descr,
        sq_star_st3_descr,
        sq_star_st4_descr,
        sq_star_st5_descr,
    ];


    static const sq_star_url = [
        sq_star_st1_url,
        sq_star_st2_url,
        sq_star_st3_url,
        sq_star_st4_url,
        sq_star_st5_url,
    ];
    
    static const sq_star_st1_title = "Обзор головоломки и язык вращений";
    static const sq_star_st1_descr = """
        <p><a href="rg2://ytplay?time=0:26&link=kWXQUGa-OMY">Super Square Star 2 Layer</a>
        - таково полное название данной головоломки. Она является,
        по сути, упрощенным вариантом обычного Square-1, у которого нет среднего слоя, и все элементы
        большие. Из-за этих особенностей имеет форму шестиконечной звезды.</p>

        <p>Встречается в двух основных <a href="rg2://ytplay?time=0:52&link=kWXQUGa-OMY">вариантах расцветки:</a></p>

        <p>1. <a href="rg2://ytplay?time=0:57&link=kWXQUGa-OMY">Одноцветные лучи</a></p>
        <p style="text-align:center"><img src="sq_star_1_1.xml"></p>

        <p>простой вариант, т.к. положение каждого элемента относительно других элементов не фиксировано,
        можно довольно легко создать пары одинаковых зелено/синих элементов (друг над другом), а
        потом просто развернуть эти пары как надо.</p>

        <p>2. <a href="rg2://ytplay?time=1:12&link=kWXQUGa-OMY">Двухцветные лучи</a></p>
        <p style="text-align:center"><img src="sq_star_1_2.xml"></p>

        <p>чуть более сложный вариант, т.к. положение каждого элемента в собранной головоломке
        уже четко определено.</p>

        <p><a href="rg2://ytplay?time=2:48&link=kWXQUGa-OMY">Поскольку</a> первый вариант
        головоломки можно собрать интуитивно (без формул), а так же используя
        формулы сборки второго варианта головоломки, будем рассматривать только второй вариант с
        двухцветными лучами.</p>

        <p>Теперь несколько слов о <a href="rg2://ytplay?time=4:16&link=kWXQUGa-OMY">языке вращений</a>
        этой головоломки. Т.к., по сути, это скваер, то и
        логичнее всего будет использовать язык вращений обычного square-1, т.е.
        слэш означает слайс, первая цифра вращение верхней грани, вторая цифра вращение
        нижней грани. Если цифра положительная - крутим по часовой стрелке, если отрицательная, то
        против часовой стрелки на указанное количество элементов. Только вращение на
        \"2\" в этой головоломке будет означать поворот на 2 больших элемента, а не на один, как в Square-1,
        т.к. маленьких элементов тут нет.</p>

        <p>Выглядеть это будет вот так:</p>

        <p>1. <a href="rg2://ytplay?time=4:55&link=kWXQUGa-OMY">Слайс (/)</a></p>
        <p style="text-align:center"><img src="sq_star_1_2.xml"> / <img src="sq_star_1_3.xml"></p>

        <p>2. <a href="rg2://ytplay?time=5:11&link=kWXQUGa-OMY">Верх по часовой на 1 (1,0)</a></p>
        <p style="text-align:center"><img src="sq_star_1_2.xml"> (1,0) <img src="sq_star_1_4.xml"></p>

        <p>3. <a href="rg2://ytplay?time=5:18&link=kWXQUGa-OMY">Низ по часовой на 1 (0,1)</a></p>
        <p style="text-align:center"><img src="sq_star_1_2.xml"> (0,1) <img src="sq_star_1_5.xml"></p>

        <p>4. Верх против часовой на 2, низ по часовой на 1 (-2,1)</p>
        <p style="text-align:center"><img src="sq_star_1_2.xml"> (-2,1) <img src="sq_star_1_6.xml"></p>

        <p>Пример записи <a href="rg2://ytplay?time=5:41&link=kWXQUGa-OMY">формулы:</a> (1,0)/(-1,0)/(2,0)/(-2,0)/</p>

    """;
    static const sq_star_st1_url = "kWXQUGa-OMY";

    static const sq_star_st2_title = "Этап 1. Первый слой";
    static const sq_star_st2_descr = """
        <p>Сборка одного слоя, с правильно стоящими в нем элементами, довольно интуитивный процесс и прежде,
        чем читать далее, попробуйте сначала собрать его самостоятельно.</p>

        <p>На мой взгляд собирать слой проще всего тройками, а начать
        <a href="rg2://ytplay?time=6:44&link=kWXQUGa-OMY">с какой-либо пары</a> (чаще всего
        она есть). Если у вас ее нет, то ее легко сделать абсолютно интуитивно. Заметьте, что цвет
        слоя не имеет абсолютно никакого значения, синяя это пара или зеленая.
        Например, у нас есть вот такая
        <a href="rg2://ytplay?time=7:06&link=kWXQUGa-OMY">зелено-оранжевая пара,</a></p>
        <p style="text-align:center"><img src="sq_star_2_1.xml"></p>
        ставим ее <a href="rg2://ytplay?time=7:47&link=kWXQUGa-OMY">как на картинке:</a>
        <p style="text-align:center"><img src="sq_star_2_2.xml"></p>

        <p>Значит справа от нее должен стоять зелено-желтый элемент. Находим его (в нашем случае
        это <a href="rg2://ytplay?time=8:19&link=kWXQUGa-OMY">зелено-желто-белый элемент)</a> и
        первым делом уводим этот элемент <a href="rg2://ytplay?time=8:28&link=kWXQUGa-OMY">на другой слой справа</a>
        (в видео он сразу оказался уже на другом слое справа).</p>
        <p style="text-align:center"><img src="sq_star_2_4.xml"></p>

        <p>Теперь вращением верхней грани переводим пару на правую сторону, слайс.
        Пара ушла вниз, а нужный нам элемент вылез наверх. Ставим его вот на это место
        <a href="rg2://ytplay?time=9:00&link=kWXQUGa-OMY">(спереди справа).</a></p>
        <p style="text-align:center"><img src="sq_star_2_3.xml"></p>

        <p>Слайс. Теперь сверху пара, которую переводим
        <a href="rg2://ytplay?time=9:15&link=kWXQUGa-OMY">на левую сторону спереди.</a></p>
        <p style="text-align:center"><img src="sq_star_2_2.xml"></p>

        <p>Слайс.</p>
        <p style="text-align:center"><img src="sq_star_2_5.xml"></p>

        <p>Получаем блок из трех элементов, который целиком переводим
        <a href="rg2://ytplay?time=9:41&link=kWXQUGa-OMY">на правую сторону.</a></p>
        <p style="text-align:center"><img src="sq_star_2_6.xml"></p>

        <p>Слайс. Запоминаем цвет передней правой нижней наклейки (в данном случае
        <a href="rg2://ytplay?time=10:19&link=kWXQUGa-OMY">это будет белый),</a></p>
        <p style="text-align:center"><img src="sq_star_2_7.xml"></p>

        <p>с такого элемента надо начать сборку <a href="rg2://ytplay?time=10:35&link=kWXQUGa-OMY">следующей тройки.</a>
        Теперь уводим нашу тройку налево (на нижнем слое), чтобы она пока не мешала делать слайс
        и крутить верхнюю грань.</p>

        <p>Теперь будем собирать <a href="rg2://ytplay?time=10:35&link=kWXQUGa-OMY">вторую тройку.</a>
        Начнем с элемента, цвет которого мы недавно запоминали,
        т.е. с зелено-белого, ставим его спереди слева и теперь ищем элемент, который должен стоять
        справа от него. Это будет <a href="rg2://ytplay?time=10:55&link=kWXQUGa-OMY">зелено-красный.</a>
        <a href="rg2://ytplay?time=11:09&link=kWXQUGa-OMY">И повторяем то,</a> что мы делали с
        парой и элементом. Разводим их на <a href="rg2://ytplay?time=11:14&link=kWXQUGa-OMY">разные слои,</a>
        выставляем куда надо второй элемент, поднимем первый, ставим спереди слева, поднимаем второй.
        Получаем пару. Как к этой паре поставить третий элемент, надеюсь, уже понятно, абсолютно
        аналогично сборке первого тройного блока.</p>

        <p>После сборки <a href="rg2://ytplay?time=12:58&link=kWXQUGa-OMY">второго тройного блока,</a>
        переводим его направо и делаем слайс. Нижний слой должен собраться.</p>

        <p><i>Если какой-то момент из текста вам непонятен, вы всегда можете посмотреть его в видео, просто
        щелкнув по соответствующей ссылке в тексте.</i></p>
    """;
    static const sq_star_st2_url = "kWXQUGa-OMY";

    static const sq_star_st3_title = "Этап 2. Расстановка элементов верхнего слоя";
    static const sq_star_st3_descr = """
        Осталось только правильно расставить элементы
        <a href="rg2://ytplay?time=13:28&link=kWXQUGa-OMY">на верхнем слое.</a> По возможности,
        находим <a href="rg2://ytplay?time=13:50&link=kWXQUGa-OMY">какой-нибудь блок</a> на верхнем
        слое и совмещаем эти элементы с соответствующими элементами нижнего слоя.</p>
        <p style="text-align:center"><img src="sq_star_3_8.xml"></p>

        <p>И тут нам понадобится один очень простой алгоритм, который можно назвать
        \"Звездочным пиф-пафом\". А чтобы его было легче запомнить, постараюсь сначала его объяснить.</p>

        <p><a href="rg2://ytplay?time=15:02&link=kWXQUGa-OMY">Допустим,</a> что у нас есть ситуация,
        когда нам нужно собрать тройной блок. При этом двойной
        блок у нас уже есть, а третий элемент блока, который должен стоять справа от него, находится
        слева. Т.е. по сути нам нужно сделать вот такое перемещение:</p>
        <p style="text-align:center"><img src="sq_star_3_1.xml"> = <img src="sq_star_3_2.xml"></p>

        <p>Как уже было сказано в предыдущей части, нам нужно сделать следующее: развести пару и
        элемент на разные слои, поставить элемент спереди справа, поднять пару, поставить ее
        спереди слева, поднять одиночный элемент, поставить тройной блок на правую сторону.
        Из данного положения алгоритм для выполнения этих действий будет выглядеть
        <a href="rg2://ytplay?time=15:31&link=kWXQUGa-OMY">следующим образом.</a></p>

        <p><a href="rg2://ytplay?time=16:24&link=kWXQUGa-OMY&alg=(1,0)/(-1,0)/(2,0)/(-2,0)">Алгоритм:</a> <b>(1,0)/(-1,0)/(2,0)/(-2,0)</b></p>

        <p>Это и есть наш \"Звездочный пиф-паф\", всего четыре хода (если не считать слайсы).</p>

        <p>Теперь давайте сделаем этот пиф-паф
        <a href="rg2://ytplay?time=16:48&link=kWXQUGa-OMY">на собранной головоломке</a>
        и посмотрим, какие еще элементы меняют свое местоположение.</p>
        <p style="text-align:center"><img src="sq_star_3_3.xml"></p>

        <p><a href="rg2://ytplay?time=17:26&link=kWXQUGa-OMY">Видим,</a> что кроме смены
        элементов в нашем тройном блоке, есть ДВА элемента, которые
        поменялись местами и еще ТРИ, которые так же, как и наш блок меняются местами по кругу.
        <a href="rg2://ytplay?time=18:27&link=kWXQUGa-OMY">Т.е. мы имеем</a> два трицикла и
        один двуцикл. Что дают нам эти знания?</p>

        <p>А дают они нам <a href="rg2://ytplay?time=18:56&link=kWXQUGa-OMY">вот что.</a> Если мы
        выполним данный алгоритм ДВА раза, то элементы двуцикла
        вернутся на свои места, а элементы трициклов переместятся еще раз - ничего интересного. Но
        если мы выполним алгоритм <a href="rg2://ytplay?time=19:41&link=kWXQUGa-OMY">три раза,</a>
        то у нас на свои места вернутся элементы трициклов,
        а элементы двуцикла поменяются местами - вот это уже интереснее.</p>

        <p>Получается, что если мы выполним этот алгоритм ТРИ раза, то у нас все элементы останутся
        на своих местах и только два элемента дальние левый верхний и правый нижний поменяются местами.</p>

        <p>Теперь о том, <a href="rg2://ytplay?time=20:02&link=kWXQUGa-OMY">как применить эти знания,</a>
        для перестановки элементов на верхнем слое, когда нижний слой уже собран правильно. Как вы
        понимаете, довольно легко меняются местами левый дальний и любой из правых элементов.</p>
        <p style="text-align:center"><img src="sq_star_3_4.xml"></p>

        <p>Рассмотрим каждый случай подробнее:</p>

        <p>1. <a href="rg2://ytplay?time=20:31&link=kWXQUGa-OMY">Левый дальний и правый ближний.</a></p>
        <p style="text-align:center"><img src="sq_star_3_5.xml"></p>

        <p>Тут все очень просто, делаем слайс и правый элемент встает в нужную нам позицию для замены.
        Соответственно делаем три пиф-пафа, элементы меняются местами. Отменяем слайс.</p>

        <p>Т.е.: /(1,0)/(-1,0)/(2,0)/(-2,0) (1,0)/(-1,0)/(2,0)/(-2,0) (1,0)/(-1,0)/(2,0)/(-2,0)/<br/>
        или если убрать взаимоисключающие себя ходы, то получается:</p>

        <p><a href="rg2://ytplay?time=20:42&link=kWXQUGa-OMY">Алгоритм:</a>
        <b>/(1,0)/(-1,0)/(2,0)/(-1,0)/(-1,0)/(2,0)/(-1,0)/(-1,0)/(2,0)/(-2,0)/</b></p>

        <p>2. <a href="rg2://ytplay?time=22:00&link=kWXQUGa-OMY">Левый дальний и правый средний.</a></p>
        <p style="text-align:center"><img src="sq_star_3_6.xml"></p>

        <p>Делаем слайс, ставим правый элемент назад, три пиф-пафа, возвращаем элемент снизу в среднюю
        позицию, слайс.</p>

        <p><a href="rg2://ytplay?time=22:10&link=kWXQUGa-OMY">Алгоритм:</a>
        <b>/(1,1)/(-1,0)/(2,0)/(-1,0)/(-1,0)/(2,0)/(-1,0)/(-1,0)/(2,0)/(-2,-1)/</b></p>

        <p>3. <a href="rg2://ytplay?time=23:30&link=kWXQUGa-OMY">Левый дальний и правый дальний.</a></p>
        <p style="text-align:center"><img src="sq_star_3_7.xml"></p>

        <p>Аналогично среднему, только нижний слой в начале и в конце алгоритма сдвигаем на два элемента.</p>

        <p><a href="rg2://ytplay?time=23:31&link=kWXQUGa-OMY">Алгоритм:</a>
        <b>/(1,2)/(-1,0)/(2,0)/(-1,0)/(-1,0)/(2,0)/(-1,0)/(-1,0)/(2,0)/(-2,-2)/</b></p>

        <p><i>Надеюсь, что данная информация поможет вам научится собирать не только двухслойную
        звезду, но и четырехслойную.</i></p>

    """;
    static const sq_star_st3_url = "kWXQUGa-OMY";

    static const sq_star_st4_title = "Этап 3. Расстановка центров";
    static const sq_star_st4_descr = """
        <p>И осталось только правильно поставить <a href="rg2://ytplay?time=24:33&link=kWXQUGa-OMY">центры</a>
        данной головоломки. Тут все очень интуитивно
        и легко. Возможны только две ситуации:</p>

        <p>1. <a href="rg2://ytplay?time=24:51&link=kWXQUGa-OMY">Одна половинка не соответствует цвету верхней грани</a></p>
        <p style="text-align:center"><img src="sq_star_4_1.xml"></p>

        <p><a href="rg2://ytplay?time=25:03&link=kWXQUGa-OMY&alg=/(3,0)/(3,0)/(3,0)">Алгоритм:</a> <b>/(3,0)/(3,0)/(3,0)</b></p>

        <p>2. <a href="rg2://ytplay?time=25:37&link=kWXQUGa-OMY">Обе половинки центра не соответствуют цвету верхней грани</a></p>
        <p style="text-align:center"><img src="sq_star_4_2.xml"></p>

        <p><a href="rg2://ytplay?time=25:48&link=kWXQUGa-OMY&alg=/(3,3)/">Алгоритм:</a> <b>/(3,3)/</b></p>

    """;
    static const sq_star_st4_url = "kWXQUGa-OMY";

    static const sq_star_st5_title = "Вариант с одноцветными лучами";
    static const sq_star_st5_descr = """
        <p><a href="rg2://ytplay?time=0:36&link=4yWNBooGitc">Как я уже упоминал</a>
        в обучалке по сборке этой головоломки с разноцветными лучами,
        вариант с лучами одного цвета является очень простым. Главное отличие сборки этого варианта в том,
        что последовательность сборки будет несколько другой. Тут проще
        не обращая внимания на то, какого цвета у нас крыша и подвал, сначала сдружить по цветам
        лучи верхнего и нижнего слоев.</p>

        <p>Делается это при помощи всего лишь одного четырехходового алгоритма.</p>
        <p><a href="rg2://ytplay?time=1:18&link=4yWNBooGitc&alg=/(-1,0)/(1,0)/">Алгоритм:</a> <b>/(-1,0)/(1,0)/</b></p>

        <p>который меняет два передних элемента на верхней грани. На самом деле не только их, но
        в этой головоломке и на этом этапе это не имеет значения. Как же применять этот алгоритм?</p>

        <p><a href="rg2://ytplay?time=2:23&link=4yWNBooGitc">Для начала,</a>
        попытайтесь вращением крыши сдружить как можно больше ребер. И теперь ищем
        какие-нибудь два элемента луча стоящих на разных слоях и
        <a href="rg2://ytplay?time=2:59&link=4yWNBooGitc">рядом друг с другом.</a></p>
        <p style="text-align:center"><img src="sq_star_5_1.xml"></p>

        <p>Если таких ребер нет, то <a href="rg2://ytplay?time=3:17&link=4yWNBooGitc">надо их сделать.</a>
        Главное тут понимать, что оба слоя всегда вращаем ТОЛЬКО вместе.</p>

        <p>Если такая пара есть, то ставим ее спереди и выполняем наш простой алгоритм.</p>

        <p>Повторяем эти действия до тех пор, пока все лучи верхнего и нижнего слоев не будут «дружить»
        друг с другом.</p>
        <p style="text-align:center"><img src="sq_star_5_2.xml"></p>

        <p>После того, как все лучи «подружились», красим крышу. Опять же, на этом этапе оба слоя
        всегда вращаем только вместе. Вот базовые ситуации этого этапа:</p>

        <p>1. <a href="rg2://ytplay?time=4:59&link=4yWNBooGitc">Три рядом стоящих элемента.</a></p>
        <p style="text-align:center"><img src="sq_star_5_3.xml"></p>

        <p>решается простым слайсом.</p>

        <p>2. <a href="rg2://ytplay?time=5:18&link=4yWNBooGitc">Два рядом стоящих элемента.</a></p>
        <p style="text-align:center"><img src="sq_star_5_4.xml"></p>

        <p>Делаем слайс между этими двумя элементами и получаем ситуацию N1, т.е. три рядом стоящих
        элемента, которые уже знаем как решать.</p>

        <p>3. <a href="rg2://ytplay?time=5:48&link=4yWNBooGitc">Одинокий элемент.</a></p>
        <p style="text-align:center"><img src="sq_star_5_5.xml"></p>

        <p>Берем головоломку так, чтобы этот одинокий элемент находился спереди справа. Делаем слайс
        и получаем ситуацию с двумя рядом стоящими элементами, а как ее решать см. выше.</p>

        <p>4. <a href="rg2://ytplay?time=6:25&link=4yWNBooGitc">Элементы стоят не рядом.</a></p>
        <p style="text-align:center"><img src="sq_star_5_6.xml"></p>

        <p>В этом случае рассматриваем ситуацию как две ситуации с рядом стоящими элементами. Просто
        решаем сначала одну, а потом вторую ситуацию.</p>

        <p>После того, как все лучи развернуты правильно,</p>
        <p style="text-align:center"><img src="sq_star_5_7.xml"></p>

        <p>остается только развернуть центральные элементы. Этот этап абсолютно аналогичен третьему
        этапу этой головоломки с разноцветными лучами. Т.е. тут могут быть всего лишь две ситуации,
        когда центр не собран:</p>

        <p>1. <a href="rg2://ytplay?time=7:56&link=4yWNBooGitc">Одна половинка не соответствует цвету верхней грани</a></p>
        <p style="text-align:center"><img src="sq_star_5_8.xml"></p>

        <p><a href="rg2://ytplay?time=8:13&link=4yWNBooGitc&alg=/(3,0)/(3,0)/(3,0)">Алгоритм:</a> <b>/(3,0)/(3,0)/(3,0)</b></p>

        <p>2. <a href="rg2://ytplay?time=8:33&link=4yWNBooGitc">Обе половинки центра не соответствуют цвету верхней грани</a></p>
        <p style="text-align:center"><img src="sq_star_5_9.xml"></p>

        <p><a href="rg2://ytplay?time=8:41&link=4yWNBooGitc&alg=/(3,3)/">Алгоритм:</a> <b>/(3,3)/</b></p>


    """;
    static const sq_star_st5_url = "4yWNBooGitc";

}
