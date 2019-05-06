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
      Step.AppendToMap (steps, parsed_step);
   end loop;

   while Step.UnresolvedCount (steps) > 0 loop
      Step.RunMap (steps);
   end loop;

   Step.RunMap (steps);

end d7;
