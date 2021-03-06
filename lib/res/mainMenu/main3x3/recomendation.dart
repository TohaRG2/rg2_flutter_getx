
import 'package:rg2/models/phases.dart';

class Recomendation implements Phase {
  @override
  int count = recomend_title.length;

  @override
  String phase = "RECOMENDATION";

  @override
  List<String> titles() => recomend_title;

  @override
  List<String> icons() => recomend_icon;

  @override
  List<String> descriptions() => recomend_descr;

  @override
  List<String> urls() => recomend_url;

  @override
  List<String> comments() => List.filled(count, "");

///==================================================


    static const recomend_title = [
        recomendation0_title,
        recomendation2_title,
        recomendation3_title,
        recomendation4_title,
    ];

    static const recomend_icon = [
        "vbegin_0",
        "vbegin_0",
        "vbegin_0",
        "vbegin_0",
    ];

    static const recomend_descr = [
        recomendation0_descr,
        recomendation2_descr,
        recomendation3_descr,
        recomendation4_descr,
    ];


    static const recomend_url = [
        recomendation0_url,
        recomendation2_url,
        recomendation3_url,
        recomendation4_url,
    ];

    static const recomendation0_title = "Как собирать кубик быстро";
    static const recomendation0_descr = """
        <p>Итак, кубик собирать научились, теперь будем учиться собирать его быстро.
        Что для этого нужно?</p>

        <p><b>1. Уметь собирать кубик</b> методикой для начинающих, но НЕ абы какой, а той, в которой после
        сборки верхнего креста, вы сначала разворачиваете углы, т.е. делаете всю крышу одного цвета.
        Например, популярная сейчас методика сборки пиф-пафами не подойдет и вам придется сначала
        освоить одну из методик приведенных в программе. Но не расстраивайтесь, т.к.
        бОльшая часть в методиках для начинающих очень похожа, то сделать это будет довольно легко.</p>

        <p><b>2. Иметь хороший кубик.</b> Это не означает, что вам нужен профессиональный куб, достаточно
        любого, который легко вращается и хоть немного \"режет углы\", т.е. прощает небольшие недокрутки
        граней. И тут, как ни странно, многие дешевые китайские кубики оказываются гораздо лучше дорогого
        классического Рубикса.</p>

        <p>Вот, пожалуй, и все что нужно.</p>

        <p>Есть несколько скоростных методов сборки кубика, самые известные - это <b>Фридрих</b> или правильнее
        его будет называть <b>CFOP</b> (читается сифоп) и <b>ROUX</b> (читается Ру). Начать я рекомендую все-таки с
        <b>CFOP</b>, т.к. он является самым скоростным методом, да и гораздо ближе к методике для начинающих
        чем метод Ру. В чем преимущества метода Ру, вы сможете найти в описании этого метода, которое
        есть в программе.</p> 
        
        <p>Давайте рассмотрим CFOP подробнее.</p>

        <p>Как можно догадаться из названия, метод включает в себя 4 основных этапа.<br/>
        <b>C</b> = Cross (крест)<br/>
        <b>F</b> = F2L (первые 2 слоя)<br/>
        <b>O</b> = OLL (ориентация последнего слоя)<br/>
        <b>P</b> = PLL (расстановка последнего слоя)<br/>
        Давайте, для начала, кратко их рассмотрим, а потом я расскажу, как лучше их изучать. Более подробно
        о каждом из этапов написано в соответствующем разделе программы.
        </p>

        <p><b>Крест</b> - первый и наверное самый простой этап. Первый крест из любого положения
        кубика всегда можно собрать не более чем за 8 ходов. По сравнению с методикой для начинающих
        нужно всего лишь научиться собирать крест сразу на нижней грани, быстро находить нужные ребра и
        ставить их сразу на свои места из того положения, где они находятся + учиться использовать ходы
        установки одного ребра для установки другого ребра. Т.е. как видите - это объединение пары первых
        этапов методики для начинающих в один.</p>

        <p><b>F2L (First 2 Layer)</b> - первые два слоя. И снова объединяем два этапа в один. В отличие
        от методики для начинающих, надо научиться ставить не отдельно углы первого слоя, а затем ребра
        второго, а сразу угол и соответствующее ему ребро второго слоя - парой. И пожалуй, это самый сложный
        этап методики, ну а почему это так, вы поймете, когда начнете его изучать.</p>

        <p><b>OLL (Orientation Last Layer)</b> - ориентация (разворот) элементов последнего (верхнего)
        слоя. И снова объединяем пару этапов методики для начинающих в один. И именно отсюда
        берется первое требование про необходимость сначала разворота всех элементов, а только потом их
        расстановки. Если вы собираете кубик именно так, то и OLL/PLL вам будет гораздо легче понять и учить.
        На этом этапе у вас может быть всего лишь 57 различных ситуаций, которые, в отличие
        от ситуаций на F2L, довольно легко распознаются и делятся на группы.</p>

        <p><b>PLL (Permutation Last Layer)</b> - перестановка элементов последнего слоя. Опять же, объединяем
        два последних этапа в один. Все еще проще чем на этапе <b>OLL</b>, тут всего 21 ситуация и научиться различать их
        тоже довольно не сложно.</p>

        <p><b>Теперь о том, как учить:</b></p>

        <p>1. Начните с ускорений. Ускорения - это наиболее полезные алгоритмы различных этапов. Если
        вы учились по моей методике, то все равно изучите все ускорения из методики Максима Чечнева,
        хотя многие из них вам будут уже знакомы и их не придется учить. В итоге вы должны, по сути,
        освоить так называемые 2Look-OLL и 2Look-PLL, т.е. выполнение последних четырех этапов не
        универсальными алгоритмами, а по одному алгоритму для каждой ситуации. Должно получиться:
        3 алгоритма для получения креста + 7 для разворота углов + 2 для расстановки углов +
        4 для расстановки ребер.</p>

        <p>2. Обязательно смотрите видео, как правильно выполнять алгоритмы (фингертриксы). Правильная
        постановка рук и соответствующее выполнение алгоритма это не только скорость, но и часть его
        запоминания. Большинство спидкуберов уже и не помнят формулы для алгоритмов, но зато легко
        выполняют их руками, более того, они не могут выполнить алгоритм медленно, только быстро, потому
        что пальцы сами так крутят кубик.</p>

        <p>3. Непосредственно CFOP - начните со сборки креста. Этот этап поможет вам понять кубик.
        Учитесь сводить количество лишних движений к минимуму.</p>

        <p>4. Вместе с крестом начните F2L. Я рекомендую сначала освоить интуитивный F2L, в нем хоть и довольно
        много лишних ходов, но это все равно быстрее методики для начинающих. Постепенно
        ускоряйте свой интуитивный F2L алгоритмами для сложных ситуаций. Надеюсь, вы сами поймете это, когда начнете его
        изучать. Главное, научиться смотреть в нужные места кубика и быстро находить элементы пары.</p>

        <p>5. Надеюсь, что к этому моменту вы уже освоили ускорения и собираете OLL и PLL этапы максимум за
        два коротких и быстрых алгоритма каждый. Поэтому, начните изучать остальные PLL алгоритмы, их
        не так и много.</p>

        <p>6. Развивайте свой LookAhead (взгляд вперед), научитесь, особенно на этапе F2L, выполнять
        алгоритмы равномерно. Ведь сборка кубика это не только время выполнения
        алгоритмов, но и время, которое вы тратите на определение сложившейся ситуации. И когда
        вы крутите алгоритм на максимальной скорости, опять же, в силу физиологических особенностей
        организма, вы не сможете \"думать и смотреть\" вперед. Для тренировки равномерности вращения
        в таймере программы предусмотрен метроном, настройте скорость и старайтесь делать одно вращение
        за один такт и пусть это по началу будет гораздо медленне, но постепенно увеличивая частоту
        метронома вы сможете заметно сократить время сборки кубика.<br/>
        Очень показательный пример равномерной сборки, с очень медленным вращением граней, без использования
        продвинутых алгоритмов для OLL и PLL <a href="rg2://ytplay?time=3:12&link=TjT2lPBa8r0">и последующим разбором</a>
        возникших ситуаций от меня.</br>
        Или вот еще примеры быстрых - равномерной и рваной сборок <a href="rg2://ytplay?time=0:52&link=4nSnsav3bIU">от Дилана.</a>
        Надеюсь разница очевидна.</p>

        <p>7. Остается только OLL, ну а потом и различные ускорения для него в виде VLS, COLL, WV.</p>

        <p>Надеюсь, вы заметили, что этапы в программе расположены именно в такой последовательности, как
        их лучше учить. А не просто по порядку. Удачи в сборках.</p>

    """;
    static const recomendation0_url = "";

