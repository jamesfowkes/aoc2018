with CoordTest;

package body CoordTest_Suite is

   Result : aliased Test_Suite;

   Test_Case : aliased CoordTest.Test_Case;

   function Suite return Access_Test_Suite is
   begin
      Add_Test (Result'Access, Test_Case'Access);
      return Result'Access;
   end Suite;

end CoordTest_Suite;
