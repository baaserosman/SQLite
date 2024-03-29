/*===================================================
													  SELECT
===================================================*/
	/* tracks tablosundaki track isimlerini (name) sorgulayınız */
	SELECT name FROM tracks;
	
	
	/* tracks tablosundaki besteci(Composer) ve şarkı isimlerini (name) sorgulayınız.*/
	SELECT Composer, name FROM tracks;
	
	/* tracks tablosundaki tüm bilgileri sorgulayınız */
	SELECT * FROM tracks;
	
	
/*===================================================
													DISTINCT
===================================================*/
	/*tracks tablosundaki composer bilgileri sorgulayınız (TEKRARLI OLABİLİR)*/
	SELECT Composer FROM tracks;
	
	/*tracks tablosundaki composer bilgileri sorgulayınız (TEKRARSIZ) */
	SELECT DISTINCT Composer FROM tracks;
	
	/*tracks tablosundaki AlbumId ve MediaTypeId bigilerini TEKRARSIZ olarak 
	sorgulayınız */
	SELECT DISTINCT AlbumId,MediaTypeId FROM tracks;
	
	
/*===================================================
														WHERE
====================================================*/

	/*Composer'ı Jimi Hendrix olan şarkıların isimlerini (name) sorgulayiniz*/
	SELECT name FROM tracks WHERE Composer='Jimi Hendrix';
	
	/* invoices tablosunda Total değeri 10$ dan büyük olan faturaların tüm bilgilerini 
	sorgulayiniz */
	
	SELECT * FROM invoices WHERE total >10 ;
	-- SELECT CustomerId, BillingAddress,total FROM invoices WHERE total >10 ;

	
/*===================================================
														LIMIT
====================================================*/
 
	/*invoices tablosunda Total değeri 10$'dan büyük olan ilk 4 kayıt'ın InvoiceId, 
	InvoiceDate ve total bilgilerini sorgulayiniz */
	SELECT InvoiceId,InvoiceDate,total 
	FROM invoices
	WHERE total >10 
	LIMIT 4;
	
	
	/*invoices tablosunda Total değeri 10$'dan büyük olan kayıtları Total değerine göre 
	ARTAN sırada sıralayarak sorgulayiniz */
	SELECT * FROM invoices
	WHERE total >10
	ORDER BY total ASC;
	
	/*invoices tablosunda Total değeri 10$'dan büyük olan kayıtlardan işlem tarihi 
	(InvoiceDate) en yeni olan 10 kaydın tüm bilgilerini listeyiniz */ 
	SELECT * FROM invoices
	WHERE total >10
	ORDER BY InvoiceDate DESC
	LIMIT 10;
	
		
	/*===================================================
								 LOGICAL OPERATORS (AND,OR,NOT)
====================================================*/
	
	/* invoices tablosunda ülkesi (BillingCountry) USA olmayan kayıtları total değerine
	göre  AZALAN sırada listeyiniz */ 	
	
	SELECT *
	FROM invoices	
	WHERE NOT BillingCountry='USA'
	ORDER BY total DESC;
	
	/* invoices tablosunda, ülkesi (BillingCountry) USA veya Germany olan kayıtları, 
	InvoiceId sırasına göre artan sırada listeyiniz */ 
	
	SELECT *
	FROM invoices
	WHERE BillingCountry = "USA" OR BillingCountry = "Germany"
	ORDER BY InvoiceId ASC ;
	
	/* invoices tablosunda BillingState sutunu NS olmayan VEYA NULL olan tüm verileri 
	sorgulayınız.*/
	SELECT *
	FROM invoices
	WHERE NOT BillingState = 'AB' OR BillingState IS NULL;
	
	/* invoices tablosunda fatura tarihi (InvoiceDate) 01-01-2012 ile 02-01-2013 
	tarihleri arasındaki faturaların tüm bilgilerini listeleyiniz */ 
	
	SELECT *
	FROM invoices
	WHERE InvoiceDate> '2012-01-01' 
	AND InvoiceDate <= '2013-01-02 00:00:00';
	
	/* invoices tablosunda fatura tarihi (InvoiceDate) 2009 ila 2011 tarihleri arasındaki
 en yeni faturayı listeleyen sorguyu yazınız */
 
	SELECT *
	FROM invoices
	WHERE InvoiceDate BETWEEN  '2009-01-01' 
	AND '2010-12-31' 
	ORDER BY InvoiceDate DESC
	LIMIT 1;
	
	/* students Tablosunda Grade sütunu 89 ila 96 arasında olan öğrencilerin tüm bilgilerini büyükten küçüğe sorgulayınız. */
	
	SELECT *
	FROM students
	WHERE Grade BETWEEN 89 AND 96
	ORDER BY Grade;
	
	/*===================================================
								                   IN
====================================================*/
	/* customers tablosunda Belgium, Norway veya  Canada  ülkelerinden sipariş veren
		müşterilerin FirstName ve LastName bilgilerini listeyiniz	*/
		
	SELECT FirstName, LastName, country
	FROM customers 
	WHERE country IN("Belgium", "Norway", "Canada");
	
	/*===================================================
								                    LIKE
====================================================*/
	/* tracks tablosunda Composer sutunu Bach ile biten kayıtların Name bilgilerini 
	listeyen sorguyu yazınız*/
	
	SELECT name , Composer
	FROM tracks
	WHERE Composer LIKE "%Bach" ;
	
	/* albulms tablosunda Title (başlık) sutununda Greatest içeren kayıtların tüm bilgilerini 
	listeyen sorguyu yazınız*/
	
	SELECT *
	FROM albums
	WHERE Title
	LIKE "%Greatest%" ;
	
	/* invoices tablosunda, 2010 ve 2019 arası bir tarihte (InvoiceDate) Sadece şubat
	aylarında gerçekleşmiş olan faturaların	tüm bilgilerini listeleyen sorguyu yazınız*/
	
	SELECT *
	FROM invoices
	WHERE InvoiceDate 
	LIKE "201_-02%" ; 
	
	/* customers tablosunda, isimleri (FirstName) üç harfli olan müşterilerin FirstName, 
	LastName ve City bilgilerini	listeleyen sorguyu yazınız*/
	
	SELECT FirstName, LastName, City
	FROM customers
	WHERE FirstName LIKE "___" ;
	
	/* customers tablosunda, soyisimleri Sch veya Go ile başlayan müşterilerin FirstName, 
	LastName ve City bilgilerini listeleyen sorguyu yazınız*/
	
	SELECT FirstName, LastName, City
	FROM customers
	WHERE LastName LIKE 'Sch%' OR LastName LIKE 'Go%';