    static const recomendation1_title = "Методика Максима vs \"Классическая\" методика.";
    static const recomendation1_descr = """
        <p>Довольно часто в отзывах и на почту мне пишут про методику сборки кубика
        для новичков, которая еще в 80-х годах прошлого века была
        <a href="https://soberi-kubik.ru/data/Nauka_i_jizn_1983-05.pdf">напечатана в журнале</a> \"Наука и жизнь\".
        И которая, с некоторыми вариациями, встречается на большинстве ресурсов рунета. А соответственно и
        95% тех, кто старше 20-ти, учились собирать кубик именно по этой методике. Назовем эту методику \"классической\".
        В том числе и я сам, году в 198Х-каком-то собрал свой первый кубик именно по этой методике.
        Для начала очень кратко об этой методике:<br/><br/>

        1. Сборка правильного белого креста.<br/><br/>
        2. Ставим на место углы первого слоя. Очень интуитивный и простой алгоритм: уводим от квартиры, опускаем квартиру,
        ставим угол на место, возвращаем квартиру на место. Углы смотрящие вниз сначала разворачиваем
        этим же алгоритмом.<br/><br/>
        3. Ставим ребра второго слоя. Еще один интуитивный алгоритм: ставим ребро к своему центру,
        отводим его от квартиры, опускаем квартиру, возвращаем ребро, возвращаем квартиру. Смотрим,
        что угол который был на месте на крыше оказался внизу - ставим его на место, как на предыдущем
        этапе.<br/><br/>
        4. Желтый крест. По сути, все как у Максима, но зачем-то чуть более запутано.<br/><br/>
        5. Расставляем на места элементы креста. Делаем Рыбку из ускорений для начинающих. Там мы
        ее конечно использовали для углов, а тут для ребер.<br/><br/>
        6. Ставим на место углы. Вариант этого алгоритма используется в расстановке углов мегаминкса.<br/><br/>
        7. Разворот углов. Крутим углы по две штуки за алгоритм.<br/><br/>
        Profit!<br/><br/>

        Но когда
        я сам пару лет назад натолкнулся на методику Максима Чечнева, то понял, что данная методика
        имеет ряд преимуществ перед классической. Постараюсь поподробнее рассмотреть эти преимущества:</p>

        <p><b>1.</b> Всего 4 алгоритма (пиф-паф, ромашка, убийца и инфаркт). В классической методике этих
        алгоритмов несколько больше, хотя и некоторые из них более интуитивные. Ну и нельзя не отметить
        очень нестандартный, но очень действенный способ запоминания этих алгоритмов при помощи присказок.

        Да есть методика для начинающих от Евгения Бондаренко, где можно сказать используется только
        один простейший алгоритм пиф-паф (в вариациях справа и слева), но на мой взгляд, там
        как раз не хватает каких-то ассоциаций, чтобы запомнить те дополнительные ходы (действия)
        к пиф-пафам для каждого этапа и не перепутать где, сколько и каких пиф-пафов надо сделать.
        Ну и последовательность этапов, на мой взгляд, тоже не оптимальная (об этом ниже). </p>

        <p><b>2.</b> Более <b>правильная</b> последовательность выполнения этапов. Т.е. если вы решите,
        не лишь бы как-то собрать кубик, а захотите собирать его хоть немного быстрее,
        то перейти на сборку самым популярным и скоростным методом CFOP (Фридрих), вам будет гораздо
        проще именно с методики Максима. Например, собирать F2L, когда белая (начальная) сторона
        находится сверху (как в классической методике), мягко говоря
        неудобно. По сути 4 и 5 этапы методики Максима - это F2L, 6 и 7 этапы - это OLL, а 8 и 9 этапы - PLL.</p>

        <p><b>3.</b> Возможность постепенного перехода к скоростной сборке. Плюс, который следует из второго преимущества.
        Нет необходимости выполнять какой-то этап сразу весь и всегда по новым \"скоростным\" алгоритмам.
        Вы можете учить новые алгоритмы и постепенно добавлять их в свои сборки. Наиболее ярко это
        проявляется на 7 этапе (по методике Максима). Т.е. для начала вы выполняете этот этап при
        помощи пиф-пафов, а потом начинаете учить ускорения. На данном этапе вам может попасться всего
        лишь 7 ситуаций, каждую из которых можно решить быстрее, чем в 6 или 12 пиф-пафов. Но
        учить сразу все 7 алгоритмов нет необходимости. Например, выучили вы <b>Рыбку</b> и если
        вам попалась <b>Рыбка</b>, то решаете ее в один алгоритм, если какая-то другая ситуация, то
        пиф-пафами. Все выше сказанное относится и к другим этапам сборки.</p>

        <p><b>4.</b> Еще один плюс, который следует из второго - более быстрое определение ситуации на
        последних этапах сборки кубика. Т.к. общее время сборки это не только время выполнения
        алгоритмов, но и время, которое вы тратите на понимание того, какая перед вами ситуация и
        соответственно какой алгоритм нужно применить. Наиболее ярко это проявляется
        при сборке по методу Евгения Бондаренко после сборки верхнего креста. Понять какой из углов
        не на своем месте, когда они уже правильно ориентированы гораздо проще (1-2 секунды
        против 8-15 секунд).
        </p>

        <p><b>5.</b> Наличие у данной методики Ускорений. По сути самых полезных алгоритмов методики Фридрих,
        которые являются еще и основой для многих других алгоритмов.
        И освоив которые, можно значительно сократить время сборки кубика. Поэтому освоение
        методики CFOP рекомендую начать именно с ускорений, а не сразу начинать изучать PLL/OLL.
        </p>

    """;
    static const recomendation1_url = "";


