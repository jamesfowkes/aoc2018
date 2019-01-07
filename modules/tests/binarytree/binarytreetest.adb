with AUnit.Assertions; use AUnit.Assertions;
with Ada.Containers; use Ada.Containers;
with binarytree;
with utils;

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
      traversal_vec : utils.IntegerVector.Vector;
   begin
      binarytree.init (test_root);
      binarytree.insert (test_root, 1);

      Assert (binarytree.count (test_root) = 1,
         "Tree should have exactly one child");
      Assert (binarytree.hasleft (test_root) = False,
         "Root node should not have left node");
      Assert (binarytree.hasright (test_root) = False,
         "Root node should not have right node");

      binarytree.traverse_inorder(test_root, traversal_vec);

      Assert(traversal_vec.Element(0) = 1, "First vector element should be 1");
      Assert(traversal_vec.Length = 1, "Length of vector should be 1");

   end AddSingleNode;

   procedure AddTwoNodes_AGreaterThanB (R : in out AUnit.Test_Cases.Test_Case'Class) is
      test_root : binarytree.binarytree_root;
      traversal_vec : utils.IntegerVector.Vector;
   begin
      binarytree.init (test_root);
      binarytree.insert (test_root, 2);
      binarytree.insert (test_root, 1);

      Assert (binarytree.count (test_root) = 2,
         "Tree should have exactly two children");

      binarytree.traverse_inorder(test_root, traversal_vec);

      Assert(traversal_vec.Element(0) = 1, "First vector element should be 1");
      Assert(traversal_vec.Element(1) = 2, "Second vector element should be 2");
      Assert(traversal_vec.Length = 2, "Length of vector should be 2");

   end AddTwoNodes_AGreaterThanB;

   procedure AddTwoNodes_BGreaterThanA (R : in out AUnit.Test_Cases.Test_Case'Class) is
      test_root : binarytree.binarytree_root;
      traversal_vec : utils.IntegerVector.Vector;
   begin
      binarytree.init (test_root);
      binarytree.insert (test_root, 1);
      binarytree.insert (test_root, 2);

      Assert (binarytree.count (test_root) = 2,
         "Tree should have exactly two children");

      binarytree.traverse_inorder(test_root, traversal_vec);

      Assert(traversal_vec.Element(0) = 1, "First vector element should be 1");
      Assert(traversal_vec.Element(1) = 2, "Second vector element should be 2");
      Assert(traversal_vec.Length = 2, "Length of vector should be 2");

   end AddTwoNodes_BGreaterThanA;

   procedure AddTwoNodes_AEqualToB (R : in out AUnit.Test_Cases.Test_Case'Class) is
      test_root : binarytree.binarytree_root;
      traversal_vec : utils.IntegerVector.Vector;
   begin
      binarytree.init (test_root);
      binarytree.insert (test_root, 1);
      binarytree.insert (test_root, 1);

      Assert (binarytree.count (test_root) = 2,
         "Tree should have exactly two children");

      binarytree.traverse_inorder(test_root, traversal_vec);

      Assert(traversal_vec.Element(0) = 1, "First vector element should be 1");
      Assert(traversal_vec.Element(1) = 1, "Second vector element should be 2");
      Assert(traversal_vec.Length = 2, "Length of vector should be 2");

   end AddTwoNodes_AEqualToB;
   procedure Register_Tests (T : in out Test_Case) is
      use Test_Cases, Test_Cases.Registration;
   begin
      Register_Routine (T, InitTest'Access, "Initialization of a tree");
      Register_Routine (T, AddSingleNode'Access, "Adding a single node to a tree");
      Register_Routine (T, AddTwoNodes_AGreaterThanB'Access, "Adding a two nodes where the value of 1st > 2nd");
      Register_Routine (T, AddTwoNodes_BGreaterThanA'Access, "Adding a two nodes where the value of 1st < 2nd");
      Register_Routine (T, AddTwoNodes_AEqualToB'Access, "Adding a two nodes where the value of 1st = 2nd");

   end Register_Tests;

   function Name (T : Test_Case) return Message_String is
   begin
      return Format ("Test BinaryTree package");
   end Name;

end BinaryTreeTest;
