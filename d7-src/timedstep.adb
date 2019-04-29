with Ada.Text_IO;
with Ada.Integer_Text_IO;
with TimedStep;
with Ada.Strings.Fixed;

package body TimedStep is

   function Create (name : Character) return TimedStepRecord is
      new_step  : TimedStepRecord;
      dependencies  : Step.DependencyVector.Vector;
   begin
      new_step.name := name;
      new_step.deps := dependencies;
      new_step.time := Character'Pos (name) - 65 + 1;
      new_step.done := False;
      return new_step;
   end Create;

   function TryRun (step_record : TimedStepRecord; other_steps : TimedStepMap.Map) return Boolean is
   begin
      if TimedStep.UnresolvedCount (step_record, other_steps) = 0 and step_record.done = False then
         return True;
      end if;
      return False;
   end TryRun;

   function UnresolvedCount (step_record : TimedStepRecord; other_steps : TimedStepMap.Map) return Integer is
      count  : Integer := 0;
   begin
      for C : Character of step_record.deps loop
         if not other_steps (C).done then
            count := count + 1;
         end if;
      end loop;
      return count;
   end UnresolvedCount;

   function UnresolvedCount (step_map : TimedStepMap.Map) return Integer is
      count : Integer := 0;
   begin
      for S in TimedStep.TimedStepMap.Iterate (step_map) loop
         count := count + UnresolvedCount (TimedStep.TimedStepMap.Element (S), step_map);
      end loop;
      return count;
   end UnresolvedCount;

   procedure RunMap (step_map : in out TimedStepMap.Map; nelves : Integer) is
      free_elf : Integer := 1;
      time := Integer := 0;
   begin
      declare
         elves : String (1 .. nelves) := (others => '#');
      begin
         for elf of elves then
            if elf /= '#' then
               step_map (elf).run ();
      end;
   end RunMap;

   procedure Print (to_print : TimedStepRecord; other_steps : TimedStepMap.Map) is
   begin
      Ada.Text_IO.Put ("TimedStep ");
      Ada.Text_IO.Put (to_print.name);

      if Integer (TimedStep.DependencyVector.Length (to_print.deps)) > 0 then
         Ada.Text_IO.Put (" depends on ");
         for C  : Character of to_print.deps loop
            Ada.Text_IO.Put (C);
         end loop;
         Ada.Text_IO.Put ("  (");
         Ada.Integer_Text_IO.Put (TimedStep.UnresolvedCount (to_print, other_steps), Width => 0);
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
end TimedStep;
