-- Deploy hpms_geocode:city_abbrevs to pg
-- requires: appschema
-- requires: counties_fips

BEGIN;

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

SET search_path = geocoding, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

create table city_abbrev (
 id serial primary key,
 name varchar(256) unique,
 abbrev varchar(10) unique,
 incorp_date date,
 district numeric,
 county_abbrev varchar(8),
 urban_area varchar(8),
 caltrans_city_code varchar(8)
);

insert into city_abbrev
(name,abbrev,incorp_date,district,county_abbrev,urban_area,caltrans_city_code)
values
('Adelanto','Adel','12/22/1970',8,'SBd','3115','5408'),
('Agoura Hills','AgrH','12/8/1982',7,'LA','3201','5435'),
('Alameda','Ala','4/19/1854',4,'Ala','3072','5014'),
('Albany','Alb','9/22/1908',4,'Ala','3072','5178'),
('Alhambra','Alh','7/11/1903',7,'LA','3041','5130'),
('Aliso Viejo','AsVj','7/1/2001',12,'Ora','3200','5480'),
('Alturas','Alt','9/16/1901',2,'Mod',NULL,'5120'),
('Amador','Ama','6/2/1915',10,'Ama',NULL,'5228'),
('American Canyon','AmCn','1/1/1992',4,'Nap','3208','5470'),
('Anaheim','Ana','3/18/1876',12,'Ora','3041','5055'),
('Anderson','And','1/16/1956',2,'Sha','3063','5321'),
('Angels Camp','Ang','1/24/1912',10,'Cal',NULL,'5206'),
('Antioch','Ant','2/6/1872',4,'CC','3001','5038'),
('Apple Valley (Town)','AplV','11/28/1988',8,'SBd','3115','5453'),
('Arcadia','Ada','8/5/1903',7,'LA','3041','5131'),
('Arcata','Arc','2/2/1858',1,'Hum','3002','5021'),
('Arroyo Grande','ArGd','7/10/1911',5,'SLO',NULL,'5199'),
('Artesia','Art','5/29/1959',7,'LA','3041','5355'),
('Arvin','Arv','12/21/1960',6,'Ker','3003','5370'),
('Atascadero','Atas','7/2/1979',5,'SLO','3004','5423'),
('Atherton (Town)','Atn','9/12/1923',4,'SM','3072','5261'),
('Atwater','Atw','8/16/1922',10,'Mer','3046','5254'),
('Auburn','Aub','5/2/1888',3,'Pla','3067','5077'),
('Avalon','Ava','6/26/1913',7,'LA',NULL,'5219'),
('Avenal','Avnl','9/11/1979',6,'Kin','3176','5424'),
('Azusa','Azu','12/29/1898',7,'LA','3041','5112'),
('Bakersfield','Bkd','1/11/1898',6,'Ker','3007','5109'),
('Baldwin Park','BwP','1/25/1956',7,'LA','3041','5323'),
('Banning','Ban','2/6/1913',8,'Riv','3069','5214'),
('Barstow','Bsw','9/30/1947',8,'SBd','3009','5298'),
('Beaumont','Bau','11/18/1912',8,'Riv','3069','5209'),
('Bell','Bell','11/7/1927',7,'LA','3041','5272'),
('Bell Gardens','BGdn','8/1/1961',7,'LA','3041','5373'),
('Bellflower','Bfl','9/3/1957',7,'LA','3041','5348'),
('Belmont','Bmt','10/29/1926',4,'SM','3072','5268'),
('Belvedere','Blv','12/24/1896',4,'Mrn','3205','5105'),
('Benicia','Ben','3/27/1850',4,'Sol','3208','5003'),
('Berkeley','Ber','4/4/1878',4,'Ala','3072','5057'),
('Beverly Hills','BvHs','1/28/1914',7,'LA','3041','5221'),
('Big Bear Lake','BBL','11/28/1980',8,'SBd','3119','5426'),
('Biggs','Big','6/26/1903',3,'But',NULL,'5128'),
('Bishop','Bis','5/6/1903',9,'Iny',NULL,'5125'),
('Blue Lake','BLk','4/23/1910',1,'Hum',NULL,'5190'),
('Blythe','Bly','7/21/1916',8,'Riv','3011','5233'),
('Bradbury','Bby','7/26/1957',7,'LA','3041','5344'),
('Brawley','Brw','4/6/1908',11,'Imp','3012','5167'),
('Brea','Bre','2/23/1917',12,'Ora','3041','5237'),
('Brentwood','Btwd','1/21/1948',4,'CC','3001','5300'),
('Brisbane','Bsbn','11/27/1961',4,'SM','3072','5376'),
('Buellton','Bltn','2/1/1992',5,'SB',NULL,'5471'),
('Buena Park','BPk','1/27/1953',12,'Ora','3041','5310'),
('Burbank','Brb','7/8/1911',7,'LA','3041','5200'),
('Burlingame','Burl','6/6/1908',4,'SM','3072','5171'),
('Calabasas','Cal','4/5/1991',7,'LA','3201','5463'),
('Calexico','Clx','4/16/1908',11,'Imp','3013','5168'),
('California City','CalC','12/10/1965',6,'Ker','3179','5399'),
('Calimesa','Cmsa','12/1/1990',8,'Riv','3069','5460'),
('Calipatria','Clp','2/28/1919',11,'Imp',NULL,'5243'),
('Calistoga','Csta','1/6/1886',4,'Nap',NULL,'5061'),
('Camarillo','Cmrl','10/22/1964',7,'Ven','3204','5393'),
('Campbell','Cmb','3/28/1952',4,'SCl','3047','5306'),
('Canyon Lake','CnLk','12/1/1990',8,'Riv','3202','5461'),
('Capitola','Cptl','1/11/1949',5,'SCr','3076','5304'),
('Carlsbad','Cbd','7/16/1952',11,'SD','3071','5308'),
('Carmel (Carmel-by-the-Sea)','Cml','10/31/1916',5,'Mon','3049','5234'),
('Carpinteria','Carp','9/28/1965',5,'SB','3075','5397'),
('Carson','Crsn','2/20/1968',7,'LA','3041','5403'),
('Cathedral City','CthC','11/16/1981',8,'Riv','3033','5430'),
('Ceres','Cer','2/25/1918',10,'Sta','3048','5241'),
('Cerritos','Crts','4/24/1956',7,'LA','3041','5325'),
('Chico','Chc','1/8/1872',3,'But','3014','5037'),
('Chino','Chn','2/28/1910',8,'SBd','3041','5188'),
('Chino Hills','ChnH','12/1/1991',8,'SBd','3041','5467'),
('Chowchilla','Chw','2/7/1923',6,'Mad','3171','5258'),
('Chula Vista','ChV','11/28/1911',11,'SD','3071','5203'),
('Citrus Heights','CHts','1/1/1997',3,'Sac','3067','5475'),
('Claremont','Cla','10/3/1907',7,'LA','3041','5162'),
('Clayton','Cytn','3/18/1964',4,'CC','3199','5386'),
('Clearlake','Cllk','11/14/1980',1,'Lak','3181','5427'),
('Cloverdale','Clvd','2/28/1872',4,'Son',NULL,'5039'),
('Clovis','Clo','2/27/1912',6,'Fre','3026','5208'),
('Coachella','Coa','12/13/1946',8,'Riv','3033','5294'),
('Coalinga','Clng','4/3/1906',6,'Fre','3016','5146'),
('Colfax','Cfx','2/23/1910',3,'Pla',NULL,'5187'),
('Colma (Town)','Clm','8/5/1924',4,'SM','3072','5264'),
('Colton','Col','7/11/1887',8,'SBd','3069','5065'),
('Colusa','Clu','6/16/1868',3,'Col',NULL,'5035'),
('Commerce','Cmrc','1/28/1960',7,'LA','3041','5362'),
('Compton','Com','5/11/1888',7,'LA','3041','5078'),
('Concord','Cnd','2/9/1905',4,'CC','3199','5135'),
('Corcoran','Crcn','8/11/1914',6,'Kin','3106','5223'),
('Corning','Cng','8/6/1907',2,'Teh','3182','5161'),
('Corona','Cor','7/13/1896',8,'Riv','3069','5104'),
('Coronado','Cord','12/11/1890',11,'SD','3071','5090'),
('Corte Madera (Town)','CMad','6/10/1916',4,'Mrn','3205','5232'),
('Costa Mesa','CMs','6/29/1953',12,'Ora','3041','5312'),
('Cotati','Coti','7/16/1963',4,'Son','3079','5383'),
('Covina','Cov','8/14/1901',7,'LA','3041','5118'),
('Crescent City','CrC','4/13/1854',1,'DN',NULL,'5013'),
('Cudahy','Cdhy','11/10/1960',7,'LA','3041','5369'),
('Culver City','ClC','9/7/1917',7,'LA','3041','5240'),
('Cupertino','Cpo','10/10/1955',4,'SCl','3047','5318'),
('Cypress','Cyp','7/24/1956',12,'Ora','3041','5330'),
('Daly City','DlC','3/22/1911',4,'SM','3072','5196'),
('Dana Point','DaPt','1/1/1989',12,'Ora','3200','5454'),
('Danville (Town)','Dnvl','7/1/1982',4,'CC','3199','5434'),
('Davis','Dvs','3/28/1917',3,'Yol','3019','5238'),
('Del Mar','DlMr','7/15/1959',11,'SD','3071','5356'),
('Del Rey Oaks','DRO','9/3/1953',5,'Mon','3049','5313'),
('Delano','Dln','4/13/1915',6,'Ker','3020','5227'),
('Desert Hot Springs','DHSp','9/25/1963',8,'Riv','3149','5384'),
('Diamond Bar','DmBr','4/18/1989',7,'LA','3041','5455'),
('Dinuba','Dba','1/6/1906',6,'Tul','3021','5143'),
('Dixon','Dxn','3/30/1878',4,'Sol','3152','5056'),
('Dorris','Drs','12/23/1908',2,'Sis',NULL,'5179'),
('Dos Palos','Dpls','5/24/1935',10,'Mer',NULL,'5279'),
('Downey','Dny','12/17/1956',7,'LA','3041','5334'),
('Duarte','Drt','8/22/1957',7,'LA','3041','5346'),
('Dublin','Dbln','2/1/1982',4,'Ala','3199','5432'),
('Dunsmuir','Dmr','8/7/1909',2,'Sis',NULL,'5183'),
('East Palo Alto','EPAo','7/1/1983',4,'SM','3072','5438'),
('Eastvale','EAST','10/1/2010',8,'Riv','3069','5486'),
('El Cajon','ECj','11/12/1912',11,'SD','3071','5211'),
('El Centro','ECn','4/16/1908',11,'Imp','3022','5169'),
('El Cerrito','ECr','8/23/1917',4,'CC','3072','5239'),
('El Monte','EMte','11/18/1912',7,'LA','3041','5210'),
('El Segundo','ESeg','1/18/1917',7,'LA','3041','5235'),
('Elk Grove','ElkG','7/1/2000',3,'Sac','3067','5479'),
('Emeryville','Emv','12/8/1896',4,'Ala','3072','5106'),
('Encinitas','Ents','10/1/1986',11,'SD','3071','5446'),
('Escalon','Esl','3/12/1957',10,'SJ',NULL,'5337'),
('Escondido','Esd','10/8/1888',11,'SD','3071','5081'),
('Etna','Etn','3/13/1878',2,'Sis',NULL,'5054'),
('Eureka','Eur','4/18/1856',1,'Hum','3024','5017'),
('Exeter','Exr','3/2/1911',6,'Tul','3092','5195'),
('Fairfax (Town)','Frfx','3/2/1931',4,'Mrn','3205','5277'),
('Fairfield','Frfd','12/12/1903',4,'Sol','3025','5132'),
('Farmersville','Fmvl','10/5/1960',6,'Tul','3092','5368'),
('Ferndale','Fer','8/28/1893',1,'Hum',NULL,'5097'),
('Fillmore','Fil','7/10/1914',7,'Ven','3107','5222'),
('Firebaugh','Fir','9/17/1914',6,'Fre',NULL,'5224'),
('Folsom','Fol','4/20/1946',3,'Sac','3067','5288'),
('Fontana','Fna','6/25/1952',8,'SBd','3069','5307'),
('Fort Bragg','FBg','8/5/1889',1,'Men','3118','5088'),
('Fort Jones (Town)','FJn','3/16/1872',2,'Sis',NULL,'5040'),
('Fortuna','Fta','1/20/1906',1,'Hum','3128','5145'),
('Foster City','FstC','4/27/1971',4,'SM','3072','5409'),
('Fountain Valley','FnV','6/13/1957',12,'Ora','3041','5341'),
('Fowler','Fow','6/15/1908',6,'Fre',NULL,'5173'),
('Fremont','Fmt','1/23/1956',4,'Ala','3072','5322'),
('Fresno','Fre','10/12/1885',6,'Fre','3026','5060'),
('Fullerton','Ful','2/15/1904',12,'Ora','3041','5133'),
('Galt','Gal','8/16/1946',3,'Sac','3039','5293'),
('Garden Grove','GGr','6/18/1956',12,'Ora','3041','5328'),
('Gardena','Gar','9/11/1930',7,'LA','3041','5276'),
('Gilroy','Gil','3/12/1870',4,'SCl','3027','5034'),
('Glendale','Gndl','2/15/1906',7,'LA','3041','5144'),
('Glendora','Gdr','11/13/1911',7,'LA','3041','5204'),
('Goleta','Glta','2/1/2002',5,'SB','3075','5481'),
('Gonzales','Gnz','1/14/1947',5,'Mon',NULL,'5296'),
('Grand Terrace','GrTr','11/30/1978',8,'SBd','3069','5421'),
('Grass Valley','GVy','3/13/1893',3,'Nev','3028','5023'),
('Greenfield','Gnfd','1/7/1947',5,'Mon','3186','5295'),
('Gridley','Grd','11/23/1905',3,'But',NULL,'5140'),
('Grover Beach','GrC','12/21/1959',5,'SLO',NULL,'5359'),
('Guadalupe','Gdlp','8/3/1946',5,'SB','3145','5292'),
('Gustine','Gus','11/11/1915',10,'Mer',NULL,'5230'),
('Half Moon Bay','HMBy','7/15/1959',4,'SM',NULL,'5357'),
('Hanford','Han','8/12/1891',6,'Kin','3030','5091'),
('Hawaiian Gardens','HGdn','4/9/1964',7,'LA','3041','5387'),
('Hawthorne','Haw','7/12/1922',7,'LA','3041','5253'),
('Hayward','Hay','3/11/1876',4,'Ala','3072','5050'),
('Healdsburg','Hlbg','2/20/1867',4,'Son','3079','5027'),
('Hemet','Hem','1/20/1910',8,'Riv','3031','5186'),
('Hercules','Her','12/15/1900',4,'CC','3072','5117'),
('Hermosa Beach','HmB','1/14/1907',7,'LA','3041','5155'),
('Hesperia','Hes','7/1/1988',8,'SBd','3115','5452'),
('Hidden Hills','HidH','10/19/1961',7,'LA','3041','5374'),
('Highland','High','11/24/1987',8,'SBd','3069','5449'),
('Hillsborough (Town)','Hil','5/5/1910',4,'SM','3072','5191'),
('Hollister','Hst','3/26/1872',5,'SBt','3032','5047'),
('Holtville','Holt','7/1/1908',11,'Imp',NULL,'5174'),
('Hughson','Husn','12/9/1972',10,'Sta','3048','5411'),
('Huntington Beach','HntB','2/17/1909',12,'Ora','3041','5181'),
('Huntington Park','HntP','9/1/1906',7,'LA','3041','5150'),
('Huron','Hrn','5/3/1951',6,'Fre',NULL,'5305'),
('Imperial','Imp','7/12/1904',11,'Imp','3022','5134'),
('Imperial Beach','ImB','7/18/1956',11,'SD','3071','5329'),
('Indian Wells','IndW','7/14/1967',8,'Riv','3033','5401'),
('Indio','Ind','5/16/1930',8,'Riv','3033','5275'),
('Industry','Idy','6/18/1957',7,'LA','3041','5342'),
('Inglewood','Ing','2/7/1908',7,'LA','3041','5164'),
('Ione','Ion','3/23/1953',10,'Ama','3187','5311'),
('Irvine','Irvn','12/28/1971',12,'Ora','3200','5410'),
('Irwindale','Irw','8/6/1957',7,'LA','3041','5345'),
('Isleton','Ist','5/14/1923',3,'Sac',NULL,'5260'),
('Jackson','Jkn','12/5/1905',10,'Ama',NULL,'5141'),
('Jurupa Valley','JrpV','7/1/2011',8,'Riv',NULL,'3069'),
('Kerman','Kmn','7/2/1946',6,'Fre','3188','5291'),
('King City','KnC','2/9/1911',5,'Mon','3146','5194'),
('Kingsburg','Kngb','5/29/1908',6,'Fre','3160','5170'),
('La Canada Flintridge','LCF','11/30/1976',7,'LA','3041','5417'),
('La Habra','LHb','1/20/1925',12,'Ora','3041','5266'),
('La Habra Heights','LHHs','12/4/1978',7,'LA','3041','5422'),
('La Mesa','LMsa','2/16/1912',11,'SD','3071','5207'),
('La Mirada','LMrd','3/23/1960',7,'LA','3041','5364'),
('La Palma','LPma','10/26/1955',12,'Ora','3041','5319'),
('La Puente','LPu','8/1/1956',7,'LA','3041','5331'),
('La Quinta','LQnt','5/1/1982',8,'Riv','3033','5433'),
('La Verne','LVn','8/20/1906',7,'LA','3041','5149'),
('Lafayette','Lfyt','7/29/1968',4,'CC','3199','5404'),
('Laguna Beach','LgnB','6/29/1927',12,'Ora','3200','5270'),
('Laguna Hills','LgnH','12/20/1991',12,'Ora','3200','5468'),
('Laguna Niguel','LgNg','12/1/1989',12,'Ora','3200','5458'),
('Laguna Woods','LgnW','3/24/1999',12,'Ora','3200','5476'),
('Lake Elsinore','Esn','4/9/1888',8,'Riv','3202','5074'),
('Lake Forest','LkFr','12/20/1991',12,'Ora','3200','5469'),
('Lakeport','Lkpt','4/30/1888',1,'Lak',NULL,'5076'),
('Lakewood','Lkw','4/16/1954',7,'LA','3041','5315'),
('Lancaster','Lan','11/22/1977',7,'LA','3055','5419'),
('Larkspur','Lksp','3/1/1908',4,'Mrn','3205','5166'),
('Lathrop','Ltrp','7/1/1989',10,'SJ','3083','5456'),
('Lawndale','Lndl','12/28/1959',7,'LA','3041','5360'),
('Lemon Grove','LmGr','7/1/1977',11,'SD','3071','5418'),
('Lemoore','Lem','7/4/1900',6,'Kin','3117','5115'),
('Lincoln','Lncn','8/7/1890',3,'Pla','3135','5089'),
('Lindsay','Lnsy','2/28/1910',6,'Tul','3037','5189'),
('Live Oak','LiO','1/22/1947',3,'Sut',NULL,'5297'),
('Livermore','Lvmr','4/1/1876',4,'Ala','3206','5053'),
('Livingston','Lvtn','9/11/1922',10,'Mer','3155','5256'),
('Lodi','Lod','12/6/1906',10,'SJ','3039','5154'),
('Loma Linda','LmLn','9/29/1970',8,'SBd','3069','5407'),
('Lomita','Lmta','6/30/1964',7,'LA','3041','5389'),
('Lompoc','Lom','8/13/1888',5,'SB','3040','5080'),
('Long Beach','LBch','12/13/1897',7,'LA','3041','5108'),
('Loomis (Town)','Lms','12/17/1984',3,'Pla','3067','5442'),
('Los Alamitos','LAlm','3/1/1960',12,'Ora','3041','5363'),
('Los Altos','LAts','12/1/1952',4,'SCl','3047','5309'),
('Los Altos Hills (Town)','LAH','1/27/1956',4,'SCl','3047','5324'),
('Los Angeles','LA','4/4/1850',7,'LA','3041','5006'),
('Los Banos','LBns','5/8/1907',10,'Mer','3042','5160'),
('Los Gatos (Town)','LGts','8/10/1887',4,'SCl','3047','5067'),
('Loyalton','Loy','8/21/1901',3,'Sie',NULL,'5119'),
('Lynwood','Lyn','7/21/1921',7,'LA','3041','5250'),
('Madera','Mad','3/27/1907',6,'Mad','3043','5157'),
('Malibu','Mal','3/28/1991',7,'LA','3041','5462'),
('Mammoth Lakes (Town)','MmLk','8/20/1984',9,'Mno',NULL,'5439'),
('Manhattan Beach','ManB','12/12/1912',7,'LA','3041','5212'),
('Manteca','Mtca','6/5/1918',10,'SJ','3044','5242'),
('Maricopa','Mcp','7/25/1911',6,'Ker',NULL,'5201'),
('Marina','Mrna','11/13/1975',5,'Mon','3049','5416'),
('Martinez','Mtz','4/1/1876',4,'CC','3199','5024'),
('Marysville','Mvl','2/5/1851',3,'Yub','3045','5009'),
('Maywood','Myd','9/2/1924',7,'LA','3041','5265'),
('McFarland','McF','7/18/1957',6,'Ker','3172','5343'),
('Mendota','Mda','6/17/1942',6,'Fre','3166','5285'),
('Menifee','Mnfe','10/1/2008',8,'Riv',NULL,'5483'),
('Menlo Park','MlP','11/23/1927',4,'SM','3072','5273'),
('Merced','Mer','4/1/1889',10,'Mer','3046','5085'),
('Mill Valley','MlV','9/1/1900',4,'Mrn','3205','5113'),
('Millbrae','Mlbr','1/14/1948',4,'SM','3072','5299'),
('Milpitas','Mps','1/26/1954',4,'SCl','3047','5314'),
('Mission Viejo','MsnV','3/31/1988',12,'Ora','3200','5451'),
('Modesto','Mod','8/6/1884',10,'Sta','3048','5059'),
('Monrovia','Mnro','12/15/1887',7,'LA','3041','5069'),
('Montague','Mntg','1/28/1909',2,'Sis',NULL,'5180'),
('Montclair','Mcl','4/25/1956',8,'SBd','3041','5326'),
('Monte Sereno','MSo','5/14/1957',4,'SCl','3047','5339'),
('Montebello','Mtbl','10/16/1920',7,'LA','3041','5247'),
('Monterey','Mon','6/14/1890',5,'Mon','3049','5086'),
('Monterey Park','MonP','5/29/1916',7,'LA','3041','5231'),
('Moorpark','Mrpk','7/1/1983',7,'Ven','3201','5436'),
('Moraga (Town)','Mrga','11/13/1974',4,'CC','3199','5415'),
('Moreno Valley','MorV','12/3/1984',8,'Riv','3069','5441'),
('Morgan Hill','MgH','11/10/1906',4,'SCl','3027','5152'),
('Morro Bay','MoBy','7/17/1964',5,'SLO','3097','5391'),
('Mount Shasta','MSha','5/31/1905',2,'Sis',NULL,'5136'),
('Mountain View','MVw','11/7/1902',4,'SCl','3047','5124'),
('Murrieta','Mrta','7/1/1991',8,'Riv','3202','5464'),
('Napa','Nap','3/23/1872',4,'Nap','3050','5042'),
('National City','NatC','9/17/1887',11,'SD','3071','5066'),
('Needles','Ned','10/30/1913',8,'SBd','3150','5220'),
('Nevada City','NevC','4/19/1856',3,'Nev','3028','5018'),
('Newark','Nwk','9/22/1955',4,'Ala','3072','5317'),
('Newman','Newm','6/10/1908',10,'Sta',NULL,'5172'),
('Newport Beach','NptB','9/1/1906',12,'Ora','3041','5151'),
('Norco','Nrco','12/28/1964',8,'Riv','3069','5394'),
('Norwalk','Nrw','8/26/1957',7,'LA','3041','5347'),
('Novato','Nvto','1/20/1960',4,'Mrn','3205','5361'),
('Oakdale','Okdl','11/24/1906',10,'Sta','3098','5153'),
('Oakland','Oak','5/4/1852',4,'Ala','3072','5012'),
('Oakley','Okly','7/1/1999',4,'CC','3001','5477'),
('Oceanside','Ocn','7/3/1888',11,'SD','3071','5079'),
('Ojai','Oji','8/5/1921',7,'Ven','3091','5251'),
('Ontario','Ont','12/10/1891',8,'SBd','3041','5092'),
('Orange','Ora','4/6/1888',12,'Ora','3041','5073'),
('Orange Cove','OrCv','1/20/1948',6,'Fre','3194','5301'),
('Orinda','Orin','7/1/1985',4,'CC','3199','5444'),
('Orland','Orl','11/11/1909',3,'Gle','3195','5185'),
('Oroville','Ovl','1/3/1906',3,'But','3053','5142'),
('Oxnard','Oxn','6/30/1903',7,'Ven','3091','5129'),
('Pacific Grove','PGr','7/5/1889',5,'Mon','3049','5087'),
('Pacifica','Pfa','11/22/1957',4,'SM','3072','5350'),
('Palm Desert','PDst','11/26/1973',8,'Riv','3033','5414'),
('Palm Springs','PSp','4/20/1938',8,'Riv','3033','5282'),
('Palmdale','Pmdl','8/24/1962',7,'LA','3055','5378'),
('Palo Alto','PA','4/23/1894',4,'SCl','3047','5100'),
('Palos Verdes Estates','PVE','12/20/1939',7,'LA','3041','5283'),
('Paradise (Town)','Prds','11/27/1979',3,'But','3057','5425'),
('Paramount','Prm','1/30/1957',7,'LA','3041','5336'),
('Parlier','Par','11/15/1921',6,'Fre','3198','5252'),
('Pasadena','Pas','6/19/1886',7,'LA','3041','5064'),
('Paso Robles (El Paso de Robles)','PsRs','3/11/1889',5,'SLO','3004','5084'),
('Patterson','Pat','12/22/1919',10,'Sta','3156','5244'),
('Perris','Per','5/26/1911',8,'Riv','3069','5198'),
('Petaluma','Pet','4/12/1858',4,'Son','3059','5022'),
('Pico Rivera','PRv','1/29/1958',7,'LA','3041','5351'),
('Piedmont','Pdmt','1/31/1907',4,'Ala','3072','5156'),
('Pinole','Pin','6/25/1903',4,'CC','3072','5126'),
('Pismo Beach','PBch','4/25/1946',5,'SLO',NULL,'5289'),
('Pittsburg','Pit','6/25/1903',4,'CC','3001','5127'),
('Placentia','Plcn','12/2/1926',12,'Ora','3041','5269'),
('Placerville','Plcr','5/13/1854',3,'ED','3099','5015'),
('Pleasant Hill','PlHl','11/14/1961',4,'CC','3199','5375'),
('Pleasanton','Ple','6/18/1894',4,'Ala','3199','5101'),
('Plymouth','Ply','2/8/1917',10,'Ama',NULL,'5236'),
('Point Arena','PtA','7/11/1908',1,'Men',NULL,'5175'),
('Pomona','Pom','1/6/1888',7,'LA','3041','5070'),
('Port Hueneme','PHme','3/24/1948',7,'Ven','3091','5302'),
('Porterville','Ptrv','5/7/1902',6,'Tul','3061','5122'),
('Portola','Prtl','5/16/1946',2,'Plu',NULL,'5290'),
('Portola Valley (Town)','PtlV','7/14/1964',4,'SM','3072','5390'),
('Poway','Pwy','12/1/1980',11,'SD','3071','5428'),
('Rancho Cordova','RCdv','7/1/2003',3,'Sac','3067','5482'),
('Rancho Cucamonga','RCuc','11/30/1977',8,'SBd','3041','5420'),
('Rancho Mirage','RMir','8/3/1973',8,'Riv','3033','5412'),
('Rancho Palos Verdes','RoPV','9/7/1973',7,'LA','3041','5413'),
('Rancho Santa Margarita','RSM','1/1/2000',12,'Ora','3200','5478'),
('Red Bluff','RBl','3/31/1876',2,'Teh','3062','5052'),
('Redding','Rdg','10/4/1887',2,'Sha','3063','5068'),
('Redlands','Rdl','12/3/1888',8,'SBd','3069','5083'),
('Redondo Beach','RdoB','4/29/1892',7,'LA','3041','5093'),
('Redwood City','RdwC','5/11/1867',4,'SM','3072','5029'),
('Reedley','Reed','2/18/1913',6,'Fre','3065','5216'),
('Rialto','Ria','11/17/1911',8,'SBd','3069','5205'),
('Richmond','Rch','8/7/1905',4,'CC','3072','5137'),
('Ridgecrest','Rgcr','11/29/1963',6,'Ker','3066','5385'),
('Rio Dell','RDel','2/23/1965',1,'Hum',NULL,'5396'),
('Rio Vista','RVs','1/6/1894',4,'Sol',NULL,'5099'),
('Ripon','Rip','11/27/1945',10,'SJ','3048','5286'),
('Riverbank','Rvbk','8/23/1922',10,'Sta','3048','5255'),
('Riverside','Riv','10/11/1883',8,'Riv','3069','5058'),
('Rocklin','Roc','2/24/1893',3,'Pla','3067','5095'),
('Rohnert Park','RnPk','8/28/1962',4,'Son','3079','5379'),
('Rolling Hills','RlH','1/24/1957',7,'LA','3041','5335'),
('Rolling Hills Estates','RHE','9/18/1957',7,'LA','3041','5349'),
('Rosemead','Rsmd','8/4/1959',7,'LA','3041','5358'),
('Roseville','Rsv','4/10/1909',3,'Pla','3067','5182'),
('Ross (Town)','Ros','8/21/1908',4,'Mrn','3205','5176'),
('Sacramento','Sac','2/27/1850',3,'Sac','3067','5002'),
('Saint Helena','SHla','3/24/1876',4,'Nap',NULL,'5051'),
('Salinas','Sal','3/4/1874',5,'Mon','3068','5045'),
('San Anselmo (Town)','Slmo','4/9/1907',4,'Mrn','3205','5159'),
('San Bernardino','SBd','8/10/1869',8,'SBd','3069','5033'),
('San Bruno','SBr','12/23/1914',4,'SM','3072','5226'),
('San Carlos','SCar','7/8/1925',4,'SM','3072','5267'),
('San Clemente','SCle','2/28/1928',12,'Ora','3200','5274'),
('San Diego','SD','3/27/1850',11,'SD','3071','5004'),
('San Dimas','SDms','8/4/1960',7,'LA','3041','5367'),
('San Fernando','SFr','8/31/1911',7,'LA','3041','5202'),
('San Francisco','SF','2/18/1850',4,'SF','3072','5001'),
('San Gabriel','SGb','4/24/1913',7,'LA','3041','5217'),
('San Jacinto','SJc','4/20/1888',8,'Riv','3031','5075'),
('San Joaquin','SJ','2/14/1920',6,'Fre',NULL,'5245'),
('San Jose','SJs','3/27/1850',4,'SCl','3047','5005'),
('San Juan Bautista','SJB','5/4/1869',5,'SBt',NULL,'5103'),
('San Juan Capistrano','SJCp','4/19/1961',12,'Ora','3200','5372'),
('San Leandro','SLn','3/21/1872',4,'Ala','3072','5041'),
('San Luis Obispo','SLO','2/16/1856',5,'SLO','3074','5016'),
('San Marcos','SMcs','1/28/1963',11,'SD','3071','5381'),
('San Marino','SMro','4/25/1913',7,'LA','3041','5218'),
('San Mateo','SM','9/4/1894',4,'SM','3072','5102'),
('San Pablo','SPb','4/27/1948',4,'CC','3072','5303'),
('San Rafael','SRf','2/18/1874',4,'Mrn','3205','5043'),
('San Ramon','SRmn','7/1/1983',4,'CC','3199','5437'),
('Sand City','SndC','5/31/1960',5,'Mon','3049','5366'),
('Sanger','Sgr','5/9/1911',6,'Fre','3073','5197'),
('Santa Ana','SA','6/1/1886',12,'Ora','3041','5063'),
('Santa Barbara','SB','4/9/1850',5,'SB','3075','5007'),
('Santa Clara','SCl','7/5/1852',4,'SCl','3047','5019'),
('Santa Clarita','SCta','12/15/1987',7,'LA','3207','5450'),
('Santa Cruz','SCr','3/31/1866',5,'SCr','3076','5025'),
('Santa Fe Springs','SFSp','5/15/1957',7,'LA','3041','5340'),
('Santa Maria','SMra','9/12/1905',5,'SB','3077','5138'),
('Santa Monica','SMca','11/30/1886',7,'LA','3041','5107'),
('Santa Paula','SPa','4/22/1902',7,'Ven','3078','5121'),
('Santa Rosa','SRo','3/26/1868',4,'Son','3079','5028'),
('Santee','Snt','12/1/1980',11,'SD','3071','5429'),
('Saratoga','Sar','10/22/1956',4,'SCl','3047','5332'),
('Sausalito','Saus','9/4/1893',4,'Mrn','3205','5098'),
('Scotts Valley','SctV','8/2/1966',5,'SCr','3076','5400'),
('Seal Beach','SlB','10/27/1915',12,'Ora','3041','5229'),
('Seaside','Sea','10/13/1954',5,'Mon','3049','5316'),
('Sebastopol','Seb','6/13/1902',4,'Son','3079','5123'),
('Selma','Sel','3/15/1893',6,'Fre','3080','5096'),
('Shafter','Shf','1/20/1938',6,'Ker','3116','5281'),
('Shasta Lake','ShLk','7/2/1993',2,'Sha','3063','5474'),
('Sierra Madre','SieM','2/2/1907',7,'LA','3041','5158'),
('Signal Hill','SigH','4/22/1924',7,'LA','3041','5262'),
('Simi Valley','SimV','10/10/1969',7,'Ven','3081','5405'),
('Solana Beach','SolB','7/1/1986',11,'SD','3071','5445'),
('Soledad','Sol','3/9/1921',5,'Mon','3125','5248'),
('Solvang','Slvg','5/1/1985',5,'SB',NULL,'5443'),
('Sonoma','Son','9/3/1883',4,'Son','3114','5114'),
('Sonora','Sra','5/1/1851',10,'Tuo',NULL,'5010'),
('South El Monte','SEMt','7/30/1958',7,'LA','3041','5352'),
('South Gate','SGt','1/20/1923',7,'LA','3041','5257'),
('South Lake Tahoe','SLTo','11/30/1965',3,'ED','3082','5398'),
('South Pasadena','SPas','3/2/1888',7,'LA','3041','5071'),
('South San Francisco','SSF','9/19/1908',4,'SM','3072','5177'),
('Stanton','Stt','6/4/1956',12,'Ora','3041','5327'),
('Stockton','Stkn','7/23/1850',10,'SJ','3083','5008'),
('Suisun City','Suis','10/9/1868',4,'Sol','3025','5032'),
('Sunnyvale','Sunv','12/24/1912',4,'SCl','3047','5213'),
('Susanville','Susv','8/24/1900',2,'Las','3084','5116'),
('Sutter Creek','StCk','2/11/1913',10,'Ama',NULL,'5215'),
('Taft','Taf','11/7/1910',6,'Ker','3113','5193'),
('Tehachapi','Thpi','8/13/1909',6,'Ker','3139','5184'),
('Tehama','Teh','7/5/1906',2,'Teh',NULL,'5148'),
('Temecula','Tmca','12/1/1989',8,'Riv','3202','5459'),
('Temple City','TmpC','5/25/1960',7,'LA','3041','5365'),
('Thousand Oaks','ThOk','10/7/1964',7,'Ven','3201','5392'),
('Tiburon (Town)','Tbrn','6/23/1964',4,'Mrn','3205','5388'),
('Torrance','Tor','5/12/1921',7,'LA','3041','5249'),
('Tracy','Tra','7/22/1910',10,'SJ','3086','5192'),
('Trinidad','Trnd','11/7/1870',1,'Hum',NULL,'5036'),
('Truckee (Town)','Trk','3/23/1993',3,'Nev',NULL,'5473'),
('Tulare','Tul','4/5/1888',6,'Tul','3087','5072'),
('Tulelake','Tlk','3/1/1937',2,'Sis',NULL,'5280'),
('Turlock','Tur','2/15/1908',10,'Sta','3088','5165'),
('Tustin','Tus','9/21/1927',12,'Ora','3041','5271'),
('Twentynine Palms','TnP','11/23/1987',8,'SBd','3123','5448'),
('Ukiah','Uki','3/8/1876',1,'Men','3089','5049'),
('Union City','UnC','1/26/1959',4,'Ala','3072','5354'),
('Upland','Upl','5/15/1906',8,'SBd','3041','5147'),
('Vacaville','Vac','8/9/1892',4,'Sol','3090','5094'),
('Vallejo','Val','3/30/1868',4,'Sol','3208','5030'),
('Ventura (San Buenaventura)','Ven','4/2/1866',7,'Ven','3091','5026'),
('Vernon','Ver','9/22/1905',7,'LA','3041','5139'),
('Victorville','Vctv','9/21/1962',8,'SBd','3115','5380'),
('Villa Park','VlPk','1/11/1962',12,'Ora','3041','5377'),
('Visalia','Vis','2/27/1874',6,'Tul','3092','5044'),
('Vista','Vsta','1/28/1963',11,'SD','3071','5382'),
('Walnut','Wal','1/19/1959',7,'LA','3041','5353'),
('Walnut Creek','WlC','10/21/1914',4,'CC','3199','5225'),
('Wasco','Was','12/22/1945',6,'Ker','3094','5287'),
('Waterford','Wtrf','11/7/1969',10,'Sta',NULL,'5406'),
('Watsonville','Wat','3/30/1868',5,'SCr','3095','5031'),
('Weed','Weed','1/25/1961',2,'Sis',NULL,'5371'),
('West Covina','WCov','2/17/1923',7,'LA','3041','5259'),
('West Hollywood','WHwd','11/29/1984',7,'LA','3041','5440'),
('West Sacramento','WSac','1/1/1987',3,'Yol','3067','5447'),
('Westlake Village','WlkV','12/11/1981',7,'LA','3201','5431'),
('Westminster','Wtm','3/27/1957',12,'Ora','3041','5338'),
('Westmorland','Wmd','6/30/1934',11,'Imp',NULL,'5278'),
('Wheatland','Wht','4/23/1874',3,'Yub',NULL,'5048'),
('Whittier','Wit','2/25/1898',7,'LA','3041','5111'),
('Wildomar','Wdmr','7/1/2008',8,'Riv','3202','5484'),
('Williams','Wms','5/17/1920',3,'Col',NULL,'5246'),
('Willits','Wlts','11/19/1888',1,'Men','3130','5082'),
('Willows','Wlos','1/16/1886',3,'Gle','3138','5062'),
('Windsor (Town)','Wnsr','7/1/1992',4,'Son','3079','5472'),
('Winters','Win','2/9/1898',3,'Yol',NULL,'5110'),
('Woodlake','Wlk','9/23/1941',6,'Tul','3144','5284'),
('Woodland','Wd','2/22/1871',3,'Yol','3096','5046'),
('Woodside (Town)','Wds','11/16/1956',4,'SM','3072','5333'),
('Yorba Linda','YbLn','11/2/1967',12,'Ora','3041','5402'),
('Yountville (Town)','Yntv','2/4/1965',4,'Nap',NULL,'5395'),
('Yreka','Yre','4/21/1857',2,'Sis','3103','5020'),
('Yuba City','YC','1/23/1908',3,'Sut','3045','5163'),
('Yucaipa','Ycpa','11/27/1989',8,'SBd','3069','5457'),
('Yucca Valley (Town)','YucV','11/27/1991',8,'SBd','3124','5466')
;


COMMIT;
