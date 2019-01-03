with AUnit.Assertions; use AUnit.Assertions;
with binarytree;

package body BinaryTreeTest is

   procedure InitTest (R : in out AUnit.Test_Cases.Test_Case'Class);
   procedure AddSingleNode (R : in out AUnit.Test_Cases.Test_Case'Class);

   procedure Set_Up (T : in out Test_Case) is
   begin
      null;
   end Set_Up;

   procedure Tear_Down (T : in out Test_Case) is
   begin
      null;
   end Tear_Down;


   procedure InitTest (R : in out AUnit.Test_Cases.Test_Case'Class) is
      test_root : binarytree.binarytree_root;
   begin
      binarytree.init (test_root);
      Assert (binarytree.hasleft (test_root) = False,
         "Root node should not have left node");
      Assert (binarytree.hasright (test_root) = False,
         "Root node should not have right node");
      Assert (binarytree.count (test_root) = 0,
         "Tree should not have any nodes");
   end InitTest;

   procedure AddSingleNode (R : in out AUnit.Test_Cases.Test_Case'Class) is
      test_root : binarytree.binarytree_root;
   begin
      binarytree.init (test_root);
      binarytree.insert (test_root, 1);

      Assert (binarytree.count (test_root) = 1,
         "Tree should have exactly one child");
      Assert (binarytree.hasleft (test_root) = False,
         "Root node should not have left node");
      Assert (binarytree.hasright (test_root) = False,
         "Root node should not have right node");
   end AddSingleNode;

   procedure Register_Tests (T : in out Test_Case) is
      use Test_Cases, Test_Cases.Registration;
   begin
      Register_Routine (T, InitTest'Access, "Initialization of a tree");
      Register_Routine (T, AddSingleNode'Access, "Adding a single node to a tree");
   end Register_Tests;

   function Name (T : Test_Case) return Message_String is
   begin
      return Format ("Test BinaryTree package");
   end Name;

end BinaryTreeTest;
