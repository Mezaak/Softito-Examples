select * from BookCategory

select * from BookCategory
where BookCategoryName = 'Science'


select b.BookName, bc.BookCategoryName
from Books b
inner join BookCategory bc on b.BookCategoryId = bc.BookCategoryId;


select * from Books
where Stock < 5;

select bb.BorrowedDate, bb.ReturnedDate, b.BookName
from BorrowedBooks bb
inner join Books b on bb.BookId = b.BookId
where bb.MemberId = 4;



select bt.TransactionType, bt.TransactionDate, p.FirstName, p.LastName
from BookTransactions bt
inner join Personnel p on bt.PersonnelId = p.PersonnelId
where bt.BookId = 2;


select * from Members
where FirstName = 'Hamdullah' and LastName = 'Güven';



select bb.BorrowedDate, b.BookName, m.FirstName, m.LastName
from BorrowedBooks bb
inner join Books b on bb.BookId = b.BookId
inner join Members m on bb.MemberId = m.MemberId
where bb.ReturnedDate is null;

select m.FirstName, m.LastName, m.Email, m.Phone, b.BookName
from Members m
inner join BorrowedBooks bb on m.MemberId = bb.MemberId
inner join Books b on bb.BookId = b.BookId;

create trigger trg_UpdateStock
on BorrowedBooks
after insert, update
as
begin
    -- stok azaltma
    if exists (select 1 from inserted where BorrowedDate is not null and ReturnedDate IS NULL)
    begin
        update Books
        set Stock = Stock - 1
        where BookId in (select BookId from inserted);
    end

    -- iade olunca stok artýrma 
    if exists (select 1 from inserted where ReturnedDate is not null)


    begin
        update Books
        set Stock = Stock + 1
        where BookId in (select BookId from inserted);
    end
end;


create trigger trg_DefaultStock
on Books
after insert
as
begin
    update Books
    set Stock = 1
    where Stock = 0;
end;


create view AvailableBooks as
select BookID, BookName,Stock
from Books
where Stock > 0;


insert into Books (BookID, BookName, Stock) values (9, '1984', 0, 4 );
insert into Books (BookID, BookName, Stock) values (10, 'Dune', 5, 3 );







