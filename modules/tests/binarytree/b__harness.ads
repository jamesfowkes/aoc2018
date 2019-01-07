pragma Ada_95;
pragma Warnings (Off);
with System;
package ada_main is

   gnat_argc : Integer;
   gnat_argv : System.Address;
   gnat_envp : System.Address;

   pragma Import (C, gnat_argc);
   pragma Import (C, gnat_argv);
   pragma Import (C, gnat_envp);

   gnat_exit_status : Integer;
   pragma Import (C, gnat_exit_status);

   GNAT_Version : constant String :=
                    "GNAT Version: 6.3.0" & ASCII.NUL;
   pragma Export (C, GNAT_Version, "__gnat_version");

   Ada_Main_Program_Name : constant String := "_ada_harness" & ASCII.NUL;
   pragma Export (C, Ada_Main_Program_Name, "__gnat_ada_main_program_name");

   procedure adainit;
   pragma Export (C, adainit, "adainit");

   procedure adafinal;
   pragma Export (C, adafinal, "adafinal");

   function main
     (argc : Integer;
      argv : System.Address;
      envp : System.Address)
      return Integer;
   pragma Export (C, main, "main");

   type Version_32 is mod 2 ** 32;
   u00001 : constant Version_32 := 16#4102adbb#;
   pragma Export (C, u00001, "harnessB");
   u00002 : constant Version_32 := 16#b6df930e#;
   pragma Export (C, u00002, "system__standard_libraryB");
   u00003 : constant Version_32 := 16#937076cc#;
   pragma Export (C, u00003, "system__standard_libraryS");
   u00004 : constant Version_32 := 16#fa79b673#;
   pragma Export (C, u00004, "aunitB");
   u00005 : constant Version_32 := 16#76cdf7c6#;
   pragma Export (C, u00005, "aunitS");
   u00006 : constant Version_32 := 16#3ffc8e18#;
   pragma Export (C, u00006, "adaS");
   u00007 : constant Version_32 := 16#b6c145a2#;
   pragma Export (C, u00007, "aunit__memoryB");
   u00008 : constant Version_32 := 16#b5da660a#;
   pragma Export (C, u00008, "aunit__memoryS");
   u00009 : constant Version_32 := 16#6326c08a#;
   pragma Export (C, u00009, "systemS");
   u00010 : constant Version_32 := 16#39a03df9#;
   pragma Export (C, u00010, "system__storage_elementsB");
   u00011 : constant Version_32 := 16#4ee58a8e#;
   pragma Export (C, u00011, "system__storage_elementsS");
   u00012 : constant Version_32 := 16#17d955ab#;
   pragma Export (C, u00012, "aunit__reporterS");
   u00013 : constant Version_32 := 16#e7214354#;
   pragma Export (C, u00013, "ada__exceptionsB");
   u00014 : constant Version_32 := 16#020f9e08#;
   pragma Export (C, u00014, "ada__exceptionsS");
   u00015 : constant Version_32 := 16#e947e6a9#;
   pragma Export (C, u00015, "ada__exceptions__last_chance_handlerB");
   u00016 : constant Version_32 := 16#41e5552e#;
   pragma Export (C, u00016, "ada__exceptions__last_chance_handlerS");
   u00017 : constant Version_32 := 16#465d427a#;
   pragma Export (C, u00017, "system__soft_linksB");
   u00018 : constant Version_32 := 16#fda218df#;
   pragma Export (C, u00018, "system__soft_linksS");
   u00019 : constant Version_32 := 16#b01dad17#;
   pragma Export (C, u00019, "system__parametersB");
   u00020 : constant Version_32 := 16#1d0ccdf5#;
   pragma Export (C, u00020, "system__parametersS");
   u00021 : constant Version_32 := 16#0f0cb66d#;
   pragma Export (C, u00021, "system__secondary_stackB");
   u00022 : constant Version_32 := 16#c8470fe3#;
   pragma Export (C, u00022, "system__secondary_stackS");
   u00023 : constant Version_32 := 16#41837d1e#;
   pragma Export (C, u00023, "system__stack_checkingB");
   u00024 : constant Version_32 := 16#ed99ab62#;
   pragma Export (C, u00024, "system__stack_checkingS");
   u00025 : constant Version_32 := 16#87a448ff#;
   pragma Export (C, u00025, "system__exception_tableB");
   u00026 : constant Version_32 := 16#3e88a9c8#;
   pragma Export (C, u00026, "system__exception_tableS");
   u00027 : constant Version_32 := 16#ce4af020#;
   pragma Export (C, u00027, "system__exceptionsB");
   u00028 : constant Version_32 := 16#0b45ad7c#;
   pragma Export (C, u00028, "system__exceptionsS");
   u00029 : constant Version_32 := 16#4c9e814d#;
   pragma Export (C, u00029, "system__exceptions__machineS");
   u00030 : constant Version_32 := 16#aa0563fc#;
   pragma Export (C, u00030, "system__exceptions_debugB");
   u00031 : constant Version_32 := 16#1dac394e#;
   pragma Export (C, u00031, "system__exceptions_debugS");
   u00032 : constant Version_32 := 16#570325c8#;
   pragma Export (C, u00032, "system__img_intB");
   u00033 : constant Version_32 := 16#61fd2048#;
   pragma Export (C, u00033, "system__img_intS");
   u00034 : constant Version_32 := 16#39df8c17#;
   pragma Export (C, u00034, "system__tracebackB");
   u00035 : constant Version_32 := 16#3d041e4e#;
   pragma Export (C, u00035, "system__tracebackS");
   u00036 : constant Version_32 := 16#9ed49525#;
   pragma Export (C, u00036, "system__traceback_entriesB");
   u00037 : constant Version_32 := 16#637d36fa#;
   pragma Export (C, u00037, "system__traceback_entriesS");
   u00038 : constant Version_32 := 16#6fd210f2#;
   pragma Export (C, u00038, "system__traceback__symbolicB");
   u00039 : constant Version_32 := 16#dd19f67a#;
   pragma Export (C, u00039, "system__traceback__symbolicS");
   u00040 : constant Version_32 := 16#701f9d88#;
   pragma Export (C, u00040, "ada__exceptions__tracebackB");
   u00041 : constant Version_32 := 16#20245e75#;
   pragma Export (C, u00041, "ada__exceptions__tracebackS");
   u00042 : constant Version_32 := 16#57a37a42#;
   pragma Export (C, u00042, "system__address_imageB");
   u00043 : constant Version_32 := 16#c2ca5db0#;
   pragma Export (C, u00043, "system__address_imageS");
   u00044 : constant Version_32 := 16#8c33a517#;
   pragma Export (C, u00044, "system__wch_conB");
   u00045 : constant Version_32 := 16#785be258#;
   pragma Export (C, u00045, "system__wch_conS");
   u00046 : constant Version_32 := 16#9721e840#;
   pragma Export (C, u00046, "system__wch_stwB");
   u00047 : constant Version_32 := 16#554ace59#;
   pragma Export (C, u00047, "system__wch_stwS");
   u00048 : constant Version_32 := 16#b96cfbef#;
   pragma Export (C, u00048, "system__wch_cnvB");
   u00049 : constant Version_32 := 16#77ec58ab#;
   pragma Export (C, u00049, "system__wch_cnvS");
   u00050 : constant Version_32 := 16#4be8ce1b#;
   pragma Export (C, u00050, "interfacesS");
   u00051 : constant Version_32 := 16#ece6fdb6#;
   pragma Export (C, u00051, "system__wch_jisB");
   u00052 : constant Version_32 := 16#f79c418a#;
   pragma Export (C, u00052, "system__wch_jisS");
   u00053 : constant Version_32 := 16#10558b11#;
   pragma Export (C, u00053, "ada__streamsB");
   u00054 : constant Version_32 := 16#2e6701ab#;
   pragma Export (C, u00054, "ada__streamsS");
   u00055 : constant Version_32 := 16#db5c917c#;
   pragma Export (C, u00055, "ada__io_exceptionsS");
   u00056 : constant Version_32 := 16#920eada5#;
   pragma Export (C, u00056, "ada__tagsB");
   u00057 : constant Version_32 := 16#13ca27f3#;
   pragma Export (C, u00057, "ada__tagsS");
   u00058 : constant Version_32 := 16#c3335bfd#;
   pragma Export (C, u00058, "system__htableB");
   u00059 : constant Version_32 := 16#e7e47360#;
   pragma Export (C, u00059, "system__htableS");
   u00060 : constant Version_32 := 16#089f5cd0#;
   pragma Export (C, u00060, "system__string_hashB");
   u00061 : constant Version_32 := 16#45ba181e#;
   pragma Export (C, u00061, "system__string_hashS");
   u00062 : constant Version_32 := 16#fe7e644a#;
   pragma Export (C, u00062, "system__unsigned_typesS");
   u00063 : constant Version_32 := 16#06052bd0#;
   pragma Export (C, u00063, "system__val_lluB");
   u00064 : constant Version_32 := 16#848c3338#;
   pragma Export (C, u00064, "system__val_lluS");
   u00065 : constant Version_32 := 16#27b600b2#;
   pragma Export (C, u00065, "system__val_utilB");
   u00066 : constant Version_32 := 16#cf867674#;
   pragma Export (C, u00066, "system__val_utilS");
   u00067 : constant Version_32 := 16#d1060688#;
   pragma Export (C, u00067, "system__case_utilB");
   u00068 : constant Version_32 := 16#472fa95d#;
   pragma Export (C, u00068, "system__case_utilS");
   u00069 : constant Version_32 := 16#e99cd447#;
   pragma Export (C, u00069, "aunit__optionsS");
   u00070 : constant Version_32 := 16#e9d6512d#;
   pragma Export (C, u00070, "aunit__test_filtersB");
   u00071 : constant Version_32 := 16#9a67cba8#;
   pragma Export (C, u00071, "aunit__test_filtersS");
   u00072 : constant Version_32 := 16#6e9501f4#;
   pragma Export (C, u00072, "aunit__simple_test_casesB");
   u00073 : constant Version_32 := 16#f9679d50#;
   pragma Export (C, u00073, "aunit__simple_test_casesS");
   u00074 : constant Version_32 := 16#8872fb1a#;
   pragma Export (C, u00074, "aunit__assertionsB");
   u00075 : constant Version_32 := 16#6db0f35e#;
   pragma Export (C, u00075, "aunit__assertionsS");
   u00076 : constant Version_32 := 16#11329e00#;
   pragma Export (C, u00076, "ada_containersS");
   u00077 : constant Version_32 := 16#76b7f255#;
   pragma Export (C, u00077, "ada_containers__aunit_listsB");
   u00078 : constant Version_32 := 16#c8d9569a#;
   pragma Export (C, u00078, "ada_containers__aunit_listsS");
   u00079 : constant Version_32 := 16#9b1c7ff2#;
   pragma Export (C, u00079, "aunit__memory__utilsB");
   u00080 : constant Version_32 := 16#fb2f6c57#;
   pragma Export (C, u00080, "aunit__memory__utilsS");
   u00081 : constant Version_32 := 16#01adf261#;
   pragma Export (C, u00081, "aunit__test_resultsB");
   u00082 : constant Version_32 := 16#1087836e#;
   pragma Export (C, u00082, "aunit__test_resultsS");
   u00083 : constant Version_32 := 16#9df5edcf#;
   pragma Export (C, u00083, "aunit__time_measureB");
   u00084 : constant Version_32 := 16#07f2df2f#;
   pragma Export (C, u00084, "aunit__time_measureS");
   u00085 : constant Version_32 := 16#5ec405a9#;
   pragma Export (C, u00085, "ada__calendarB");
   u00086 : constant Version_32 := 16#e67a5d0a#;
   pragma Export (C, u00086, "ada__calendarS");
   u00087 : constant Version_32 := 16#769e25e6#;
   pragma Export (C, u00087, "interfaces__cB");
   u00088 : constant Version_32 := 16#61e3d2ff#;
   pragma Export (C, u00088, "interfaces__cS");
   u00089 : constant Version_32 := 16#d083f760#;
   pragma Export (C, u00089, "system__os_primitivesB");
   u00090 : constant Version_32 := 16#e9a9d1fc#;
   pragma Export (C, u00090, "system__os_primitivesS");
   u00091 : constant Version_32 := 16#6b6cea8f#;
   pragma Export (C, u00091, "aunit__testsS");
   u00092 : constant Version_32 := 16#6abe5dbe#;
   pragma Export (C, u00092, "system__finalization_mastersB");
   u00093 : constant Version_32 := 16#38daf940#;
   pragma Export (C, u00093, "system__finalization_mastersS");
   u00094 : constant Version_32 := 16#7268f812#;
   pragma Export (C, u00094, "system__img_boolB");
   u00095 : constant Version_32 := 16#96ffb161#;
   pragma Export (C, u00095, "system__img_boolS");
   u00096 : constant Version_32 := 16#d7aac20c#;
   pragma Export (C, u00096, "system__ioB");
   u00097 : constant Version_32 := 16#fd6437c5#;
   pragma Export (C, u00097, "system__ioS");
   u00098 : constant Version_32 := 16#cf417de3#;
   pragma Export (C, u00098, "ada__finalizationS");
   u00099 : constant Version_32 := 16#95817ed8#;
   pragma Export (C, u00099, "system__finalization_rootB");
   u00100 : constant Version_32 := 16#2cd4b31a#;
   pragma Export (C, u00100, "system__finalization_rootS");
   u00101 : constant Version_32 := 16#6d4d969a#;
   pragma Export (C, u00101, "system__storage_poolsB");
   u00102 : constant Version_32 := 16#40cb5e27#;
   pragma Export (C, u00102, "system__storage_poolsS");
   u00103 : constant Version_32 := 16#5a895de2#;
   pragma Export (C, u00103, "system__pool_globalB");
   u00104 : constant Version_32 := 16#7141203e#;
   pragma Export (C, u00104, "system__pool_globalS");
   u00105 : constant Version_32 := 16#58e7cff7#;
   pragma Export (C, u00105, "system__memoryB");
   u00106 : constant Version_32 := 16#3a5ba6be#;
   pragma Export (C, u00106, "system__memoryS");
   u00107 : constant Version_32 := 16#13b71684#;
   pragma Export (C, u00107, "system__crtlS");
   u00108 : constant Version_32 := 16#fd2ad2f1#;
   pragma Export (C, u00108, "gnatS");
   u00109 : constant Version_32 := 16#82fca8a5#;
   pragma Export (C, u00109, "gnat__source_infoS");
   u00110 : constant Version_32 := 16#acb182ec#;
   pragma Export (C, u00110, "gnat__tracebackB");
   u00111 : constant Version_32 := 16#4982a308#;
   pragma Export (C, u00111, "gnat__tracebackS");
   u00112 : constant Version_32 := 16#85b06f15#;
   pragma Export (C, u00112, "gnat__traceback__symbolicS");
   u00113 : constant Version_32 := 16#9a578b55#;
   pragma Export (C, u00113, "aunit__reporter__textB");
   u00114 : constant Version_32 := 16#28ca7b1a#;
   pragma Export (C, u00114, "aunit__reporter__textS");
   u00115 : constant Version_32 := 16#b48102f5#;
   pragma Export (C, u00115, "gnat__ioB");
   u00116 : constant Version_32 := 16#6227e843#;
   pragma Export (C, u00116, "gnat__ioS");
   u00117 : constant Version_32 := 16#dde34de3#;
   pragma Export (C, u00117, "system__exp_intB");
   u00118 : constant Version_32 := 16#7a05f676#;
   pragma Export (C, u00118, "system__exp_intS");
   u00119 : constant Version_32 := 16#f4e1c091#;
   pragma Export (C, u00119, "system__stream_attributesB");
   u00120 : constant Version_32 := 16#221dd20d#;
   pragma Export (C, u00120, "system__stream_attributesS");
   u00121 : constant Version_32 := 16#e11af2d7#;
   pragma Export (C, u00121, "aunit__runB");
   u00122 : constant Version_32 := 16#4b2a8016#;
   pragma Export (C, u00122, "aunit__runS");
   u00123 : constant Version_32 := 16#d01edb9b#;
   pragma Export (C, u00123, "aunit__test_suitesB");
   u00124 : constant Version_32 := 16#f3c7e671#;
   pragma Export (C, u00124, "aunit__test_suitesS");
   u00125 : constant Version_32 := 16#c1a1c47c#;
   pragma Export (C, u00125, "binarytreetest_suiteB");
   u00126 : constant Version_32 := 16#da95c452#;
   pragma Export (C, u00126, "binarytreetest_suiteS");
   u00127 : constant Version_32 := 16#8df6a8db#;
   pragma Export (C, u00127, "binarytreetestB");
   u00128 : constant Version_32 := 16#7bdd7c27#;
   pragma Export (C, u00128, "binarytreetestS");
   u00129 : constant Version_32 := 16#5e196e91#;
   pragma Export (C, u00129, "ada__containersS");
   u00130 : constant Version_32 := 16#68f3d93a#;
   pragma Export (C, u00130, "binarytreeB");
   u00131 : constant Version_32 := 16#6c18341c#;
   pragma Export (C, u00131, "binarytreeS");
   u00132 : constant Version_32 := 16#883add11#;
   pragma Export (C, u00132, "stackB");
   u00133 : constant Version_32 := 16#8017045d#;
   pragma Export (C, u00133, "stackS");
   u00134 : constant Version_32 := 16#3ce6d431#;
   pragma Export (C, u00134, "utilsB");
   u00135 : constant Version_32 := 16#17562d9f#;
   pragma Export (C, u00135, "utilsS");
   u00136 : constant Version_32 := 16#14d67c72#;
   pragma Export (C, u00136, "ada__containers__helpersB");
   u00137 : constant Version_32 := 16#4adfc5eb#;
   pragma Export (C, u00137, "ada__containers__helpersS");
   u00138 : constant Version_32 := 16#020a3f4d#;
   pragma Export (C, u00138, "system__atomic_countersB");
   u00139 : constant Version_32 := 16#d77aed07#;
   pragma Export (C, u00139, "system__atomic_countersS");
   u00140 : constant Version_32 := 16#52f1910f#;
   pragma Export (C, u00140, "system__assertionsB");
   u00141 : constant Version_32 := 16#aeabec1e#;
   pragma Export (C, u00141, "system__assertionsS");
   u00142 : constant Version_32 := 16#e78389d8#;
   pragma Export (C, u00142, "system__storage_pools__subpoolsB");
   u00143 : constant Version_32 := 16#cc5a1856#;
   pragma Export (C, u00143, "system__storage_pools__subpoolsS");
   u00144 : constant Version_32 := 16#9aad1ff1#;
   pragma Export (C, u00144, "system__storage_pools__subpools__finalizationB");
   u00145 : constant Version_32 := 16#fe2f4b3a#;
   pragma Export (C, u00145, "system__storage_pools__subpools__finalizationS");
   u00146 : constant Version_32 := 16#f9b5bb0c#;
   pragma Export (C, u00146, "aunit__test_casesB");
   u00147 : constant Version_32 := 16#b9f05298#;
   pragma Export (C, u00147, "aunit__test_casesS");
   --  BEGIN ELABORATION ORDER
   --  ada%s
   --  gnat%s
   --  gnat.io%s
   --  gnat.io%b
   --  gnat.source_info%s
   --  interfaces%s
   --  system%s
   --  system.atomic_counters%s
   --  system.atomic_counters%b
   --  system.case_util%s
   --  system.case_util%b
   --  system.exp_int%s
   --  system.exp_int%b
   --  system.htable%s
   --  system.img_bool%s
   --  system.img_bool%b
   --  system.img_int%s
   --  system.img_int%b
   --  system.io%s
   --  system.io%b
   --  system.os_primitives%s
   --  system.os_primitives%b
   --  system.parameters%s
   --  system.parameters%b
   --  system.crtl%s
   --  system.standard_library%s
   --  system.exceptions_debug%s
   --  system.exceptions_debug%b
   --  system.storage_elements%s
   --  system.storage_elements%b
   --  system.stack_checking%s
   --  system.stack_checking%b
   --  system.string_hash%s
   --  system.string_hash%b
   --  system.htable%b
   --  system.traceback_entries%s
   --  system.traceback_entries%b
   --  ada.exceptions%s
   --  system.soft_links%s
   --  system.unsigned_types%s
   --  system.val_llu%s
   --  system.val_util%s
   --  system.val_util%b
   --  system.val_llu%b
   --  system.wch_con%s
   --  system.wch_con%b
   --  system.wch_cnv%s
   --  system.wch_jis%s
   --  system.wch_jis%b
   --  system.wch_cnv%b
   --  system.wch_stw%s
   --  system.wch_stw%b
   --  ada.exceptions.last_chance_handler%s
   --  ada.exceptions.last_chance_handler%b
   --  ada.exceptions.traceback%s
   --  system.address_image%s
   --  system.exception_table%s
   --  system.exception_table%b
   --  ada.containers%s
   --  ada.io_exceptions%s
   --  ada.tags%s
   --  ada.streams%s
   --  ada.streams%b
   --  interfaces.c%s
   --  system.exceptions%s
   --  system.exceptions%b
   --  system.exceptions.machine%s
   --  system.finalization_root%s
   --  system.finalization_root%b
   --  ada.finalization%s
   --  ada.containers.helpers%s
   --  ada.containers.helpers%b
   --  system.storage_pools%s
   --  system.storage_pools%b
   --  system.finalization_masters%s
   --  system.storage_pools.subpools%s
   --  system.storage_pools.subpools.finalization%s
   --  system.storage_pools.subpools.finalization%b
   --  system.stream_attributes%s
   --  system.stream_attributes%b
   --  ada.calendar%s
   --  ada.calendar%b
   --  system.assertions%s
   --  system.assertions%b
   --  system.memory%s
   --  system.memory%b
   --  system.standard_library%b
   --  system.pool_global%s
   --  system.pool_global%b
   --  system.secondary_stack%s
   --  system.storage_pools.subpools%b
   --  system.finalization_masters%b
   --  interfaces.c%b
   --  ada.tags%b
   --  system.soft_links%b
   --  system.secondary_stack%b
   --  system.address_image%b
   --  ada.exceptions.traceback%b
   --  system.traceback%s
   --  system.traceback%b
   --  gnat.traceback%s
   --  gnat.traceback%b
   --  system.traceback.symbolic%s
   --  system.traceback.symbolic%b
   --  ada.exceptions%b
   --  gnat.traceback.symbolic%s
   --  ada_containers%s
   --  ada_containers.aunit_lists%s
   --  aunit%s
   --  aunit.memory%s
   --  aunit.memory%b
   --  aunit%b
   --  aunit.memory.utils%s
   --  aunit.memory.utils%b
   --  ada_containers.aunit_lists%b
   --  aunit.tests%s
   --  aunit.test_filters%s
   --  aunit.options%s
   --  aunit.time_measure%s
   --  aunit.time_measure%b
   --  aunit.test_results%s
   --  aunit.test_results%b
   --  aunit.assertions%s
   --  aunit.assertions%b
   --  aunit.reporter%s
   --  aunit.reporter.text%s
   --  aunit.reporter.text%b
   --  aunit.simple_test_cases%s
   --  aunit.simple_test_cases%b
   --  aunit.test_filters%b
   --  aunit.test_cases%s
   --  aunit.test_cases%b
   --  aunit.test_suites%s
   --  aunit.test_suites%b
   --  aunit.run%s
   --  aunit.run%b
   --  binarytreetest%s
   --  binarytreetest_suite%s
   --  binarytreetest_suite%b
   --  harness%b
   --  stack%s
   --  stack%b
   --  utils%s
   --  utils%b
   --  binarytree%s
   --  binarytree%b
   --  binarytreetest%b
   --  END ELABORATION ORDER


end ada_main;
