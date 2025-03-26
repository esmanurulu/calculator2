# calculator2
Interpreter implementation for a simple calculator. 1. Rust 2. ADA 3. Perl 4. Scheme 5. Prolog
**Esmanur Ulu 231101024**

## -**> RUST:**

1 - ^ operatörü ile üs alma desteği

2- İşlem önceliği: Üs > Çarpma/Bölme > Toplama/Çıkarma

3- Değişken atama: x = 5 + 3 gibi atamaları destekler. Değişkenler bir HashMap'te saklanır.
<br />
**compile işlemi:**
rustc calculator.rs && ./calculator

**Error Handling in Rust:**

panic!(“geçersiz karakter: {}", self.input[self.pos])

panic!("bilinmeyen işlem: {:?}", self.current_token);

let  val  =  *vars.get(name).expect("bilinmeyen değişken");

  

  

## **-> ADA:**

  

Başlangıçta kullanıcıdan yapmak istediği işlemin girişini alıyor. İşleme göre inputları da sırasıyla alıyor. Bilgisayarımda kuramadım. Online compiler’dan çalıştırdığımda:

Put_Line("1. Addition of 2 Numbers ");

Put_Line("2. Subtraction of 2 Numbers");

Put_Line("3. Multiplication");

Put_Line("4. Division");

Put_Line("5. Squaring ");

Bu işlemlerin hepsini gerçekleştiriyor.

  

**

## -> PERL


1. Üs Alma: ^ veya ** ile
 2. Değişken Atama: x = 5 + 3
 3. İşlem Önceliği: Parantez > Üs > Çarpma/Bölme > Toplama/Çıkarma

**compile işlemi:**
perl calculator.pl
  

 Error Handling in Perl
2.  **die**  "Geçersiz karakterler"
3.  **die**  "Sıfıra bölme hatası"
4.  **die**  "Tanımsız değişken: $1"
   
     
    
  **

## -> SCHEME

Çalıştırmak için:

mit-scheme // komutu çalıştırdım.

1 ]=> (load "/Users/esmanurulu/Desktop/395hw2/Scheme/calculator.scm") //pathi yazdım
...
1 ]=> (load "Calculator.scm")

  ..
1 ]=> (calculator '((1 + 2) * 4))

  

;Value: 12

1 ]=> (calculator '(10 / (5 + 2)))

  

;Value: 10/7

  

  

**

## -> PROLOG

**
**Error handling in prolog:**
throw(zero_division)).
 
 
**compile için:**

swipl calculator.pl 

İlk sayıyı girin: 3

İkinci sayıyı girin: 4

İşlemi girin (+, -, *, /): *

SONUÇ: 12

  
  

Bu şekilde doğru outputu veriyor. Fakat sonuçtan hemen sonra

Welcome to SWI-Prolog (threaded, 64 bits, version 9.2.9)

SWI-Prolog comes with ABSOLUTELY NO WARRANTY. This is free software.

Please run ?- license. for legal details.

  

For online help and background, visit https://www.swi-prolog.org

For built-in help, use ?- help(Topic). or ?- apropos(Word).

  

?-

Bu şekilde swipl açılıyor. Ctrl + z ile sonlandırıyorum programı.
