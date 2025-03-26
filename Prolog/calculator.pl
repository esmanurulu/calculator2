

:- encoding(utf8). 
:- prompt(_, '').  % 

main :-
    write('=== PROLOG HESAP MAKİNESİ ==='), nl,
    write('Not: İşlemler için sadece +, -, *, / kullanın'), nl, nl,
    read_input(Sayi1, Sayi2, Op),
    islem_yap(Sayi1, Sayi2, Op).

read_input(Sayi1, Sayi2, Op) :-
    read_line('İlk sayıyı girin: ', Sayi1),
    read_line('İkinci sayıyı girin: ', Sayi2),
    read_line('İşlemi girin (+, -, *, /): ', OpStr),
    atom_string(Op, OpStr).

read_line(Prompt, Value) :-
    repeat,
    write(Prompt), flush_output,
    read_line_to_string(user_input, Line),
    (   validate_input(Line, Parsed)
    ->  Value = Parsed, !
    ;   write('Geçersiz giriş! Tekrar deneyin.'), nl, fail
    ).

validate_input(Line, Number) :-
    atom_number(Line, Number),
    number(Number). % Sayı kontrolü

validate_input(Line, Op) :-
    member(Line, ["+","-","*","/"]),
    atom_string(Op, Line). % Operatör kontrolü

islem_yap(Sayi1, Sayi2, Op) :-
    (   operator_kontrol(Op),
        hesapla(Sayi1, Sayi2, Op, Sonuc)
    ->  format('~nSONUÇ: ~w~n~n', [Sonuc])
    ;   format('~nHATALI İŞLEM!~n~n')
    ).

operator_kontrol(Op) :-
    memberchk(Op, [+, -, *, /]).

hesapla(Sayi1, Sayi2, +, Sonuc) :- Sonuc is Sayi1 + Sayi2.
hesapla(Sayi1, Sayi2, -, Sonuc) :- Sonuc is Sayi1 - Sayi2.
hesapla(Sayi1, Sayi2, *, Sonuc) :- Sonuc is Sayi1 * Sayi2.
hesapla(Sayi1, Sayi2, /, Sonuc) :-
    (Sayi2 =\= 0 -> Sonuc is Sayi1 / Sayi2 ; throw(zero_division)).

:- initialization(main).