    static const recomendation2_title = "С чего начать и как учить.";
    static const recomendation2_descr = """
        <p>Начать стоит с основной \"фишки\" программы - возможности не только прочитать
        о какой-то головоломке, но и посмотреть нужный момент в видео, если вам что-то непонятно из
        текста. Например, вы видите в тексте слово <a href="rg2://ytplay?time=0:41&link=QJ8-8l9dQ_U">\"Алгоритм\"</a>,
        которое выделено цветом. Значит можно по нему щелкнуть и посмотреть в видео именно тот
        момент, как выполнять данный алгоритм. А если вы нажмете в видео кнопку \"<b>|&lt</b>\", то сможете
        повторить видео еще раз, с того момента, с которого начали его смотреть.</p>

        <p>Не стесняйтесь смотреть видео, т.к. многие моменты в сборке кубика довольно трудно передать
        словами, в то время, как в видео это очень просто показать и объяснить. С другой стороны,
        если вам нужно всего лишь немного вспомнить формулу для алгоритма, то ее гораздо быстрее можно
        найти именно в тексте, чем в видео.</p>

        <p>Если вы забыли как выполняется то или иное вращение, нажмите большую зеленую кнопку в
        нижней части экрана и найдите нужное вращение в открывшемся окне.</p>

        <p>Еще одной особенностью программы является использование
        <a href="rg2://ytplay?time=8:36&link=u1CA_35lRAI">языка вращений</a> Максима Чечнева, который позволяет запоминать
        алгоритмы, составляя для них ассоциативные ряды. Основные понятия (движения) этого метода:<br/>
        <a href="rg2://ytplay?time=11:15&link=8VCsFNFa5yM"><b>\"Лондон\"</b></a> - передняя грань, причем
        \"В Лондон\" вращение передней грани по часовой стрелке, а \"из Лондона\" - против часовой.<br/>
        <a href="rg2://ytplay?time=8:16&link=ku-FyZvD48Q"><b>\"свет\"</b></a> - правая грань, причем
        Включение света - это вращение по часовой стрелке, а выключение - против часовой.<br/>
        и <a href="rg2://ytplay?time=7:58&link=8VCsFNFa5yM"><b>\"крыша\"</b></a> - верхняя грань.<br/>
        Возможно это не лучшие ассоциации, но на мой взгляд в любом случае
        <a href="rg2://ytplay?time=8:51&link=u1CA_35lRAI"><b>\"В Лондон\",</b></a> гораздо легче для
        запоминания, чем \"передняя грань по часовой стрелке\".</p>

        <p>Если вы хотите не просто научиться собирать кубик, а еще и делать это быстро, то
        после освоения любой из приведенных методик для начинающих переходите к изучению
        метода Фридрих или правильнее все таки его называть CFOP (сифоп). Описание того, как
        его учить и на что обратить внимание вы можете найти в разделе <b>Собираем кубик быстро
        (Фридрих (CFOP), ROUX)</b>.</p>

    """;
    static const recomendation2_url = "TjT2lPBa8r0";

