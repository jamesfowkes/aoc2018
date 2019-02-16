with AUnit.Reporter.Text;
with AUnit.Run;

--  Suite for this level of tests:
with CoordTest_Suite;

procedure Harness is

   procedure Run is new AUnit.Run.Test_Runner (CoordTest_Suite.Suite);
   Reporter : AUnit.Reporter.Text.Text_Reporter;

begin
   Run (Reporter);
end Harness;
