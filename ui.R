
ui<- navbarPage(title=strong(HTML("<span style='font-size:24px'>Лісові екосистеми Чорнобильської зони відчуження</span>")), # id="nav",
                windowTitle = "Ліси Чорнобиля",
                
                tabPanel(strong(HTML("<span style='font-size:16px'>Динаміка лісового покриву (1986-2018)</span>")),
                         icon= icon("tree"),
                         div(class="outer",
                             
                             tags$head(
                               # Include our custom CSS
                               includeCSS("styles.css")
                             ),
                             
                             
                             leafletOutput("map1", width="100%", height="100%"),
                             
                             
                             
                             absolutePanel(id = "controls", class = "panel panel-default", fixed = TRUE,
                                           draggable = TRUE, top = 330, left = "auto", right = 50, bottom = 1,
                                           width = 520, height = 510,
                                           
                                           h4(align = 'center', "Зміни лісового покриву за період 1986-2018 рр."),
                                           
                                           h5("Карти щільного лісового покриву побудовано на основі мультиспектральних
                                              космічних знімків Landsat та класифікаційної моделі Random Forest.
                                              Просторове розрізнення (розмір пікселя) растрових зображень понижено до
                                              60х60 м. Головними чинниками збільшення площі лісів були природні
                                              сукцесії на покинутих с/г угіддях."),
                                           
                                           
                                           column(width = 12, align="center", 

                                                  div(id="cite2", "Зміни наземного покриву у межах Чорнобильської зони відчуження за 1986-2018 рр.: "),
                                                  img(src = 'burned.jpg', 
                                                      width= "458px"))
                                           
                                           
                                           ),
                             
                             
                             
                             
                             tags$div(id="cite",
                                      a(img(src='researchgate.svg', width= "60px"), target="_blank", href="https://www.researchgate.net/profile/Maksym_Matsala")),
                             
                             tags$div(id="cite5",
                                      a(img(src='scopus.png', width= "120px"), target="_blank", href="https://www.scopus.com/authid/detail.uri?authorId=57208823347"))
                             
                             )
                         
                         ),
                
                tabPanel(strong(HTML("<span style='font-size:16px'>Екосистемні порушення лісів ЧЗВ</span>")),
                         icon= icon("fire"),
                         div(class="outer",
                             
                             tags$head(
                                #Include our custom CSS
                               includeCSS("styles.css")
                             ),
                             
                             # If not using custom CSS, set height of leafletOutput to a number instead of percent
                             leafletOutput("map2", width="100%", height="100%"),
                             absolutePanel(id = "controls", class = "panel panel-default", fixed = TRUE,
                                           draggable = TRUE, top = 280, left = "auto", right = 50, bottom = 1,
                                           width = 520, height = 580,
                                           
                                           h4(align = 'center', div(style = 'color:red', "УВАГА! МАПА У ТЕСТОВОМУ РЕЖИМІ!")),
                                           h4(align = 'center', "Природні порушення (драйвери змін) у лісах ЧЗВ"),
                                           
                                           h5("Природні порушення лісів - невід'ємна частина динаміки лісів. Їхні карти 
                                              побудовано на основі алгоритму LandTrendr (темпоральна
                                              сегментація часових серій супутникових знімків Landsat). Класифікація
                                              чинників порушень за моделлю Random Forest. Основою для моделювання
                                              виступали спектральні показники Normalized Burn Ratio та ландшафтні
                                              метрики."),
                                           
                                           
                                           column(width = 12, align="center", 
                                                  
                                                  div(id="cite2", "Динаміка екосистемних порушень лісів"),
                                                  img(src = 'disturb.jpg', 
                                                      width= "458px"))
                                           
                                           
                             ),
                             
                             tags$div(id="cite",
                                      a(img(src='researchgate.svg', width= "60px"), target="_blank", href="https://www.researchgate.net/profile/Maksym_Matsala")),
                             
                             tags$div(id="cite5",
                                      a(img(src='scopus.png', width= "120px"), target="_blank", href="https://www.scopus.com/authid/detail.uri?authorId=57208823347"))
                             
                         ), 
                conditionalPanel("false", icon("crosshairs"))
                )
)

