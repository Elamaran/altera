//megafunction wizard: %Altera SOPC Builder%
//GENERATION: STANDARD
//VERSION: WM1.0


//Legal Notice: (C)2009 Altera Corporation. All rights reserved.  Your
//use of Altera Corporation's design tools, logic functions and other
//software and tools, and its AMPP partner logic functions, and any
//output files any of the foregoing (including device programming or
//simulation files), and any associated documentation or information are
//expressly subject to the terms and conditions of the Altera Program
//License Subscription Agreement or other applicable license agreement,
//including, without limitation, that your use is for the sole purpose
//of programming logic devices manufactured by Altera and sold by Altera
//or its authorized distributors.  Please refer to the applicable
//agreement for further details.

// synthesis translate_off
`timescale 1ns / 1ps
// synthesis translate_on

// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module cpu_jtag_debug_module_arbitrator (
                                          // inputs:
                                           clk,
                                           cpu_data_master_address_to_slave,
                                           cpu_data_master_byteenable,
                                           cpu_data_master_debugaccess,
                                           cpu_data_master_read,
                                           cpu_data_master_waitrequest,
                                           cpu_data_master_write,
                                           cpu_data_master_writedata,
                                           cpu_instruction_master_address_to_slave,
                                           cpu_instruction_master_latency_counter,
                                           cpu_instruction_master_read,
                                           cpu_jtag_debug_module_readdata,
                                           cpu_jtag_debug_module_resetrequest,
                                           reset_n,

                                          // outputs:
                                           cpu_data_master_granted_cpu_jtag_debug_module,
                                           cpu_data_master_qualified_request_cpu_jtag_debug_module,
                                           cpu_data_master_read_data_valid_cpu_jtag_debug_module,
                                           cpu_data_master_requests_cpu_jtag_debug_module,
                                           cpu_instruction_master_granted_cpu_jtag_debug_module,
                                           cpu_instruction_master_qualified_request_cpu_jtag_debug_module,
                                           cpu_instruction_master_read_data_valid_cpu_jtag_debug_module,
                                           cpu_instruction_master_requests_cpu_jtag_debug_module,
                                           cpu_jtag_debug_module_address,
                                           cpu_jtag_debug_module_begintransfer,
                                           cpu_jtag_debug_module_byteenable,
                                           cpu_jtag_debug_module_chipselect,
                                           cpu_jtag_debug_module_debugaccess,
                                           cpu_jtag_debug_module_readdata_from_sa,
                                           cpu_jtag_debug_module_reset,
                                           cpu_jtag_debug_module_reset_n,
                                           cpu_jtag_debug_module_resetrequest_from_sa,
                                           cpu_jtag_debug_module_write,
                                           cpu_jtag_debug_module_writedata,
                                           d1_cpu_jtag_debug_module_end_xfer
                                        )
;

  output           cpu_data_master_granted_cpu_jtag_debug_module;
  output           cpu_data_master_qualified_request_cpu_jtag_debug_module;
  output           cpu_data_master_read_data_valid_cpu_jtag_debug_module;
  output           cpu_data_master_requests_cpu_jtag_debug_module;
  output           cpu_instruction_master_granted_cpu_jtag_debug_module;
  output           cpu_instruction_master_qualified_request_cpu_jtag_debug_module;
  output           cpu_instruction_master_read_data_valid_cpu_jtag_debug_module;
  output           cpu_instruction_master_requests_cpu_jtag_debug_module;
  output  [  8: 0] cpu_jtag_debug_module_address;
  output           cpu_jtag_debug_module_begintransfer;
  output  [  3: 0] cpu_jtag_debug_module_byteenable;
  output           cpu_jtag_debug_module_chipselect;
  output           cpu_jtag_debug_module_debugaccess;
  output  [ 31: 0] cpu_jtag_debug_module_readdata_from_sa;
  output           cpu_jtag_debug_module_reset;
  output           cpu_jtag_debug_module_reset_n;
  output           cpu_jtag_debug_module_resetrequest_from_sa;
  output           cpu_jtag_debug_module_write;
  output  [ 31: 0] cpu_jtag_debug_module_writedata;
  output           d1_cpu_jtag_debug_module_end_xfer;
  input            clk;
  input   [ 14: 0] cpu_data_master_address_to_slave;
  input   [  3: 0] cpu_data_master_byteenable;
  input            cpu_data_master_debugaccess;
  input            cpu_data_master_read;
  input            cpu_data_master_waitrequest;
  input            cpu_data_master_write;
  input   [ 31: 0] cpu_data_master_writedata;
  input   [ 14: 0] cpu_instruction_master_address_to_slave;
  input            cpu_instruction_master_latency_counter;
  input            cpu_instruction_master_read;
  input   [ 31: 0] cpu_jtag_debug_module_readdata;
  input            cpu_jtag_debug_module_resetrequest;
  input            reset_n;

  wire             cpu_data_master_arbiterlock;
  wire             cpu_data_master_arbiterlock2;
  wire             cpu_data_master_continuerequest;
  wire             cpu_data_master_granted_cpu_jtag_debug_module;
  wire             cpu_data_master_qualified_request_cpu_jtag_debug_module;
  wire             cpu_data_master_read_data_valid_cpu_jtag_debug_module;
  wire             cpu_data_master_requests_cpu_jtag_debug_module;
  wire             cpu_data_master_saved_grant_cpu_jtag_debug_module;
  wire             cpu_instruction_master_arbiterlock;
  wire             cpu_instruction_master_arbiterlock2;
  wire             cpu_instruction_master_continuerequest;
  wire             cpu_instruction_master_granted_cpu_jtag_debug_module;
  wire             cpu_instruction_master_qualified_request_cpu_jtag_debug_module;
  wire             cpu_instruction_master_read_data_valid_cpu_jtag_debug_module;
  wire             cpu_instruction_master_requests_cpu_jtag_debug_module;
  wire             cpu_instruction_master_saved_grant_cpu_jtag_debug_module;
  wire    [  8: 0] cpu_jtag_debug_module_address;
  wire             cpu_jtag_debug_module_allgrants;
  wire             cpu_jtag_debug_module_allow_new_arb_cycle;
  wire             cpu_jtag_debug_module_any_bursting_master_saved_grant;
  wire             cpu_jtag_debug_module_any_continuerequest;
  reg     [  1: 0] cpu_jtag_debug_module_arb_addend;
  wire             cpu_jtag_debug_module_arb_counter_enable;
  reg              cpu_jtag_debug_module_arb_share_counter;
  wire             cpu_jtag_debug_module_arb_share_counter_next_value;
  wire             cpu_jtag_debug_module_arb_share_set_values;
  wire    [  1: 0] cpu_jtag_debug_module_arb_winner;
  wire             cpu_jtag_debug_module_arbitration_holdoff_internal;
  wire             cpu_jtag_debug_module_beginbursttransfer_internal;
  wire             cpu_jtag_debug_module_begins_xfer;
  wire             cpu_jtag_debug_module_begintransfer;
  wire    [  3: 0] cpu_jtag_debug_module_byteenable;
  wire             cpu_jtag_debug_module_chipselect;
  wire    [  3: 0] cpu_jtag_debug_module_chosen_master_double_vector;
  wire    [  1: 0] cpu_jtag_debug_module_chosen_master_rot_left;
  wire             cpu_jtag_debug_module_debugaccess;
  wire             cpu_jtag_debug_module_end_xfer;
  wire             cpu_jtag_debug_module_firsttransfer;
  wire    [  1: 0] cpu_jtag_debug_module_grant_vector;
  wire             cpu_jtag_debug_module_in_a_read_cycle;
  wire             cpu_jtag_debug_module_in_a_write_cycle;
  wire    [  1: 0] cpu_jtag_debug_module_master_qreq_vector;
  wire             cpu_jtag_debug_module_non_bursting_master_requests;
  wire    [ 31: 0] cpu_jtag_debug_module_readdata_from_sa;
  reg              cpu_jtag_debug_module_reg_firsttransfer;
  wire             cpu_jtag_debug_module_reset;
  wire             cpu_jtag_debug_module_reset_n;
  wire             cpu_jtag_debug_module_resetrequest_from_sa;
  reg     [  1: 0] cpu_jtag_debug_module_saved_chosen_master_vector;
  reg              cpu_jtag_debug_module_slavearbiterlockenable;
  wire             cpu_jtag_debug_module_slavearbiterlockenable2;
  wire             cpu_jtag_debug_module_unreg_firsttransfer;
  wire             cpu_jtag_debug_module_waits_for_read;
  wire             cpu_jtag_debug_module_waits_for_write;
  wire             cpu_jtag_debug_module_write;
  wire    [ 31: 0] cpu_jtag_debug_module_writedata;
  reg              d1_cpu_jtag_debug_module_end_xfer;
  reg              d1_reasons_to_wait;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_cpu_jtag_debug_module;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  reg              last_cycle_cpu_data_master_granted_slave_cpu_jtag_debug_module;
  reg              last_cycle_cpu_instruction_master_granted_slave_cpu_jtag_debug_module;
  wire    [ 14: 0] shifted_address_to_cpu_jtag_debug_module_from_cpu_data_master;
  wire    [ 14: 0] shifted_address_to_cpu_jtag_debug_module_from_cpu_instruction_master;
  wire             wait_for_cpu_jtag_debug_module_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else if (1)
          d1_reasons_to_wait <= ~cpu_jtag_debug_module_end_xfer;
    end


  assign cpu_jtag_debug_module_begins_xfer = ~d1_reasons_to_wait & ((cpu_data_master_qualified_request_cpu_jtag_debug_module | cpu_instruction_master_qualified_request_cpu_jtag_debug_module));
  //assign cpu_jtag_debug_module_readdata_from_sa = cpu_jtag_debug_module_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign cpu_jtag_debug_module_readdata_from_sa = cpu_jtag_debug_module_readdata;

  assign cpu_data_master_requests_cpu_jtag_debug_module = ({cpu_data_master_address_to_slave[14 : 11] , 11'b0} == 15'h4800) & (cpu_data_master_read | cpu_data_master_write);
  //cpu_jtag_debug_module_arb_share_counter set values, which is an e_mux
  assign cpu_jtag_debug_module_arb_share_set_values = 1;

  //cpu_jtag_debug_module_non_bursting_master_requests mux, which is an e_mux
  assign cpu_jtag_debug_module_non_bursting_master_requests = cpu_data_master_requests_cpu_jtag_debug_module |
    cpu_instruction_master_requests_cpu_jtag_debug_module |
    cpu_data_master_requests_cpu_jtag_debug_module |
    cpu_instruction_master_requests_cpu_jtag_debug_module;

  //cpu_jtag_debug_module_any_bursting_master_saved_grant mux, which is an e_mux
  assign cpu_jtag_debug_module_any_bursting_master_saved_grant = 0;

  //cpu_jtag_debug_module_arb_share_counter_next_value assignment, which is an e_assign
  assign cpu_jtag_debug_module_arb_share_counter_next_value = cpu_jtag_debug_module_firsttransfer ? (cpu_jtag_debug_module_arb_share_set_values - 1) : |cpu_jtag_debug_module_arb_share_counter ? (cpu_jtag_debug_module_arb_share_counter - 1) : 0;

  //cpu_jtag_debug_module_allgrants all slave grants, which is an e_mux
  assign cpu_jtag_debug_module_allgrants = |cpu_jtag_debug_module_grant_vector |
    |cpu_jtag_debug_module_grant_vector |
    |cpu_jtag_debug_module_grant_vector |
    |cpu_jtag_debug_module_grant_vector;

  //cpu_jtag_debug_module_end_xfer assignment, which is an e_assign
  assign cpu_jtag_debug_module_end_xfer = ~(cpu_jtag_debug_module_waits_for_read | cpu_jtag_debug_module_waits_for_write);

  //end_xfer_arb_share_counter_term_cpu_jtag_debug_module arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_cpu_jtag_debug_module = cpu_jtag_debug_module_end_xfer & (~cpu_jtag_debug_module_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //cpu_jtag_debug_module_arb_share_counter arbitration counter enable, which is an e_assign
  assign cpu_jtag_debug_module_arb_counter_enable = (end_xfer_arb_share_counter_term_cpu_jtag_debug_module & cpu_jtag_debug_module_allgrants) | (end_xfer_arb_share_counter_term_cpu_jtag_debug_module & ~cpu_jtag_debug_module_non_bursting_master_requests);

  //cpu_jtag_debug_module_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_jtag_debug_module_arb_share_counter <= 0;
      else if (cpu_jtag_debug_module_arb_counter_enable)
          cpu_jtag_debug_module_arb_share_counter <= cpu_jtag_debug_module_arb_share_counter_next_value;
    end


  //cpu_jtag_debug_module_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_jtag_debug_module_slavearbiterlockenable <= 0;
      else if ((|cpu_jtag_debug_module_master_qreq_vector & end_xfer_arb_share_counter_term_cpu_jtag_debug_module) | (end_xfer_arb_share_counter_term_cpu_jtag_debug_module & ~cpu_jtag_debug_module_non_bursting_master_requests))
          cpu_jtag_debug_module_slavearbiterlockenable <= |cpu_jtag_debug_module_arb_share_counter_next_value;
    end


  //cpu/data_master cpu/jtag_debug_module arbiterlock, which is an e_assign
  assign cpu_data_master_arbiterlock = cpu_jtag_debug_module_slavearbiterlockenable & cpu_data_master_continuerequest;

  //cpu_jtag_debug_module_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign cpu_jtag_debug_module_slavearbiterlockenable2 = |cpu_jtag_debug_module_arb_share_counter_next_value;

  //cpu/data_master cpu/jtag_debug_module arbiterlock2, which is an e_assign
  assign cpu_data_master_arbiterlock2 = cpu_jtag_debug_module_slavearbiterlockenable2 & cpu_data_master_continuerequest;

  //cpu/instruction_master cpu/jtag_debug_module arbiterlock, which is an e_assign
  assign cpu_instruction_master_arbiterlock = cpu_jtag_debug_module_slavearbiterlockenable & cpu_instruction_master_continuerequest;

  //cpu/instruction_master cpu/jtag_debug_module arbiterlock2, which is an e_assign
  assign cpu_instruction_master_arbiterlock2 = cpu_jtag_debug_module_slavearbiterlockenable2 & cpu_instruction_master_continuerequest;

  //cpu/instruction_master granted cpu/jtag_debug_module last time, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          last_cycle_cpu_instruction_master_granted_slave_cpu_jtag_debug_module <= 0;
      else if (1)
          last_cycle_cpu_instruction_master_granted_slave_cpu_jtag_debug_module <= cpu_instruction_master_saved_grant_cpu_jtag_debug_module ? 1 : (cpu_jtag_debug_module_arbitration_holdoff_internal | ~cpu_instruction_master_requests_cpu_jtag_debug_module) ? 0 : last_cycle_cpu_instruction_master_granted_slave_cpu_jtag_debug_module;
    end


  //cpu_instruction_master_continuerequest continued request, which is an e_mux
  assign cpu_instruction_master_continuerequest = last_cycle_cpu_instruction_master_granted_slave_cpu_jtag_debug_module & cpu_instruction_master_requests_cpu_jtag_debug_module;

  //cpu_jtag_debug_module_any_continuerequest at least one master continues requesting, which is an e_mux
  assign cpu_jtag_debug_module_any_continuerequest = cpu_instruction_master_continuerequest |
    cpu_data_master_continuerequest;

  assign cpu_data_master_qualified_request_cpu_jtag_debug_module = cpu_data_master_requests_cpu_jtag_debug_module & ~(((~cpu_data_master_waitrequest) & cpu_data_master_write) | cpu_instruction_master_arbiterlock);
  //cpu_jtag_debug_module_writedata mux, which is an e_mux
  assign cpu_jtag_debug_module_writedata = cpu_data_master_writedata;

  assign cpu_instruction_master_requests_cpu_jtag_debug_module = (({cpu_instruction_master_address_to_slave[14 : 11] , 11'b0} == 15'h4800) & (cpu_instruction_master_read)) & cpu_instruction_master_read;
  //cpu/data_master granted cpu/jtag_debug_module last time, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          last_cycle_cpu_data_master_granted_slave_cpu_jtag_debug_module <= 0;
      else if (1)
          last_cycle_cpu_data_master_granted_slave_cpu_jtag_debug_module <= cpu_data_master_saved_grant_cpu_jtag_debug_module ? 1 : (cpu_jtag_debug_module_arbitration_holdoff_internal | ~cpu_data_master_requests_cpu_jtag_debug_module) ? 0 : last_cycle_cpu_data_master_granted_slave_cpu_jtag_debug_module;
    end


  //cpu_data_master_continuerequest continued request, which is an e_mux
  assign cpu_data_master_continuerequest = last_cycle_cpu_data_master_granted_slave_cpu_jtag_debug_module & cpu_data_master_requests_cpu_jtag_debug_module;

  assign cpu_instruction_master_qualified_request_cpu_jtag_debug_module = cpu_instruction_master_requests_cpu_jtag_debug_module & ~((cpu_instruction_master_read & ((cpu_instruction_master_latency_counter != 0))) | cpu_data_master_arbiterlock);
  //local readdatavalid cpu_instruction_master_read_data_valid_cpu_jtag_debug_module, which is an e_mux
  assign cpu_instruction_master_read_data_valid_cpu_jtag_debug_module = cpu_instruction_master_granted_cpu_jtag_debug_module & cpu_instruction_master_read & ~cpu_jtag_debug_module_waits_for_read;

  //allow new arb cycle for cpu/jtag_debug_module, which is an e_assign
  assign cpu_jtag_debug_module_allow_new_arb_cycle = ~cpu_data_master_arbiterlock & ~cpu_instruction_master_arbiterlock;

  //cpu/instruction_master assignment into master qualified-requests vector for cpu/jtag_debug_module, which is an e_assign
  assign cpu_jtag_debug_module_master_qreq_vector[0] = cpu_instruction_master_qualified_request_cpu_jtag_debug_module;

  //cpu/instruction_master grant cpu/jtag_debug_module, which is an e_assign
  assign cpu_instruction_master_granted_cpu_jtag_debug_module = cpu_jtag_debug_module_grant_vector[0];

  //cpu/instruction_master saved-grant cpu/jtag_debug_module, which is an e_assign
  assign cpu_instruction_master_saved_grant_cpu_jtag_debug_module = cpu_jtag_debug_module_arb_winner[0] && cpu_instruction_master_requests_cpu_jtag_debug_module;

  //cpu/data_master assignment into master qualified-requests vector for cpu/jtag_debug_module, which is an e_assign
  assign cpu_jtag_debug_module_master_qreq_vector[1] = cpu_data_master_qualified_request_cpu_jtag_debug_module;

  //cpu/data_master grant cpu/jtag_debug_module, which is an e_assign
  assign cpu_data_master_granted_cpu_jtag_debug_module = cpu_jtag_debug_module_grant_vector[1];

  //cpu/data_master saved-grant cpu/jtag_debug_module, which is an e_assign
  assign cpu_data_master_saved_grant_cpu_jtag_debug_module = cpu_jtag_debug_module_arb_winner[1] && cpu_data_master_requests_cpu_jtag_debug_module;

  //cpu/jtag_debug_module chosen-master double-vector, which is an e_assign
  assign cpu_jtag_debug_module_chosen_master_double_vector = {cpu_jtag_debug_module_master_qreq_vector, cpu_jtag_debug_module_master_qreq_vector} & ({~cpu_jtag_debug_module_master_qreq_vector, ~cpu_jtag_debug_module_master_qreq_vector} + cpu_jtag_debug_module_arb_addend);

  //stable onehot encoding of arb winner
  assign cpu_jtag_debug_module_arb_winner = (cpu_jtag_debug_module_allow_new_arb_cycle & | cpu_jtag_debug_module_grant_vector) ? cpu_jtag_debug_module_grant_vector : cpu_jtag_debug_module_saved_chosen_master_vector;

  //saved cpu_jtag_debug_module_grant_vector, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_jtag_debug_module_saved_chosen_master_vector <= 0;
      else if (cpu_jtag_debug_module_allow_new_arb_cycle)
          cpu_jtag_debug_module_saved_chosen_master_vector <= |cpu_jtag_debug_module_grant_vector ? cpu_jtag_debug_module_grant_vector : cpu_jtag_debug_module_saved_chosen_master_vector;
    end


  //onehot encoding of chosen master
  assign cpu_jtag_debug_module_grant_vector = {(cpu_jtag_debug_module_chosen_master_double_vector[1] | cpu_jtag_debug_module_chosen_master_double_vector[3]),
    (cpu_jtag_debug_module_chosen_master_double_vector[0] | cpu_jtag_debug_module_chosen_master_double_vector[2])};

  //cpu/jtag_debug_module chosen master rotated left, which is an e_assign
  assign cpu_jtag_debug_module_chosen_master_rot_left = (cpu_jtag_debug_module_arb_winner << 1) ? (cpu_jtag_debug_module_arb_winner << 1) : 1;

  //cpu/jtag_debug_module's addend for next-master-grant
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_jtag_debug_module_arb_addend <= 1;
      else if (|cpu_jtag_debug_module_grant_vector)
          cpu_jtag_debug_module_arb_addend <= cpu_jtag_debug_module_end_xfer? cpu_jtag_debug_module_chosen_master_rot_left : cpu_jtag_debug_module_grant_vector;
    end


  assign cpu_jtag_debug_module_begintransfer = cpu_jtag_debug_module_begins_xfer;
  //assign lhs ~cpu_jtag_debug_module_reset of type reset_n to cpu_jtag_debug_module_reset_n, which is an e_assign
  assign cpu_jtag_debug_module_reset = ~cpu_jtag_debug_module_reset_n;

  //cpu_jtag_debug_module_reset_n assignment, which is an e_assign
  assign cpu_jtag_debug_module_reset_n = reset_n;

  //assign cpu_jtag_debug_module_resetrequest_from_sa = cpu_jtag_debug_module_resetrequest so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign cpu_jtag_debug_module_resetrequest_from_sa = cpu_jtag_debug_module_resetrequest;

  assign cpu_jtag_debug_module_chipselect = cpu_data_master_granted_cpu_jtag_debug_module | cpu_instruction_master_granted_cpu_jtag_debug_module;
  //cpu_jtag_debug_module_firsttransfer first transaction, which is an e_assign
  assign cpu_jtag_debug_module_firsttransfer = cpu_jtag_debug_module_begins_xfer ? cpu_jtag_debug_module_unreg_firsttransfer : cpu_jtag_debug_module_reg_firsttransfer;

  //cpu_jtag_debug_module_unreg_firsttransfer first transaction, which is an e_assign
  assign cpu_jtag_debug_module_unreg_firsttransfer = ~(cpu_jtag_debug_module_slavearbiterlockenable & cpu_jtag_debug_module_any_continuerequest);

  //cpu_jtag_debug_module_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_jtag_debug_module_reg_firsttransfer <= 1'b1;
      else if (cpu_jtag_debug_module_begins_xfer)
          cpu_jtag_debug_module_reg_firsttransfer <= cpu_jtag_debug_module_unreg_firsttransfer;
    end


  //cpu_jtag_debug_module_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign cpu_jtag_debug_module_beginbursttransfer_internal = cpu_jtag_debug_module_begins_xfer;

  //cpu_jtag_debug_module_arbitration_holdoff_internal arbitration_holdoff, which is an e_assign
  assign cpu_jtag_debug_module_arbitration_holdoff_internal = cpu_jtag_debug_module_begins_xfer & cpu_jtag_debug_module_firsttransfer;

  //cpu_jtag_debug_module_write assignment, which is an e_mux
  assign cpu_jtag_debug_module_write = cpu_data_master_granted_cpu_jtag_debug_module & cpu_data_master_write;

  assign shifted_address_to_cpu_jtag_debug_module_from_cpu_data_master = cpu_data_master_address_to_slave;
  //cpu_jtag_debug_module_address mux, which is an e_mux
  assign cpu_jtag_debug_module_address = (cpu_data_master_granted_cpu_jtag_debug_module)? (shifted_address_to_cpu_jtag_debug_module_from_cpu_data_master >> 2) :
    (shifted_address_to_cpu_jtag_debug_module_from_cpu_instruction_master >> 2);

  assign shifted_address_to_cpu_jtag_debug_module_from_cpu_instruction_master = cpu_instruction_master_address_to_slave;
  //d1_cpu_jtag_debug_module_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_cpu_jtag_debug_module_end_xfer <= 1;
      else if (1)
          d1_cpu_jtag_debug_module_end_xfer <= cpu_jtag_debug_module_end_xfer;
    end


  //cpu_jtag_debug_module_waits_for_read in a cycle, which is an e_mux
  assign cpu_jtag_debug_module_waits_for_read = cpu_jtag_debug_module_in_a_read_cycle & cpu_jtag_debug_module_begins_xfer;

  //cpu_jtag_debug_module_in_a_read_cycle assignment, which is an e_assign
  assign cpu_jtag_debug_module_in_a_read_cycle = (cpu_data_master_granted_cpu_jtag_debug_module & cpu_data_master_read) | (cpu_instruction_master_granted_cpu_jtag_debug_module & cpu_instruction_master_read);

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = cpu_jtag_debug_module_in_a_read_cycle;

  //cpu_jtag_debug_module_waits_for_write in a cycle, which is an e_mux
  assign cpu_jtag_debug_module_waits_for_write = cpu_jtag_debug_module_in_a_write_cycle & 0;

  //cpu_jtag_debug_module_in_a_write_cycle assignment, which is an e_assign
  assign cpu_jtag_debug_module_in_a_write_cycle = cpu_data_master_granted_cpu_jtag_debug_module & cpu_data_master_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = cpu_jtag_debug_module_in_a_write_cycle;

  assign wait_for_cpu_jtag_debug_module_counter = 0;
  //cpu_jtag_debug_module_byteenable byte enable port mux, which is an e_mux
  assign cpu_jtag_debug_module_byteenable = (cpu_data_master_granted_cpu_jtag_debug_module)? cpu_data_master_byteenable :
    -1;

  //debugaccess mux, which is an e_mux
  assign cpu_jtag_debug_module_debugaccess = (cpu_data_master_granted_cpu_jtag_debug_module)? cpu_data_master_debugaccess :
    0;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //cpu/jtag_debug_module enable non-zero assertions, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          enable_nonzero_assertions <= 0;
      else if (1)
          enable_nonzero_assertions <= 1'b1;
    end


  //grant signals are active simultaneously, which is an e_process
  always @(posedge clk)
    begin
      if (cpu_data_master_granted_cpu_jtag_debug_module + cpu_instruction_master_granted_cpu_jtag_debug_module > 1)
        begin
          $write("%0d ns: > 1 of grant signals are active simultaneously", $time);
          $stop;
        end
    end


  //saved_grant signals are active simultaneously, which is an e_process
  always @(posedge clk)
    begin
      if (cpu_data_master_saved_grant_cpu_jtag_debug_module + cpu_instruction_master_saved_grant_cpu_jtag_debug_module > 1)
        begin
          $write("%0d ns: > 1 of saved_grant signals are active simultaneously", $time);
          $stop;
        end
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module cpu_data_master_arbitrator (
                                    // inputs:
                                     clk,
                                     cpu_data_master_address,
                                     cpu_data_master_granted_cpu_jtag_debug_module,
                                     cpu_data_master_granted_led_pio_s1,
                                     cpu_data_master_granted_onchip_ram_s1,
                                     cpu_data_master_granted_onchip_rom_s1,
                                     cpu_data_master_qualified_request_cpu_jtag_debug_module,
                                     cpu_data_master_qualified_request_led_pio_s1,
                                     cpu_data_master_qualified_request_onchip_ram_s1,
                                     cpu_data_master_qualified_request_onchip_rom_s1,
                                     cpu_data_master_read,
                                     cpu_data_master_read_data_valid_cpu_jtag_debug_module,
                                     cpu_data_master_read_data_valid_led_pio_s1,
                                     cpu_data_master_read_data_valid_onchip_ram_s1,
                                     cpu_data_master_read_data_valid_onchip_rom_s1,
                                     cpu_data_master_requests_cpu_jtag_debug_module,
                                     cpu_data_master_requests_led_pio_s1,
                                     cpu_data_master_requests_onchip_ram_s1,
                                     cpu_data_master_requests_onchip_rom_s1,
                                     cpu_data_master_write,
                                     cpu_jtag_debug_module_readdata_from_sa,
                                     d1_cpu_jtag_debug_module_end_xfer,
                                     d1_led_pio_s1_end_xfer,
                                     d1_onchip_ram_s1_end_xfer,
                                     d1_onchip_rom_s1_end_xfer,
                                     onchip_ram_s1_readdata_from_sa,
                                     onchip_rom_s1_readdata_from_sa,
                                     registered_cpu_data_master_read_data_valid_onchip_ram_s1,
                                     registered_cpu_data_master_read_data_valid_onchip_rom_s1,
                                     reset_n,

                                    // outputs:
                                     cpu_data_master_address_to_slave,
                                     cpu_data_master_readdata,
                                     cpu_data_master_waitrequest
                                  )
;

  output  [ 14: 0] cpu_data_master_address_to_slave;
  output  [ 31: 0] cpu_data_master_readdata;
  output           cpu_data_master_waitrequest;
  input            clk;
  input   [ 14: 0] cpu_data_master_address;
  input            cpu_data_master_granted_cpu_jtag_debug_module;
  input            cpu_data_master_granted_led_pio_s1;
  input            cpu_data_master_granted_onchip_ram_s1;
  input            cpu_data_master_granted_onchip_rom_s1;
  input            cpu_data_master_qualified_request_cpu_jtag_debug_module;
  input            cpu_data_master_qualified_request_led_pio_s1;
  input            cpu_data_master_qualified_request_onchip_ram_s1;
  input            cpu_data_master_qualified_request_onchip_rom_s1;
  input            cpu_data_master_read;
  input            cpu_data_master_read_data_valid_cpu_jtag_debug_module;
  input            cpu_data_master_read_data_valid_led_pio_s1;
  input            cpu_data_master_read_data_valid_onchip_ram_s1;
  input            cpu_data_master_read_data_valid_onchip_rom_s1;
  input            cpu_data_master_requests_cpu_jtag_debug_module;
  input            cpu_data_master_requests_led_pio_s1;
  input            cpu_data_master_requests_onchip_ram_s1;
  input            cpu_data_master_requests_onchip_rom_s1;
  input            cpu_data_master_write;
  input   [ 31: 0] cpu_jtag_debug_module_readdata_from_sa;
  input            d1_cpu_jtag_debug_module_end_xfer;
  input            d1_led_pio_s1_end_xfer;
  input            d1_onchip_ram_s1_end_xfer;
  input            d1_onchip_rom_s1_end_xfer;
  input   [ 31: 0] onchip_ram_s1_readdata_from_sa;
  input   [ 31: 0] onchip_rom_s1_readdata_from_sa;
  input            registered_cpu_data_master_read_data_valid_onchip_ram_s1;
  input            registered_cpu_data_master_read_data_valid_onchip_rom_s1;
  input            reset_n;

  wire    [ 14: 0] cpu_data_master_address_to_slave;
  wire    [ 31: 0] cpu_data_master_readdata;
  wire             cpu_data_master_run;
  reg              cpu_data_master_waitrequest;
  wire             r_0;
  //r_0 master_run cascaded wait assignment, which is an e_assign
  assign r_0 = 1 & (cpu_data_master_qualified_request_cpu_jtag_debug_module | ~cpu_data_master_requests_cpu_jtag_debug_module) & (cpu_data_master_granted_cpu_jtag_debug_module | ~cpu_data_master_qualified_request_cpu_jtag_debug_module) & ((~cpu_data_master_qualified_request_cpu_jtag_debug_module | ~cpu_data_master_read | (1 & 1 & cpu_data_master_read))) & ((~cpu_data_master_qualified_request_cpu_jtag_debug_module | ~cpu_data_master_write | (1 & cpu_data_master_write))) & 1 & (cpu_data_master_qualified_request_led_pio_s1 | ~cpu_data_master_requests_led_pio_s1) & ((~cpu_data_master_qualified_request_led_pio_s1 | ~cpu_data_master_read | (1 & 1 & cpu_data_master_read))) & ((~cpu_data_master_qualified_request_led_pio_s1 | ~cpu_data_master_write | (1 & cpu_data_master_write))) & 1 & (cpu_data_master_qualified_request_onchip_ram_s1 | registered_cpu_data_master_read_data_valid_onchip_ram_s1 | ~cpu_data_master_requests_onchip_ram_s1) & (cpu_data_master_granted_onchip_ram_s1 | ~cpu_data_master_qualified_request_onchip_ram_s1) & ((~cpu_data_master_qualified_request_onchip_ram_s1 | ~cpu_data_master_read | (registered_cpu_data_master_read_data_valid_onchip_ram_s1 & cpu_data_master_read))) & ((~cpu_data_master_qualified_request_onchip_ram_s1 | ~(cpu_data_master_read | cpu_data_master_write) | (1 & (cpu_data_master_read | cpu_data_master_write)))) & 1 & (cpu_data_master_qualified_request_onchip_rom_s1 | registered_cpu_data_master_read_data_valid_onchip_rom_s1 | ~cpu_data_master_requests_onchip_rom_s1) & (cpu_data_master_granted_onchip_rom_s1 | ~cpu_data_master_qualified_request_onchip_rom_s1) & ((~cpu_data_master_qualified_request_onchip_rom_s1 | ~cpu_data_master_read | (registered_cpu_data_master_read_data_valid_onchip_rom_s1 & cpu_data_master_read))) & ((~cpu_data_master_qualified_request_onchip_rom_s1 | ~(cpu_data_master_read | cpu_data_master_write) | (1 & (cpu_data_master_read | cpu_data_master_write))));

  //cascaded wait assignment, which is an e_assign
  assign cpu_data_master_run = r_0;

  //optimize select-logic by passing only those address bits which matter.
  assign cpu_data_master_address_to_slave = cpu_data_master_address[14 : 0];

  //cpu/data_master readdata mux, which is an e_mux
  assign cpu_data_master_readdata = ({32 {~cpu_data_master_requests_cpu_jtag_debug_module}} | cpu_jtag_debug_module_readdata_from_sa) &
    ({32 {~cpu_data_master_requests_onchip_ram_s1}} | onchip_ram_s1_readdata_from_sa) &
    ({32 {~cpu_data_master_requests_onchip_rom_s1}} | onchip_rom_s1_readdata_from_sa);

  //actual waitrequest port, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_data_master_waitrequest <= ~0;
      else if (1)
          cpu_data_master_waitrequest <= ~((~(cpu_data_master_read | cpu_data_master_write))? 0: (cpu_data_master_run & cpu_data_master_waitrequest));
    end



endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module cpu_instruction_master_arbitrator (
                                           // inputs:
                                            clk,
                                            cpu_instruction_master_address,
                                            cpu_instruction_master_granted_cpu_jtag_debug_module,
                                            cpu_instruction_master_granted_onchip_ram_s1,
                                            cpu_instruction_master_granted_onchip_rom_s1,
                                            cpu_instruction_master_qualified_request_cpu_jtag_debug_module,
                                            cpu_instruction_master_qualified_request_onchip_ram_s1,
                                            cpu_instruction_master_qualified_request_onchip_rom_s1,
                                            cpu_instruction_master_read,
                                            cpu_instruction_master_read_data_valid_cpu_jtag_debug_module,
                                            cpu_instruction_master_read_data_valid_onchip_ram_s1,
                                            cpu_instruction_master_read_data_valid_onchip_rom_s1,
                                            cpu_instruction_master_requests_cpu_jtag_debug_module,
                                            cpu_instruction_master_requests_onchip_ram_s1,
                                            cpu_instruction_master_requests_onchip_rom_s1,
                                            cpu_jtag_debug_module_readdata_from_sa,
                                            d1_cpu_jtag_debug_module_end_xfer,
                                            d1_onchip_ram_s1_end_xfer,
                                            d1_onchip_rom_s1_end_xfer,
                                            onchip_ram_s1_readdata_from_sa,
                                            onchip_rom_s1_readdata_from_sa,
                                            reset_n,

                                           // outputs:
                                            cpu_instruction_master_address_to_slave,
                                            cpu_instruction_master_latency_counter,
                                            cpu_instruction_master_readdata,
                                            cpu_instruction_master_readdatavalid,
                                            cpu_instruction_master_waitrequest
                                         )
;

  output  [ 14: 0] cpu_instruction_master_address_to_slave;
  output           cpu_instruction_master_latency_counter;
  output  [ 31: 0] cpu_instruction_master_readdata;
  output           cpu_instruction_master_readdatavalid;
  output           cpu_instruction_master_waitrequest;
  input            clk;
  input   [ 14: 0] cpu_instruction_master_address;
  input            cpu_instruction_master_granted_cpu_jtag_debug_module;
  input            cpu_instruction_master_granted_onchip_ram_s1;
  input            cpu_instruction_master_granted_onchip_rom_s1;
  input            cpu_instruction_master_qualified_request_cpu_jtag_debug_module;
  input            cpu_instruction_master_qualified_request_onchip_ram_s1;
  input            cpu_instruction_master_qualified_request_onchip_rom_s1;
  input            cpu_instruction_master_read;
  input            cpu_instruction_master_read_data_valid_cpu_jtag_debug_module;
  input            cpu_instruction_master_read_data_valid_onchip_ram_s1;
  input            cpu_instruction_master_read_data_valid_onchip_rom_s1;
  input            cpu_instruction_master_requests_cpu_jtag_debug_module;
  input            cpu_instruction_master_requests_onchip_ram_s1;
  input            cpu_instruction_master_requests_onchip_rom_s1;
  input   [ 31: 0] cpu_jtag_debug_module_readdata_from_sa;
  input            d1_cpu_jtag_debug_module_end_xfer;
  input            d1_onchip_ram_s1_end_xfer;
  input            d1_onchip_rom_s1_end_xfer;
  input   [ 31: 0] onchip_ram_s1_readdata_from_sa;
  input   [ 31: 0] onchip_rom_s1_readdata_from_sa;
  input            reset_n;

  reg              active_and_waiting_last_time;
  reg     [ 14: 0] cpu_instruction_master_address_last_time;
  wire    [ 14: 0] cpu_instruction_master_address_to_slave;
  wire             cpu_instruction_master_is_granted_some_slave;
  reg              cpu_instruction_master_latency_counter;
  reg              cpu_instruction_master_read_but_no_slave_selected;
  reg              cpu_instruction_master_read_last_time;
  wire    [ 31: 0] cpu_instruction_master_readdata;
  wire             cpu_instruction_master_readdatavalid;
  wire             cpu_instruction_master_run;
  wire             cpu_instruction_master_waitrequest;
  wire             latency_load_value;
  wire             p1_cpu_instruction_master_latency_counter;
  wire             pre_flush_cpu_instruction_master_readdatavalid;
  wire             r_0;
  //r_0 master_run cascaded wait assignment, which is an e_assign
  assign r_0 = 1 & (cpu_instruction_master_qualified_request_cpu_jtag_debug_module | ~cpu_instruction_master_requests_cpu_jtag_debug_module) & (cpu_instruction_master_granted_cpu_jtag_debug_module | ~cpu_instruction_master_qualified_request_cpu_jtag_debug_module) & ((~cpu_instruction_master_qualified_request_cpu_jtag_debug_module | ~cpu_instruction_master_read | (1 & ~d1_cpu_jtag_debug_module_end_xfer & cpu_instruction_master_read))) & 1 & (cpu_instruction_master_qualified_request_onchip_ram_s1 | ~cpu_instruction_master_requests_onchip_ram_s1) & (cpu_instruction_master_granted_onchip_ram_s1 | ~cpu_instruction_master_qualified_request_onchip_ram_s1) & ((~cpu_instruction_master_qualified_request_onchip_ram_s1 | ~cpu_instruction_master_read | (1 & cpu_instruction_master_read))) & 1 & (cpu_instruction_master_qualified_request_onchip_rom_s1 | ~cpu_instruction_master_requests_onchip_rom_s1) & (cpu_instruction_master_granted_onchip_rom_s1 | ~cpu_instruction_master_qualified_request_onchip_rom_s1) & ((~cpu_instruction_master_qualified_request_onchip_rom_s1 | ~cpu_instruction_master_read | (1 & cpu_instruction_master_read)));

  //cascaded wait assignment, which is an e_assign
  assign cpu_instruction_master_run = r_0;

  //optimize select-logic by passing only those address bits which matter.
  assign cpu_instruction_master_address_to_slave = cpu_instruction_master_address[14 : 0];

  //cpu_instruction_master_read_but_no_slave_selected assignment, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_instruction_master_read_but_no_slave_selected <= 0;
      else if (1)
          cpu_instruction_master_read_but_no_slave_selected <= cpu_instruction_master_read & cpu_instruction_master_run & ~cpu_instruction_master_is_granted_some_slave;
    end


  //some slave is getting selected, which is an e_mux
  assign cpu_instruction_master_is_granted_some_slave = cpu_instruction_master_granted_cpu_jtag_debug_module |
    cpu_instruction_master_granted_onchip_ram_s1 |
    cpu_instruction_master_granted_onchip_rom_s1;

  //latent slave read data valids which may be flushed, which is an e_mux
  assign pre_flush_cpu_instruction_master_readdatavalid = cpu_instruction_master_read_data_valid_onchip_ram_s1 |
    cpu_instruction_master_read_data_valid_onchip_rom_s1;

  //latent slave read data valid which is not flushed, which is an e_mux
  assign cpu_instruction_master_readdatavalid = cpu_instruction_master_read_but_no_slave_selected |
    pre_flush_cpu_instruction_master_readdatavalid |
    cpu_instruction_master_read_data_valid_cpu_jtag_debug_module |
    cpu_instruction_master_read_but_no_slave_selected |
    pre_flush_cpu_instruction_master_readdatavalid |
    cpu_instruction_master_read_but_no_slave_selected |
    pre_flush_cpu_instruction_master_readdatavalid;

  //cpu/instruction_master readdata mux, which is an e_mux
  assign cpu_instruction_master_readdata = ({32 {~(cpu_instruction_master_qualified_request_cpu_jtag_debug_module & cpu_instruction_master_read)}} | cpu_jtag_debug_module_readdata_from_sa) &
    ({32 {~cpu_instruction_master_read_data_valid_onchip_ram_s1}} | onchip_ram_s1_readdata_from_sa) &
    ({32 {~cpu_instruction_master_read_data_valid_onchip_rom_s1}} | onchip_rom_s1_readdata_from_sa);

  //actual waitrequest port, which is an e_assign
  assign cpu_instruction_master_waitrequest = ~cpu_instruction_master_run;

  //latent max counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_instruction_master_latency_counter <= 0;
      else if (1)
          cpu_instruction_master_latency_counter <= p1_cpu_instruction_master_latency_counter;
    end


  //latency counter load mux, which is an e_mux
  assign p1_cpu_instruction_master_latency_counter = ((cpu_instruction_master_run & cpu_instruction_master_read))? latency_load_value :
    (cpu_instruction_master_latency_counter)? cpu_instruction_master_latency_counter - 1 :
    0;

  //read latency load values, which is an e_mux
  assign latency_load_value = ({1 {cpu_instruction_master_requests_onchip_ram_s1}} & 1) |
    ({1 {cpu_instruction_master_requests_onchip_rom_s1}} & 1);


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //cpu_instruction_master_address check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_instruction_master_address_last_time <= 0;
      else if (1)
          cpu_instruction_master_address_last_time <= cpu_instruction_master_address;
    end


  //cpu/instruction_master waited last time, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          active_and_waiting_last_time <= 0;
      else if (1)
          active_and_waiting_last_time <= cpu_instruction_master_waitrequest & (cpu_instruction_master_read);
    end


  //cpu_instruction_master_address matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (cpu_instruction_master_address != cpu_instruction_master_address_last_time))
        begin
          $write("%0d ns: cpu_instruction_master_address did not heed wait!!!", $time);
          $stop;
        end
    end


  //cpu_instruction_master_read check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_instruction_master_read_last_time <= 0;
      else if (1)
          cpu_instruction_master_read_last_time <= cpu_instruction_master_read;
    end


  //cpu_instruction_master_read matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (cpu_instruction_master_read != cpu_instruction_master_read_last_time))
        begin
          $write("%0d ns: cpu_instruction_master_read did not heed wait!!!", $time);
          $stop;
        end
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module led_pio_s1_arbitrator (
                               // inputs:
                                clk,
                                cpu_data_master_address_to_slave,
                                cpu_data_master_byteenable,
                                cpu_data_master_read,
                                cpu_data_master_waitrequest,
                                cpu_data_master_write,
                                cpu_data_master_writedata,
                                reset_n,

                               // outputs:
                                cpu_data_master_granted_led_pio_s1,
                                cpu_data_master_qualified_request_led_pio_s1,
                                cpu_data_master_read_data_valid_led_pio_s1,
                                cpu_data_master_requests_led_pio_s1,
                                d1_led_pio_s1_end_xfer,
                                led_pio_s1_address,
                                led_pio_s1_chipselect,
                                led_pio_s1_reset_n,
                                led_pio_s1_write_n,
                                led_pio_s1_writedata
                             )
;

  output           cpu_data_master_granted_led_pio_s1;
  output           cpu_data_master_qualified_request_led_pio_s1;
  output           cpu_data_master_read_data_valid_led_pio_s1;
  output           cpu_data_master_requests_led_pio_s1;
  output           d1_led_pio_s1_end_xfer;
  output  [  1: 0] led_pio_s1_address;
  output           led_pio_s1_chipselect;
  output           led_pio_s1_reset_n;
  output           led_pio_s1_write_n;
  output  [  7: 0] led_pio_s1_writedata;
  input            clk;
  input   [ 14: 0] cpu_data_master_address_to_slave;
  input   [  3: 0] cpu_data_master_byteenable;
  input            cpu_data_master_read;
  input            cpu_data_master_waitrequest;
  input            cpu_data_master_write;
  input   [ 31: 0] cpu_data_master_writedata;
  input            reset_n;

  wire             cpu_data_master_arbiterlock;
  wire             cpu_data_master_arbiterlock2;
  wire             cpu_data_master_continuerequest;
  wire             cpu_data_master_granted_led_pio_s1;
  wire             cpu_data_master_qualified_request_led_pio_s1;
  wire             cpu_data_master_read_data_valid_led_pio_s1;
  wire             cpu_data_master_requests_led_pio_s1;
  wire             cpu_data_master_saved_grant_led_pio_s1;
  reg              d1_led_pio_s1_end_xfer;
  reg              d1_reasons_to_wait;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_led_pio_s1;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  wire    [  1: 0] led_pio_s1_address;
  wire             led_pio_s1_allgrants;
  wire             led_pio_s1_allow_new_arb_cycle;
  wire             led_pio_s1_any_bursting_master_saved_grant;
  wire             led_pio_s1_any_continuerequest;
  wire             led_pio_s1_arb_counter_enable;
  reg              led_pio_s1_arb_share_counter;
  wire             led_pio_s1_arb_share_counter_next_value;
  wire             led_pio_s1_arb_share_set_values;
  wire             led_pio_s1_beginbursttransfer_internal;
  wire             led_pio_s1_begins_xfer;
  wire             led_pio_s1_chipselect;
  wire             led_pio_s1_end_xfer;
  wire             led_pio_s1_firsttransfer;
  wire             led_pio_s1_grant_vector;
  wire             led_pio_s1_in_a_read_cycle;
  wire             led_pio_s1_in_a_write_cycle;
  wire             led_pio_s1_master_qreq_vector;
  wire             led_pio_s1_non_bursting_master_requests;
  wire             led_pio_s1_pretend_byte_enable;
  reg              led_pio_s1_reg_firsttransfer;
  wire             led_pio_s1_reset_n;
  reg              led_pio_s1_slavearbiterlockenable;
  wire             led_pio_s1_slavearbiterlockenable2;
  wire             led_pio_s1_unreg_firsttransfer;
  wire             led_pio_s1_waits_for_read;
  wire             led_pio_s1_waits_for_write;
  wire             led_pio_s1_write_n;
  wire    [  7: 0] led_pio_s1_writedata;
  wire    [ 14: 0] shifted_address_to_led_pio_s1_from_cpu_data_master;
  wire             wait_for_led_pio_s1_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else if (1)
          d1_reasons_to_wait <= ~led_pio_s1_end_xfer;
    end


  assign led_pio_s1_begins_xfer = ~d1_reasons_to_wait & ((cpu_data_master_qualified_request_led_pio_s1));
  assign cpu_data_master_requests_led_pio_s1 = (({cpu_data_master_address_to_slave[14 : 4] , 4'b0} == 15'h5000) & (cpu_data_master_read | cpu_data_master_write)) & cpu_data_master_write;
  //led_pio_s1_arb_share_counter set values, which is an e_mux
  assign led_pio_s1_arb_share_set_values = 1;

  //led_pio_s1_non_bursting_master_requests mux, which is an e_mux
  assign led_pio_s1_non_bursting_master_requests = cpu_data_master_requests_led_pio_s1;

  //led_pio_s1_any_bursting_master_saved_grant mux, which is an e_mux
  assign led_pio_s1_any_bursting_master_saved_grant = 0;

  //led_pio_s1_arb_share_counter_next_value assignment, which is an e_assign
  assign led_pio_s1_arb_share_counter_next_value = led_pio_s1_firsttransfer ? (led_pio_s1_arb_share_set_values - 1) : |led_pio_s1_arb_share_counter ? (led_pio_s1_arb_share_counter - 1) : 0;

  //led_pio_s1_allgrants all slave grants, which is an e_mux
  assign led_pio_s1_allgrants = |led_pio_s1_grant_vector;

  //led_pio_s1_end_xfer assignment, which is an e_assign
  assign led_pio_s1_end_xfer = ~(led_pio_s1_waits_for_read | led_pio_s1_waits_for_write);

  //end_xfer_arb_share_counter_term_led_pio_s1 arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_led_pio_s1 = led_pio_s1_end_xfer & (~led_pio_s1_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //led_pio_s1_arb_share_counter arbitration counter enable, which is an e_assign
  assign led_pio_s1_arb_counter_enable = (end_xfer_arb_share_counter_term_led_pio_s1 & led_pio_s1_allgrants) | (end_xfer_arb_share_counter_term_led_pio_s1 & ~led_pio_s1_non_bursting_master_requests);

  //led_pio_s1_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          led_pio_s1_arb_share_counter <= 0;
      else if (led_pio_s1_arb_counter_enable)
          led_pio_s1_arb_share_counter <= led_pio_s1_arb_share_counter_next_value;
    end


  //led_pio_s1_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          led_pio_s1_slavearbiterlockenable <= 0;
      else if ((|led_pio_s1_master_qreq_vector & end_xfer_arb_share_counter_term_led_pio_s1) | (end_xfer_arb_share_counter_term_led_pio_s1 & ~led_pio_s1_non_bursting_master_requests))
          led_pio_s1_slavearbiterlockenable <= |led_pio_s1_arb_share_counter_next_value;
    end


  //cpu/data_master led_pio/s1 arbiterlock, which is an e_assign
  assign cpu_data_master_arbiterlock = led_pio_s1_slavearbiterlockenable & cpu_data_master_continuerequest;

  //led_pio_s1_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign led_pio_s1_slavearbiterlockenable2 = |led_pio_s1_arb_share_counter_next_value;

  //cpu/data_master led_pio/s1 arbiterlock2, which is an e_assign
  assign cpu_data_master_arbiterlock2 = led_pio_s1_slavearbiterlockenable2 & cpu_data_master_continuerequest;

  //led_pio_s1_any_continuerequest at least one master continues requesting, which is an e_assign
  assign led_pio_s1_any_continuerequest = 1;

  //cpu_data_master_continuerequest continued request, which is an e_assign
  assign cpu_data_master_continuerequest = 1;

  assign cpu_data_master_qualified_request_led_pio_s1 = cpu_data_master_requests_led_pio_s1 & ~(((~cpu_data_master_waitrequest) & cpu_data_master_write));
  //led_pio_s1_writedata mux, which is an e_mux
  assign led_pio_s1_writedata = cpu_data_master_writedata;

  //master is always granted when requested
  assign cpu_data_master_granted_led_pio_s1 = cpu_data_master_qualified_request_led_pio_s1;

  //cpu/data_master saved-grant led_pio/s1, which is an e_assign
  assign cpu_data_master_saved_grant_led_pio_s1 = cpu_data_master_requests_led_pio_s1;

  //allow new arb cycle for led_pio/s1, which is an e_assign
  assign led_pio_s1_allow_new_arb_cycle = 1;

  //placeholder chosen master
  assign led_pio_s1_grant_vector = 1;

  //placeholder vector of master qualified-requests
  assign led_pio_s1_master_qreq_vector = 1;

  //led_pio_s1_reset_n assignment, which is an e_assign
  assign led_pio_s1_reset_n = reset_n;

  assign led_pio_s1_chipselect = cpu_data_master_granted_led_pio_s1;
  //led_pio_s1_firsttransfer first transaction, which is an e_assign
  assign led_pio_s1_firsttransfer = led_pio_s1_begins_xfer ? led_pio_s1_unreg_firsttransfer : led_pio_s1_reg_firsttransfer;

  //led_pio_s1_unreg_firsttransfer first transaction, which is an e_assign
  assign led_pio_s1_unreg_firsttransfer = ~(led_pio_s1_slavearbiterlockenable & led_pio_s1_any_continuerequest);

  //led_pio_s1_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          led_pio_s1_reg_firsttransfer <= 1'b1;
      else if (led_pio_s1_begins_xfer)
          led_pio_s1_reg_firsttransfer <= led_pio_s1_unreg_firsttransfer;
    end


  //led_pio_s1_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign led_pio_s1_beginbursttransfer_internal = led_pio_s1_begins_xfer;

  //~led_pio_s1_write_n assignment, which is an e_mux
  assign led_pio_s1_write_n = ~(((cpu_data_master_granted_led_pio_s1 & cpu_data_master_write)) & led_pio_s1_pretend_byte_enable);

  assign shifted_address_to_led_pio_s1_from_cpu_data_master = cpu_data_master_address_to_slave;
  //led_pio_s1_address mux, which is an e_mux
  assign led_pio_s1_address = shifted_address_to_led_pio_s1_from_cpu_data_master >> 2;

  //d1_led_pio_s1_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_led_pio_s1_end_xfer <= 1;
      else if (1)
          d1_led_pio_s1_end_xfer <= led_pio_s1_end_xfer;
    end


  //led_pio_s1_waits_for_read in a cycle, which is an e_mux
  assign led_pio_s1_waits_for_read = led_pio_s1_in_a_read_cycle & led_pio_s1_begins_xfer;

  //led_pio_s1_in_a_read_cycle assignment, which is an e_assign
  assign led_pio_s1_in_a_read_cycle = cpu_data_master_granted_led_pio_s1 & cpu_data_master_read;

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = led_pio_s1_in_a_read_cycle;

  //led_pio_s1_waits_for_write in a cycle, which is an e_mux
  assign led_pio_s1_waits_for_write = led_pio_s1_in_a_write_cycle & 0;

  //led_pio_s1_in_a_write_cycle assignment, which is an e_assign
  assign led_pio_s1_in_a_write_cycle = cpu_data_master_granted_led_pio_s1 & cpu_data_master_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = led_pio_s1_in_a_write_cycle;

  assign wait_for_led_pio_s1_counter = 0;
  //led_pio_s1_pretend_byte_enable byte enable port mux, which is an e_mux
  assign led_pio_s1_pretend_byte_enable = (cpu_data_master_granted_led_pio_s1)? cpu_data_master_byteenable :
    -1;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //led_pio/s1 enable non-zero assertions, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          enable_nonzero_assertions <= 0;
      else if (1)
          enable_nonzero_assertions <= 1'b1;
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module onchip_ram_s1_arbitrator (
                                  // inputs:
                                   clk,
                                   cpu_data_master_address_to_slave,
                                   cpu_data_master_byteenable,
                                   cpu_data_master_read,
                                   cpu_data_master_waitrequest,
                                   cpu_data_master_write,
                                   cpu_data_master_writedata,
                                   cpu_instruction_master_address_to_slave,
                                   cpu_instruction_master_latency_counter,
                                   cpu_instruction_master_read,
                                   onchip_ram_s1_readdata,
                                   reset_n,

                                  // outputs:
                                   cpu_data_master_granted_onchip_ram_s1,
                                   cpu_data_master_qualified_request_onchip_ram_s1,
                                   cpu_data_master_read_data_valid_onchip_ram_s1,
                                   cpu_data_master_requests_onchip_ram_s1,
                                   cpu_instruction_master_granted_onchip_ram_s1,
                                   cpu_instruction_master_qualified_request_onchip_ram_s1,
                                   cpu_instruction_master_read_data_valid_onchip_ram_s1,
                                   cpu_instruction_master_requests_onchip_ram_s1,
                                   d1_onchip_ram_s1_end_xfer,
                                   onchip_ram_s1_address,
                                   onchip_ram_s1_byteenable,
                                   onchip_ram_s1_chipselect,
                                   onchip_ram_s1_clken,
                                   onchip_ram_s1_readdata_from_sa,
                                   onchip_ram_s1_write,
                                   onchip_ram_s1_writedata,
                                   registered_cpu_data_master_read_data_valid_onchip_ram_s1
                                )
;

  output           cpu_data_master_granted_onchip_ram_s1;
  output           cpu_data_master_qualified_request_onchip_ram_s1;
  output           cpu_data_master_read_data_valid_onchip_ram_s1;
  output           cpu_data_master_requests_onchip_ram_s1;
  output           cpu_instruction_master_granted_onchip_ram_s1;
  output           cpu_instruction_master_qualified_request_onchip_ram_s1;
  output           cpu_instruction_master_read_data_valid_onchip_ram_s1;
  output           cpu_instruction_master_requests_onchip_ram_s1;
  output           d1_onchip_ram_s1_end_xfer;
  output  [  9: 0] onchip_ram_s1_address;
  output  [  3: 0] onchip_ram_s1_byteenable;
  output           onchip_ram_s1_chipselect;
  output           onchip_ram_s1_clken;
  output  [ 31: 0] onchip_ram_s1_readdata_from_sa;
  output           onchip_ram_s1_write;
  output  [ 31: 0] onchip_ram_s1_writedata;
  output           registered_cpu_data_master_read_data_valid_onchip_ram_s1;
  input            clk;
  input   [ 14: 0] cpu_data_master_address_to_slave;
  input   [  3: 0] cpu_data_master_byteenable;
  input            cpu_data_master_read;
  input            cpu_data_master_waitrequest;
  input            cpu_data_master_write;
  input   [ 31: 0] cpu_data_master_writedata;
  input   [ 14: 0] cpu_instruction_master_address_to_slave;
  input            cpu_instruction_master_latency_counter;
  input            cpu_instruction_master_read;
  input   [ 31: 0] onchip_ram_s1_readdata;
  input            reset_n;

  wire             cpu_data_master_arbiterlock;
  wire             cpu_data_master_arbiterlock2;
  wire             cpu_data_master_continuerequest;
  wire             cpu_data_master_granted_onchip_ram_s1;
  wire             cpu_data_master_qualified_request_onchip_ram_s1;
  wire             cpu_data_master_read_data_valid_onchip_ram_s1;
  reg              cpu_data_master_read_data_valid_onchip_ram_s1_shift_register;
  wire             cpu_data_master_read_data_valid_onchip_ram_s1_shift_register_in;
  wire             cpu_data_master_requests_onchip_ram_s1;
  wire             cpu_data_master_saved_grant_onchip_ram_s1;
  wire             cpu_instruction_master_arbiterlock;
  wire             cpu_instruction_master_arbiterlock2;
  wire             cpu_instruction_master_continuerequest;
  wire             cpu_instruction_master_granted_onchip_ram_s1;
  wire             cpu_instruction_master_qualified_request_onchip_ram_s1;
  wire             cpu_instruction_master_read_data_valid_onchip_ram_s1;
  reg              cpu_instruction_master_read_data_valid_onchip_ram_s1_shift_register;
  wire             cpu_instruction_master_read_data_valid_onchip_ram_s1_shift_register_in;
  wire             cpu_instruction_master_requests_onchip_ram_s1;
  wire             cpu_instruction_master_saved_grant_onchip_ram_s1;
  reg              d1_onchip_ram_s1_end_xfer;
  reg              d1_reasons_to_wait;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_onchip_ram_s1;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  reg              last_cycle_cpu_data_master_granted_slave_onchip_ram_s1;
  reg              last_cycle_cpu_instruction_master_granted_slave_onchip_ram_s1;
  wire    [  9: 0] onchip_ram_s1_address;
  wire             onchip_ram_s1_allgrants;
  wire             onchip_ram_s1_allow_new_arb_cycle;
  wire             onchip_ram_s1_any_bursting_master_saved_grant;
  wire             onchip_ram_s1_any_continuerequest;
  reg     [  1: 0] onchip_ram_s1_arb_addend;
  wire             onchip_ram_s1_arb_counter_enable;
  reg              onchip_ram_s1_arb_share_counter;
  wire             onchip_ram_s1_arb_share_counter_next_value;
  wire             onchip_ram_s1_arb_share_set_values;
  wire    [  1: 0] onchip_ram_s1_arb_winner;
  wire             onchip_ram_s1_arbitration_holdoff_internal;
  wire             onchip_ram_s1_beginbursttransfer_internal;
  wire             onchip_ram_s1_begins_xfer;
  wire    [  3: 0] onchip_ram_s1_byteenable;
  wire             onchip_ram_s1_chipselect;
  wire    [  3: 0] onchip_ram_s1_chosen_master_double_vector;
  wire    [  1: 0] onchip_ram_s1_chosen_master_rot_left;
  wire             onchip_ram_s1_clken;
  wire             onchip_ram_s1_end_xfer;
  wire             onchip_ram_s1_firsttransfer;
  wire    [  1: 0] onchip_ram_s1_grant_vector;
  wire             onchip_ram_s1_in_a_read_cycle;
  wire             onchip_ram_s1_in_a_write_cycle;
  wire    [  1: 0] onchip_ram_s1_master_qreq_vector;
  wire             onchip_ram_s1_non_bursting_master_requests;
  wire    [ 31: 0] onchip_ram_s1_readdata_from_sa;
  reg              onchip_ram_s1_reg_firsttransfer;
  reg     [  1: 0] onchip_ram_s1_saved_chosen_master_vector;
  reg              onchip_ram_s1_slavearbiterlockenable;
  wire             onchip_ram_s1_slavearbiterlockenable2;
  wire             onchip_ram_s1_unreg_firsttransfer;
  wire             onchip_ram_s1_waits_for_read;
  wire             onchip_ram_s1_waits_for_write;
  wire             onchip_ram_s1_write;
  wire    [ 31: 0] onchip_ram_s1_writedata;
  wire             p1_cpu_data_master_read_data_valid_onchip_ram_s1_shift_register;
  wire             p1_cpu_instruction_master_read_data_valid_onchip_ram_s1_shift_register;
  wire             registered_cpu_data_master_read_data_valid_onchip_ram_s1;
  wire    [ 14: 0] shifted_address_to_onchip_ram_s1_from_cpu_data_master;
  wire    [ 14: 0] shifted_address_to_onchip_ram_s1_from_cpu_instruction_master;
  wire             wait_for_onchip_ram_s1_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else if (1)
          d1_reasons_to_wait <= ~onchip_ram_s1_end_xfer;
    end


  assign onchip_ram_s1_begins_xfer = ~d1_reasons_to_wait & ((cpu_data_master_qualified_request_onchip_ram_s1 | cpu_instruction_master_qualified_request_onchip_ram_s1));
  //assign onchip_ram_s1_readdata_from_sa = onchip_ram_s1_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign onchip_ram_s1_readdata_from_sa = onchip_ram_s1_readdata;

  assign cpu_data_master_requests_onchip_ram_s1 = ({cpu_data_master_address_to_slave[14 : 12] , 12'b0} == 15'h3000) & (cpu_data_master_read | cpu_data_master_write);
  //registered rdv signal_name registered_cpu_data_master_read_data_valid_onchip_ram_s1 assignment, which is an e_assign
  assign registered_cpu_data_master_read_data_valid_onchip_ram_s1 = cpu_data_master_read_data_valid_onchip_ram_s1_shift_register_in;

  //onchip_ram_s1_arb_share_counter set values, which is an e_mux
  assign onchip_ram_s1_arb_share_set_values = 1;

  //onchip_ram_s1_non_bursting_master_requests mux, which is an e_mux
  assign onchip_ram_s1_non_bursting_master_requests = cpu_data_master_requests_onchip_ram_s1 |
    cpu_instruction_master_requests_onchip_ram_s1 |
    cpu_data_master_requests_onchip_ram_s1 |
    cpu_instruction_master_requests_onchip_ram_s1;

  //onchip_ram_s1_any_bursting_master_saved_grant mux, which is an e_mux
  assign onchip_ram_s1_any_bursting_master_saved_grant = 0;

  //onchip_ram_s1_arb_share_counter_next_value assignment, which is an e_assign
  assign onchip_ram_s1_arb_share_counter_next_value = onchip_ram_s1_firsttransfer ? (onchip_ram_s1_arb_share_set_values - 1) : |onchip_ram_s1_arb_share_counter ? (onchip_ram_s1_arb_share_counter - 1) : 0;

  //onchip_ram_s1_allgrants all slave grants, which is an e_mux
  assign onchip_ram_s1_allgrants = |onchip_ram_s1_grant_vector |
    |onchip_ram_s1_grant_vector |
    |onchip_ram_s1_grant_vector |
    |onchip_ram_s1_grant_vector;

  //onchip_ram_s1_end_xfer assignment, which is an e_assign
  assign onchip_ram_s1_end_xfer = ~(onchip_ram_s1_waits_for_read | onchip_ram_s1_waits_for_write);

  //end_xfer_arb_share_counter_term_onchip_ram_s1 arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_onchip_ram_s1 = onchip_ram_s1_end_xfer & (~onchip_ram_s1_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //onchip_ram_s1_arb_share_counter arbitration counter enable, which is an e_assign
  assign onchip_ram_s1_arb_counter_enable = (end_xfer_arb_share_counter_term_onchip_ram_s1 & onchip_ram_s1_allgrants) | (end_xfer_arb_share_counter_term_onchip_ram_s1 & ~onchip_ram_s1_non_bursting_master_requests);

  //onchip_ram_s1_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          onchip_ram_s1_arb_share_counter <= 0;
      else if (onchip_ram_s1_arb_counter_enable)
          onchip_ram_s1_arb_share_counter <= onchip_ram_s1_arb_share_counter_next_value;
    end


  //onchip_ram_s1_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          onchip_ram_s1_slavearbiterlockenable <= 0;
      else if ((|onchip_ram_s1_master_qreq_vector & end_xfer_arb_share_counter_term_onchip_ram_s1) | (end_xfer_arb_share_counter_term_onchip_ram_s1 & ~onchip_ram_s1_non_bursting_master_requests))
          onchip_ram_s1_slavearbiterlockenable <= |onchip_ram_s1_arb_share_counter_next_value;
    end


  //cpu/data_master onchip_ram/s1 arbiterlock, which is an e_assign
  assign cpu_data_master_arbiterlock = onchip_ram_s1_slavearbiterlockenable & cpu_data_master_continuerequest;

  //onchip_ram_s1_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign onchip_ram_s1_slavearbiterlockenable2 = |onchip_ram_s1_arb_share_counter_next_value;

  //cpu/data_master onchip_ram/s1 arbiterlock2, which is an e_assign
  assign cpu_data_master_arbiterlock2 = onchip_ram_s1_slavearbiterlockenable2 & cpu_data_master_continuerequest;

  //cpu/instruction_master onchip_ram/s1 arbiterlock, which is an e_assign
  assign cpu_instruction_master_arbiterlock = onchip_ram_s1_slavearbiterlockenable & cpu_instruction_master_continuerequest;

  //cpu/instruction_master onchip_ram/s1 arbiterlock2, which is an e_assign
  assign cpu_instruction_master_arbiterlock2 = onchip_ram_s1_slavearbiterlockenable2 & cpu_instruction_master_continuerequest;

  //cpu/instruction_master granted onchip_ram/s1 last time, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          last_cycle_cpu_instruction_master_granted_slave_onchip_ram_s1 <= 0;
      else if (1)
          last_cycle_cpu_instruction_master_granted_slave_onchip_ram_s1 <= cpu_instruction_master_saved_grant_onchip_ram_s1 ? 1 : (onchip_ram_s1_arbitration_holdoff_internal | ~cpu_instruction_master_requests_onchip_ram_s1) ? 0 : last_cycle_cpu_instruction_master_granted_slave_onchip_ram_s1;
    end


  //cpu_instruction_master_continuerequest continued request, which is an e_mux
  assign cpu_instruction_master_continuerequest = last_cycle_cpu_instruction_master_granted_slave_onchip_ram_s1 & cpu_instruction_master_requests_onchip_ram_s1;

  //onchip_ram_s1_any_continuerequest at least one master continues requesting, which is an e_mux
  assign onchip_ram_s1_any_continuerequest = cpu_instruction_master_continuerequest |
    cpu_data_master_continuerequest;

  assign cpu_data_master_qualified_request_onchip_ram_s1 = cpu_data_master_requests_onchip_ram_s1 & ~((cpu_data_master_read & ((|cpu_data_master_read_data_valid_onchip_ram_s1_shift_register))) | ((~cpu_data_master_waitrequest) & cpu_data_master_write) | cpu_instruction_master_arbiterlock);
  //cpu_data_master_read_data_valid_onchip_ram_s1_shift_register_in mux for readlatency shift register, which is an e_mux
  assign cpu_data_master_read_data_valid_onchip_ram_s1_shift_register_in = cpu_data_master_granted_onchip_ram_s1 & cpu_data_master_read & ~onchip_ram_s1_waits_for_read & ~(|cpu_data_master_read_data_valid_onchip_ram_s1_shift_register);

  //shift register p1 cpu_data_master_read_data_valid_onchip_ram_s1_shift_register in if flush, otherwise shift left, which is an e_mux
  assign p1_cpu_data_master_read_data_valid_onchip_ram_s1_shift_register = {cpu_data_master_read_data_valid_onchip_ram_s1_shift_register, cpu_data_master_read_data_valid_onchip_ram_s1_shift_register_in};

  //cpu_data_master_read_data_valid_onchip_ram_s1_shift_register for remembering which master asked for a fixed latency read, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_data_master_read_data_valid_onchip_ram_s1_shift_register <= 0;
      else if (1)
          cpu_data_master_read_data_valid_onchip_ram_s1_shift_register <= p1_cpu_data_master_read_data_valid_onchip_ram_s1_shift_register;
    end


  //local readdatavalid cpu_data_master_read_data_valid_onchip_ram_s1, which is an e_mux
  assign cpu_data_master_read_data_valid_onchip_ram_s1 = cpu_data_master_read_data_valid_onchip_ram_s1_shift_register;

  //onchip_ram_s1_writedata mux, which is an e_mux
  assign onchip_ram_s1_writedata = cpu_data_master_writedata;

  //mux onchip_ram_s1_clken, which is an e_mux
  assign onchip_ram_s1_clken = 1'b1;

  assign cpu_instruction_master_requests_onchip_ram_s1 = (({cpu_instruction_master_address_to_slave[14 : 12] , 12'b0} == 15'h3000) & (cpu_instruction_master_read)) & cpu_instruction_master_read;
  //cpu/data_master granted onchip_ram/s1 last time, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          last_cycle_cpu_data_master_granted_slave_onchip_ram_s1 <= 0;
      else if (1)
          last_cycle_cpu_data_master_granted_slave_onchip_ram_s1 <= cpu_data_master_saved_grant_onchip_ram_s1 ? 1 : (onchip_ram_s1_arbitration_holdoff_internal | ~cpu_data_master_requests_onchip_ram_s1) ? 0 : last_cycle_cpu_data_master_granted_slave_onchip_ram_s1;
    end


  //cpu_data_master_continuerequest continued request, which is an e_mux
  assign cpu_data_master_continuerequest = last_cycle_cpu_data_master_granted_slave_onchip_ram_s1 & cpu_data_master_requests_onchip_ram_s1;

  assign cpu_instruction_master_qualified_request_onchip_ram_s1 = cpu_instruction_master_requests_onchip_ram_s1 & ~((cpu_instruction_master_read & ((1 < cpu_instruction_master_latency_counter))) | cpu_data_master_arbiterlock);
  //cpu_instruction_master_read_data_valid_onchip_ram_s1_shift_register_in mux for readlatency shift register, which is an e_mux
  assign cpu_instruction_master_read_data_valid_onchip_ram_s1_shift_register_in = cpu_instruction_master_granted_onchip_ram_s1 & cpu_instruction_master_read & ~onchip_ram_s1_waits_for_read;

  //shift register p1 cpu_instruction_master_read_data_valid_onchip_ram_s1_shift_register in if flush, otherwise shift left, which is an e_mux
  assign p1_cpu_instruction_master_read_data_valid_onchip_ram_s1_shift_register = {cpu_instruction_master_read_data_valid_onchip_ram_s1_shift_register, cpu_instruction_master_read_data_valid_onchip_ram_s1_shift_register_in};

  //cpu_instruction_master_read_data_valid_onchip_ram_s1_shift_register for remembering which master asked for a fixed latency read, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_instruction_master_read_data_valid_onchip_ram_s1_shift_register <= 0;
      else if (1)
          cpu_instruction_master_read_data_valid_onchip_ram_s1_shift_register <= p1_cpu_instruction_master_read_data_valid_onchip_ram_s1_shift_register;
    end


  //local readdatavalid cpu_instruction_master_read_data_valid_onchip_ram_s1, which is an e_mux
  assign cpu_instruction_master_read_data_valid_onchip_ram_s1 = cpu_instruction_master_read_data_valid_onchip_ram_s1_shift_register;

  //allow new arb cycle for onchip_ram/s1, which is an e_assign
  assign onchip_ram_s1_allow_new_arb_cycle = ~cpu_data_master_arbiterlock & ~cpu_instruction_master_arbiterlock;

  //cpu/instruction_master assignment into master qualified-requests vector for onchip_ram/s1, which is an e_assign
  assign onchip_ram_s1_master_qreq_vector[0] = cpu_instruction_master_qualified_request_onchip_ram_s1;

  //cpu/instruction_master grant onchip_ram/s1, which is an e_assign
  assign cpu_instruction_master_granted_onchip_ram_s1 = onchip_ram_s1_grant_vector[0];

  //cpu/instruction_master saved-grant onchip_ram/s1, which is an e_assign
  assign cpu_instruction_master_saved_grant_onchip_ram_s1 = onchip_ram_s1_arb_winner[0] && cpu_instruction_master_requests_onchip_ram_s1;

  //cpu/data_master assignment into master qualified-requests vector for onchip_ram/s1, which is an e_assign
  assign onchip_ram_s1_master_qreq_vector[1] = cpu_data_master_qualified_request_onchip_ram_s1;

  //cpu/data_master grant onchip_ram/s1, which is an e_assign
  assign cpu_data_master_granted_onchip_ram_s1 = onchip_ram_s1_grant_vector[1];

  //cpu/data_master saved-grant onchip_ram/s1, which is an e_assign
  assign cpu_data_master_saved_grant_onchip_ram_s1 = onchip_ram_s1_arb_winner[1] && cpu_data_master_requests_onchip_ram_s1;

  //onchip_ram/s1 chosen-master double-vector, which is an e_assign
  assign onchip_ram_s1_chosen_master_double_vector = {onchip_ram_s1_master_qreq_vector, onchip_ram_s1_master_qreq_vector} & ({~onchip_ram_s1_master_qreq_vector, ~onchip_ram_s1_master_qreq_vector} + onchip_ram_s1_arb_addend);

  //stable onehot encoding of arb winner
  assign onchip_ram_s1_arb_winner = (onchip_ram_s1_allow_new_arb_cycle & | onchip_ram_s1_grant_vector) ? onchip_ram_s1_grant_vector : onchip_ram_s1_saved_chosen_master_vector;

  //saved onchip_ram_s1_grant_vector, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          onchip_ram_s1_saved_chosen_master_vector <= 0;
      else if (onchip_ram_s1_allow_new_arb_cycle)
          onchip_ram_s1_saved_chosen_master_vector <= |onchip_ram_s1_grant_vector ? onchip_ram_s1_grant_vector : onchip_ram_s1_saved_chosen_master_vector;
    end


  //onehot encoding of chosen master
  assign onchip_ram_s1_grant_vector = {(onchip_ram_s1_chosen_master_double_vector[1] | onchip_ram_s1_chosen_master_double_vector[3]),
    (onchip_ram_s1_chosen_master_double_vector[0] | onchip_ram_s1_chosen_master_double_vector[2])};

  //onchip_ram/s1 chosen master rotated left, which is an e_assign
  assign onchip_ram_s1_chosen_master_rot_left = (onchip_ram_s1_arb_winner << 1) ? (onchip_ram_s1_arb_winner << 1) : 1;

  //onchip_ram/s1's addend for next-master-grant
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          onchip_ram_s1_arb_addend <= 1;
      else if (|onchip_ram_s1_grant_vector)
          onchip_ram_s1_arb_addend <= onchip_ram_s1_end_xfer? onchip_ram_s1_chosen_master_rot_left : onchip_ram_s1_grant_vector;
    end


  assign onchip_ram_s1_chipselect = cpu_data_master_granted_onchip_ram_s1 | cpu_instruction_master_granted_onchip_ram_s1;
  //onchip_ram_s1_firsttransfer first transaction, which is an e_assign
  assign onchip_ram_s1_firsttransfer = onchip_ram_s1_begins_xfer ? onchip_ram_s1_unreg_firsttransfer : onchip_ram_s1_reg_firsttransfer;

  //onchip_ram_s1_unreg_firsttransfer first transaction, which is an e_assign
  assign onchip_ram_s1_unreg_firsttransfer = ~(onchip_ram_s1_slavearbiterlockenable & onchip_ram_s1_any_continuerequest);

  //onchip_ram_s1_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          onchip_ram_s1_reg_firsttransfer <= 1'b1;
      else if (onchip_ram_s1_begins_xfer)
          onchip_ram_s1_reg_firsttransfer <= onchip_ram_s1_unreg_firsttransfer;
    end


  //onchip_ram_s1_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign onchip_ram_s1_beginbursttransfer_internal = onchip_ram_s1_begins_xfer;

  //onchip_ram_s1_arbitration_holdoff_internal arbitration_holdoff, which is an e_assign
  assign onchip_ram_s1_arbitration_holdoff_internal = onchip_ram_s1_begins_xfer & onchip_ram_s1_firsttransfer;

  //onchip_ram_s1_write assignment, which is an e_mux
  assign onchip_ram_s1_write = cpu_data_master_granted_onchip_ram_s1 & cpu_data_master_write;

  assign shifted_address_to_onchip_ram_s1_from_cpu_data_master = cpu_data_master_address_to_slave;
  //onchip_ram_s1_address mux, which is an e_mux
  assign onchip_ram_s1_address = (cpu_data_master_granted_onchip_ram_s1)? (shifted_address_to_onchip_ram_s1_from_cpu_data_master >> 2) :
    (shifted_address_to_onchip_ram_s1_from_cpu_instruction_master >> 2);

  assign shifted_address_to_onchip_ram_s1_from_cpu_instruction_master = cpu_instruction_master_address_to_slave;
  //d1_onchip_ram_s1_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_onchip_ram_s1_end_xfer <= 1;
      else if (1)
          d1_onchip_ram_s1_end_xfer <= onchip_ram_s1_end_xfer;
    end


  //onchip_ram_s1_waits_for_read in a cycle, which is an e_mux
  assign onchip_ram_s1_waits_for_read = onchip_ram_s1_in_a_read_cycle & 0;

  //onchip_ram_s1_in_a_read_cycle assignment, which is an e_assign
  assign onchip_ram_s1_in_a_read_cycle = (cpu_data_master_granted_onchip_ram_s1 & cpu_data_master_read) | (cpu_instruction_master_granted_onchip_ram_s1 & cpu_instruction_master_read);

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = onchip_ram_s1_in_a_read_cycle;

  //onchip_ram_s1_waits_for_write in a cycle, which is an e_mux
  assign onchip_ram_s1_waits_for_write = onchip_ram_s1_in_a_write_cycle & 0;

  //onchip_ram_s1_in_a_write_cycle assignment, which is an e_assign
  assign onchip_ram_s1_in_a_write_cycle = cpu_data_master_granted_onchip_ram_s1 & cpu_data_master_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = onchip_ram_s1_in_a_write_cycle;

  assign wait_for_onchip_ram_s1_counter = 0;
  //onchip_ram_s1_byteenable byte enable port mux, which is an e_mux
  assign onchip_ram_s1_byteenable = (cpu_data_master_granted_onchip_ram_s1)? cpu_data_master_byteenable :
    -1;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //onchip_ram/s1 enable non-zero assertions, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          enable_nonzero_assertions <= 0;
      else if (1)
          enable_nonzero_assertions <= 1'b1;
    end


  //grant signals are active simultaneously, which is an e_process
  always @(posedge clk)
    begin
      if (cpu_data_master_granted_onchip_ram_s1 + cpu_instruction_master_granted_onchip_ram_s1 > 1)
        begin
          $write("%0d ns: > 1 of grant signals are active simultaneously", $time);
          $stop;
        end
    end


  //saved_grant signals are active simultaneously, which is an e_process
  always @(posedge clk)
    begin
      if (cpu_data_master_saved_grant_onchip_ram_s1 + cpu_instruction_master_saved_grant_onchip_ram_s1 > 1)
        begin
          $write("%0d ns: > 1 of saved_grant signals are active simultaneously", $time);
          $stop;
        end
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module onchip_rom_s1_arbitrator (
                                  // inputs:
                                   clk,
                                   cpu_data_master_address_to_slave,
                                   cpu_data_master_byteenable,
                                   cpu_data_master_debugaccess,
                                   cpu_data_master_read,
                                   cpu_data_master_waitrequest,
                                   cpu_data_master_write,
                                   cpu_data_master_writedata,
                                   cpu_instruction_master_address_to_slave,
                                   cpu_instruction_master_latency_counter,
                                   cpu_instruction_master_read,
                                   onchip_rom_s1_readdata,
                                   reset_n,

                                  // outputs:
                                   cpu_data_master_granted_onchip_rom_s1,
                                   cpu_data_master_qualified_request_onchip_rom_s1,
                                   cpu_data_master_read_data_valid_onchip_rom_s1,
                                   cpu_data_master_requests_onchip_rom_s1,
                                   cpu_instruction_master_granted_onchip_rom_s1,
                                   cpu_instruction_master_qualified_request_onchip_rom_s1,
                                   cpu_instruction_master_read_data_valid_onchip_rom_s1,
                                   cpu_instruction_master_requests_onchip_rom_s1,
                                   d1_onchip_rom_s1_end_xfer,
                                   onchip_rom_s1_address,
                                   onchip_rom_s1_byteenable,
                                   onchip_rom_s1_chipselect,
                                   onchip_rom_s1_clken,
                                   onchip_rom_s1_debugaccess,
                                   onchip_rom_s1_readdata_from_sa,
                                   onchip_rom_s1_write,
                                   onchip_rom_s1_writedata,
                                   registered_cpu_data_master_read_data_valid_onchip_rom_s1
                                )
;

  output           cpu_data_master_granted_onchip_rom_s1;
  output           cpu_data_master_qualified_request_onchip_rom_s1;
  output           cpu_data_master_read_data_valid_onchip_rom_s1;
  output           cpu_data_master_requests_onchip_rom_s1;
  output           cpu_instruction_master_granted_onchip_rom_s1;
  output           cpu_instruction_master_qualified_request_onchip_rom_s1;
  output           cpu_instruction_master_read_data_valid_onchip_rom_s1;
  output           cpu_instruction_master_requests_onchip_rom_s1;
  output           d1_onchip_rom_s1_end_xfer;
  output  [  9: 0] onchip_rom_s1_address;
  output  [  3: 0] onchip_rom_s1_byteenable;
  output           onchip_rom_s1_chipselect;
  output           onchip_rom_s1_clken;
  output           onchip_rom_s1_debugaccess;
  output  [ 31: 0] onchip_rom_s1_readdata_from_sa;
  output           onchip_rom_s1_write;
  output  [ 31: 0] onchip_rom_s1_writedata;
  output           registered_cpu_data_master_read_data_valid_onchip_rom_s1;
  input            clk;
  input   [ 14: 0] cpu_data_master_address_to_slave;
  input   [  3: 0] cpu_data_master_byteenable;
  input            cpu_data_master_debugaccess;
  input            cpu_data_master_read;
  input            cpu_data_master_waitrequest;
  input            cpu_data_master_write;
  input   [ 31: 0] cpu_data_master_writedata;
  input   [ 14: 0] cpu_instruction_master_address_to_slave;
  input            cpu_instruction_master_latency_counter;
  input            cpu_instruction_master_read;
  input   [ 31: 0] onchip_rom_s1_readdata;
  input            reset_n;

  wire             cpu_data_master_arbiterlock;
  wire             cpu_data_master_arbiterlock2;
  wire             cpu_data_master_continuerequest;
  wire             cpu_data_master_granted_onchip_rom_s1;
  wire             cpu_data_master_qualified_request_onchip_rom_s1;
  wire             cpu_data_master_read_data_valid_onchip_rom_s1;
  reg              cpu_data_master_read_data_valid_onchip_rom_s1_shift_register;
  wire             cpu_data_master_read_data_valid_onchip_rom_s1_shift_register_in;
  wire             cpu_data_master_requests_onchip_rom_s1;
  wire             cpu_data_master_saved_grant_onchip_rom_s1;
  wire             cpu_instruction_master_arbiterlock;
  wire             cpu_instruction_master_arbiterlock2;
  wire             cpu_instruction_master_continuerequest;
  wire             cpu_instruction_master_granted_onchip_rom_s1;
  wire             cpu_instruction_master_qualified_request_onchip_rom_s1;
  wire             cpu_instruction_master_read_data_valid_onchip_rom_s1;
  reg              cpu_instruction_master_read_data_valid_onchip_rom_s1_shift_register;
  wire             cpu_instruction_master_read_data_valid_onchip_rom_s1_shift_register_in;
  wire             cpu_instruction_master_requests_onchip_rom_s1;
  wire             cpu_instruction_master_saved_grant_onchip_rom_s1;
  reg              d1_onchip_rom_s1_end_xfer;
  reg              d1_reasons_to_wait;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_onchip_rom_s1;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  reg              last_cycle_cpu_data_master_granted_slave_onchip_rom_s1;
  reg              last_cycle_cpu_instruction_master_granted_slave_onchip_rom_s1;
  wire    [  9: 0] onchip_rom_s1_address;
  wire             onchip_rom_s1_allgrants;
  wire             onchip_rom_s1_allow_new_arb_cycle;
  wire             onchip_rom_s1_any_bursting_master_saved_grant;
  wire             onchip_rom_s1_any_continuerequest;
  reg     [  1: 0] onchip_rom_s1_arb_addend;
  wire             onchip_rom_s1_arb_counter_enable;
  reg              onchip_rom_s1_arb_share_counter;
  wire             onchip_rom_s1_arb_share_counter_next_value;
  wire             onchip_rom_s1_arb_share_set_values;
  wire    [  1: 0] onchip_rom_s1_arb_winner;
  wire             onchip_rom_s1_arbitration_holdoff_internal;
  wire             onchip_rom_s1_beginbursttransfer_internal;
  wire             onchip_rom_s1_begins_xfer;
  wire    [  3: 0] onchip_rom_s1_byteenable;
  wire             onchip_rom_s1_chipselect;
  wire    [  3: 0] onchip_rom_s1_chosen_master_double_vector;
  wire    [  1: 0] onchip_rom_s1_chosen_master_rot_left;
  wire             onchip_rom_s1_clken;
  wire             onchip_rom_s1_debugaccess;
  wire             onchip_rom_s1_end_xfer;
  wire             onchip_rom_s1_firsttransfer;
  wire    [  1: 0] onchip_rom_s1_grant_vector;
  wire             onchip_rom_s1_in_a_read_cycle;
  wire             onchip_rom_s1_in_a_write_cycle;
  wire    [  1: 0] onchip_rom_s1_master_qreq_vector;
  wire             onchip_rom_s1_non_bursting_master_requests;
  wire    [ 31: 0] onchip_rom_s1_readdata_from_sa;
  reg              onchip_rom_s1_reg_firsttransfer;
  reg     [  1: 0] onchip_rom_s1_saved_chosen_master_vector;
  reg              onchip_rom_s1_slavearbiterlockenable;
  wire             onchip_rom_s1_slavearbiterlockenable2;
  wire             onchip_rom_s1_unreg_firsttransfer;
  wire             onchip_rom_s1_waits_for_read;
  wire             onchip_rom_s1_waits_for_write;
  wire             onchip_rom_s1_write;
  wire    [ 31: 0] onchip_rom_s1_writedata;
  wire             p1_cpu_data_master_read_data_valid_onchip_rom_s1_shift_register;
  wire             p1_cpu_instruction_master_read_data_valid_onchip_rom_s1_shift_register;
  wire             registered_cpu_data_master_read_data_valid_onchip_rom_s1;
  wire    [ 14: 0] shifted_address_to_onchip_rom_s1_from_cpu_data_master;
  wire    [ 14: 0] shifted_address_to_onchip_rom_s1_from_cpu_instruction_master;
  wire             wait_for_onchip_rom_s1_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else if (1)
          d1_reasons_to_wait <= ~onchip_rom_s1_end_xfer;
    end


  assign onchip_rom_s1_begins_xfer = ~d1_reasons_to_wait & ((cpu_data_master_qualified_request_onchip_rom_s1 | cpu_instruction_master_qualified_request_onchip_rom_s1));
  //assign onchip_rom_s1_readdata_from_sa = onchip_rom_s1_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign onchip_rom_s1_readdata_from_sa = onchip_rom_s1_readdata;

  assign cpu_data_master_requests_onchip_rom_s1 = ({cpu_data_master_address_to_slave[14 : 12] , 12'b0} == 15'h2000) & (cpu_data_master_read | cpu_data_master_write);
  //registered rdv signal_name registered_cpu_data_master_read_data_valid_onchip_rom_s1 assignment, which is an e_assign
  assign registered_cpu_data_master_read_data_valid_onchip_rom_s1 = cpu_data_master_read_data_valid_onchip_rom_s1_shift_register_in;

  //onchip_rom_s1_arb_share_counter set values, which is an e_mux
  assign onchip_rom_s1_arb_share_set_values = 1;

  //onchip_rom_s1_non_bursting_master_requests mux, which is an e_mux
  assign onchip_rom_s1_non_bursting_master_requests = cpu_data_master_requests_onchip_rom_s1 |
    cpu_instruction_master_requests_onchip_rom_s1 |
    cpu_data_master_requests_onchip_rom_s1 |
    cpu_instruction_master_requests_onchip_rom_s1;

  //onchip_rom_s1_any_bursting_master_saved_grant mux, which is an e_mux
  assign onchip_rom_s1_any_bursting_master_saved_grant = 0;

  //onchip_rom_s1_arb_share_counter_next_value assignment, which is an e_assign
  assign onchip_rom_s1_arb_share_counter_next_value = onchip_rom_s1_firsttransfer ? (onchip_rom_s1_arb_share_set_values - 1) : |onchip_rom_s1_arb_share_counter ? (onchip_rom_s1_arb_share_counter - 1) : 0;

  //onchip_rom_s1_allgrants all slave grants, which is an e_mux
  assign onchip_rom_s1_allgrants = |onchip_rom_s1_grant_vector |
    |onchip_rom_s1_grant_vector |
    |onchip_rom_s1_grant_vector |
    |onchip_rom_s1_grant_vector;

  //onchip_rom_s1_end_xfer assignment, which is an e_assign
  assign onchip_rom_s1_end_xfer = ~(onchip_rom_s1_waits_for_read | onchip_rom_s1_waits_for_write);

  //end_xfer_arb_share_counter_term_onchip_rom_s1 arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_onchip_rom_s1 = onchip_rom_s1_end_xfer & (~onchip_rom_s1_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //onchip_rom_s1_arb_share_counter arbitration counter enable, which is an e_assign
  assign onchip_rom_s1_arb_counter_enable = (end_xfer_arb_share_counter_term_onchip_rom_s1 & onchip_rom_s1_allgrants) | (end_xfer_arb_share_counter_term_onchip_rom_s1 & ~onchip_rom_s1_non_bursting_master_requests);

  //onchip_rom_s1_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          onchip_rom_s1_arb_share_counter <= 0;
      else if (onchip_rom_s1_arb_counter_enable)
          onchip_rom_s1_arb_share_counter <= onchip_rom_s1_arb_share_counter_next_value;
    end


  //onchip_rom_s1_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          onchip_rom_s1_slavearbiterlockenable <= 0;
      else if ((|onchip_rom_s1_master_qreq_vector & end_xfer_arb_share_counter_term_onchip_rom_s1) | (end_xfer_arb_share_counter_term_onchip_rom_s1 & ~onchip_rom_s1_non_bursting_master_requests))
          onchip_rom_s1_slavearbiterlockenable <= |onchip_rom_s1_arb_share_counter_next_value;
    end


  //cpu/data_master onchip_rom/s1 arbiterlock, which is an e_assign
  assign cpu_data_master_arbiterlock = onchip_rom_s1_slavearbiterlockenable & cpu_data_master_continuerequest;

  //onchip_rom_s1_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign onchip_rom_s1_slavearbiterlockenable2 = |onchip_rom_s1_arb_share_counter_next_value;

  //cpu/data_master onchip_rom/s1 arbiterlock2, which is an e_assign
  assign cpu_data_master_arbiterlock2 = onchip_rom_s1_slavearbiterlockenable2 & cpu_data_master_continuerequest;

  //cpu/instruction_master onchip_rom/s1 arbiterlock, which is an e_assign
  assign cpu_instruction_master_arbiterlock = onchip_rom_s1_slavearbiterlockenable & cpu_instruction_master_continuerequest;

  //cpu/instruction_master onchip_rom/s1 arbiterlock2, which is an e_assign
  assign cpu_instruction_master_arbiterlock2 = onchip_rom_s1_slavearbiterlockenable2 & cpu_instruction_master_continuerequest;

  //cpu/instruction_master granted onchip_rom/s1 last time, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          last_cycle_cpu_instruction_master_granted_slave_onchip_rom_s1 <= 0;
      else if (1)
          last_cycle_cpu_instruction_master_granted_slave_onchip_rom_s1 <= cpu_instruction_master_saved_grant_onchip_rom_s1 ? 1 : (onchip_rom_s1_arbitration_holdoff_internal | ~cpu_instruction_master_requests_onchip_rom_s1) ? 0 : last_cycle_cpu_instruction_master_granted_slave_onchip_rom_s1;
    end


  //cpu_instruction_master_continuerequest continued request, which is an e_mux
  assign cpu_instruction_master_continuerequest = last_cycle_cpu_instruction_master_granted_slave_onchip_rom_s1 & cpu_instruction_master_requests_onchip_rom_s1;

  //onchip_rom_s1_any_continuerequest at least one master continues requesting, which is an e_mux
  assign onchip_rom_s1_any_continuerequest = cpu_instruction_master_continuerequest |
    cpu_data_master_continuerequest;

  assign cpu_data_master_qualified_request_onchip_rom_s1 = cpu_data_master_requests_onchip_rom_s1 & ~((cpu_data_master_read & ((|cpu_data_master_read_data_valid_onchip_rom_s1_shift_register))) | ((~cpu_data_master_waitrequest) & cpu_data_master_write) | cpu_instruction_master_arbiterlock);
  //cpu_data_master_read_data_valid_onchip_rom_s1_shift_register_in mux for readlatency shift register, which is an e_mux
  assign cpu_data_master_read_data_valid_onchip_rom_s1_shift_register_in = cpu_data_master_granted_onchip_rom_s1 & cpu_data_master_read & ~onchip_rom_s1_waits_for_read & ~(|cpu_data_master_read_data_valid_onchip_rom_s1_shift_register);

  //shift register p1 cpu_data_master_read_data_valid_onchip_rom_s1_shift_register in if flush, otherwise shift left, which is an e_mux
  assign p1_cpu_data_master_read_data_valid_onchip_rom_s1_shift_register = {cpu_data_master_read_data_valid_onchip_rom_s1_shift_register, cpu_data_master_read_data_valid_onchip_rom_s1_shift_register_in};

  //cpu_data_master_read_data_valid_onchip_rom_s1_shift_register for remembering which master asked for a fixed latency read, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_data_master_read_data_valid_onchip_rom_s1_shift_register <= 0;
      else if (1)
          cpu_data_master_read_data_valid_onchip_rom_s1_shift_register <= p1_cpu_data_master_read_data_valid_onchip_rom_s1_shift_register;
    end


  //local readdatavalid cpu_data_master_read_data_valid_onchip_rom_s1, which is an e_mux
  assign cpu_data_master_read_data_valid_onchip_rom_s1 = cpu_data_master_read_data_valid_onchip_rom_s1_shift_register;

  //onchip_rom_s1_writedata mux, which is an e_mux
  assign onchip_rom_s1_writedata = cpu_data_master_writedata;

  //mux onchip_rom_s1_clken, which is an e_mux
  assign onchip_rom_s1_clken = 1'b1;

  assign cpu_instruction_master_requests_onchip_rom_s1 = (({cpu_instruction_master_address_to_slave[14 : 12] , 12'b0} == 15'h2000) & (cpu_instruction_master_read)) & cpu_instruction_master_read;
  //cpu/data_master granted onchip_rom/s1 last time, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          last_cycle_cpu_data_master_granted_slave_onchip_rom_s1 <= 0;
      else if (1)
          last_cycle_cpu_data_master_granted_slave_onchip_rom_s1 <= cpu_data_master_saved_grant_onchip_rom_s1 ? 1 : (onchip_rom_s1_arbitration_holdoff_internal | ~cpu_data_master_requests_onchip_rom_s1) ? 0 : last_cycle_cpu_data_master_granted_slave_onchip_rom_s1;
    end


  //cpu_data_master_continuerequest continued request, which is an e_mux
  assign cpu_data_master_continuerequest = last_cycle_cpu_data_master_granted_slave_onchip_rom_s1 & cpu_data_master_requests_onchip_rom_s1;

  assign cpu_instruction_master_qualified_request_onchip_rom_s1 = cpu_instruction_master_requests_onchip_rom_s1 & ~((cpu_instruction_master_read & ((1 < cpu_instruction_master_latency_counter))) | cpu_data_master_arbiterlock);
  //cpu_instruction_master_read_data_valid_onchip_rom_s1_shift_register_in mux for readlatency shift register, which is an e_mux
  assign cpu_instruction_master_read_data_valid_onchip_rom_s1_shift_register_in = cpu_instruction_master_granted_onchip_rom_s1 & cpu_instruction_master_read & ~onchip_rom_s1_waits_for_read;

  //shift register p1 cpu_instruction_master_read_data_valid_onchip_rom_s1_shift_register in if flush, otherwise shift left, which is an e_mux
  assign p1_cpu_instruction_master_read_data_valid_onchip_rom_s1_shift_register = {cpu_instruction_master_read_data_valid_onchip_rom_s1_shift_register, cpu_instruction_master_read_data_valid_onchip_rom_s1_shift_register_in};

  //cpu_instruction_master_read_data_valid_onchip_rom_s1_shift_register for remembering which master asked for a fixed latency read, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_instruction_master_read_data_valid_onchip_rom_s1_shift_register <= 0;
      else if (1)
          cpu_instruction_master_read_data_valid_onchip_rom_s1_shift_register <= p1_cpu_instruction_master_read_data_valid_onchip_rom_s1_shift_register;
    end


  //local readdatavalid cpu_instruction_master_read_data_valid_onchip_rom_s1, which is an e_mux
  assign cpu_instruction_master_read_data_valid_onchip_rom_s1 = cpu_instruction_master_read_data_valid_onchip_rom_s1_shift_register;

  //allow new arb cycle for onchip_rom/s1, which is an e_assign
  assign onchip_rom_s1_allow_new_arb_cycle = ~cpu_data_master_arbiterlock & ~cpu_instruction_master_arbiterlock;

  //cpu/instruction_master assignment into master qualified-requests vector for onchip_rom/s1, which is an e_assign
  assign onchip_rom_s1_master_qreq_vector[0] = cpu_instruction_master_qualified_request_onchip_rom_s1;

  //cpu/instruction_master grant onchip_rom/s1, which is an e_assign
  assign cpu_instruction_master_granted_onchip_rom_s1 = onchip_rom_s1_grant_vector[0];

  //cpu/instruction_master saved-grant onchip_rom/s1, which is an e_assign
  assign cpu_instruction_master_saved_grant_onchip_rom_s1 = onchip_rom_s1_arb_winner[0] && cpu_instruction_master_requests_onchip_rom_s1;

  //cpu/data_master assignment into master qualified-requests vector for onchip_rom/s1, which is an e_assign
  assign onchip_rom_s1_master_qreq_vector[1] = cpu_data_master_qualified_request_onchip_rom_s1;

  //cpu/data_master grant onchip_rom/s1, which is an e_assign
  assign cpu_data_master_granted_onchip_rom_s1 = onchip_rom_s1_grant_vector[1];

  //cpu/data_master saved-grant onchip_rom/s1, which is an e_assign
  assign cpu_data_master_saved_grant_onchip_rom_s1 = onchip_rom_s1_arb_winner[1] && cpu_data_master_requests_onchip_rom_s1;

  //onchip_rom/s1 chosen-master double-vector, which is an e_assign
  assign onchip_rom_s1_chosen_master_double_vector = {onchip_rom_s1_master_qreq_vector, onchip_rom_s1_master_qreq_vector} & ({~onchip_rom_s1_master_qreq_vector, ~onchip_rom_s1_master_qreq_vector} + onchip_rom_s1_arb_addend);

  //stable onehot encoding of arb winner
  assign onchip_rom_s1_arb_winner = (onchip_rom_s1_allow_new_arb_cycle & | onchip_rom_s1_grant_vector) ? onchip_rom_s1_grant_vector : onchip_rom_s1_saved_chosen_master_vector;

  //saved onchip_rom_s1_grant_vector, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          onchip_rom_s1_saved_chosen_master_vector <= 0;
      else if (onchip_rom_s1_allow_new_arb_cycle)
          onchip_rom_s1_saved_chosen_master_vector <= |onchip_rom_s1_grant_vector ? onchip_rom_s1_grant_vector : onchip_rom_s1_saved_chosen_master_vector;
    end


  //onehot encoding of chosen master
  assign onchip_rom_s1_grant_vector = {(onchip_rom_s1_chosen_master_double_vector[1] | onchip_rom_s1_chosen_master_double_vector[3]),
    (onchip_rom_s1_chosen_master_double_vector[0] | onchip_rom_s1_chosen_master_double_vector[2])};

  //onchip_rom/s1 chosen master rotated left, which is an e_assign
  assign onchip_rom_s1_chosen_master_rot_left = (onchip_rom_s1_arb_winner << 1) ? (onchip_rom_s1_arb_winner << 1) : 1;

  //onchip_rom/s1's addend for next-master-grant
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          onchip_rom_s1_arb_addend <= 1;
      else if (|onchip_rom_s1_grant_vector)
          onchip_rom_s1_arb_addend <= onchip_rom_s1_end_xfer? onchip_rom_s1_chosen_master_rot_left : onchip_rom_s1_grant_vector;
    end


  assign onchip_rom_s1_chipselect = cpu_data_master_granted_onchip_rom_s1 | cpu_instruction_master_granted_onchip_rom_s1;
  //onchip_rom_s1_firsttransfer first transaction, which is an e_assign
  assign onchip_rom_s1_firsttransfer = onchip_rom_s1_begins_xfer ? onchip_rom_s1_unreg_firsttransfer : onchip_rom_s1_reg_firsttransfer;

  //onchip_rom_s1_unreg_firsttransfer first transaction, which is an e_assign
  assign onchip_rom_s1_unreg_firsttransfer = ~(onchip_rom_s1_slavearbiterlockenable & onchip_rom_s1_any_continuerequest);

  //onchip_rom_s1_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          onchip_rom_s1_reg_firsttransfer <= 1'b1;
      else if (onchip_rom_s1_begins_xfer)
          onchip_rom_s1_reg_firsttransfer <= onchip_rom_s1_unreg_firsttransfer;
    end


  //onchip_rom_s1_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign onchip_rom_s1_beginbursttransfer_internal = onchip_rom_s1_begins_xfer;

  //onchip_rom_s1_arbitration_holdoff_internal arbitration_holdoff, which is an e_assign
  assign onchip_rom_s1_arbitration_holdoff_internal = onchip_rom_s1_begins_xfer & onchip_rom_s1_firsttransfer;

  //onchip_rom_s1_write assignment, which is an e_mux
  assign onchip_rom_s1_write = cpu_data_master_granted_onchip_rom_s1 & cpu_data_master_write;

  assign shifted_address_to_onchip_rom_s1_from_cpu_data_master = cpu_data_master_address_to_slave;
  //onchip_rom_s1_address mux, which is an e_mux
  assign onchip_rom_s1_address = (cpu_data_master_granted_onchip_rom_s1)? (shifted_address_to_onchip_rom_s1_from_cpu_data_master >> 2) :
    (shifted_address_to_onchip_rom_s1_from_cpu_instruction_master >> 2);

  assign shifted_address_to_onchip_rom_s1_from_cpu_instruction_master = cpu_instruction_master_address_to_slave;
  //d1_onchip_rom_s1_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_onchip_rom_s1_end_xfer <= 1;
      else if (1)
          d1_onchip_rom_s1_end_xfer <= onchip_rom_s1_end_xfer;
    end


  //onchip_rom_s1_waits_for_read in a cycle, which is an e_mux
  assign onchip_rom_s1_waits_for_read = onchip_rom_s1_in_a_read_cycle & 0;

  //onchip_rom_s1_in_a_read_cycle assignment, which is an e_assign
  assign onchip_rom_s1_in_a_read_cycle = (cpu_data_master_granted_onchip_rom_s1 & cpu_data_master_read) | (cpu_instruction_master_granted_onchip_rom_s1 & cpu_instruction_master_read);

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = onchip_rom_s1_in_a_read_cycle;

  //onchip_rom_s1_waits_for_write in a cycle, which is an e_mux
  assign onchip_rom_s1_waits_for_write = onchip_rom_s1_in_a_write_cycle & 0;

  //onchip_rom_s1_in_a_write_cycle assignment, which is an e_assign
  assign onchip_rom_s1_in_a_write_cycle = cpu_data_master_granted_onchip_rom_s1 & cpu_data_master_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = onchip_rom_s1_in_a_write_cycle;

  assign wait_for_onchip_rom_s1_counter = 0;
  //onchip_rom_s1_byteenable byte enable port mux, which is an e_mux
  assign onchip_rom_s1_byteenable = (cpu_data_master_granted_onchip_rom_s1)? cpu_data_master_byteenable :
    -1;

  //debugaccess mux, which is an e_mux
  assign onchip_rom_s1_debugaccess = (cpu_data_master_granted_onchip_rom_s1)? cpu_data_master_debugaccess :
    0;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //onchip_rom/s1 enable non-zero assertions, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          enable_nonzero_assertions <= 0;
      else if (1)
          enable_nonzero_assertions <= 1'b1;
    end


  //grant signals are active simultaneously, which is an e_process
  always @(posedge clk)
    begin
      if (cpu_data_master_granted_onchip_rom_s1 + cpu_instruction_master_granted_onchip_rom_s1 > 1)
        begin
          $write("%0d ns: > 1 of grant signals are active simultaneously", $time);
          $stop;
        end
    end


  //saved_grant signals are active simultaneously, which is an e_process
  always @(posedge clk)
    begin
      if (cpu_data_master_saved_grant_onchip_rom_s1 + cpu_instruction_master_saved_grant_onchip_rom_s1 > 1)
        begin
          $write("%0d ns: > 1 of saved_grant signals are active simultaneously", $time);
          $stop;
        end
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module mcu_reset_clk_domain_synch_module (
                                           // inputs:
                                            clk,
                                            data_in,
                                            reset_n,

                                           // outputs:
                                            data_out
                                         )
;

  output           data_out;
  input            clk;
  input            data_in;
  input            reset_n;

  reg              data_in_d1 /* synthesis ALTERA_ATTRIBUTE = "{-from \"*\"} CUT=ON ; PRESERVE_REGISTER=ON ; SUPPRESS_DA_RULE_INTERNAL=R101"  */;
  reg              data_out /* synthesis ALTERA_ATTRIBUTE = "PRESERVE_REGISTER=ON ; SUPPRESS_DA_RULE_INTERNAL=R101"  */;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          data_in_d1 <= 0;
      else if (1)
          data_in_d1 <= data_in;
    end


  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          data_out <= 0;
      else if (1)
          data_out <= data_in_d1;
    end



endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module mcu (
             // 1) global signals:
              clk,
              reset_n,

             // the_led_pio
              out_port_from_the_led_pio
           )
;

  output  [  7: 0] out_port_from_the_led_pio;
  input            clk;
  input            reset_n;

  wire             clk_reset_n;
  wire    [ 14: 0] cpu_data_master_address;
  wire    [ 14: 0] cpu_data_master_address_to_slave;
  wire    [  3: 0] cpu_data_master_byteenable;
  wire             cpu_data_master_debugaccess;
  wire             cpu_data_master_granted_cpu_jtag_debug_module;
  wire             cpu_data_master_granted_led_pio_s1;
  wire             cpu_data_master_granted_onchip_ram_s1;
  wire             cpu_data_master_granted_onchip_rom_s1;
  wire    [ 31: 0] cpu_data_master_irq;
  wire             cpu_data_master_qualified_request_cpu_jtag_debug_module;
  wire             cpu_data_master_qualified_request_led_pio_s1;
  wire             cpu_data_master_qualified_request_onchip_ram_s1;
  wire             cpu_data_master_qualified_request_onchip_rom_s1;
  wire             cpu_data_master_read;
  wire             cpu_data_master_read_data_valid_cpu_jtag_debug_module;
  wire             cpu_data_master_read_data_valid_led_pio_s1;
  wire             cpu_data_master_read_data_valid_onchip_ram_s1;
  wire             cpu_data_master_read_data_valid_onchip_rom_s1;
  wire    [ 31: 0] cpu_data_master_readdata;
  wire             cpu_data_master_requests_cpu_jtag_debug_module;
  wire             cpu_data_master_requests_led_pio_s1;
  wire             cpu_data_master_requests_onchip_ram_s1;
  wire             cpu_data_master_requests_onchip_rom_s1;
  wire             cpu_data_master_waitrequest;
  wire             cpu_data_master_write;
  wire    [ 31: 0] cpu_data_master_writedata;
  wire    [ 14: 0] cpu_instruction_master_address;
  wire    [ 14: 0] cpu_instruction_master_address_to_slave;
  wire             cpu_instruction_master_granted_cpu_jtag_debug_module;
  wire             cpu_instruction_master_granted_onchip_ram_s1;
  wire             cpu_instruction_master_granted_onchip_rom_s1;
  wire             cpu_instruction_master_latency_counter;
  wire             cpu_instruction_master_qualified_request_cpu_jtag_debug_module;
  wire             cpu_instruction_master_qualified_request_onchip_ram_s1;
  wire             cpu_instruction_master_qualified_request_onchip_rom_s1;
  wire             cpu_instruction_master_read;
  wire             cpu_instruction_master_read_data_valid_cpu_jtag_debug_module;
  wire             cpu_instruction_master_read_data_valid_onchip_ram_s1;
  wire             cpu_instruction_master_read_data_valid_onchip_rom_s1;
  wire    [ 31: 0] cpu_instruction_master_readdata;
  wire             cpu_instruction_master_readdatavalid;
  wire             cpu_instruction_master_requests_cpu_jtag_debug_module;
  wire             cpu_instruction_master_requests_onchip_ram_s1;
  wire             cpu_instruction_master_requests_onchip_rom_s1;
  wire             cpu_instruction_master_waitrequest;
  wire    [  8: 0] cpu_jtag_debug_module_address;
  wire             cpu_jtag_debug_module_begintransfer;
  wire    [  3: 0] cpu_jtag_debug_module_byteenable;
  wire             cpu_jtag_debug_module_chipselect;
  wire             cpu_jtag_debug_module_debugaccess;
  wire    [ 31: 0] cpu_jtag_debug_module_readdata;
  wire    [ 31: 0] cpu_jtag_debug_module_readdata_from_sa;
  wire             cpu_jtag_debug_module_reset;
  wire             cpu_jtag_debug_module_reset_n;
  wire             cpu_jtag_debug_module_resetrequest;
  wire             cpu_jtag_debug_module_resetrequest_from_sa;
  wire             cpu_jtag_debug_module_write;
  wire    [ 31: 0] cpu_jtag_debug_module_writedata;
  wire             d1_cpu_jtag_debug_module_end_xfer;
  wire             d1_led_pio_s1_end_xfer;
  wire             d1_onchip_ram_s1_end_xfer;
  wire             d1_onchip_rom_s1_end_xfer;
  wire    [  1: 0] led_pio_s1_address;
  wire             led_pio_s1_chipselect;
  wire             led_pio_s1_reset_n;
  wire             led_pio_s1_write_n;
  wire    [  7: 0] led_pio_s1_writedata;
  wire    [  9: 0] onchip_ram_s1_address;
  wire    [  3: 0] onchip_ram_s1_byteenable;
  wire             onchip_ram_s1_chipselect;
  wire             onchip_ram_s1_clken;
  wire    [ 31: 0] onchip_ram_s1_readdata;
  wire    [ 31: 0] onchip_ram_s1_readdata_from_sa;
  wire             onchip_ram_s1_write;
  wire    [ 31: 0] onchip_ram_s1_writedata;
  wire    [  9: 0] onchip_rom_s1_address;
  wire    [  3: 0] onchip_rom_s1_byteenable;
  wire             onchip_rom_s1_chipselect;
  wire             onchip_rom_s1_clken;
  wire             onchip_rom_s1_debugaccess;
  wire    [ 31: 0] onchip_rom_s1_readdata;
  wire    [ 31: 0] onchip_rom_s1_readdata_from_sa;
  wire             onchip_rom_s1_write;
  wire    [ 31: 0] onchip_rom_s1_writedata;
  wire    [  7: 0] out_port_from_the_led_pio;
  wire             registered_cpu_data_master_read_data_valid_onchip_ram_s1;
  wire             registered_cpu_data_master_read_data_valid_onchip_rom_s1;
  wire             reset_n_sources;
  cpu_jtag_debug_module_arbitrator the_cpu_jtag_debug_module
    (
      .clk                                                            (clk),
      .cpu_data_master_address_to_slave                               (cpu_data_master_address_to_slave),
      .cpu_data_master_byteenable                                     (cpu_data_master_byteenable),
      .cpu_data_master_debugaccess                                    (cpu_data_master_debugaccess),
      .cpu_data_master_granted_cpu_jtag_debug_module                  (cpu_data_master_granted_cpu_jtag_debug_module),
      .cpu_data_master_qualified_request_cpu_jtag_debug_module        (cpu_data_master_qualified_request_cpu_jtag_debug_module),
      .cpu_data_master_read                                           (cpu_data_master_read),
      .cpu_data_master_read_data_valid_cpu_jtag_debug_module          (cpu_data_master_read_data_valid_cpu_jtag_debug_module),
      .cpu_data_master_requests_cpu_jtag_debug_module                 (cpu_data_master_requests_cpu_jtag_debug_module),
      .cpu_data_master_waitrequest                                    (cpu_data_master_waitrequest),
      .cpu_data_master_write                                          (cpu_data_master_write),
      .cpu_data_master_writedata                                      (cpu_data_master_writedata),
      .cpu_instruction_master_address_to_slave                        (cpu_instruction_master_address_to_slave),
      .cpu_instruction_master_granted_cpu_jtag_debug_module           (cpu_instruction_master_granted_cpu_jtag_debug_module),
      .cpu_instruction_master_latency_counter                         (cpu_instruction_master_latency_counter),
      .cpu_instruction_master_qualified_request_cpu_jtag_debug_module (cpu_instruction_master_qualified_request_cpu_jtag_debug_module),
      .cpu_instruction_master_read                                    (cpu_instruction_master_read),
      .cpu_instruction_master_read_data_valid_cpu_jtag_debug_module   (cpu_instruction_master_read_data_valid_cpu_jtag_debug_module),
      .cpu_instruction_master_requests_cpu_jtag_debug_module          (cpu_instruction_master_requests_cpu_jtag_debug_module),
      .cpu_jtag_debug_module_address                                  (cpu_jtag_debug_module_address),
      .cpu_jtag_debug_module_begintransfer                            (cpu_jtag_debug_module_begintransfer),
      .cpu_jtag_debug_module_byteenable                               (cpu_jtag_debug_module_byteenable),
      .cpu_jtag_debug_module_chipselect                               (cpu_jtag_debug_module_chipselect),
      .cpu_jtag_debug_module_debugaccess                              (cpu_jtag_debug_module_debugaccess),
      .cpu_jtag_debug_module_readdata                                 (cpu_jtag_debug_module_readdata),
      .cpu_jtag_debug_module_readdata_from_sa                         (cpu_jtag_debug_module_readdata_from_sa),
      .cpu_jtag_debug_module_reset                                    (cpu_jtag_debug_module_reset),
      .cpu_jtag_debug_module_reset_n                                  (cpu_jtag_debug_module_reset_n),
      .cpu_jtag_debug_module_resetrequest                             (cpu_jtag_debug_module_resetrequest),
      .cpu_jtag_debug_module_resetrequest_from_sa                     (cpu_jtag_debug_module_resetrequest_from_sa),
      .cpu_jtag_debug_module_write                                    (cpu_jtag_debug_module_write),
      .cpu_jtag_debug_module_writedata                                (cpu_jtag_debug_module_writedata),
      .d1_cpu_jtag_debug_module_end_xfer                              (d1_cpu_jtag_debug_module_end_xfer),
      .reset_n                                                        (clk_reset_n)
    );

  cpu_data_master_arbitrator the_cpu_data_master
    (
      .clk                                                      (clk),
      .cpu_data_master_address                                  (cpu_data_master_address),
      .cpu_data_master_address_to_slave                         (cpu_data_master_address_to_slave),
      .cpu_data_master_granted_cpu_jtag_debug_module            (cpu_data_master_granted_cpu_jtag_debug_module),
      .cpu_data_master_granted_led_pio_s1                       (cpu_data_master_granted_led_pio_s1),
      .cpu_data_master_granted_onchip_ram_s1                    (cpu_data_master_granted_onchip_ram_s1),
      .cpu_data_master_granted_onchip_rom_s1                    (cpu_data_master_granted_onchip_rom_s1),
      .cpu_data_master_qualified_request_cpu_jtag_debug_module  (cpu_data_master_qualified_request_cpu_jtag_debug_module),
      .cpu_data_master_qualified_request_led_pio_s1             (cpu_data_master_qualified_request_led_pio_s1),
      .cpu_data_master_qualified_request_onchip_ram_s1          (cpu_data_master_qualified_request_onchip_ram_s1),
      .cpu_data_master_qualified_request_onchip_rom_s1          (cpu_data_master_qualified_request_onchip_rom_s1),
      .cpu_data_master_read                                     (cpu_data_master_read),
      .cpu_data_master_read_data_valid_cpu_jtag_debug_module    (cpu_data_master_read_data_valid_cpu_jtag_debug_module),
      .cpu_data_master_read_data_valid_led_pio_s1               (cpu_data_master_read_data_valid_led_pio_s1),
      .cpu_data_master_read_data_valid_onchip_ram_s1            (cpu_data_master_read_data_valid_onchip_ram_s1),
      .cpu_data_master_read_data_valid_onchip_rom_s1            (cpu_data_master_read_data_valid_onchip_rom_s1),
      .cpu_data_master_readdata                                 (cpu_data_master_readdata),
      .cpu_data_master_requests_cpu_jtag_debug_module           (cpu_data_master_requests_cpu_jtag_debug_module),
      .cpu_data_master_requests_led_pio_s1                      (cpu_data_master_requests_led_pio_s1),
      .cpu_data_master_requests_onchip_ram_s1                   (cpu_data_master_requests_onchip_ram_s1),
      .cpu_data_master_requests_onchip_rom_s1                   (cpu_data_master_requests_onchip_rom_s1),
      .cpu_data_master_waitrequest                              (cpu_data_master_waitrequest),
      .cpu_data_master_write                                    (cpu_data_master_write),
      .cpu_jtag_debug_module_readdata_from_sa                   (cpu_jtag_debug_module_readdata_from_sa),
      .d1_cpu_jtag_debug_module_end_xfer                        (d1_cpu_jtag_debug_module_end_xfer),
      .d1_led_pio_s1_end_xfer                                   (d1_led_pio_s1_end_xfer),
      .d1_onchip_ram_s1_end_xfer                                (d1_onchip_ram_s1_end_xfer),
      .d1_onchip_rom_s1_end_xfer                                (d1_onchip_rom_s1_end_xfer),
      .onchip_ram_s1_readdata_from_sa                           (onchip_ram_s1_readdata_from_sa),
      .onchip_rom_s1_readdata_from_sa                           (onchip_rom_s1_readdata_from_sa),
      .registered_cpu_data_master_read_data_valid_onchip_ram_s1 (registered_cpu_data_master_read_data_valid_onchip_ram_s1),
      .registered_cpu_data_master_read_data_valid_onchip_rom_s1 (registered_cpu_data_master_read_data_valid_onchip_rom_s1),
      .reset_n                                                  (clk_reset_n)
    );

  cpu_instruction_master_arbitrator the_cpu_instruction_master
    (
      .clk                                                            (clk),
      .cpu_instruction_master_address                                 (cpu_instruction_master_address),
      .cpu_instruction_master_address_to_slave                        (cpu_instruction_master_address_to_slave),
      .cpu_instruction_master_granted_cpu_jtag_debug_module           (cpu_instruction_master_granted_cpu_jtag_debug_module),
      .cpu_instruction_master_granted_onchip_ram_s1                   (cpu_instruction_master_granted_onchip_ram_s1),
      .cpu_instruction_master_granted_onchip_rom_s1                   (cpu_instruction_master_granted_onchip_rom_s1),
      .cpu_instruction_master_latency_counter                         (cpu_instruction_master_latency_counter),
      .cpu_instruction_master_qualified_request_cpu_jtag_debug_module (cpu_instruction_master_qualified_request_cpu_jtag_debug_module),
      .cpu_instruction_master_qualified_request_onchip_ram_s1         (cpu_instruction_master_qualified_request_onchip_ram_s1),
      .cpu_instruction_master_qualified_request_onchip_rom_s1         (cpu_instruction_master_qualified_request_onchip_rom_s1),
      .cpu_instruction_master_read                                    (cpu_instruction_master_read),
      .cpu_instruction_master_read_data_valid_cpu_jtag_debug_module   (cpu_instruction_master_read_data_valid_cpu_jtag_debug_module),
      .cpu_instruction_master_read_data_valid_onchip_ram_s1           (cpu_instruction_master_read_data_valid_onchip_ram_s1),
      .cpu_instruction_master_read_data_valid_onchip_rom_s1           (cpu_instruction_master_read_data_valid_onchip_rom_s1),
      .cpu_instruction_master_readdata                                (cpu_instruction_master_readdata),
      .cpu_instruction_master_readdatavalid                           (cpu_instruction_master_readdatavalid),
      .cpu_instruction_master_requests_cpu_jtag_debug_module          (cpu_instruction_master_requests_cpu_jtag_debug_module),
      .cpu_instruction_master_requests_onchip_ram_s1                  (cpu_instruction_master_requests_onchip_ram_s1),
      .cpu_instruction_master_requests_onchip_rom_s1                  (cpu_instruction_master_requests_onchip_rom_s1),
      .cpu_instruction_master_waitrequest                             (cpu_instruction_master_waitrequest),
      .cpu_jtag_debug_module_readdata_from_sa                         (cpu_jtag_debug_module_readdata_from_sa),
      .d1_cpu_jtag_debug_module_end_xfer                              (d1_cpu_jtag_debug_module_end_xfer),
      .d1_onchip_ram_s1_end_xfer                                      (d1_onchip_ram_s1_end_xfer),
      .d1_onchip_rom_s1_end_xfer                                      (d1_onchip_rom_s1_end_xfer),
      .onchip_ram_s1_readdata_from_sa                                 (onchip_ram_s1_readdata_from_sa),
      .onchip_rom_s1_readdata_from_sa                                 (onchip_rom_s1_readdata_from_sa),
      .reset_n                                                        (clk_reset_n)
    );

  cpu the_cpu
    (
      .clk                                   (clk),
      .d_address                             (cpu_data_master_address),
      .d_byteenable                          (cpu_data_master_byteenable),
      .d_irq                                 (cpu_data_master_irq),
      .d_read                                (cpu_data_master_read),
      .d_readdata                            (cpu_data_master_readdata),
      .d_waitrequest                         (cpu_data_master_waitrequest),
      .d_write                               (cpu_data_master_write),
      .d_writedata                           (cpu_data_master_writedata),
      .i_address                             (cpu_instruction_master_address),
      .i_read                                (cpu_instruction_master_read),
      .i_readdata                            (cpu_instruction_master_readdata),
      .i_readdatavalid                       (cpu_instruction_master_readdatavalid),
      .i_waitrequest                         (cpu_instruction_master_waitrequest),
      .jtag_debug_module_address             (cpu_jtag_debug_module_address),
      .jtag_debug_module_begintransfer       (cpu_jtag_debug_module_begintransfer),
      .jtag_debug_module_byteenable          (cpu_jtag_debug_module_byteenable),
      .jtag_debug_module_clk                 (clk),
      .jtag_debug_module_debugaccess         (cpu_jtag_debug_module_debugaccess),
      .jtag_debug_module_debugaccess_to_roms (cpu_data_master_debugaccess),
      .jtag_debug_module_readdata            (cpu_jtag_debug_module_readdata),
      .jtag_debug_module_reset               (cpu_jtag_debug_module_reset),
      .jtag_debug_module_resetrequest        (cpu_jtag_debug_module_resetrequest),
      .jtag_debug_module_select              (cpu_jtag_debug_module_chipselect),
      .jtag_debug_module_write               (cpu_jtag_debug_module_write),
      .jtag_debug_module_writedata           (cpu_jtag_debug_module_writedata),
      .reset_n                               (cpu_jtag_debug_module_reset_n)
    );

  led_pio_s1_arbitrator the_led_pio_s1
    (
      .clk                                          (clk),
      .cpu_data_master_address_to_slave             (cpu_data_master_address_to_slave),
      .cpu_data_master_byteenable                   (cpu_data_master_byteenable),
      .cpu_data_master_granted_led_pio_s1           (cpu_data_master_granted_led_pio_s1),
      .cpu_data_master_qualified_request_led_pio_s1 (cpu_data_master_qualified_request_led_pio_s1),
      .cpu_data_master_read                         (cpu_data_master_read),
      .cpu_data_master_read_data_valid_led_pio_s1   (cpu_data_master_read_data_valid_led_pio_s1),
      .cpu_data_master_requests_led_pio_s1          (cpu_data_master_requests_led_pio_s1),
      .cpu_data_master_waitrequest                  (cpu_data_master_waitrequest),
      .cpu_data_master_write                        (cpu_data_master_write),
      .cpu_data_master_writedata                    (cpu_data_master_writedata),
      .d1_led_pio_s1_end_xfer                       (d1_led_pio_s1_end_xfer),
      .led_pio_s1_address                           (led_pio_s1_address),
      .led_pio_s1_chipselect                        (led_pio_s1_chipselect),
      .led_pio_s1_reset_n                           (led_pio_s1_reset_n),
      .led_pio_s1_write_n                           (led_pio_s1_write_n),
      .led_pio_s1_writedata                         (led_pio_s1_writedata),
      .reset_n                                      (clk_reset_n)
    );

  led_pio the_led_pio
    (
      .address    (led_pio_s1_address),
      .chipselect (led_pio_s1_chipselect),
      .clk        (clk),
      .out_port   (out_port_from_the_led_pio),
      .reset_n    (led_pio_s1_reset_n),
      .write_n    (led_pio_s1_write_n),
      .writedata  (led_pio_s1_writedata)
    );

  onchip_ram_s1_arbitrator the_onchip_ram_s1
    (
      .clk                                                      (clk),
      .cpu_data_master_address_to_slave                         (cpu_data_master_address_to_slave),
      .cpu_data_master_byteenable                               (cpu_data_master_byteenable),
      .cpu_data_master_granted_onchip_ram_s1                    (cpu_data_master_granted_onchip_ram_s1),
      .cpu_data_master_qualified_request_onchip_ram_s1          (cpu_data_master_qualified_request_onchip_ram_s1),
      .cpu_data_master_read                                     (cpu_data_master_read),
      .cpu_data_master_read_data_valid_onchip_ram_s1            (cpu_data_master_read_data_valid_onchip_ram_s1),
      .cpu_data_master_requests_onchip_ram_s1                   (cpu_data_master_requests_onchip_ram_s1),
      .cpu_data_master_waitrequest                              (cpu_data_master_waitrequest),
      .cpu_data_master_write                                    (cpu_data_master_write),
      .cpu_data_master_writedata                                (cpu_data_master_writedata),
      .cpu_instruction_master_address_to_slave                  (cpu_instruction_master_address_to_slave),
      .cpu_instruction_master_granted_onchip_ram_s1             (cpu_instruction_master_granted_onchip_ram_s1),
      .cpu_instruction_master_latency_counter                   (cpu_instruction_master_latency_counter),
      .cpu_instruction_master_qualified_request_onchip_ram_s1   (cpu_instruction_master_qualified_request_onchip_ram_s1),
      .cpu_instruction_master_read                              (cpu_instruction_master_read),
      .cpu_instruction_master_read_data_valid_onchip_ram_s1     (cpu_instruction_master_read_data_valid_onchip_ram_s1),
      .cpu_instruction_master_requests_onchip_ram_s1            (cpu_instruction_master_requests_onchip_ram_s1),
      .d1_onchip_ram_s1_end_xfer                                (d1_onchip_ram_s1_end_xfer),
      .onchip_ram_s1_address                                    (onchip_ram_s1_address),
      .onchip_ram_s1_byteenable                                 (onchip_ram_s1_byteenable),
      .onchip_ram_s1_chipselect                                 (onchip_ram_s1_chipselect),
      .onchip_ram_s1_clken                                      (onchip_ram_s1_clken),
      .onchip_ram_s1_readdata                                   (onchip_ram_s1_readdata),
      .onchip_ram_s1_readdata_from_sa                           (onchip_ram_s1_readdata_from_sa),
      .onchip_ram_s1_write                                      (onchip_ram_s1_write),
      .onchip_ram_s1_writedata                                  (onchip_ram_s1_writedata),
      .registered_cpu_data_master_read_data_valid_onchip_ram_s1 (registered_cpu_data_master_read_data_valid_onchip_ram_s1),
      .reset_n                                                  (clk_reset_n)
    );

  onchip_ram the_onchip_ram
    (
      .address    (onchip_ram_s1_address),
      .byteenable (onchip_ram_s1_byteenable),
      .chipselect (onchip_ram_s1_chipselect),
      .clk        (clk),
      .clken      (onchip_ram_s1_clken),
      .readdata   (onchip_ram_s1_readdata),
      .write      (onchip_ram_s1_write),
      .writedata  (onchip_ram_s1_writedata)
    );

  onchip_rom_s1_arbitrator the_onchip_rom_s1
    (
      .clk                                                      (clk),
      .cpu_data_master_address_to_slave                         (cpu_data_master_address_to_slave),
      .cpu_data_master_byteenable                               (cpu_data_master_byteenable),
      .cpu_data_master_debugaccess                              (cpu_data_master_debugaccess),
      .cpu_data_master_granted_onchip_rom_s1                    (cpu_data_master_granted_onchip_rom_s1),
      .cpu_data_master_qualified_request_onchip_rom_s1          (cpu_data_master_qualified_request_onchip_rom_s1),
      .cpu_data_master_read                                     (cpu_data_master_read),
      .cpu_data_master_read_data_valid_onchip_rom_s1            (cpu_data_master_read_data_valid_onchip_rom_s1),
      .cpu_data_master_requests_onchip_rom_s1                   (cpu_data_master_requests_onchip_rom_s1),
      .cpu_data_master_waitrequest                              (cpu_data_master_waitrequest),
      .cpu_data_master_write                                    (cpu_data_master_write),
      .cpu_data_master_writedata                                (cpu_data_master_writedata),
      .cpu_instruction_master_address_to_slave                  (cpu_instruction_master_address_to_slave),
      .cpu_instruction_master_granted_onchip_rom_s1             (cpu_instruction_master_granted_onchip_rom_s1),
      .cpu_instruction_master_latency_counter                   (cpu_instruction_master_latency_counter),
      .cpu_instruction_master_qualified_request_onchip_rom_s1   (cpu_instruction_master_qualified_request_onchip_rom_s1),
      .cpu_instruction_master_read                              (cpu_instruction_master_read),
      .cpu_instruction_master_read_data_valid_onchip_rom_s1     (cpu_instruction_master_read_data_valid_onchip_rom_s1),
      .cpu_instruction_master_requests_onchip_rom_s1            (cpu_instruction_master_requests_onchip_rom_s1),
      .d1_onchip_rom_s1_end_xfer                                (d1_onchip_rom_s1_end_xfer),
      .onchip_rom_s1_address                                    (onchip_rom_s1_address),
      .onchip_rom_s1_byteenable                                 (onchip_rom_s1_byteenable),
      .onchip_rom_s1_chipselect                                 (onchip_rom_s1_chipselect),
      .onchip_rom_s1_clken                                      (onchip_rom_s1_clken),
      .onchip_rom_s1_debugaccess                                (onchip_rom_s1_debugaccess),
      .onchip_rom_s1_readdata                                   (onchip_rom_s1_readdata),
      .onchip_rom_s1_readdata_from_sa                           (onchip_rom_s1_readdata_from_sa),
      .onchip_rom_s1_write                                      (onchip_rom_s1_write),
      .onchip_rom_s1_writedata                                  (onchip_rom_s1_writedata),
      .registered_cpu_data_master_read_data_valid_onchip_rom_s1 (registered_cpu_data_master_read_data_valid_onchip_rom_s1),
      .reset_n                                                  (clk_reset_n)
    );

  onchip_rom the_onchip_rom
    (
      .address     (onchip_rom_s1_address),
      .byteenable  (onchip_rom_s1_byteenable),
      .chipselect  (onchip_rom_s1_chipselect),
      .clk         (clk),
      .clken       (onchip_rom_s1_clken),
      .debugaccess (onchip_rom_s1_debugaccess),
      .readdata    (onchip_rom_s1_readdata),
      .write       (onchip_rom_s1_write),
      .writedata   (onchip_rom_s1_writedata)
    );

  //reset is asserted asynchronously and deasserted synchronously
  mcu_reset_clk_domain_synch_module mcu_reset_clk_domain_synch
    (
      .clk      (clk),
      .data_in  (1'b1),
      .data_out (clk_reset_n),
      .reset_n  (reset_n_sources)
    );

  //reset sources mux, which is an e_mux
  assign reset_n_sources = ~(~reset_n |
    0 |
    cpu_jtag_debug_module_resetrequest_from_sa |
    cpu_jtag_debug_module_resetrequest_from_sa);

  //cpu_data_master_irq of type irq does not connect to anything so wire it to default (0)
  assign cpu_data_master_irq = 0;


endmodule


//synthesis translate_off



// <ALTERA_NOTE> CODE INSERTED BETWEEN HERE

// AND HERE WILL BE PRESERVED </ALTERA_NOTE>


// If user logic components use Altsync_Ram with convert_hex2ver.dll,
// set USE_convert_hex2ver in the user comments section above

// `ifdef USE_convert_hex2ver
// `else
// `define NO_PLI 1
// `endif

