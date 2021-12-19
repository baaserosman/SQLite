/* Chinook veritabanındaki tracks tablosunda bulunan her bir şarkının türü (genre)
listeleyiniz.*/

	SELECT Name, GenreId
	FROM tracks;


 /* invoice tablosundaki faturaların her birinin müşteri adını (FirstName),
 soyadını (lastName), fatura tarihi (InvoiceDate) ve fatura meblağını (total) 
 listeleyen sorguyu yazınız */
 
	SELECT customers.FirstName, customers.LastName, invoices.InvoiceDate, invoices."Total"
	FROM invoices
	JOIN customers ON customers.CustomerId = invoices.CustomerId ; 
	
 
/* artists tablosunda bulunan her bir kişinin albums tablosunda bulunan tüm albümlerinin
listeleyen sorguyu yazınız. Sorguda ArtistId, Name, Title ve AlbumId olmalıdır*/

	SELECT artists.ArtistId, artists.Name, albums.Title, albums.AlbumId
	FROM artists
	JOIN albums ON artists.ArtistId = albums.ArtistId; 
	