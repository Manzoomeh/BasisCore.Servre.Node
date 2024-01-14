alter PROCEDURE [dbo].[SbCallProcedure]
	
	 @fileNames nvarchar(200), 
	 @dmnid int ,
	 @sitesize int,
	 @command xml

AS
BEGIN

declare @page_il nvarchar(max)
if @fileNames = 'render.inc'
	set @page_il = '{"$type": "rawtext","core":"rawtext,"content": "<h1>hi this is a simple call test<h1>"}';
else if @fileNames = 'sourceAndRender.inc'
begin
	set @page_il = '{"$type": "group","core":"group",Commands:[{"$type":"inlinesource","core":"inlinesource","name":"view","Members":[{"name":"item","preview":"true","content":"<row valueID=\"12688722\" mid=\"20\" groupid=\"249\" prpid=\"8070\" usedforid=\"1255248\" typeid=\"150\" multi=\"0\" ord=\"699\" vocabulary=\"نام_تور_برنامه_ریزی_شده\" question=\"نام تور برنامه ریزی شده\" answer=\"تور استانبول\" /> <row valueID=\"12688725\" mid=\"20\" groupid=\"249\" prpid=\"8074\" usedforid=\"1255248\" typeid=\"140\" multi=\"0\" ord=\"779\" vocabulary=\"روزهای_رفت\" question=\"روزهای رفت\" answer=\"دوشنبه\" /><row valueID=\"12688726\" mid=\"20\" groupid=\"249\" prpid=\"8074\" usedforid=\"1255248\" typeid=\"140\" multi=\"0\" ord=\"779\" vocabulary=\"روزهای_رفت\" question=\"\" answer=\"سه شنبه\" /><row valueID=\"12688727\" mid=\"20\" groupid=\"249\" prpid=\"8074\" usedforid=\"1255248\" typeid=\"140\" multi=\"0\" ord=\"779\" vocabulary=\"روزهای_رفت\" question=\"\" answer=\"چهارشنبه\" /><row valueID=\"12688728\" mid=\"20\" groupid=\"249\" prpid=\"8074\" usedforid=\"1255248\" typeid=\"140\" multi=\"0\" ord=\"779\" vocabulary=\"روزهای_رفت\" question=\"\" answer=\"پنجشنبه\" /><row valueID=\"12688729\" mid=\"20\" groupid=\"249\" prpid=\"8074\" usedforid=\"1255248\" typeid=\"140\" multi=\"0\" ord=\"779\" vocabulary=\"روزهای_رفت\" question=\"\" answer=\"جمعه\" /><row valueID=\"12688730\" mid=\"20\" groupid=\"249\" prpid=\"8074\" usedforid=\"1255248\" typeid=\"140\" multi=\"0\" ord=\"779\" vocabulary=\"روزهای_رفت\" question=\"\" answer=\"شنبه\" /><row valueID=\"12688731\" mid=\"20\" groupid=\"249\" prpid=\"8074\" usedforid=\"1255248\" typeid=\"140\" multi=\"0\" ord=\"779\" vocabulary=\"روزهای_رفت\" question=\"\" answer=\"یکشنبه\" /><row valueID=\"12688732\" mid=\"20\" groupid=\"249\" prpid=\"8075\" usedforid=\"1255248\" typeid=\"140\" multi=\"0\" ord=\"799\" vocabulary=\"روزهای_برگشت\" question=\"روزهای برگشت\" answer=\"دوشنبه\" /> <row valueID=\"12688733\" mid=\"20\" groupid=\"249\" prpid=\"8075\" usedforid=\"1255248\" typeid=\"140\" multi=\"0\" ord=\"799\" vocabulary=\"روزهای_برگشت\" question=\"\" answer=\"سه شنبه\" /><row valueID=\"12688734\" mid=\"20\" groupid=\"249\" prpid=\"8075\" usedforid=\"1255248\" typeid=\"140\" multi=\"0\" ord=\"799\" vocabulary=\"روزهای_برگشت\" question=\"\" answer=\"چهارشنبه\" /> <row valueID=\"12688735\" mid=\"20\" groupid=\"249\" prpid=\"8075\" usedforid=\"1255248\" typeid=\"140\" multi=\"0\" ord=\"799\" vocabulary=\"روزهای_برگشت\" question=\"\" answer=\"پنجشنبه\" /> <row valueID=\"12688736\" mid=\"20\" groupid=\"249\" prpid=\"8075\" usedforid=\"1255248\" typeid=\"140\" multi=\"0\" ord=\"799\" vocabulary=\"روزهای_برگشت\" question=\"\" answer=\"جمعه\" /> <row valueID=\"12688737\" mid=\"20\" groupid=\"249\" prpid=\"8075\" usedforid=\"1255248\" typeid=\"140\" multi=\"0\" ord=\"799\" vocabulary=\"روزهای_برگشت\" question=\"\" answer=\"شنبه\" /><row valueID=\"12688738\" mid=\"20\" groupid=\"249\" prpid=\"8075\" usedforid=\"1255248\" typeid=\"140\" multi=\"0\" ord=\"799\" vocabulary=\"روزهای_برگشت\" question=\"\" answer=\"یکشنبه\" /><row valueID=\"12688723\" mid=\"20\" groupid=\"249\" prpid=\"8076\" usedforid=\"1255248\" typeid=\"128\" multi=\"0\" ord=\"739\" vocabulary=\"مدت_اقامت\" question=\"مدت اقامت\" answer=\"6 شب و 7 روز\" /><row valueID=\"12688724\" mid=\"20\" groupid=\"249\" prpid=\"8077\" usedforid=\"1255248\" typeid=\"128\" multi=\"0\" ord=\"759\" vocabulary=\"تاریخ_اعتبار\" question=\"تاریخ اعتبار\" answer=\"15MAR-28MAR\" /><row valueID=\"12688739\" mid=\"20\" groupid=\"249\" prpid=\"8080\" usedforid=\"1255248\" typeid=\"140\" multi=\"0\" ord=\"825\" vocabulary=\"خدمات\" question=\"خدمات\" answer=\"صبحانه\" /> <row valueID=\"12688740\" mid=\"20\" groupid=\"249\" prpid=\"8080\" usedforid=\"1255248\" typeid=\"140\" multi=\"0\" ord=\"825\" vocabulary=\"خدمات\" question=\"\" answer=\"ترانسفر فرودگاهی\" /><row valueID=\"12688741\" mid=\"20\" groupid=\"249\" prpid=\"8080\" usedforid=\"1255248\" typeid=\"140\" multi=\"0\" ord=\"825\" vocabulary=\"خدمات\" question=\"\" answer=\"گشت شهری با نهار\" /><row valueID=\"12688745\" mid=\"20\" groupid=\"249\" prpid=\"8082\" usedforid=\"1255248\" typeid=\"140\" multi=\"0\" ord=\"945\" vocabulary=\"محل_اقامت\" question=\"محل اقامت\" answer=\"هتل\" /><row valueID=\"12688746\" mid=\"20\" groupid=\"249\" prpid=\"8083\" usedforid=\"1255248\" typeid=\"140\" multi=\"0\" ord=\"965\" vocabulary=\"حمل_و_نقل\" question=\"حمل و نقل\" answer=\"هواپیما\" /> <row valueID=\"12688742\" mid=\"20\" groupid=\"249\" prpid=\"8087\" usedforid=\"1255248\" typeid=\"140\" multi=\"0\" ord=\"839\" vocabulary=\"نوع_پرواز\" question=\"نوع پرواز\" answer=\"چارتر\" /> <row valueID=\"12688743\" mid=\"20\" groupid=\"249\" prpid=\"8088\" usedforid=\"1255248\" typeid=\"140\" multi=\"0\" ord=\"859\" vocabulary=\"کلاس_پرواز\" question=\"کلاس پرواز\" answer=\"کلاس اقتصادی\" /><row valueID=\"12688744\" mid=\"20\" groupid=\"249\" prpid=\"8089\" usedforid=\"1255248\" typeid=\"140\" multi=\"0\" ord=\"879\" vocabulary=\"نوع_بلیط\" question=\"نوع بلیط\" answer=\"بلیط رفت و برگشت\" /><row valueID=\"12688750\" mid=\"20\" groupid=\"249\" prpid=\"8097\" usedforid=\"1255248\" typeid=\"144\" multi=\"1\" ord=\"1179\" vocabulary=\"توضیحات_تور\" question=\"توضیحات تور\" answer=\"نرخ نوزاد 200.000 تومان می باشد.\" /><row valueID=\"12748850\" mid=\"20\" groupid=\"249\" prpid=\"8181\" usedforid=\"1255248\" typeid=\"251\" multi=\"1\" ord=\"1199\" vocabulary=\"شروع_قیمت_ها_از_\" question=\"شروع قیمت ها از\" answer=\"1845000تومان\" /> "},{"name":"menu","preview":"true","content":"<row name=\"Home\" id=\"01\" parentid=\"00\" /><row name=\"Irantour\" id=\"02\" parentid=\"00\" /><row name=\"HotelReservation\" id=\"03\" parentid=\"00\" /><row name=\"Gallery\" id=\"04\" parentid=\"00\" /><row name=\"AboutUs\" id=\"05\" /><row name=\"culturalTours\" id=\"06\" parentid=\"02\" /><row name=\"ClimbingTour\" id=\"07\" parentid=\"02\" /><row name=\"PilgrimageTour\" id=\"08\" parentid=\"02\" /><row name=\"Esfahan\" id=\"09\" parentid=\"06\" /><row name=\"Shiraz\" id=\"10\" parentid=\"06\" /><row name=\"Kashan\" id=\"11\" parentid=\"09\" /><row name=\"NajafAbad\" id=\"12\" parentid=\"09\" /><row name=\"ShahinShar\" id=\"13\" parentid=\"09\" /><row name=\"Marvdasht\" id=\"14\" parentid=\"10\" /><row name=\"Kazeroon\" id=\"15\" parentid=\"10\" /><row name=\"Tehran\" id=\"16\" parentid=\"07\" /><row name=\"Lavasanat\" id=\"17\" parentid=\"16\" /><row name=\"Damavand\" id=\"18\" parentid=\"16\" /><row name=\"GholleDamavand\" id=\"19\" parentid=\"18\" /><row name=\"Khorasan\" id=\"20\" parentid=\"08\" /><row name=\"Ghom\" id=\"21\" parentid=\"08\" /><row name=\"KhorasanRasavi\" id=\"22\" parentid=\"20\" /><row name=\"KhorasanShomali\" id=\"23\" parentid=\"20\" /><row name=\"KhorasanJonoobi\" id=\"24\" parentid=\"20\" /><row name=\"Mashahad\" id=\"25\" parentid=\"22\" /><row name=\"Neyshbur\" id=\"26\" parentid=\"22\" /><row name=\"Hotels\" id=\"27\" parentid=\"03\" /><row name=\"ReservationForm\" id=\"28\" parentid=\"3\" /><row name=\"Iran\" id=\"29\" parentid=\"04\" /><row name=\"OurTours\" id=\"30\" parentid=\"04\" /><row name=\"VideoClips\" id=\"31\" parentid=\"04\" /><row name=\"ContactUs\" id=\"32\" parentid=\"05\" />"}]},{"$type":"Print","data-member-name":"view.item","layout-content":"<table width="500" border="1" id="@id"><tbody><tr> @child</tr></tbody></table>","else-layout-content":"محصولی موجود نیست","divider-content":"</tr><tr> ","divider-rowcount":2,"incomplete-content":"<td style="color:red">red</td>","faces":[{"name":"face1","replace":true,"function":true,"content":"<td style="color:green" id="usedforid"><p> @valueID @mid @groupid @prpid @usedforid @typeid @multi @ord<br></td>"}],"replaces":[{"tagname":"i","content":"<span style="color:red">@val1</span>"}]}]}'
	end
else if @fileNames = 'withCall.inc'
begin
	set @page_il ='{$type:"call",core:"call",source:"sourceAndRender.inc"}'
	end
select 
@fileNames as 'filename',
'<h1>hi</h1>' as content,
@page_il as page_il,
0 as pagesizeid,
12 as pageid,
case when isnull(@page_il,'')='' then 1 else 0 end as il_call 

END