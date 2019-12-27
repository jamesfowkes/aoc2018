pragma Warnings (Off);
pragma Ada_95;
pragma Source_File_Name (ada_main, Spec_File_Name => "b__harness.ads");
pragma Source_File_Name (ada_main, Body_File_Name => "b__harness.adb");
pragma Suppress (Overflow_Check);
with Ada.Exceptions;

package body ada_main is

   E078 : Short_Integer; pragma Import (Ada, E078, "system__os_lib_E");
   E018 : Short_Integer; pragma Import (Ada, E018, "system__soft_links_E");
   E028 : Short_Integer; pragma Import (Ada, E028, "system__exception_table_E");
   E073 : Short_Integer; pragma Import (Ada, E073, "ada__io_exceptions_E");
   E058 : Short_Integer; pragma Import (Ada, E058, "ada__strings_E");
   E043 : Short_Integer; pragma Import (Ada, E043, "ada__containers_E");
   E030 : Short_Integer; pragma Import (Ada, E030, "system__exceptions_E");
   E024 : Short_Integer; pragma Import (Ada, E024, "system__soft_links__initialize_E");
   E060 : Short_Integer; pragma Import (Ada, E060, "ada__strings__maps_E");
   E064 : Short_Integer; pragma Import (Ada, E064, "ada__strings__maps__constants_E");
   E048 : Short_Integer; pragma Import (Ada, E048, "interfaces__c_E");
   E084 : Short_Integer; pragma Import (Ada, E084, "system__object_reader_E");
   E053 : Short_Integer; pragma Import (Ada, E053, "system__dwarf_lines_E");
   E042 : Short_Integer; pragma Import (Ada, E042, "system__traceback__symbolic_E");
   E104 : Short_Integer; pragma Import (Ada, E104, "ada__tags_E");
   E102 : Short_Integer; pragma Import (Ada, E102, "ada__streams_E");
   E172 : Short_Integer; pragma Import (Ada, E172, "system__file_control_block_E");
   E136 : Short_Integer; pragma Import (Ada, E136, "system__finalization_root_E");
   E134 : Short_Integer; pragma Import (Ada, E134, "ada__finalization_E");
   E171 : Short_Integer; pragma Import (Ada, E171, "system__file_io_E");
   E138 : Short_Integer; pragma Import (Ada, E138, "system__storage_pools_E");
   E131 : Short_Integer; pragma Import (Ada, E131, "system__finalization_masters_E");
   E184 : Short_Integer; pragma Import (Ada, E184, "system__storage_pools__subpools_E");
   E126 : Short_Integer; pragma Import (Ada, E126, "ada__calendar_E");
   E167 : Short_Integer; pragma Import (Ada, E167, "ada__text_io_E");
   E182 : Short_Integer; pragma Import (Ada, E182, "system__assertions_E");
   E140 : Short_Integer; pragma Import (Ada, E140, "system__pool_global_E");
   E005 : Short_Integer; pragma Import (Ada, E005, "aunit_E");
   E008 : Short_Integer; pragma Import (Ada, E008, "aunit__memory_E");
   E120 : Short_Integer; pragma Import (Ada, E120, "aunit__memory__utils_E");
   E117 : Short_Integer; pragma Import (Ada, E117, "ada_containers__aunit_lists_E");
   E129 : Short_Integer; pragma Import (Ada, E129, "aunit__tests_E");
   E124 : Short_Integer; pragma Import (Ada, E124, "aunit__time_measure_E");
   E122 : Short_Integer; pragma Import (Ada, E122, "aunit__test_results_E");
   E115 : Short_Integer; pragma Import (Ada, E115, "aunit__assertions_E");
   E111 : Short_Integer; pragma Import (Ada, E111, "aunit__test_filters_E");
   E113 : Short_Integer; pragma Import (Ada, E113, "aunit__simple_test_cases_E");
   E012 : Short_Integer; pragma Import (Ada, E012, "aunit__reporter_E");
   E149 : Short_Integer; pragma Import (Ada, E149, "aunit__reporter__text_E");
   E188 : Short_Integer; pragma Import (Ada, E188, "aunit__test_cases_E");
   E159 : Short_Integer; pragma Import (Ada, E159, "aunit__test_suites_E");
   E157 : Short_Integer; pragma Import (Ada, E157, "aunit__run_E");
   E174 : Short_Integer; pragma Import (Ada, E174, "stack_E");
   E176 : Short_Integer; pragma Import (Ada, E176, "utils_E");
   E165 : Short_Integer; pragma Import (Ada, E165, "binarytree_E");
   E163 : Short_Integer; pragma Import (Ada, E163, "binarytreetest_E");
   E161 : Short_Integer; pragma Import (Ada, E161, "binarytreetest_suite_E");

   Sec_Default_Sized_Stacks : array (1 .. 1) of aliased System.Secondary_Stack.SS_Stack (System.Parameters.Runtime_Default_Sec_Stack_Size);

   Local_Priority_Specific_Dispatching : constant String := "";
   Local_Interrupt_States : constant String := "";

   Is_Elaborated : Boolean := False;

   procedure finalize_library is
   begin
      E163 := E163 - 1;
      declare
         procedure F1;
         pragma Import (Ada, F1, "binarytreetest__finalize_spec");
      begin
         F1;
      end;
      E176 := E176 - 1;
      declare
         procedure F2;
         pragma Import (Ada, F2, "utils__finalize_spec");
      begin
         F2;
      end;
      E159 := E159 - 1;
      declare
         procedure F3;
         pragma Import (Ada, F3, "aunit__test_suites__finalize_spec");
      begin
         F3;
      end;
      E188 := E188 - 1;
      declare
         procedure F4;
         pragma Import (Ada, F4, "aunit__test_cases__finalize_spec");
      begin
         F4;
      end;
      E149 := E149 - 1;
      declare
         procedure F5;
         pragma Import (Ada, F5, "aunit__reporter__text__finalize_spec");
      begin
         F5;
      end;
      E111 := E111 - 1;
      E113 := E113 - 1;
      declare
         procedure F6;
         pragma Import (Ada, F6, "aunit__simple_test_cases__finalize_spec");
      begin
         F6;
      end;
      declare
         procedure F7;
         pragma Import (Ada, F7, "aunit__test_filters__finalize_spec");
      begin
         F7;
      end;
      E115 := E115 - 1;
      declare
         procedure F8;
         pragma Import (Ada, F8, "aunit__assertions__finalize_spec");
      begin
         F8;
      end;
      E122 := E122 - 1;
      declare
         procedure F9;
         pragma Import (Ada, F9, "aunit__test_results__finalize_spec");
      begin
         F9;
      end;
      declare
         procedure F10;
         pragma Import (Ada, F10, "aunit__tests__finalize_spec");
      begin
         E129 := E129 - 1;
         F10;
      end;
      E140 := E140 - 1;
      declare
         procedure F11;
         pragma Import (Ada, F11, "system__pool_global__finalize_spec");
      begin
         F11;
      end;
      E167 := E167 - 1;
      declare
         procedure F12;
         pragma Import (Ada, F12, "ada__text_io__finalize_spec");
      begin
         F12;
      end;
      E184 := E184 - 1;
      declare
         procedure F13;
         pragma Import (Ada, F13, "system__storage_pools__subpools__finalize_spec");
      begin
         F13;
      end;
      E131 := E131 - 1;
      declare
         procedure F14;
         pragma Import (Ada, F14, "system__finalization_masters__finalize_spec");
      begin
         F14;
      end;
      declare
         procedure F15;
         pragma Import (Ada, F15, "system__file_io__finalize_body");
      begin
         E171 := E171 - 1;
         F15;
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
      Default_Secondary_Stack_Size : System.Parameters.Size_Type;
      pragma Import (C, Default_Secondary_Stack_Size, "__gnat_default_ss_size");
      Leap_Seconds_Support : Integer;
      pragma Import (C, Leap_Seconds_Support, "__gl_leap_seconds_support");
      Bind_Env_Addr : System.Address;
      pragma Import (C, Bind_Env_Addr, "__gl_bind_env_addr");

      procedure Runtime_Initialize (Install_Handler : Integer);
      pragma Import (C, Runtime_Initialize, "__gnat_runtime_initialize");

      Finalize_Library_Objects : No_Param_Proc;
      pragma Import (C, Finalize_Library_Objects, "__gnat_finalize_library_objects");
      Binder_Sec_Stacks_Count : Natural;
      pragma Import (Ada, Binder_Sec_Stacks_Count, "__gnat_binder_ss_count");
      Default_Sized_SS_Pool : System.Address;
      pragma Import (Ada, Default_Sized_SS_Pool, "__gnat_default_ss_pool");

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

      ada_main'Elab_Body;
      Default_Secondary_Stack_Size := System.Parameters.Runtime_Default_Sec_Stack_Size;
      Binder_Sec_Stacks_Count := 1;
      Default_Sized_SS_Pool := Sec_Default_Sized_Stacks'Address;

      Runtime_Initialize (1);

      Finalize_Library_Objects := finalize_library'access;

      System.Soft_Links'Elab_Spec;
      System.Exception_Table'Elab_Body;
      E028 := E028 + 1;
      Ada.Io_Exceptions'Elab_Spec;
      E073 := E073 + 1;
      Ada.Strings'Elab_Spec;
      E058 := E058 + 1;
      Ada.Containers'Elab_Spec;
      E043 := E043 + 1;
      System.Exceptions'Elab_Spec;
      E030 := E030 + 1;
      System.Soft_Links.Initialize'Elab_Body;
      E024 := E024 + 1;
      E018 := E018 + 1;
      System.Os_Lib'Elab_Body;
      E078 := E078 + 1;
      Ada.Strings.Maps'Elab_Spec;
      Ada.Strings.Maps.Constants'Elab_Spec;
      E064 := E064 + 1;
      Interfaces.C'Elab_Spec;
      E060 := E060 + 1;
      E048 := E048 + 1;
      System.Object_Reader'Elab_Spec;
      System.Dwarf_Lines'Elab_Spec;
      E053 := E053 + 1;
      System.Traceback.Symbolic'Elab_Body;
      E042 := E042 + 1;
      E084 := E084 + 1;
      Ada.Tags'Elab_Spec;
      Ada.Tags'Elab_Body;
      E104 := E104 + 1;
      Ada.Streams'Elab_Spec;
      E102 := E102 + 1;
      System.File_Control_Block'Elab_Spec;
      E172 := E172 + 1;
      System.Finalization_Root'Elab_Spec;
      E136 := E136 + 1;
      Ada.Finalization'Elab_Spec;
      E134 := E134 + 1;
      System.File_Io'Elab_Body;
      E171 := E171 + 1;
      System.Storage_Pools'Elab_Spec;
      E138 := E138 + 1;
      System.Finalization_Masters'Elab_Spec;
      System.Finalization_Masters'Elab_Body;
      E131 := E131 + 1;
      System.Storage_Pools.Subpools'Elab_Spec;
      E184 := E184 + 1;
      Ada.Calendar'Elab_Spec;
      Ada.Calendar'Elab_Body;
      E126 := E126 + 1;
      Ada.Text_Io'Elab_Spec;
      Ada.Text_Io'Elab_Body;
      E167 := E167 + 1;
      System.Assertions'Elab_Spec;
      E182 := E182 + 1;
      System.Pool_Global'Elab_Spec;
      E140 := E140 + 1;
      E008 := E008 + 1;
      E005 := E005 + 1;
      E120 := E120 + 1;
      E117 := E117 + 1;
      Aunit.Tests'Elab_Spec;
      E129 := E129 + 1;
      Aunit.Time_Measure'Elab_Spec;
      E124 := E124 + 1;
      Aunit.Test_Results'Elab_Spec;
      E122 := E122 + 1;
      Aunit.Assertions'Elab_Spec;
      Aunit.Assertions'Elab_Body;
      E115 := E115 + 1;
      Aunit.Test_Filters'Elab_Spec;
      Aunit.Simple_Test_Cases'Elab_Spec;
      E113 := E113 + 1;
      E111 := E111 + 1;
      Aunit.Reporter'Elab_Spec;
      E012 := E012 + 1;
      Aunit.Reporter.Text'Elab_Spec;
      E149 := E149 + 1;
      Aunit.Test_Cases'Elab_Spec;
      E188 := E188 + 1;
      Aunit.Test_Suites'Elab_Spec;
      E159 := E159 + 1;
      E157 := E157 + 1;
      E174 := E174 + 1;
      utils'elab_spec;
      E176 := E176 + 1;
      E165 := E165 + 1;
      Binarytreetest'Elab_Spec;
      Binarytreetest'Elab_Body;
      E163 := E163 + 1;
      Binarytreetest_Suite'Elab_Body;
      E161 := E161 + 1;
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
   --   /home/james/code/aoc2018/modules/tests/binarytree/binarytreetest.o
   --   /home/james/code/aoc2018/modules/tests/binarytree/binarytreetest_suite.o
   --   /home/james/code/aoc2018/modules/tests/binarytree/harness.o
   --   -L/home/james/code/aoc2018/modules/tests/binarytree/
   --   -L/home/james/code/aoc2018/modules/tests/binarytree/
   --   -L/usr/lib/x86_64-linux-gnu/ada/adalib/aunit/
   --   -L/home/james/code/aoc2018/modules/binarytree/lib/
   --   -L/home/james/code/aoc2018/modules/stack/lib/
   --   -L/home/james/code/aoc2018/modules/utils/lib/
   --   -L/usr/lib/gcc/x86_64-linux-gnu/8/adalib/
   --   -static
   --   -lgnat
   --   -ldl
--  END Object file/option list   

end ada_main;