    static const recomendation3_title = "Немного терминологии";
    static const recomendation3_descr = """
    <p> Термины, которые должен знать каждый, кто занимается спидкубингом.<br/><br/>

    <b>1. <a href="rg2://ytplay?time=0:00&link=4nSnsav3bIU">Sexy Move</a></b>
    - в русском варианте <b>пиф-паф</b>. Простая четырехходовая комбинация <b>R U R\' U\'</b>. Ну а почему в
    английском варианте это так называется,
    <a href="rg2://ytplay?time=0:06&link=4nSnsav3bIU">смотрите в видео</a> :)))<br/><br/>

    <b>2. <a href="rg2://ytplay?time=0:18&link=4nSnsav3bIU">TPS</a></b> = Turns Per Second -
    количество ходов (поворотов) в секунду. Величина позволяющая оценить на сколько быстро вы
    крутите кубик. Чтобы оценить свой TPS выполните какую-то достаточно длинную комбинацию и заметьте
    время за которое вы это сделаете. Теперь поделите количество сделанных ходов, на время. Например
    <a href="rg2://ytplay?time=0:35&link=4nSnsav3bIU">Рыбку</a>, в которой семь ходов.<br/>
    Но, то что вы крутите кубик очень быстро не означает что вы быстро собираете кубик.
    <a href="rg2://ytplay?time=0:52&link=4nSnsav3bIU">Иначе говоря</a>,
    именно потому, что вы крутите слишком быстро, вы не сможете сохранять высокий TPS для всей сборки.
    Т.к. между выполнениями комбинаций у вас будут бОльшие паузы. Гораздо эффективнее, вращать кубик
    медленнее (равномернее), но без пауз между комбинациями.<br/><br/>

    <b>3. <a href="rg2://ytplay?time=1:42&link=4nSnsav3bIU">Sune</a></b> = Рыбка из Ускорения N2,<br/>
    <b><a href="rg2://ytplay?time=2:07&link=4nSnsav3bIU">Antisune</a></b> = Акула из Ускорения N11,<br/>
    <b><a href="rg2://ytplay?time=2:13&link=4nSnsav3bIU">Pi</a></b> = Вертолет из Ускорения N14,<br/>
    <b><a href="rg2://ytplay?time=2:19&link=4nSnsav3bIU">U</a></b> = Глазки из Ускорения N13,<br/>
    <b><a href="rg2://ytplay?time=2:27&link=4nSnsav3bIU">T</a></b> = Ушки из Ускорения N8,<br/>
    <b><a href="rg2://ytplay?time=2:30&link=4nSnsav3bIU">L</a></b> = Носик из Ускорения N9<br/> и
    <b><a href="rg2://ytplay?time=2:39&link=4nSnsav3bIU">H</a></b> = НТВ+ из Ускорения N8.<br/>
    Данные алгоритмы объединены в один блок как базовые (крестовые) OLL алгоритмы.<br/><br/>

    <b>4. <a href="rg2://ytplay?time=2:43&link=4nSnsav3bIU">2-gen</a></b> = Turns 2 Layer,
    вращение двух слоев. Проще говоря, 2-gen алгоритмы, это такие алгоритмы, при выполнении которых вращаются только
    2 слоя. Чаще всего R и U. Например: пиф-паф, рыбка, PLL окошки, PLL рельсы. Такие алгоритмы можно
    выполнять очень быстро (с высоким TPS) и они очень удобны для сборки
    <a href="rg2://ytplay?time=3:16&link=4nSnsav3bIU">одной рукой</a>(One Hand).
    <b>3-gen</b> алгоритмы - соответственно те, при выполнении которых, вращаются 3 грани.<br/><br/>

    <b>5. <a href="rg2://ytplay?time=3:22&link=4nSnsav3bIU">Average vs Mean</a></b> - Усредненное
    и среднее время. Если дословно переводить с агнглийского, то и mean time и average time означает
    среднее время (сборки). Но считается оно по разному. Mean time - это суммарное время всех
    попыток поделенное на количество попыток, т.е. точное среднее время. В то время как Average это более
    абстрактное понятие, скорее не среднее, а усредненное время. Т.е. при его расчете, например не берутся
    лучший и худший результат. Или под понятием Average time может пониматься примерное среднее время
    сборок.<br/><br/>

    <b>6. <a href="rg2://ytplay?time=4:27&link=4nSnsav3bIU">Sledgehammer</a></b> -
    Кувалда или Английский пиф-паф <b>(R\' F R F\')</b>. Еще одна простая четырехходовка из Ускорения N1.
    Используется как часть многих алгоритмов. Так же можно использовать и как альтернативу первому
    базовому <b>U (R U\' R\')</b> алгоритму интуитивного F2L, особенно при постановке на свое место
    <a href="rg2://ytplay?time=4:42&link=4nSnsav3bIU">последней пары </a>. А в
    <a href="rg2://ytplay?time=4:54&link=4nSnsav3bIU">такой ситуации</a> и вовсе можно
    получить OLL Skip.<br/><br/>

    <b>7. <a href="rg2://ytplay?time=4:56&link=4nSnsav3bIU">AUF</a></b> - Adjust Upper Face.
    Установка верхней грани - установочные ходы для PLL алгоритмов, а также
    установка на свое место собранной верхней грани после PLL алгоритма. Обычно быстрее крутить верх,
    чем делать перехваты.<br/><br/>

    <b>8. <a href="rg2://ytplay?time=5:21&link=4nSnsav3bIU">CFOP, Roux, ZZ</a></b><br/>
    <b>CFOP</b> = Cross, F2L, OLL, PLL. Скоростной метод сборки, которым пользуется большинство спидкуберов.
    Так же известен как метод Джесики Фридрих. Как видно из названия состоит из последовательной
    сборки креста (Cross), первых двух слоев (F2L),
    ориентации последнего слоя (OLL) и перестановки последнего слоя (PLL).<br/><br/>

    <b>Roux</b> (читается как Ру)- альтернативный скоростной метод сборки кубика. Даже если он
    не станет вашим основным методом сборки, очень рекомендую хотя бы научиться собирать кубик
    этим методом, т.к. он очень интуитивный и способствует лучшему пониманию кубика. Обучалку
    вы можете найти в соответствующем разделе программы.<br/><br/>

    <b>ZZ</b> - еще один метод, суть которого в первоначальном правильном ориентировании ребер.<br/><br/>

    <b>9. <a href="rg2://ytplay?time=7:37&link=4nSnsav3bIU">COLL vs OLLCP</a></b><br/>
    <b>COLL</b> = Corners & OLL (углы и OLL),<br/>
    <b>OLLCP</b> = OLL & Corner Permutation (OLL и установка углов
    на свои места). Результат и тех и других алгоритмов одинаков - PLL с углами на своих местах,
    т.е. окошки, рельсы, шахматы или PLL скип. Но OLLCP - это набор алгоритмов для любой OLL ситуации,
    а COLL только для ситуации, когда желтый крест уже собран. Более подробно про <b>COLL</b> можно
    посмотреть в соответствующем разделе программы.<br/>
    <b>ZBLL</b> = Zborowski-Bruchem Last Layer, расширенный набор COLL алгоритмов, в которых происходит расстановка на
    свои места не только углов, но и ребер, т.е. однозначный скип PLL этапа. Но и ситуаций тут уже
    значительно больше, около 500 в отличие от COLL, где их всего 40.<br/><br/>

    <b>10. <a href="rg2://ytplay?time=8:51&link=4nSnsav3bIU">Metrics</a></b>
    Метрики - различные варианты подсчета ходов.<br/>
    <b><a href="rg2://ytplay?time=9:15&link=4nSnsav3bIU">STM</a></b>
    = Slice Turn Metric. Метрика в которой ходы среднего слоя (M, S) считаются как один ход.
    Вот <a href="rg2://ytplay?time=9:23&link=4nSnsav3bIU">пример подсчета</a> STM
    ходов для алгоритма <b>M2 U\' M U2 M\' U\' M2</b>.<br/>
    <b><a href="rg2://ytplay?time=9:32&link=4nSnsav3bIU">HTM</a></b>
    = Half Turn Metric. В HTM ходы среднего слоя считаются как 2 хода, т.е. как последовательные
    ходы боковых граней. Например тот же самый алгоритм <b>M2 U\' M U2 M\' U\' M2</b> в метрике HTM
    будет подсчитан как 11 ходов.<br/>
    <b><a href="rg2://ytplay?time=9:53&link=4nSnsav3bIU">QTM</a></b>
    = Quarter Turn Metric. В данной метрике поворот любой грани на 90 градусов означает один ход.
    Т.е. ход типа R2 или U2 в данной метрике будет считаться как 2 хода.<br/>
    <b><a href="rg2://ytplay?time=9:53&link=4nSnsav3bIU">ETM</a></b>
    = Execution Turn Metric. Тут все еще интереснее, как видно из названия,
    в данной метрике количество ходов зависит от того как вы исполняете данный алгоритм. Т.е.
    одно действие = один ход. Например, если вы
    <a href="rg2://ytplay?time=10:15&link=4nSnsav3bIU">делаете U2 так</a>,
    то это 2 хода, а <a href="rg2://ytplay?time=10:18&link=4nSnsav3bIU">если так</a>,
    то один. Так же в ETM перехват куба считается за один ход.<br/><br/>

    <b>11. <a href="rg2://ytplay?time=0:00&link=XhjQNdEaHJw">VLS</a></b>
    Valk Last Slot - алгоритмы позволяющие решать OLL без постановки на место последней пары F2L.
    Называются так в честь разработчика и популяризатора этой методики Матса Валька (Mats Valk).
    Методика включает в себя порядка 200 алгоритмов. Поэтому для начала можно освоить
    <b><a href="rg2://ytplay?time=0:20&link=XhjQNdEaHJw">Winter Variation</a></b>.
    Данные алгоритмы являются частью VLS и отличаются тем, что крест на верхней стороне уже собран
    и соответственно таких алгоритмов уже меньше - всего 27. И найти их
    <a href="rg2://ytplay?time=0:00&link=rbRJWAH_pts">можно тут.</a><br/><br/>

    продолжение следует…
    </p>
    """;
    static const recomendation3_url = "4nSnsav3bIU";


