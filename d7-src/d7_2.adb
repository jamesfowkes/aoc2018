with Ada.Command_Line;

with Step;
with TimedStep;
with Types;
with get_stdin;

procedure d7_2 is
   stdin : constant Types.StringArray := get_stdin.get_strs;
   steps : TimedStep.TimedStepMap.Map;
   parsed_step : Step.ParsedStep;
   nelves : constant Integer := Integer'Value (Ada.Command_Line.Argument (1));
   time_offset : constant Integer := Integer'Value (Ada.Command_Line.Argument (2));
begin

   for I in stdin'Range loop
      parsed_step := Step.FromString (stdin (I));
      TimedStep.AppendToMap (steps, parsed_step, time_offset);
   end loop;

   for S in TimedStep.TimedStepMap.Iterate (steps) loop
      TimedStep.Print (TimedStep.TimedStepMap.Element (S), steps);
   end loop;

   TimedStep.RunMap (steps, nelves);

end d7_2;
