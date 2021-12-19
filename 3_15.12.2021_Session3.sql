/*===================================================
	AGGREGATE FUNCTION COUNT,SUM,MIN,MAX, AVG)
====================================================*/
	
	-- COUNT
	-------------------------------------------------------------------------------------------------	
	
	/* invoices tablosunda kaç adet fatura bulunduğunu döndüren sorguyu yazınız*/
	SELECT COUNT(InvoiceId) AS num_of_records
	FROM invoices;
	
	SELECT COUNT(*) AS num_of_records
	FROM invoices
	WHERE BillingPostalCode IS NULL;
	
	/* tracks tablosunda kaç adet farklı Composer bulunduğunu döndüren sorguyu yazınız*/
	SELECT count(DISTINCT Composer) as Besteci_Sayisi
	FROM tracks;
	
	/*ÖDEV: invoices tablosunda kaç adet farklı yıl olduğunu hesaplayan sorguyu yazınız*/ 
	
	
	-- MIN,MAX
	-------------------------------------------------------------------------------------------------	
	/* tracks tablosundaki şarkı süresi en kısa olan şarkının adını ve süresi listeleyen
	sorguyu yaziniz */
	
	SELECT Name AS Song_Name, MIN(Milliseconds) AS Min_Duration
	FROM tracks;
		
	/*students tablosundaki en düşük ve en yüksek notu listeleyen sorguyu yazınız */
	SELECT MIN(Grade) as min_grade, MAX(Grade) as max_grade
	FROM students;
	
		-- SUM,AVG
	-------------------------------------------------------------------------------------------------	
	/* invoices  tablosundaki faturaların toplam değerini listeyiniz */
	
	SELECT SUM(total) as total_invoices
	FROM invoices;
	
	/* invoices  tablosunda 2009 ile 2013 tarihileri arasındaki faturaların toplam 
	değerini listeyiniz */
	SELECT SUM(total) as total_invoices
	FROM invoices
	WHERE InvoiceDate BETWEEN '2009%' AND '2013-12-31';
	
	
	/* tracks  tablosundaki şarkıların ortalama duration değerini */
	SELECT ROUND(AVG(Milliseconds)) AS ort_duration
	FROM tracks;
		
	/* tracks tablosundaki şarkıların ortalama süresinden daha uzun olan 
	şarkıların adlarını listeleyiniz */
	SELECT Name, Milliseconds
	FROM tracks
	WHERE Milliseconds>393599;
	
	/*Bu yöntem hard-coded olduğu için çok mantıklı bir çözüm değil. 
	alt-sorgu(sub-query) ile daha doğru bir yaklaşım olacaktır sonraki 
	bölümlerde alt-sorguyu ayrıntılı bir şekilde inceleyeceğiz.*/
	
	SELECT Name, Milliseconds
	FROM tracks
	WHERE Milliseconds > (	SELECT AVG(Milliseconds) 
										FROM tracks);
										
/*===================================================
 GROUP BY
====================================================*/

	/* tracks tablosundaki her bir Bestecisinin (Composer) toplam şarkı sayısını 
	Besteci adına göre gruplandırarak listeleyen sorguyu yazınız. */
	
	SELECT Composer , COUNT(Name)
	FROM tracks
	WHERE Composer IS NOT NULL
	GROUP BY Composer;
	
	

	
	
	
	
SELECT COUNT(InvoiceId) AS num_of_records
FROM invoices ;

SELECT COUNT(BillingState) AS num_of_records
FROM invoices
WHERE BillingState IS NULL ;

SELECT COUNT(*) AS num_of_records
FROM invoices 
WHERE BillingState IS NOT NULL ;

SELECT COUNT(DISTINCT Composer) AS Count_of_Composer
FROM tracks; 

/* invoices tablosunda kaç 
adet farklı yıl olduğunu hesaplayan sorguyu yazınız*/ 

SELECT MIN(Milliseconds)
FROM tracks; 

SELECT Milliseconds
FROM tracks
ORDER BY Milliseconds
LIMIT 1 ;

SELECT *
FROM tracks
ORDER BY Milliseconds
LIMIT 1 ;

SELECT MIN(Grade) AS min_grade, MAX(Grade) AS max_grade
FROM students ;

SELECT SUM(total)
FROM invoices ;

/* invoices  tablosunda 2009 ile 2013 tarihileri 
arasındaki faturaların toplam değerini listeyiniz */

SELECT SUM(Total) 
FROM invoices
WHERE InvoiceDate BETWEEN "2009%" AND "2013-01-01%" ;

SELECT ROUND(AVG(Milliseconds),2) 
FROM tracks;

SELECT Name, Milliseconds
FROM tracks 
WHERE Milliseconds > 393599 ;

