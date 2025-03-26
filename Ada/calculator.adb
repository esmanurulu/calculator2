with Ada.Text_IO, Ada.Integer_Text_IO, Ada.Float_Text_IO;
with Ada.Numerics.Elementary_Functions;
use Ada.Text_IO, Ada.Integer_Text_IO;

procedure calculator_implementation is 
	
	Option : Integer;
	Sum : Integer;
	CurrentValue : Integer;
	SquareValue : Integer;
	Power : Integer;
	Exponent : Integer;
	NumberValues : Natural;
	Value_A : Float;
	Value_B : Float;
	Answer_B : Float;
	
	SUBTYPE NonNegFloat IS Float RANGE 0.0 .. Float'Last;
		Value : NonNegFloat;
		Answer : NonNegFloat;


		begin 
			New_Line;
			
			
      Put_Line("0. Exit Program");
			Put_Line("1. Addition of 2 Numbers ");
			Put_Line("2. Subtraction of 2 Numbers");
			Put_Line("3. Multiplication");
			Put_Line("4. Division");
			Put_Line("5. Squaring ");
	
			
			
			New_Line;
			
			loop
				
			New_Line(1);
			Put("Please enter your choice: ");
			get(Option);
			
			New_Line(1);
			Put_Line("You have selected: Option" & Option'img);
			New_Line(1);

			
			case Option is
				
				when 1 =>
					Ada.Text_IO.Put(Item => "In the form of a + b, enter the value a: ");
					Ada.Float_Text_IO.get(Item => Value_A);
					Ada.Text_IO.Put(Item => "Now, enter the value b: ");
					Ada.Float_Text_IO.get(Item => Value_B);
					Answer_B := Value_A + Value_B;
					
						
					Ada.Text_IO.Put("The result of your addition is: ");
					Ada.Float_Text_IO.Put (Item => Answer_B, Fore => 1, Aft => 4, Exp => 0);
					Ada.Text_IO.New_Line;
			
				when 2 => 

					Ada.Text_IO.Put(Item => "In the form of b - a, enter the value b: ");
					Ada.Float_Text_IO.get(Item => Value_B);
					Ada.Text_IO.Put(Item => "Now, enter the value a: ");
					Ada.Float_Text_IO.get(Item => Value_A);
					Answer_B := Value_B - Value_A;
					
						
					Ada.Text_IO.Put("The result of your subtraction is: ");
					Ada.Float_Text_IO.Put (Item => Answer_B, Fore => 1, Aft => 4, Exp => 0);
					Ada.Text_IO.New_Line;

			
				when 3 =>
					
					Ada.Text_IO.Put(Item => "In the form of a x b, enter the value a: ");
					Ada.Float_Text_IO.get(Item => Value_A);
					Ada.Text_IO.Put(Item => "In the form of a x b, enter the value b: ");
					Ada.Float_Text_IO.get(Item => Value_B);
					Answer_B := Value_A * Value_B;

						
					Ada.Text_IO.Put("The result of your multiplication is: ");
					Ada.Float_Text_IO.Put (Item => Answer_B, Fore => 1, Aft => 4, Exp => 0);
					Ada.Text_IO.New_Line;

					
			
				when 4 =>
					Ada.Text_IO.Put(Item => "In the form of b / a, enter the the value b: ");
					Ada.Float_Text_IO.get(Item => Value_B);
					Ada.Text_IO.Put(Item => "In the form of b / a, enter the the value a: ");
					Ada.Float_Text_IO.get(Item => Value_A);
					Answer_B := Value_B / Value_A;
					
					Ada.Text_IO.Put("The result of your division is: ");
					
					-- formats decimal output with 4 decimal point
					Ada.Float_Text_IO.Put (Item => Answer_B, Fore => 1, Aft => 4, Exp => 0);
					Ada.Text_IO.New_Line;


				when 5 =>
					Put("Enter the value to be squared: ");
					get (Item => CurrentValue);
					SquareValue := CurrentValue * CurrentValue;
					Put("The square value of the entered number is: " & SquareValue'img);
					
						
			
				when 0 =>
					Put_Line(" ");
					
			
				when others =>
					Put("invalid input.");
					
			end case;
			exit when Option = 0;
			end loop;
				
				
				
end calculator_implementation;
			
			
			
			
			
	

			
