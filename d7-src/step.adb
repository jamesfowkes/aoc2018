with Ada.Text_IO;
with Ada.Integer_Text_IO;
with Step;

package body Step is

   procedure AppendToMap (steps : in out Step.StepMap.Map; parsed_step : in Step.ParsedStep) is
   begin
      if not steps.Contains (parsed_step.step) then
         steps.Insert (parsed_step.step, New_Item => Step.Create (parsed_step.step));
      end if;

      if not steps.Contains (parsed_step.depends) then
         steps.Insert (parsed_step.depends, New_Item => Step.Create (parsed_step.depends));
      end if;

      steps (parsed_step.step).deps.Append (parsed_step.depends);
   end AppendToMap;

   function Create (name : Character) return StepRecord is
      new_step  : StepRecord;
      dependencies  : Step.DependencyVector.Vector;
   begin
      new_step.name := name;
      new_step.deps := dependencies;
      new_step.done := False;
      return new_step;
   end Create;

   function TryRun (step_record : StepRecord; other_steps : StepMap.Map) return Boolean is
   begin
      if Step.UnresolvedCount (step_record, other_steps) = 0 and step_record.done = False then
         return True;
      end if;
      return False;
   end TryRun;

   function FromString (s : in UStr.Unbounded_String) return ParsedStep is
      new_step  : ParsedStep;
   begin
      new_step.step := UStr.Element (s, 37);
      new_step.depends := UStr.Element (s, 6);
      return new_step;
   end FromString;

   function UnresolvedCount (step_record : StepRecord; other_steps : StepMap.Map) return Integer is
      count  : Integer := 0;
   begin
      for C : Character of step_record.deps loop
         if not other_steps (C).done then
            count := count + 1;
         end if;
      end loop;
      return count;
   end UnresolvedCount;

   function UnresolvedCount (step_map : StepMap.Map) return Integer is
      count : Integer := 0;
   begin
      for S in Step.StepMap.Iterate (step_map) loop
         count := count + UnresolvedCount (Step.StepMap.Element (S), step_map);
      end loop;
      return count;
   end UnresolvedCount;

   procedure RunMap (step_map : in out StepMap.Map) is
   begin
      RUNLOOP :
      for S in Step.StepMap.Iterate (step_map) loop
         if Step.TryRun  (Step.StepMap.Element (S), step_map) then
            Step.StepMap.Reference (step_map, S).done := True;
            Ada.Text_IO.Put (Step.StepMap.Key (S));
            exit RUNLOOP;
         end if;
      end loop RUNLOOP;
   end RunMap;

   procedure Print (to_print : StepRecord; other_steps : StepMap.Map) is
   begin
      Ada.Text_IO.Put ("Step ");
      Ada.Text_IO.Put (to_print.name);

      if Integer (Step.DependencyVector.Length (to_print.deps)) > 0 then
         Ada.Text_IO.Put (" depends on ");
         for C  : Character of to_print.deps loop
            Ada.Text_IO.Put (C);
         end loop;
         Ada.Text_IO.Put ("  (");
         Ada.Integer_Text_IO.Put (Step.UnresolvedCount (to_print, other_steps), Width => 0);
         Ada.Text_IO.Put (" to resolve : ");
         for C  : Character of to_print.deps loop
            if not other_steps (C).done then
               Ada.Text_IO.Put (C);
            end if;
         end loop;
         Ada.Text_IO.Put_Line (")");
      else
         Ada.Text_IO.Put_Line (" has no dependencies ");
      end if;
   end Print;
end Step;
