pragma Ada_95;
pragma Warnings (Off);
pragma Source_File_Name (ada_main, Spec_File_Name => "b__harness.ads");
pragma Source_File_Name (ada_main, Body_File_Name => "b__harness.adb");
pragma Suppress (Overflow_Check);
with Ada.Exceptions;

package body ada_main is

   E018 : Short_Integer; pragma Import (Ada, E018, "system__soft_links_E");
   E026 : Short_Integer; pragma Import (Ada, E026, "system__exception_table_E");
   E129 : Short_Integer; pragma Import (Ada, E129, "ada__containers_E");
   E055 : Short_Integer; pragma Import (Ada, E055, "ada__io_exceptions_E");
   E057 : Short_Integer; pragma Import (Ada, E057, "ada__tags_E");
   E054 : Short_Integer; pragma Import (Ada, E054, "ada__streams_E");
   E088 : Short_Integer; pragma Import (Ada, E088, "interfaces__c_E");
   E028 : Short_Integer; pragma Import (Ada, E028, "system__exceptions_E");
   E100 : Short_Integer; pragma Import (Ada, E100, "system__finalization_root_E");
   E098 : Short_Integer; pragma Import (Ada, E098, "ada__finalization_E");
   E102 : Short_Integer; pragma Import (Ada, E102, "system__storage_pools_E");
   E093 : Short_Integer; pragma Import (Ada, E093, "system__finalization_masters_E");
   E143 : Short_Integer; pragma Import (Ada, E143, "system__storage_pools__subpools_E");
   E086 : Short_Integer; pragma Import (Ada, E086, "ada__calendar_E");
   E141 : Short_Integer; pragma Import (Ada, E141, "system__assertions_E");
   E104 : Short_Integer; pragma Import (Ada, E104, "system__pool_global_E");
   E022 : Short_Integer; pragma Import (Ada, E022, "system__secondary_stack_E");
   E078 : Short_Integer; pragma Import (Ada, E078, "ada_containers__aunit_lists_E");
   E005 : Short_Integer; pragma Import (Ada, E005, "aunit_E");
   E008 : Short_Integer; pragma Import (Ada, E008, "aunit__memory_E");
   E080 : Short_Integer; pragma Import (Ada, E080, "aunit__memory__utils_E");
   E091 : Short_Integer; pragma Import (Ada, E091, "aunit__tests_E");
   E071 : Short_Integer; pragma Import (Ada, E071, "aunit__test_filters_E");
   E084 : Short_Integer; pragma Import (Ada, E084, "aunit__time_measure_E");
   E082 : Short_Integer; pragma Import (Ada, E082, "aunit__test_results_E");
   E075 : Short_Integer; pragma Import (Ada, E075, "aunit__assertions_E");
   E012 : Short_Integer; pragma Import (Ada, E012, "aunit__reporter_E");
   E114 : Short_Integer; pragma Import (Ada, E114, "aunit__reporter__text_E");
   E073 : Short_Integer; pragma Import (Ada, E073, "aunit__simple_test_cases_E");
   E147 : Short_Integer; pragma Import (Ada, E147, "aunit__test_cases_E");
   E124 : Short_Integer; pragma Import (Ada, E124, "aunit__test_suites_E");
   E122 : Short_Integer; pragma Import (Ada, E122, "aunit__run_E");
   E128 : Short_Integer; pragma Import (Ada, E128, "binarytreetest_E");
   E126 : Short_Integer; pragma Import (Ada, E126, "binarytreetest_suite_E");
   E133 : Short_Integer; pragma Import (Ada, E133, "stack_E");
   E135 : Short_Integer; pragma Import (Ada, E135, "utils_E");
   E131 : Short_Integer; pragma Import (Ada, E131, "binarytree_E");

   Local_Priority_Specific_Dispatching : constant String := "";
   Local_Interrupt_States : constant String := "";

   Is_Elaborated : Boolean := False;

   procedure finalize_library is
   begin
      E128 := E128 - 1;
      E135 := E135 - 1;
      declare
         procedure F1;
         pragma Import (Ada, F1, "utils__finalize_spec");
      begin
         F1;
      end;
      declare
         procedure F2;
         pragma Import (Ada, F2, "binarytreetest__finalize_spec");
      begin
         F2;
      end;
      E124 := E124 - 1;
      declare
         procedure F3;
         pragma Import (Ada, F3, "aunit__test_suites__finalize_spec");
      begin
         F3;
      end;
      E147 := E147 - 1;
      declare
         procedure F4;
         pragma Import (Ada, F4, "aunit__test_cases__finalize_spec");
      begin
         F4;
      end;
      E071 := E071 - 1;
      E073 := E073 - 1;
      declare
         procedure F5;
         pragma Import (Ada, F5, "aunit__simple_test_cases__finalize_spec");
      begin
         F5;
      end;
      E114 := E114 - 1;
      declare
         procedure F6;
         pragma Import (Ada, F6, "aunit__reporter__text__finalize_spec");
      begin
         F6;
      end;
      E075 := E075 - 1;
      declare
         procedure F7;
         pragma Import (Ada, F7, "aunit__assertions__finalize_spec");
      begin
         F7;
      end;
      E082 := E082 - 1;
      declare
         procedure F8;
         pragma Import (Ada, F8, "aunit__test_results__finalize_spec");
      begin
         F8;
      end;
      declare
         procedure F9;
         pragma Import (Ada, F9, "aunit__test_filters__finalize_spec");
      begin
         F9;
      end;
      declare
         procedure F10;
         pragma Import (Ada, F10, "aunit__tests__finalize_spec");
      begin
         E091 := E091 - 1;
         F10;
      end;
      E093 := E093 - 1;
      E143 := E143 - 1;
      E104 := E104 - 1;
      declare
         procedure F11;
         pragma Import (Ada, F11, "system__pool_global__finalize_spec");
      begin
         F11;
      end;
      declare
         procedure F12;
         pragma Import (Ada, F12, "system__storage_pools__subpools__finalize_spec");
      begin
         F12;
      end;
      declare
         procedure F13;
         pragma Import (Ada, F13, "system__finalization_masters__finalize_spec");
      begin
         F13;
      end;
      declare
         procedure Reraise_Library_Exception_If_Any;
            pragma Import (Ada, Reraise_Library_Exception_If_Any, "__gnat_reraise_library_exception_if_any");
      begin
         Reraise_Library_Exception_If_Any;
      end;
   end finalize_library;

   procedure adafinal is
      procedure s_stalib_adafinal;
      pragma Import (C, s_stalib_adafinal, "system__standard_library__adafinal");

      procedure Runtime_Finalize;
      pragma Import (C, Runtime_Finalize, "__gnat_runtime_finalize");

   begin
      if not Is_Elaborated then
         return;
      end if;
      Is_Elaborated := False;
      Runtime_Finalize;
      s_stalib_adafinal;
   end adafinal;

   type No_Param_Proc is access procedure;

   procedure adainit is
      Main_Priority : Integer;
      pragma Import (C, Main_Priority, "__gl_main_priority");
      Time_Slice_Value : Integer;
      pragma Import (C, Time_Slice_Value, "__gl_time_slice_val");
      WC_Encoding : Character;
      pragma Import (C, WC_Encoding, "__gl_wc_encoding");
      Locking_Policy : Character;
      pragma Import (C, Locking_Policy, "__gl_locking_policy");
      Queuing_Policy : Character;
      pragma Import (C, Queuing_Policy, "__gl_queuing_policy");
      Task_Dispatching_Policy : Character;
      pragma Import (C, Task_Dispatching_Policy, "__gl_task_dispatching_policy");
      Priority_Specific_Dispatching : System.Address;
      pragma Import (C, Priority_Specific_Dispatching, "__gl_priority_specific_dispatching");
      Num_Specific_Dispatching : Integer;
      pragma Import (C, Num_Specific_Dispatching, "__gl_num_specific_dispatching");
      Main_CPU : Integer;
      pragma Import (C, Main_CPU, "__gl_main_cpu");
      Interrupt_States : System.Address;
      pragma Import (C, Interrupt_States, "__gl_interrupt_states");
      Num_Interrupt_States : Integer;
      pragma Import (C, Num_Interrupt_States, "__gl_num_interrupt_states");
      Unreserve_All_Interrupts : Integer;
      pragma Import (C, Unreserve_All_Interrupts, "__gl_unreserve_all_interrupts");
      Exception_Tracebacks : Integer;
      pragma Import (C, Exception_Tracebacks, "__gl_exception_tracebacks");
      Detect_Blocking : Integer;
      pragma Import (C, Detect_Blocking, "__gl_detect_blocking");
      Default_Stack_Size : Integer;
      pragma Import (C, Default_Stack_Size, "__gl_default_stack_size");
      Leap_Seconds_Support : Integer;
      pragma Import (C, Leap_Seconds_Support, "__gl_leap_seconds_support");
      Bind_Env_Addr : System.Address;
      pragma Import (C, Bind_Env_Addr, "__gl_bind_env_addr");

      procedure Runtime_Initialize (Install_Handler : Integer);
      pragma Import (C, Runtime_Initialize, "__gnat_runtime_initialize");

      Finalize_Library_Objects : No_Param_Proc;
      pragma Import (C, Finalize_Library_Objects, "__gnat_finalize_library_objects");
   begin
      if Is_Elaborated then
         return;
      end if;
      Is_Elaborated := True;
      Main_Priority := -1;
      Time_Slice_Value := -1;
      WC_Encoding := 'b';
      Locking_Policy := ' ';
      Queuing_Policy := ' ';
      Task_Dispatching_Policy := ' ';
      Priority_Specific_Dispatching :=
        Local_Priority_Specific_Dispatching'Address;
      Num_Specific_Dispatching := 0;
      Main_CPU := -1;
      Interrupt_States := Local_Interrupt_States'Address;
      Num_Interrupt_States := 0;
      Unreserve_All_Interrupts := 0;
      Exception_Tracebacks := 1;
      Detect_Blocking := 0;
      Default_Stack_Size := -1;
      Leap_Seconds_Support := 0;

      Runtime_Initialize (1);

      Finalize_Library_Objects := finalize_library'access;

      System.Soft_Links'Elab_Spec;
      System.Exception_Table'Elab_Body;
      E026 := E026 + 1;
      Ada.Containers'Elab_Spec;
      E129 := E129 + 1;
      Ada.Io_Exceptions'Elab_Spec;
      E055 := E055 + 1;
      Ada.Tags'Elab_Spec;
      Ada.Streams'Elab_Spec;
      E054 := E054 + 1;
      Interfaces.C'Elab_Spec;
      System.Exceptions'Elab_Spec;
      E028 := E028 + 1;
      System.Finalization_Root'Elab_Spec;
      E100 := E100 + 1;
      Ada.Finalization'Elab_Spec;
      E098 := E098 + 1;
      System.Storage_Pools'Elab_Spec;
      E102 := E102 + 1;
      System.Finalization_Masters'Elab_Spec;
      System.Storage_Pools.Subpools'Elab_Spec;
      Ada.Calendar'Elab_Spec;
      Ada.Calendar'Elab_Body;
      E086 := E086 + 1;
      System.Assertions'Elab_Spec;
      E141 := E141 + 1;
      System.Pool_Global'Elab_Spec;
      E104 := E104 + 1;
      E143 := E143 + 1;
      System.Finalization_Masters'Elab_Body;
      E093 := E093 + 1;
      E088 := E088 + 1;
      Ada.Tags'Elab_Body;
      E057 := E057 + 1;
      System.Soft_Links'Elab_Body;
      E018 := E018 + 1;
      System.Secondary_Stack'Elab_Body;
      E022 := E022 + 1;
      E008 := E008 + 1;
      E005 := E005 + 1;
      E080 := E080 + 1;
      E078 := E078 + 1;
      Aunit.Tests'Elab_Spec;
      E091 := E091 + 1;
      Aunit.Test_Filters'Elab_Spec;
      Aunit.Time_Measure'Elab_Spec;
      E084 := E084 + 1;
      Aunit.Test_Results'Elab_Spec;
      E082 := E082 + 1;
      Aunit.Assertions'Elab_Spec;
      Aunit.Assertions'Elab_Body;
      E075 := E075 + 1;
      Aunit.Reporter'Elab_Spec;
      E012 := E012 + 1;
      Aunit.Reporter.Text'Elab_Spec;
      E114 := E114 + 1;
      Aunit.Simple_Test_Cases'Elab_Spec;
      E073 := E073 + 1;
      E071 := E071 + 1;
      Aunit.Test_Cases'Elab_Spec;
      E147 := E147 + 1;
      Aunit.Test_Suites'Elab_Spec;
      E124 := E124 + 1;
      E122 := E122 + 1;
      Binarytreetest'Elab_Spec;
      Binarytreetest_Suite'Elab_Body;
      E126 := E126 + 1;
      E133 := E133 + 1;
      utils'elab_spec;
      E135 := E135 + 1;
      E131 := E131 + 1;
      E128 := E128 + 1;
   end adainit;

   procedure Ada_Main_Program;
   pragma Import (Ada, Ada_Main_Program, "_ada_harness");

   function main
     (argc : Integer;
      argv : System.Address;
      envp : System.Address)
      return Integer
   is
      procedure Initialize (Addr : System.Address);
      pragma Import (C, Initialize, "__gnat_initialize");

      procedure Finalize;
      pragma Import (C, Finalize, "__gnat_finalize");
      SEH : aliased array (1 .. 2) of Integer;

      Ensure_Reference : aliased System.Address := Ada_Main_Program_Name'Address;
      pragma Volatile (Ensure_Reference);

   begin
      gnat_argc := argc;
      gnat_argv := argv;
      gnat_envp := envp;

      Initialize (SEH'Address);
      adainit;
      Ada_Main_Program;
      adafinal;
      Finalize;
      return (gnat_exit_status);
   end;

--  BEGIN Object file/option list
   --   /home/james/code/aoc2018/modules/tests/binarytree/binarytreetest_suite.o
   --   /home/james/code/aoc2018/modules/tests/binarytree/harness.o
   --   /home/james/code/aoc2018/modules/tests/binarytree/binarytreetest.o
   --   -L/home/james/code/aoc2018/modules/tests/binarytree/
   --   -L/home/james/code/aoc2018/modules/tests/binarytree/
   --   -L/usr/lib/x86_64-linux-gnu/ada/adalib/aunit/
   --   -L/home/james/code/aoc2018/modules/binarytree/lib/
   --   -L/home/james/code/aoc2018/modules/stack/lib/
   --   -L/home/james/code/aoc2018/modules/utils/lib/
   --   -L/usr/lib/gcc/x86_64-linux-gnu/6/adalib/
   --   -static
   --   -lgnat
--  END Object file/option list   

end ada_main;