    static const recomendation4_title = "Сравнение с методикой А.Кима";
    static const recomendation4_descr = """
        <p>Во-первых, хочу сказать большое спасибо Артуру Давлетову и Юсуфу Раминову за присланные ссылки на обучающее
        видео, приведенное в конце этого текста, а также за описание данной методики.</p>

        <p>Очень популярная среди молодого поколения спидкуберов методика. Во многих источниках
        позиционируется, как интуитивно понятная, что на мой субъективный взгляд, не совсем так.
        Для начала расскажу вкратце последовательность сборки кубика по А.Киму. Подробнее
        вы можете посмотреть в <a href="rg2://ytplay?time=0:00&link=RukIJdEiOoI">видео после текста.</a></p>

        1. <a href="rg2://ytplay?time=1:35&link=RukIJdEiOoI">Сборка белого креста.</a>
        Крест собирается через желтую сторону, т.е. собираем белый крест на желтой
        стороне, а потом легко переставляем на место ребра совмещяя их с своими центрами.<br/><br/>

        2. После креста собираем не сторону, а сначала
        <a href="rg2://ytplay?time=7:09&link=RukIJdEiOoI">ставим ребра второго слоя.</a>
        Собираем через алгоритмы \"Да\" и \"Нет\", ставим ребро так чтобы верхний цвет
        ребра совпадал с нижним центром (не как в стебле ромашки) и смотрим куда идет ребро: если вправо, то делаем
        алгоритм \"Да\" (R U\' R\'). Если влево, то делаем алгоритм \"Нет\" (L\' U L).
        <br/><br/>

        3. Теперь загоняем на свои места
        <a href="rg2://ytplay?time=12:21&link=RukIJdEiOoI">углы первого нижнего слоя.</a>
        Ищем углы где есть белая наклейка, ставим угол над его местом. Смотрим, на совпадения угла с ребром:<br/>
        Если совпадения нету (парень с завышенной самооценкой), то мы делаем алгоритм \"Нигде\" (3 пиф пафа).<br/>
        Если совпадение справа то делаем алгоритм \"Справа\"  (U\' R U\' R\' U\' R U2 R\')<br/>
        Если совпадение спереди делаем алгоритм \"Спереди\" (U R U R\' U2 R U R\')
        <br/><br/>

        4. Собираем <a href="rg2://ytplay?time=17:18&link=RukIJdEiOoI">верхний крест.</a>
        \"Палка\" или \"Галка\" (Бумеранг). Вот только алгоритмы чуть другие:<br/>
        1. \"Палка\" - делаем пиф паф и потом английский пиф паф. (R U R\' U\') (R\' F R F\')<br/>
        2. \"Галка\" (бумеранг) - делаем F (R U\' R\' U\' R U R\') F\'.
        <br/><br/>

        5. <a href="rg2://ytplay?time=20:03&link=RukIJdEiOoI">Переворчиваем углы,</a>
        двумя очень простыми алгоритмами: \"Камбрия\" или \"Колибри\".<br/>
        \"Колибри\" это \"Рыбка\" (R U R\' U) R U2 R\'<br/>
        \"Камбрия\" это \"Рыбка\" слева (L\' U\' L U\') L\' U2 L.<br/>
        Если выпали: \"Носик\", \"Ушки\", \"НТВ+\", \"Глазки\" или \"Вертолет\", то сначала делаем
        \"Колибри\", получаем или \"Колибри\" или \"Камбрию\". Аналогично ускорениям для
        моей методики, но я предпочитаю Акулу (Камбрию) делать через правую руку.
        <br/><br/>

        6. Сначала <a href="rg2://ytplay?time=23:16&link=RukIJdEiOoI">ставим на место углы</a>
        верхнего слоя. Смотрим если есть \"Фары\" (Глазки), если есть,
        то \"Фарами\" налево и делаем \"Палку\", а потом \"Галку\". Если нет \"Фар\", то сначала
        \"Галку\", а потом \"Палку\". Т.е. по сути делаем \"Запад\" или \"Австралию\".
        <br/><br/>

        7. <a href="rg2://ytplay?time=24:31&link=RukIJdEiOoI">Ставим на место ребра</a>
        верхнего слоя. По сути PLL \"Окошки\", ставим тройным блоком от себя
        и смотрим на ребро, котрое впереди. Если оно должно пойти направо, то делаем \"Камбрию\", потом \"Колибри\".
        Если налево, то сначла \"Колибри\", а потом \"Камбрию\".
        <br/><br/>

        <p>Теперь о преимуществах и недостатках данного метода:</p>

        <p><b>Начнем с плюсов:</b></p>
        <p>1. Первый крест собирается сразу на нижней грани, нет необходимости переворачивать
        кубик.</p>
        <p>2. Более правильная, по сравнению с классической методикой, последовательность выполнения этапов.
        Есть F2L, OLL и PLL (состоящий каждый из двух этапов).</p>
        <p>3. Более быстрые алгоритмы для решения 7-го этапа, чем куча пиф-пафов.</p>
        <p>4. Более простое определение расстановки углов и ребер последнего слоя (PLL этап).
        А также, их исполнение через алгоритмы предыдущих этапов.</p>

        <p><b>Минусы:</b></p>
        <p>1. Способ запоминания этих алгоритмов. Тут, наверно, стоит объяснить подробнее, почему я
        считаю картинки как крутить кубик, как в данном видео, минусом. И почему я не сделаю
        алгоритмы в программе картинками со стрелками, а предпочитаю буквенное обозначение алгоритмов
        или Максимкину терминологию.</p>

        <p>Дело здесь в физиологии человека. Все люди делятся на три типа по способу восприятия
        информации: Аудиалы (основной канал восприятия слух), Визуалы (основной канал зрение) и
        Кинестетики (основной канал тактильные ощущения).Так вот такие картинки помогут запомнить
        алгоритмы лишь визуалам, а для остальных они к сожалению бесполезны. Точнее, собрать то по ним аудиал
        с кинестетиком смогут, а вот запомнить алгоритм - только с очень большим трудом.</p>

        <p>Именно поэтому Максимкины истории с поездками в Лондом, пиф-пафами и т.п. запоминаются гораздо
        лучше, т.к. аудиалы запоминают текст, а визуалы представляют эти действия. Ну а кинестетики,
        как и в случае с картинками, запоминают алгоритмы руками, вращая кубик. Но если они подключают
        для запоминания и два других канала, то запоминаются они гораздо легче, чем просто выполняя
        алгоритмы.</p>

        <p>2. Много лишних действий. Я понимаю, что автор пытался визуализировать и сделать сборку
        более понятной, когда предложил сначала собирать крест на противоположной грани, а потом
        устанавливать элементы на свои места. И когда предложил сначала собирать второй слой, а только
        потом устанавливать на свои места углы первого слоя. Но на мой взгляд начинающему куберу вся
        эта наглядность не помогает, а только мешает. Зачем такие сложные F2L алгоритмы для постановки
        углов первого слоя? ИМХО \"пиф-пафы\" с \"Ромашками\" или интуитивные классические алгоритмы,
        в этом плане, гораздо предпочтительнее.</p>

        <p>Итого: Хорошая, скоростная методика сборки, особенно на последних этапах, но на мой взгляд,
        не совсем подходящая для начинающих.
        Если вы уже умеете собирать кубик по данной методике, то можете смело переходить к Ускорениям
        для начинающих, в которых приведены все семь крестовых OLL-алгоритмов, и только после этого
        переходить к F2L и PLL. Ну а потом, уже и к остальным OLL-алгоритмам.</p>

        P.S. Ваши отзывы и комментарии, пожалуйста, присылайте на почту
        <a href="mailto:rubicsguide@yandex.ru?subject=Методика%20А.Кима">rubicsguide@yandex.ru</a>.

        """;
    static const recomendation4_url = "RukIJdEiOoI";
}
