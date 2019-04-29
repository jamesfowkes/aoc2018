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
begin
   for I in stdin'Range loop
      parsed_step := Step.FromString (stdin (I));

      if not steps.Contains (parsed_step.step) then
         steps.Insert (parsed_step.step, New_Item => TimedStep.Create (parsed_step.step));
      end if;

      if not steps.Contains (parsed_step.depends) then
         steps.Insert (parsed_step.depends, New_Item => TimedStep.Create (parsed_step.depends));
      end if;

      steps (parsed_step.step).deps.Append (parsed_step.depends);
   end loop;

   TimedStep.RunMap (steps, nelves);

end d7_2;
