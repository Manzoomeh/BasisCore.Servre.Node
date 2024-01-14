CREATE PROCEDURE [dbo].[cms]
        @params DBSourceParamCollection READONLY
AS
begin

        select * from @params
		union all
        select 'http','Expires', 'max-age=522280,public'
		union all
		select 'http','date',  'Tue, 21 Sep 2021 14:57:51 GMT'
        union all
		select 'http', 'Server', 'BasisCore 4.0.1' 
		--union all
		--select 'http', 'Set-Cookie', 'flavor=choco; SameSite=None; Secure' 
        union all
        select 'cms','content', ''
        union all
		select 'cms','page_il', '{"$type":"group","core":"group","name":"ROOT_GROUP","Commands":[{"$type":"rawtext","core":"rawtext","content":"<h1>-----------------------------call command - just render a simple text------------------------------------<h1>"},{"$type":"call","core":"call","FileName":"render.inc"},{"$type":"rawtext","core":"rawtext","content":"<h1>-----------------------------call command - source and render------------------------------------<h1>"},{"$type":"call","core":"call","FileName":"sourceAndRender.inc"},{"$type":"rawtext","core":"rawtext","content":"<h1>-----------------------------call command - call a group with call------------------------------------<h1>"},{"$type":"rawtext","core":"rawtext","content":"<h1>-----------------------------a group with inlinesource and render with print------------------------------------<h1>"},{"$type":"group","core":"group","name":"inlineSourceAndPrint","Commands":[{"$type":"inlinesource","core":"inlinesource","name":"view","Members":[{"name":"item","preview":"true","content":"<row valueID=\"12688722\" mid=\"20\" groupid=\"249\" prpid=\"8070\" usedforid=\"1255248\" typeid=\"150\" multi=\"0\" ord=\"699\" vocabulary=\"نام_تور_برنامه_ریزی_شده\" question=\"نام تور برنامه ریزی شده\" answer=\"تور استانبول\" /> \n        <row valueID=\"12688725\" mid=\"20\" groupid=\"249\" prpid=\"8074\" usedforid=\"1255248\" typeid=\"140\" multi=\"0\" ord=\"779\" vocabulary=\"روزهای_رفت\" question=\"روزهای رفت\" answer=\"دوشنبه\" />\n        <row valueID=\"12688726\" mid=\"20\" groupid=\"249\" prpid=\"8074\" usedforid=\"1255248\" typeid=\"140\" multi=\"0\" ord=\"779\" vocabulary=\"روزهای_رفت\" question=\"\" answer=\"سه شنبه\" />\n        <row valueID=\"12688727\" mid=\"20\" groupid=\"249\" prpid=\"8074\" usedforid=\"1255248\" typeid=\"140\" multi=\"0\" ord=\"779\" vocabulary=\"روزهای_رفت\" question=\"\" answer=\"چهارشنبه\" />\n        <row valueID=\"12688728\" mid=\"20\" groupid=\"249\" prpid=\"8074\" usedforid=\"1255248\" typeid=\"140\" multi=\"0\" ord=\"779\" vocabulary=\"روزهای_رفت\" question=\"\" answer=\"پنجشنبه\" />\n        <row valueID=\"12688729\" mid=\"20\" groupid=\"249\" prpid=\"8074\" usedforid=\"1255248\" typeid=\"140\" multi=\"0\" ord=\"779\" vocabulary=\"روزهای_رفت\" question=\"\" answer=\"جمعه\" />\n        <row valueID=\"12688730\" mid=\"20\" groupid=\"249\" prpid=\"8074\" usedforid=\"1255248\" typeid=\"140\" multi=\"0\" ord=\"779\" vocabulary=\"روزهای_رفت\" question=\"\" answer=\"شنبه\" />\n        <row valueID=\"12688731\" mid=\"20\" groupid=\"249\" prpid=\"8074\" usedforid=\"1255248\" typeid=\"140\" multi=\"0\" ord=\"779\" vocabulary=\"روزهای_رفت\" question=\"\" answer=\"یکشنبه\" />\n        <row valueID=\"12688732\" mid=\"20\" groupid=\"249\" prpid=\"8075\" usedforid=\"1255248\" typeid=\"140\" multi=\"0\" ord=\"799\" vocabulary=\"روزهای_برگشت\" question=\"روزهای برگشت\" answer=\"دوشنبه\" /> \n        <row valueID=\"12688733\" mid=\"20\" groupid=\"249\" prpid=\"8075\" usedforid=\"1255248\" typeid=\"140\" multi=\"0\" ord=\"799\" vocabulary=\"روزهای_برگشت\" question=\"\" answer=\"سه شنبه\" />\n        <row valueID=\"12688734\" mid=\"20\" groupid=\"249\" prpid=\"8075\" usedforid=\"1255248\" typeid=\"140\" multi=\"0\" ord=\"799\" vocabulary=\"روزهای_برگشت\" question=\"\" answer=\"چهارشنبه\" /> \n        <row valueID=\"12688735\" mid=\"20\" groupid=\"249\" prpid=\"8075\" usedforid=\"1255248\" typeid=\"140\" multi=\"0\" ord=\"799\" vocabulary=\"روزهای_برگشت\" question=\"\" answer=\"پنجشنبه\" /> \n        <row valueID=\"12688736\" mid=\"20\" groupid=\"249\" prpid=\"8075\" usedforid=\"1255248\" typeid=\"140\" multi=\"0\" ord=\"799\" vocabulary=\"روزهای_برگشت\" question=\"\" answer=\"جمعه\" /> \n        <row valueID=\"12688737\" mid=\"20\" groupid=\"249\" prpid=\"8075\" usedforid=\"1255248\" typeid=\"140\" multi=\"0\" ord=\"799\" vocabulary=\"روزهای_برگشت\" question=\"\" answer=\"شنبه\" />\n        <row valueID=\"12688738\" mid=\"20\" groupid=\"249\" prpid=\"8075\" usedforid=\"1255248\" typeid=\"140\" multi=\"0\" ord=\"799\" vocabulary=\"روزهای_برگشت\" question=\"\" answer=\"یکشنبه\" /> \n        <row valueID=\"12688723\" mid=\"20\" groupid=\"249\" prpid=\"8076\" usedforid=\"1255248\" typeid=\"128\" multi=\"0\" ord=\"739\" vocabulary=\"مدت_اقامت\" question=\"مدت اقامت\" answer=\"6 شب و 7 روز\" />\n        <row valueID=\"12688724\" mid=\"20\" groupid=\"249\" prpid=\"8077\" usedforid=\"1255248\" typeid=\"128\" multi=\"0\" ord=\"759\" vocabulary=\"تاریخ_اعتبار\" question=\"تاریخ اعتبار\" answer=\"15MAR-28MAR\" />\n        <row valueID=\"12688739\" mid=\"20\" groupid=\"249\" prpid=\"8080\" usedforid=\"1255248\" typeid=\"140\" multi=\"0\" ord=\"825\" vocabulary=\"خدمات\" question=\"خدمات\" answer=\"صبحانه\" /> \n        <row valueID=\"12688740\" mid=\"20\" groupid=\"249\" prpid=\"8080\" usedforid=\"1255248\" typeid=\"140\" multi=\"0\" ord=\"825\" vocabulary=\"خدمات\" question=\"\" answer=\"ترانسفر فرودگاهی\" />\n        <row valueID=\"12688741\" mid=\"20\" groupid=\"249\" prpid=\"8080\" usedforid=\"1255248\" typeid=\"140\" multi=\"0\" ord=\"825\" vocabulary=\"خدمات\" question=\"\" answer=\"گشت شهری با نهار\" /> \n        <row valueID=\"12688745\" mid=\"20\" groupid=\"249\" prpid=\"8082\" usedforid=\"1255248\" typeid=\"140\" multi=\"0\" ord=\"945\" vocabulary=\"محل_اقامت\" question=\"محل اقامت\" answer=\"هتل\" />\n        <row valueID=\"12688746\" mid=\"20\" groupid=\"249\" prpid=\"8083\" usedforid=\"1255248\" typeid=\"140\" multi=\"0\" ord=\"965\" vocabulary=\"حمل_و_نقل\" question=\"حمل و نقل\" answer=\"هواپیما\" /> \n        <row valueID=\"12688742\" mid=\"20\" groupid=\"249\" prpid=\"8087\" usedforid=\"1255248\" typeid=\"140\" multi=\"0\" ord=\"839\" vocabulary=\"نوع_پرواز\" question=\"نوع پرواز\" answer=\"چارتر\" /> \n        <row valueID=\"12688743\" mid=\"20\" groupid=\"249\" prpid=\"8088\" usedforid=\"1255248\" typeid=\"140\" multi=\"0\" ord=\"859\" vocabulary=\"کلاس_پرواز\" question=\"کلاس پرواز\" answer=\"کلاس اقتصادی\" />\n        <row valueID=\"12688744\" mid=\"20\" groupid=\"249\" prpid=\"8089\" usedforid=\"1255248\" typeid=\"140\" multi=\"0\" ord=\"879\" vocabulary=\"نوع_بلیط\" question=\"نوع بلیط\" answer=\"بلیط رفت و برگشت\" />\n        <row valueID=\"12688750\" mid=\"20\" groupid=\"249\" prpid=\"8097\" usedforid=\"1255248\" typeid=\"144\" multi=\"1\" ord=\"1179\" vocabulary=\"توضیحات_تور\" question=\"توضیحات تور\" answer=\"نرخ نوزاد 200.000 تومان می باشد.\" />\n        <row valueID=\"12748850\" mid=\"20\" groupid=\"249\" prpid=\"8181\" usedforid=\"1255248\" typeid=\"251\" multi=\"1\" ord=\"1199\" vocabulary=\"شروع_قیمت_ها_از_\" question=\"شروع قیمت ها از\" answer=\"1845000تومان\" /> "},{"name":"menu","preview":"true","content":"<row name=\"Home\" id=\"01\" parentid=\"00\" />\n      <row name=\"Irantour\" id=\"02\" parentid=\"00\" />\n      <row name=\"HotelReservation\" id=\"03\" parentid=\"00\" />\n      <row name=\"Gallery\" id=\"04\" parentid=\"00\" />\n      <row name=\"AboutUs\" id =\"05\" parentid=\"00\" />\n      <row name=\"culturalTours\" id=\"06\" parentid=\"02\" />\n      <row name =\"ClimbingTour\" id =\"07\" parentid=\"02\" />\n      <row name=\"PilgrimageTour\" id=\"08\" parentid=\"02\" />\n      <row name=\"Esfahan\" id=\"09\" parentid=\"06\" />\n      <row name=\"Shiraz\" id=\"10\" parentid=\"06\" />\n      <row name=\"Kashan\" id=\"11\" parentid=\"09\" />\n      <row name=\"NajafAbad\" id=\"12\" parentid=\"09\" />\n      <row name=\"ShahinShar\" id=\"13\" parentid=\"09\" />\n      <row name=\"Marvdasht\" id=\"14\" parentid=\"10\" />\n      <row name=\"Kazeroon\" id=\"15\" parentid=\"10\" />\n      <row name=\"Tehran\" id=\"16\" parentid=\"07\" />\n      <row name=\"Lavasanat\" id=\"17\" parentid=\"16\" />\n      <row name=\"Damavand\" id=\"18\" parentid=\"16\" />\n      <row name=\"GholleDamavand\" id=\"19\" parentid=\"18\" />\n      <row name=\"Khorasan\" id=\"20\" parentid=\"08\" />\n      <row name=\"Ghom\" id=\"21\" parentid=\"08\" />\n      <row name=\"KhorasanRasavi\" id=\"22\" parentid=\"20\" />\n      <row name=\"KhorasanShomali\" id=\"23\" parentid=\"20\" />\n      <row name=\"KhorasanJonoobi\" id=\"24\" parentid=\"20\" />\n      <row name=\"Mashahad\" id=\"25\" parentid=\"22\" />\n      <row name=\"Neyshbur\" id=\"26\" parentid=\"22\" />\n      <row name=\"Hotels\" id=\"27\" parentid=\"03\" />\n      <row name=\"ReservationForm\" id=\"28\" parentid=\"3\" />\n      <row name=\"Iran\" id=\"29\" parentid=\"04\" />\n      <row name=\"OurTours\" id=\"30\" parentid=\"04\" />\n      <row name=\"VideoClips\" id=\"31\" parentid=\"04\" />\n      <row name=\"ContactUs\" id=\"32\" parentid=\"05\" />"}]},{"$type":"Print","data-member-name":"view.menu","layout-content":"<table width="500" border="1" id="@id"><tbody><tr> @child</tr></tbody></table>","else-layout-content":"محصولی موجود نیست","divider-content":"</tr><tr> ","divider-rowcount":2,"incomplete-content":"<td style="color:red">red</td>","faces":[{"name":"face1","replace":true,"function":true,"content":"<td style="color:green" id="usedforid"><p> @name <br></td>"}],"replaces":[{"tagname":"i","content":"<span style="color:red">@val1</span>"}]},{"$type":"rawtext","core":"rawtext","content":"<h1>-----------------------------ilinesource print devider------------------------------------<h1>"},{"$type":"Print","core":"print","data-member-name":"view.item","layout-content":"<table width="500" border="1" id="@id"><tbody><tr> @child</tr></tbody></table>","else-layout-content":"محصولی موجود نیست","divider-content":"</tr><tr> ","divider-rowcount":2,"incomplete-content":"<td style="color:red">red</td>","faces":[{"name":"face1","replace":true,"function":true,"content":"<td style="color:green" id="usedforid"><p> @valueID @mid @groupid @prpid @usedforid @typeid @multi @ord<br></td>"}],"replaces":[{"tagname":"i","content":"<span style="color:red">@val1</span>"}]}]},{"$type":"rawtext","core":"rawtext","content":"<h1>-----------------------------this is a test for block-base feature; so until next end it must be empty------------------------------------<h1>"},{"$type":"Print","core":"print","data-member-name":"view.menu","layout-content":"<table width="500" border="1" id="@id"><tbody><tr> @child</tr></tbody></table>","else-layout-content":"محصولی موجود نیست","divider-content":"</tr><tr> ","divider-rowcount":2,"incomplete-content":"<td style="color:red">red</td>","faces":[{"name":"face1","replace":true,"function":true,"content":"<td style="color:green" id="usedforid"><p> @name <br></td>"}],"replaces":[{"tagname":"i","content":"<span style="color:red">@val1</span>"}]},{"$type":"rawtext","core":"rawtext","content":"<h1>-----------------------------end--------------------------------<h1>"},{"$type":"rawtext","core":"rawtext","content":"<h1>-----------------------------a group with  mysql dbsource and print--------------------------------<h1>"},{"$type":"group","core":"group","name":"dbsourceMySqlAndPrint","Commands":[{"$type":"dbsource","core":"dbsource","name":"test","source":"findProducts","extra-attribute":{"parentid":"0"},"Members":[{"name":"test","extra-attribute":{"type":"list","run":"atClient"}}]},{"$type":"Print","core":"print","data-member-name":"test.test","layout-content":"<table width="500" border="1"><tbody><tr> @child</tr></tbody></table>","else-layout-content":"محصولی موجود نیست","divider-content":"</tr><tr> ","divider-rowcount":2,"incomplete-content":"<td style="color:red">red</td>","faces":[{"name":"face1","replace":true,"function":true,"content":"<td style="color:green" id="usedforid"><p>{productName:@ProductName,price:@Price,Category:@Category,Manufacturer:@Manufacturer}<br></td>"}],"replaces":[{"tagname":"i","content":"<span style="color:red">@val1</span>"}]},{"$type":"rawtext","core":"rawtext","content":"<h1>-----------------------------until end must be empty--------------------------------<h1>"},{"$type":"Print","core":"print","data-member-name":"view.item","layout-content":"<table width="500" border="1" id="@id"><tbody><tr> @child</tr></tbody></table>","else-layout-content":"محصولی موجود نیست","divider-content":"</tr><tr> ","divider-rowcount":2,"incomplete-content":"<td style="color:red">red</td>","faces":[{"name":"face1","replace":true,"function":true,"content":"<td style="color:green" id="usedforid"><p> @valueID @mid @groupid @prpid @usedforid @typeid @multi @ord<br></td>"}],"replaces":[{"tagname":"i","content":"<span style="color:red">@val1</span>"}]},{"$type":"rawtext","core":"rawtext","content":"<h1>-----------------------------end--------------------------------<h1>"}]},{"$type":"rawtext","core":"rawtext","content":"<h1>-----------------------------group with a  mongodb dbsource and with tree call in group and same tree in root--------------------------------<h1>"},{"$type":"group","core":"group","name":"mongoTree","Commands":[{"$type":"dbsource","core":"dbsource","name":"test","source":"findObjects","extra-attribute":{"parentid":"0"},"Members":[{"name":"objects","extra-attribute":{"type":"list","run":"atClient"}}]},{"$type":"rawtext","core":"rawtext","content":"<h1>-----------------------------group with a  mongodb dbsource and a tree --------------------------------<h1>"},{"$type":"tree","core":"tree","data-member-name":"test.objects","null-value":"00","principal-key":"id","foreign-key":"parentid","layout-content":"<ul class=\"menu\">@child</ul>","faces":[{"level":"1","content":"<li><a>@name</a><ul>@child</ul></li>"},{"level":"3","content":"<li><a>@name</a><ul>@child</ul></li>"},{"level":"2","content":"<li><a>@name</a><ul></ul></li>"}]}]},{"$type":"rawtext","core":"rawtext","content":"<h1>-----------------------------a large rawtext for end--------------------------------<h1>"},{"$type":"rawtext","core":"rawtext","content":"<header>\n        <h1>خودروها</h1>\n        <p>به صفحه‌ای مخصوص خودروها خوش آمدید.</p>\n    </header>\n\n    <section>\n        <h2>معرفی خودروها</h2>\n        <p>\n            اینجا معلومات مختصری در مورد مختلف خودروها قابل مشاهده است. از خودروهای شهری گرفته تا خودروهای ورزشی و لوکس.\n        </p>\n\n        <article>\n            <h3>خودرو شهری</h3>\n            <p>\n                خودروهای شهری مناسب برای مسافرت درون شهری هستند. این خودروها معمولاً مصرف سوخت کمی دارند و راحتی در رانندگی در شرایط ترافیکی را فراهم می‌کنند.\n            </p>\n        </article>\n\n        <article>\n            <h3>خودروهای ورزشی</h3>\n            <p>\n                اگر به دنبال تجربه‌ی رانندگی هیجان‌انگیز هستید، خودروهای ورزشی با قابلیت‌ها و طراحی خاص مناسب شما هستند. این خودروها عمدتاً برای سرعت و عملکرد بالا طراحی شده‌اند.\n            </p>\n        </article>\n\n        <!-- ادامه معرفی خودروها -->\n    </section>\n\n    <footer>\n        <p>صفحه اختصاصی خودروها به وسیله‌ی توسعه‌دهنده Node.js و Ubuntu، با استفاده از TypeScript، Docker، SQL، MongoDB، و Redis ایجاد شده است.</p>\n    </footer>"}]}'
        union all
		select 'cms','il_call',  'true'
        union all
		select 'cms','pagesizeid', NULL
        union all
        select 'cms' , 'pageurl' , NULL        
        union all
		select 'cms' , 'useragent' , 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:106.0) Gecko/20100101 Firefox/106.0'        
        union all
		select 'cms' , 'pageid' , '1449860'
        union all
        select 'cms'  , 'dmnid' , '4449'
		union all
        select 'cms'  , 'domainid' , '4449'
        union all
		select 'cms'  , 'ownerid' , '7631'
        union all
        select 'cms'  , 'link_page' , NULL                
        union all
        select 'cms', 'PhysicalPath', '\192.168.96.2'
		union all
        select 'cms', 'temppath', '\192.168.96.2	emp'
		union all
        select 'cms', 'cdn', '//cdn1.basiscore.net/digitalents.ir'
        --select 'cms', 'cdn', case when @saas=0 then @cdn when @saas=1 and @activecache_cdn=1 then @cdn else 'http'+@s+'://'+ @www +  @Domainname end
		union all
		select 'cms', 'agentnumber', '0'
		union all
		select 'cms', 'page_index', NULL
        union all
        --select * from @temp
        --union all
		select 'cms','random',NULL
		union all
		select 'cms', 'defaultpath', '\192.168.96.2' 
		union all
		select 'webserver', 'index', '1'
		union all
		select 'webserver', 'gzip', 'false'    
		union all
		select 'webserver', 'chunked', 'false'    
		union all
		select 'webserver', 'chunksize', '0'
		union all
		select 'webserver', 'etag', '"OmXi"'
		union all
		select 'webserver', 'lastmodified', 'Sat, 22 Aug 2020 10:35:56 GMT'
		union all
		select 'http', 'Cache-Control', 'public,max-age=522280'
		union all
		--select * from @agentinfo
		--union all
		--select 'webserver', 'cachecontrol', case when @cachecontrol>-1 then 'public,'+'max-age='+@cachecontrol  else @cachecontrol end        
		--union all
		select 'webserver', 'mime', 'text/html; charset=UTF-8'
		union all
		select 'webserver', 'headercode', '200 Ok'    
		union all
		select 'webserver', 'filepath', 'D:ProgrammingFalsafiNodeWebServerwwwrootmain.js'
		union all
		select 'webserver', 'id', '1449860'  
		union all
		select 'webserver', 'domain', 'digitalents.ir'
		union all
		select 'webserver', 'FileContent', NULL    
		union all
		select 'webserver', 'cookie', NULL 
		union all
		select 'webserver', 'debug', 'false'
		union all
        select 'index4' , 'source' , NULL 
		union all
        select 'index4' , 'destination' , NULL    
		union all
		select 'index4' , 'properties' , '{"deform":true}'
		union all
        select 'index4' , 'size' , NULL 		   
		union all
		select 'index4' , 'zippath' , NULL   
		union all 
		------------------Edited by MJ - 97-09-13 ---------------------------------------------------------------
		--select 'cms','showcmserror',case when @debug=1 then 'true' else 'false' end
		select 'cms','showcmserror','true'
		union all 
		---------------------Added By MJ - 97-08-27 -------------------------------
		select 'http','X-XSS-Protection','1; mode=block'
		union all 
		---------------------------------------------------------------------------
		--select 'webserver','savehtml','{"name":"'+convert(nvarchar(50),@idpagecache)+'","path":"'+replace(@defultPath+@cachepath,'','\')+'\cache\","mime":"'+@mimetype+'"}'
		--select 'webserver','savehtml','{"name":"'+convert(nvarchar(50),@idpagecache)+'","path":"'+replace(@defultPath+@cachepath,'','\')+case when @usesitesize='true' then '\cache\'+convert(varchar(10),@domainsizeid)+'\' else '\cache\' end+'","mime":"'+@mimetype+'"}'
		select 'webserver','savehtml', NULL
		union all 
		select 'webserver','export',''
		
		
		




		end