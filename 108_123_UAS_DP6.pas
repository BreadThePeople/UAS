program k108_123_UAS_DP6;
uses crt;

{Konstanta}

const
  datakeluar = 20;   { maksimal jumlah pengeluaran yang bisa dicatat }

{ Record menyimpan satu data pengeluaran }
type
  TPengeluaran = record
    Nama : string;   { nama pengeluaran }
    Kategori : integer;      { Kategori Pengeluaran}
    Jumlah : longint;      { banyak uang yang dikeluarkan }
  end;

{variabel global}

var
  Data: array[1..datakeluar] of TPengeluaran;  { Array berisi data pengeluaran }
  totalKategori: array[1..4] of longint;     { Menyimpan total pengeluaran per kategori }
  totalSemua: longint;                       { Total semua pengeluaran }
  n, i: integer;                             { n = jumlah pengeluaran }

                          {function dan procedure}

{ function untuk mengubah angka menjadi teks kategori }

function Kategori(k: integer): string;
begin
  case k of
    1: Kategori := 'Makan';
    2: Kategori := 'Transportasi';
    3: Kategori := 'Hobi';
    4: Kategori := 'Lainnya';
  else
    Kategori := 'Tidak Diketahui';
  end;
end;


{Procedure untuk menampilkan ringkasan pengeluaran}

procedure Ringkasan;
var
  i: integer;
begin
  writeln;
  writeln('========= RINGKASAN PENGELUARAN =========');
  
  { Menampilkan total tiap kategori }
  for i := 1 to 4 do
  begin
    writeln(Kategori(i), ' : Rp ', totalKategori[i]);
  end;

  writeln('-----------------------------------------');
  writeln('TOTAL SEMUA : Rp ', totalSemua);
end;


{ Program utama }


begin
  clrscr;

  writeln('Program penghitungan pengeluaran harian');
  writeln('');
  write('Masukkan jumlah pengeluaran hari ini (max 20): ');
  readln(n);

 
  for i := 1 to n do
  begin
    writeln('Data Pengeluaran ke-', i);

    write('Nama pengeluaran : ');          {INPUT DATA PENGELUARAN}
    readln(Data[i].Nama);

    writeln('Pilih kategori:');
    writeln('1. Makan');
    writeln('2. Transport');
    writeln('3. Hobi');
    writeln('4. Lainnya');
    write('Masukkan nomor kategori (1-4): ');
    readln(Data[i].Kategori);

   
    if (Data[i].Kategori < 1) or (Data[i].Kategori > 4) then      { pengecekan kategori }
    begin
      writeln('Kategori tidak valid! Otomatis menjadi 4 (Lainnya).');
      Data[i].Kategori := 4;
    end;

    write('Jumlah pengeluaran (Rp): ');
    readln(Data[i].Jumlah);

    {menambahkan ke total sesuai kategori}
    totalKategori[Data[i].Kategori] := totalKategori[Data[i].Kategori] + Data[i].Jumlah;

    {menambahkan ke total semua}
    totalSemua := totalSemua + Data[i].Jumlah;
  end;

{OUTPUT}

  Ringkasan;

end.
