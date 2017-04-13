-- Query all of the entries in the Genre table
select * from Genre

-- Using the INSERT statement, add one of your favorite artists to the Artist table.
insert into Artist values (null, "Pinback", 1998);

-- Using the INSERT statement, add one, or more, albums by your artist to the Album table.
insert into Album
	select null,
		"Summer in Abaddon",
		'10/14/2004',
		1234,
		"Rogue Records",
		ArtistId,
		g.GenreId
	from Artist a, Genre g where a.ArtistName = "Pinback" and g.Label = "Rock";
	
-- Using the INSERT statement, add some songs that are on that album to the Song table.
insert into Song
	select null,
		"Non Photo-Blue",
		224,
		"10/12/2004",
		g.GenreId,
		a.ArtistId,
		al.AlbumId
	from Genre g, Artist a, Album al
	where a.ArtistName = "Pinback" and g.Label = "Rock" and al.Title = "Summer in Abaddon"

insert into Song
	select null,
		"Non Photo-Blue",
		224,
		"10/12/2004",
		g.GenreId,
		a.ArtistId,
		al.AlbumId
	from Genre g, Artist a, Album al
	where a.ArtistName = "Pinback" and g.Label = "Rock" and al.Title = "Summer in Abaddon"
	
insert into Song
	select null,
		"Sender",
		299,
		"10/12/2004",
		g.GenreId,
		a.ArtistId,
		al.AlbumId
	from Genre g, Artist a, Album al
	where a.ArtistName = "Pinback" and g.Label = "Rock" and al.Title = "Summer in Abaddon"
	
insert into Song
	select null,
		"Syracuse",
		230,
		"10/12/2004",
		g.GenreId,
		a.ArtistId,
		al.AlbumId
	from Genre g, Artist a, Album al
	where a.ArtistName = "Pinback" and g.Label = "Rock" and al.Title = "Summer in Abaddon"
	
insert into Song
	select null,
		"Bloods on Fire",
		252,
		"10/12/2004",
		g.GenreId,
		a.ArtistId,
		al.AlbumId
	from Genre g, Artist a, Album al
	where a.ArtistName = "Pinback" and g.Label = "Rock" and al.Title = "Summer in Abaddon"

-- Write a SELECT query that provides the song titles, album title, and artist name for all of the data you just entered in. 
-- Use the LEFT JOIN keyword sequence to connect the tables, and the WHERE keyword to filter the results to the album and artist you added.	
select s.Title "Song", al.Title "Album", a.ArtistName "Artist"
	from Song s
	left join Album al, Artist a
	where s.ArtistId = a.ArtistId and al.Title = "Summer in Abaddon" and a.ArtistName = "Pinback"
	
-- Write a SELECT statement to display how many songs exist for each album.
-- You'll need to use the COUNT() function and the GROUP BY keyword sequence.

-- all albums
select al.Title 'Album', count(s.SongId) 'Song Count'
	from Album al
	left join Song s
	on s.AlbumId = al.AlbumId
	group by al.Title

-- only albums with songs
select count(s.SongId) 'Number of songs', al.Title "Album"
	from song s, Album al
	where s.AlbumId = al.AlbumId
	group by al.Title

-- Write a SELECT statement to display how many songs exist for each artist.
-- You'll need to use the COUNT() function and the GROUP BY keyword sequence.
select a.ArtistName 'Artist', count(s.SongId) 'Number of songs'
	from Artist a
	left join Song s
	on a.ArtistId = s.ArtistId
	group by a.ArtistName

-- Write a SELECT statement to display how many songs exist for each genre.
-- You'll need to use the COUNT() function and the GROUP BY keyword sequence.
select g.Label 'Genre', count(s.SongId) 'Number of songs'
	from Genre g
	left join Song s
	on g.GenreId = s.GenreId
	group by g.Label

-- Using MAX() function, write a select statement to find the album with the longest duration.
-- The result should display the album title and the duration.
select Title 'Title', max(AlbumLength) 'Length'
	from Album
	
-- Using MAX() function, write a select statement to find the song with the longest duration.
-- The result should display the song title and the duration.
select Title 'Title', max(SongLength) 'Length'
	from Song
	
-- Modify the previous query to also display the title of the album.
select s.Title 'Title', max(s.SongLength) 'Length', al.Title 'Album'
	from Song s
	join Album al
	where s.AlbumId = al.AlbumId


	
	