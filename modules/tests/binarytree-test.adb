--
--  Copyright (C) 2008, AdaCore
--
with AUnit.Assertions; use AUnit.Assertions;

package body binarytree.Test is

   function Name (T : Test) return AUnit.Message_String is
      pragma Unreferenced (T);
   begin
      return AUnit.Format ("Test BinaryTree package");
   end Name;

   procedure Run_Test (T : in out Test) is
      pragma Unreferenced (T);
      test_root : binarytree.binarytree_root;
   begin
      binarytree.init (test_root);
      Assert (binarytree.hasleft (test_root) = False,
         "Root node should not have left node");
      Assert (binarytree.hasright (test_root) = False,
         "Root node should not have right node");
      Assert (binarytree.count (test_root) = 0,
         "Root node should not any children");
   end Run_Test;

end binarytree.Test;
