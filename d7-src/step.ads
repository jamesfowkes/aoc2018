with Ada.Containers.Vectors;
with Ada.Strings.Unbounded;
with Ada.Containers.Ordered_Maps;

package Step is

   package UStr renames Ada.Strings.Unbounded;

   package DependencyVector is new Ada.Containers.Vectors
       (Element_Type => Character,
      Index_Type => Natural);

   type StepRecord is
   record
      name : Character;
      deps : DependencyVector.Vector;
      done : Boolean;
   end record;

   type ParsedStep is
   record
      step : Character;
      depends : Character;
   end record;

   package StepMap is new Ada.Containers.Ordered_Maps (
      Key_Type => Character,
      Element_Type => StepRecord
   );

   procedure AppendToMap (steps : in out Step.StepMap.Map; parsed_step : in Step.ParsedStep);
   function Create (name : Character) return StepRecord;
   function FromString (s : in UStr.Unbounded_String) return ParsedStep;
   function TryRun (step_record : StepRecord; other_steps : StepMap.Map) return Boolean;
   function UnresolvedCount (step_record : StepRecord; other_steps : StepMap.Map) return Integer;
   function UnresolvedCount (step_map : StepMap.Map) return Integer;

   procedure RunMap  (step_map : in out StepMap.Map);
   procedure Print (to_print : StepRecord; other_steps : StepMap.Map);

end Step;
