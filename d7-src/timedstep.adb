with Ada.Text_IO;
with Ada.Integer_Text_IO;
with Ada.Strings.Fixed;

with TimedStep;

package body TimedStep is

   procedure AppendToMap (
      steps : in out TimedStep.TimedStepMap.Map;
      parsed_step : in Step.ParsedStep;
      time_offset : in Integer
   ) is
   begin
      if not steps.Contains (parsed_step.step) then
         steps.Insert (parsed_step.step, New_Item => TimedStep.Create (parsed_step.step, time_offset));
      end if;

      if not steps.Contains (parsed_step.depends) then
         steps.Insert (parsed_step.depends, New_Item => TimedStep.Create (parsed_step.depends, time_offset));
      end if;

      steps (parsed_step.step).deps.Append (parsed_step.depends);
   end AppendToMap;

   function Create (name : Character; time_offset : Integer) return TimedStepRecord is
      new_step  : TimedStepRecord;
      dependencies  : Step.DependencyVector.Vector;
   begin
      new_step.name := name;
      new_step.deps := dependencies;
      new_step.time := Character'Pos (name) - 65 + 1 + time_offset;
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
         if TimedStep.TimedStepMap.Element (S).time > 0 then 
            count := count + 1;
         end if;
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
      free_step : Character := '#';
      elf_index : Integer := 1;
      time : Integer := 0;
   begin
      declare
         running_steps : String (1 .. nelves) := (others => '#');
      begin
         while TimedStep.UnresolvedCount (step_map) > 0 loop

            --  Assign any free slots
            Ada.Text_IO.Put ("T = ");
            Ada.Integer_Text_IO.Put (time, Width => 0);
            Ada.Text_IO.Put_Line("");

            elf_index := 1;
            for C  : Character of running_steps loop
               if C = '#' then
                  elf_index := Ada.Strings.Fixed.Index (running_steps, "#");
                  Ada.Text_IO.Put ("Elf #");
                  Ada.Integer_Text_IO.Put (elf_index, Width => 0);
                  Ada.Text_IO.Put (" is free.");
                  --  Find a step that can be run
                  free_step := FindFreeStep (step_map);
                  if free_step /= '#' then
                     Ada.Text_IO.Put (" Assigning to step ");
                     Ada.Text_IO.Put_Line (Character'Image (free_step));
                     running_steps (elf_index) := free_step;
                     step_map (free_step).running := True;
                  else
                     Ada.Text_IO.Put_Line (" No free steps.");
                  end if;
               end if;
               elf_index := elf_index + 1;
            end loop;

            --  Run the running steps
            elf_index := 1;
            for C  : Character of running_steps loop
               if C /= '#' then
                  Ada.Text_IO.Put ("Running step ");
                  Ada.Text_IO.Put (Character'Image (C));
                  Ada.Text_IO.Put (": ");
                  step_map (C).time := step_map (C).time - 1;
                  if step_map (C).time = 0 then
                     Ada.Text_IO.Put_Line ("done!");
                     running_steps (elf_index) := '#';
                  else
                     Ada.Integer_Text_IO.Put (step_map (C).time, Width => 0);
                     Ada.Text_IO.Put_Line ("s to go.");
                  end if;
               end if;
               elf_index := elf_index + 1;
            end loop;

            Ada.Text_IO.Put_Line("Running Steps: ");
            for C  : Character of running_steps loop
               if C /= '#' then
                  TimedStep.Print (step_map (C), step_map);
               end if;
            end loop;

         Ada.Text_IO.Put_Line("-------------");      
         time := time + 1;
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
         Ada.Text_IO.Put (" has no dependencies and has ");
         Ada.Integer_Text_IO.Put (to_print.time, Width => 0);
         Ada.Text_IO.Put_Line ("s to run.");
      end if;
   end Print;
end TimedStep;