SELECT Name, Milliseconds
FROM tracks 
WHERE Milliseconds > ( SELECT AVG(Milliseconds) 
						FROM tracks ) ;
						
/*===================================================
 GROUP BY
====================================================*/

	/* tracks tablosundaki her bir Bestecisinin (Composer) toplam şarkı sayısını 
	Besteci adına göre gruplandırarak listeleyen sorguyu yazınız. */
	
SELECT Composer, COUNT(Name)						
FROM tracks
WHERE Composer IS NOT NULL
GROUP BY Composer ; 

	/* customers tablosundaki müşterilerin sayılarını Ülkelerine (Country) göre gruplandırarak 
	ve müşteri sayısına göre AZALAN şekilde sıralayarak listeleyen sorguyu yazınız*/
	
SELECT country, COUNT(*)
FROM customers
GROUP BY country
ORDER BY (SELECT COUNT(country)
		  FROM customers)DESC ; 

SELECT country,Count(CustomerId)
FROM customers
GROUP BY country
ORDER BY Count(CustomerId) DESC;

/* tracks tablosundaki herbir albumü AlbumId'lerine göre gruplandırarak 
	her albumdeki minumum şarkı sürelerini listeleyen listeleyen sorguyu yazınız */
	
SELECT AlbumId , MIN (Milliseconds)/ 60 AS Min_Duration
FROM tracks
GROUP BY AlbumId ; 

/* invoices tablosundaki her bir ülkenin (BillingCountry) fatura ortalamalarını 
	hesaplayan ve ülke bilgileri ile listeleyen sorguyu yazınız.*/
	
SELECT BillingCountry, ROUND(AVG(total))
FROM invoices
GROUP BY BillingCountry;

SELECT country,Count(CustomerId)
FROM customers
GROUP BY country
ORDER BY Count(CustomerId) DESC;

/*===================================================
        JOINS
====================================================*/
    
--     Join islemleri farkli tablolardan secilen sutunlar ile yeni bir tablo 
--     olusturmak icin kullanilabilir.
--     
--     JOIN islemleri Iliskisel Veritabanlari icin cok onemli bir ozelliktir. Çunku
--    	Foreign Key'ler ile iliskili olan tablolardan istenilen sutunlari cekmek 
--     icin JOIN islemleri kullanilabilir.

--     Standart SQL'de en çok kullanılan Join islemleri:
--   	1) FULL JOIN:  Tablodaki tum sonuclari gosterir
--     2) INNER JOIN:  Tablolardaki ortak olan sonuc kumesini gosterir
--     3) LEFT JOIN:  Ilk tabloda (Sol) olup digerinde olmayan sonuclari gosterir
--     4) RIGHT JOIN: Sadece Ikinci tabloda olan tum sonuclari gosterir.

--		NOT: SQLite Sadece INNER, LEFT VE CROSS JOIN İşlemlerini desteklemektedir.
 
 /*===================================================*/   

  /* araclar.db adındaki veritabanını kullanarak Markalar ve Siparisler tablolarındaki 
 marka_id'si ayni olan kayıtların marka_id, marka_adi, siparis_adedi ve siparis_tarihi   
 bilgilerini  listeleyen bir sorgu yaziniz.*/
 
	 SELECT * FROM markalar;
	 
	 SELECT siparisler.marka_id, markalar.marka_adi, 
				 siparisler.siparis_adedi, siparisler.siparis_tarihi 
	 FROM siparisler
	 JOIN markalar ON siparisler.marka_id = markalar.marka_id;
	 
	 /* Daha kısa olarak*/
	SELECT s.marka_id, m.marka_adi, 
				 s.siparis_adedi, s.siparis_tarihi 
	 FROM siparisler s
	 JOIN markalar m ON s.marka_id = m.marka_id;
 

/* Markalar ve Siparisler tablolarındaki tüm araç markalarının siparis bilgilerini
   (marka_id,marka_adi,siparis_adedi,siparis_tarihi) listeleyen bir sorgu yaziniz.*/
	
	 SELECT m.marka_id, m.marka_adi, 
				 s.siparis_adedi, s.siparis_tarihi 
	 FROM markalar m
	 LEFT JOIN siparisler s ON s.marka_id = m.marka_id;

	 /* Chinook veritabanındaki tracks tablosunda bulunan her bir şarkının türü (genre)
listeleyiniz.*/


 /* invoice tablosundaki faturaların her birinin müşteri adını (FirstName),
 soyadını (lastName), fatura tarihi (InvoiceDate) ve fatura meblağını (total) 
 listeleyen sorguyu yazınız */
 
 
/* artists tablosunda bulunan her bir kişinin albums tablosunda bulunan tüm albümlerinin
listeleyen sorguyu yazınız. Sorguda ArtistId, Name, Title ve AlbumId olmalıdır*/