`include "d:/altera/80/quartus/eda/sim_lib/altera_mf.v"
`include "d:/altera/80/quartus/eda/sim_lib/220model.v"
`include "d:/altera/80/quartus/eda/sim_lib/sgate.v"
`include "cpu_test_bench.v"
`include "cpu_mult_cell.v"
`include "cpu_jtag_debug_module_tck.v"
`include "cpu_jtag_debug_module_sysclk.v"
`include "cpu_jtag_debug_module_wrapper.v"
`include "cpu.v"
`include "led_pio.v"
`include "onchip_ram.v"
`include "onchip_rom.v"

`timescale 1ns / 1ps

module test_bench 
;


  reg              clk;
  wire    [ 31: 0] cpu_data_master_irq;
  wire    [  7: 0] out_port_from_the_led_pio;
  reg              reset_n;


// <ALTERA_NOTE> CODE INSERTED BETWEEN HERE
//  add your signals and additional architecture here
// AND HERE WILL BE PRESERVED </ALTERA_NOTE>

  //Set us up the Dut
  mcu DUT
    (
      .clk                       (clk),
      .out_port_from_the_led_pio (out_port_from_the_led_pio),
      .reset_n                   (reset_n)
    );

  initial
    clk = 1'b0;
  always
    #10 clk <= ~clk;
  
  initial 
    begin
      reset_n <= 0;
      #200 reset_n <= 1;
    end

endmodule


//synthesis translate_on