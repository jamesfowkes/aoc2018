with BinaryTreeTest;

package body BinaryTreeTest_Suite is

   Result : aliased Test_Suite;

   Test_Case : aliased BinaryTreeTest.Test_Case;

   function Suite return Access_Test_Suite is
   begin
      Add_Test (Result'Access, Test_Case'Access);
      return Result'Access;
   end Suite;

end BinaryTreeTest_Suite;
