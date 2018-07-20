
-- Pass a filename as a command line parameter
-- Parse and print out stats about the file
-- - Characters
-- - Lines
-- - Words
--
--
with Ada.Command_Line;
with Ada.Integer_Text_IO;
with Ada.Sequential_IO;
with Ada.Strings.Unbounded;
with Ada.Text_IO; use Ada.Text_IO;

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
            package SeqIO is new Ada.Sequential_IO(Element_Type => Character);
            FileName : String(1..Ada.Command_Line.Argument(1)'length);
            FileNameLength : Natural := Ada.Command_Line.Argument(1)'length;
            SourceFile : SeqIO.File_Type;
        begin
            FileName := Ada.Command_Line.Argument(1);
            Put(Item => "Parsing file: ");
            Put_Line(Item => FileName);
            
            SeqIO.Open(SourceFile, SeqIO.In_File, FileName);
            declare
                C : Character;
                CharacterCount : Integer := 0;
                LineCount : Integer := 0;
                WordCount : Integer := 0;
            begin
                while not SeqIO.End_Of_File(SourceFile)
                loop
                    SeqIO.Read(SourceFile, C);
                    CharacterCount := CharacterCount + 1;
                end loop;
                Put(Item => "Characters: ");
                Ada.Integer_Text_IO.Put(CharacterCount);
            end;
            SeqIO.Close(SourceFile);
        end;

    end if;

    New_Line;

end awordcount;