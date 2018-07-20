
-- Pass a filename as a command line parameter
-- Parse and print out stats about the file
-- - Characters
-- - Lines
-- - Words
--
--
with Ada.Command_Line;
with Ada.Integer_Text_IO;
with Ada.Strings.Unbounded.Text_IO;
with Ada.Strings.Unbounded;
with Ada.Text_IO; use Ada.Text_IO;
with GNAT.IO_Aux;
with GNAT.Array_Split;
with GNAT.String_Split;
procedure awordcount is
   -- *** Variable declarations *** 
begin
    
   New_Line;

   if Ada.Command_Line.Argument_Count = 0 then
      Put_Line(Item => " ERROR! Filename required.");
      Put_Line(Item => " USAGE: awordcount file-to-get-counts-for.txt");
   else
      declare
         -- *** Variable declarations *** 
         FileName : String(1..Ada.Command_Line.Argument(1)'length);
         FileNameLength : Natural := Ada.Command_Line.Argument(1)'length;
         SourceFile : Ada.Text_IO.File_Type;
      begin
         FileName := Ada.Command_Line.Argument(1);
         Put(Item => "Parsing file: ");
         Put_Line(Item => FileName);         
         if GNAT.IO_Aux.File_Exists(FileName) then
            
            Open(SourceFile, In_File, FileName);
            declare
               package UStrings renames Ada.Strings.Unbounded;
               package UnboundedIO renames Ada.Strings.Unbounded.Text_IO;
               CurrentLine : UStrings.Unbounded_String := UStrings.Null_Unbounded_String;
               CurrentLineLength : Integer := 0;
               CharacterCount : Integer := 0;
               LineCount : Integer := 0;
               LineWordCount : GNAT.String_Split.Slice_Number;              
               SplitArr : GNAT.String_Split.Slice_Set;
               WordSeparators : String := " ";
               WordCount : Integer := 0;
            begin
               while not End_Of_File(SourceFile)
               loop
                  CurrentLine := UnboundedIO.Get_Line(File => SourceFile);
                  LineCount := LineCount + 1;
                  CurrentLineLength := UStrings.To_String(CurrentLine)'Length;
                  CharacterCount := CharacterCount + CurrentLineLength;
                  GNAT.String_Split.Create(SplitArr, UStrings.To_String(CurrentLine), WordSeparators, Mode => GNAT.String_Split.Multiple);
                  LineWordCount := GNAT.String_Split.Slice_Count(S => SplitArr);
                  WordCount := WordCount + Integer(LineWordCount);
               end loop;
               Put(Item => "Characters: ");
               Ada.Integer_Text_IO.Put(CharacterCount);
               New_Line;
               Put(Item => "Lines: ");
               Ada.Integer_Text_IO.Put(LineCount);
               New_Line;
               Put(Item => "Words: ");
               Ada.Integer_Text_IO.Put(WordCount);
            end;
            Close(SourceFile);
         else
            Put(Item => FileName & " not found");
         end if;
      end;

   end if;

   New_Line;
   New_Line;

end awordcount;
