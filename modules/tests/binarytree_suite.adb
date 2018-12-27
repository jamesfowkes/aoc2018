--
--  Copyright (C) 2008, AdaCore
--
with binarytree.Test;

package body BinaryTree_Suite is

   function Suite return Access_Test_Suite is
      Ret : constant Access_Test_Suite := new Test_Suite;
   begin
      Ret.Add_Test (new binarytree.Test.Test);
      return Ret;
   end Suite;

end BinaryTree_Suite;
