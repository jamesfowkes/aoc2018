with Ada.Strings.Unbounded;
with Ada.Text_IO;
with Ada.Integer_Text_IO;

with Step;
with Types;
with get_stdin;

procedure d7 is

   package UStr renames Ada.Strings.Unbounded;

   stdin : Types.StringArray := get_stdin.get_strs;
   steps : Step.StepMap.Map;
   parsed_step : Step.ParsedStep;

   procedure RunMap(step_map: in out Step.StepMap.Map) is
   begin
      RUNLOOP:
      for S in Step.StepMap.Iterate(steps) loop
         if Step.TryRun(Step.StepMap.Element(S), steps) then
            Step.StepMap.Reference(steps, S).done := true;
            Ada.Text_IO.Put(Step.StepMap.Key(S));
            exit RUNLOOP;
         end if;
      end loop RUNLOOP;
   end RunMap;

begin
   for I in stdin'Range loop
      parsed_step := Step.FromString(stdin(I));
      
      if not steps.Contains(parsed_step.step) then
         steps.Insert(parsed_step.step, New_Item => Step.Create(parsed_step.step));
      end if;

      if not steps.Contains(parsed_step.depends) then
         steps.Insert(parsed_step.depends, New_Item => Step.Create(parsed_step.depends));
      end if;

      Step.AddDependency(steps(parsed_step.step), parsed_step.depends);
   end loop;

   while Step.UnresolvedCount(steps) > 0 loop
      --  Ada.Integer_Text_IO.Put(Step.UnresolvedCount(steps), Width => 0);
      --  Ada.Text_IO.Put_Line(" steps to resolve:");
      --  for S in Step.StepMap.Iterate(steps) loop
      --     Step.Print(Step.StepMap.Element(S), steps);
      --  end loop;
      RunMap(steps);

      --  Ada.Text_IO.Put_Line("");
   end loop;

   --  for S in Step.StepMap.Iterate(steps) loop
   --     Step.Print(Step.StepMap.Element(S), steps);
   --  end loop;
   RunMap(steps);

end;
