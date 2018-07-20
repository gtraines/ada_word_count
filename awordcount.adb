
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
with Ada.Text_IO; use Ada.Text_IO;

procedure awordcount is
-- *** Variable declarations *** 
    package SeqIO is new Ada.Sequential_IO(Element_Type => Character);
    ArgsCount : Natural;
    FileName : String(1..256);
    SourceFile : SeqIO.File_Type;
begin
    
    New_Line;
    Put_Line(Item => Ada.Command_Line.Command_Name);
    
    ArgsCount := Ada.Command_Line.Argument_Count;

    if ArgsCount = 0 then
        Put_Line(Item => " ERROR! Filename required.");
        Put_Line(Item => " USAGE: awordcount file-to-get-counts-for.txt");
    else
        Ada.Integer_Text_IO.Put(Item => ArgsCount);
        New_Line;
        Put(Item => "Parsing file: ");
        Put_Line(Item => Ada.Command_Line.Argument(1));
    end if;
    -- IO.Open(SourceFile, IO.In_File, "textcounter.adb");

    -- declare
    --     C : Character;
    -- begin
    --     while not IO.End_Of_File(SourceFile)
    --     loop
    --         IO.Read(SourceFile, C);
    --         Ada.Text_IO.Put(C);
    --     end loop;
    -- end;

    -- IO.Close(SourceFile);
    New_Line;

end awordcount;