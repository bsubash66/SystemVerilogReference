//-----------------------------
//Packet generator class
//-----------------------------
typedef eth_packet_c;
class eth_packet_gen_c;

  //Implement a random member for number of packets to be generated
  rand int num_pkts;

  //Use a mail box and put these generated packets into that
  //This mailbox will be later used by the driver
  mailbox mbx_out;

  function new (mailbox mbx);
    mbx_out =  mbx;
  endfunction

  //Method
  task run;
    eth_packet_c pkt;
    for (int i=0; i < num_pkts; i++) begin
      //Create packet , randomize and put to mailbox
      pkt = new();
      assert(pkt.randomize());
      mbx_out.put(pkt);
    end
  endtask

endclass
