with Ada.Strings.Unbounded;
with Ada.Containers.Ordered_Maps;
with Step;

package TimedStep is

   package UStr renames Ada.Strings.Unbounded;

   type TimedStepRecord is
   record
      name : Character;
      deps : Step.DependencyVector.Vector;
      time : Integer;
      running : Boolean;
   end record;

   package TimedStepMap is new Ada.Containers.Ordered_Maps (
      Key_Type => Character,
      Element_Type => TimedStepRecord
   );

   procedure AppendToMap (steps : in out TimedStep.TimedStepMap.Map; parsed_step : in Step.ParsedStep);
   function Create (name : Character) return TimedStepRecord;
   function TryRun (step_record : TimedStepRecord; other_steps : TimedStepMap.Map) return Boolean;
   function UnresolvedCount (step_record : TimedStepRecord; other_steps : TimedStepMap.Map) return Integer;
   function UnresolvedCount (step_map : TimedStepMap.Map) return Integer;
   function FindFreeStep (step_map : TimedStepMap.Map) return Character;

   procedure RunMap  (step_map : in out TimedStepMap.Map; nelves : Integer);
   procedure AddDependency (step_record : out TimedStepRecord; dep : Character);
   procedure Print (to_print : TimedStepRecord; other_steps : TimedStepMap.Map);

end TimedStep;
