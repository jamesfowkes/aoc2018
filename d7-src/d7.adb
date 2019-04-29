with Step;
with Types;
with get_stdin;

procedure d7 is

   stdin : constant Types.StringArray := get_stdin.get_strs;
   steps : Step.StepMap.Map;
   parsed_step : Step.ParsedStep;

begin
   for I in stdin'Range loop
      parsed_step := Step.FromString (stdin (I));

      if not steps.Contains (parsed_step.step) then
         steps.Insert (parsed_step.step, New_Item => Step.Create (parsed_step.step));
      end if;

      if not steps.Contains (parsed_step.depends) then
         steps.Insert (parsed_step.depends, New_Item => Step.Create (parsed_step.depends));
      end if;

      steps (parsed_step.step).deps.Append (parsed_step.depends);
   end loop;

   while Step.UnresolvedCount (steps) > 0 loop
      Step.RunMap (steps);
   end loop;

   Step.RunMap (steps);

end d7;
