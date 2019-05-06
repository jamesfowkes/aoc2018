with Ada.Text_IO;
with Ada.Integer_Text_IO;
with Ada.Strings.Fixed;

with TimedStep;

package body TimedStep is

   procedure AppendToMap (steps : in out TimedStep.TimedStepMap.Map; parsed_step : in Step.ParsedStep) is
   begin
      if not steps.Contains (parsed_step.step) then
         steps.Insert (parsed_step.step, New_Item => TimedStep.Create (parsed_step.step));
      end if;

      if not steps.Contains (parsed_step.depends) then
         steps.Insert (parsed_step.depends, New_Item => TimedStep.Create (parsed_step.depends));
      end if;

      steps (parsed_step.step).deps.Append (parsed_step.depends);
   end AppendToMap;

   function Create (name : Character) return TimedStepRecord is
      new_step  : TimedStepRecord;
      dependencies  : Step.DependencyVector.Vector;
   begin
      new_step.name := name;
      new_step.deps := dependencies;
      new_step.time := Character'Pos (name) - 65 + 1;
      new_step.running := False;
      return new_step;
   end Create;

   function TryRun (step_record : TimedStepRecord; other_steps : TimedStepMap.Map) return Boolean is
   begin
      if TimedStep.UnresolvedCount (step_record, other_steps) = 0 and step_record.time = 0 then
         return True;
      end if;
      return False;
   end TryRun;

   function UnresolvedCount (step_record : TimedStepRecord; other_steps : TimedStepMap.Map) return Integer is
      count : Integer := 0;
   begin
      for C : Character of step_record.deps loop
         if other_steps (C).time > 0 then
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

   function FindFreeStep (step_map : TimedStepMap.Map) return Character is
      step : TimedStep.TimedStepRecord;
   begin
      for S in TimedStep.TimedStepMap.Iterate (step_map) loop
         step := TimedStep.TimedStepMap.Element (S);
         if not step.running and (UnresolvedCount (step, step_map) = 0) then
            return step.name;
         end if;
      end loop;
      return '#';
   end FindFreeStep;

   procedure RunMap (step_map : in out TimedStepMap.Map; nelves : Integer) is
      free_elf_index : Integer := -1;
      free_step : Character := '#';
   begin
      declare
         running_steps : String (1 .. nelves) := (others => '#');
      begin
         while TimedStep.UnresolvedCount (step_map) > 0 loop

            --  Assign any free slots
            while free_elf_index /= 0 loop
               free_elf_index := Ada.Strings.Fixed.Index (running_steps, "#");
               if free_elf_index /= 0 then
                  Ada.Text_IO.Put ("Elf #");
                  Ada.Integer_Text_IO.Put (free_elf_index, Width => 0);
                  Ada.Text_IO.Put (" is free.");
                  --  Find a step that can be run
                  free_step := FindFreeStep (step_map);
                  if free_step /= '#' then
                     Ada.Text_IO.Put (" Assigning to step ");
                     Ada.Text_IO.Put_Line (Character'Image (free_step));
                     running_steps (free_elf_index) := free_step;
                     step_map (free_step).running := True;
                  else
                     Ada.Text_IO.Put_Line ("No free steps.");
                  end if;
               end if;

               --  Run the running steps
               for C  : Character of running_steps loop
                  if C /= '#' then
                     Ada.Text_IO.Put ("Running step ");
                     Ada.Text_IO.Put_Line (Character'Image (C));
                     step_map (C).time := step_map (C).time - 1;
                  end if;
               end loop;

            end loop;

         end loop;
      end;
   end RunMap;

   procedure AddDependency (step_record : out TimedStepRecord; dep : Character) is
   begin
      null;
   end AddDependency;

   procedure Print (to_print : TimedStepRecord; other_steps : TimedStepMap.Map) is
   begin
      Ada.Text_IO.Put ("TimedStep ");
      Ada.Text_IO.Put (to_print.name);

      if Integer (Step.DependencyVector.Length (to_print.deps)) > 0 then
         Ada.Text_IO.Put (" depends on ");
         for C  : Character of to_print.deps loop
            Ada.Text_IO.Put (C);
         end loop;

         Ada.Text_IO.Put (" and has ");
         Ada.Integer_Text_IO.Put (to_print.time, Width => 0);
         Ada.Text_IO.Put ("s to run. (");

         Ada.Integer_Text_IO.Put (TimedStep.UnresolvedCount (to_print, other_steps), Width => 0);
         Ada.Text_IO.Put (" to resolve : ");
         for C  : Character of to_print.deps loop
            if other_steps (C).time > 0 then
               Ada.Text_IO.Put (C);
            end if;
         end loop;
         Ada.Text_IO.Put_Line (")");
      else
         Ada.Text_IO.Put_Line (" has no dependencies ");
      end if;
   end Print;
end TimedStep;
