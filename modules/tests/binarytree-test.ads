--
--  Copyright (C) 2008, AdaCore
--
with AUnit;
with AUnit.Simple_Test_Cases;

package binarytree.Test is

   type Test is new AUnit.Simple_Test_Cases.Test_Case with null record;

   function Name (T : Test) return AUnit.Message_String;

   procedure Run_Test (T : in out Test);

end binarytree.Test;
