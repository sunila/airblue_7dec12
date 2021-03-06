//
// Copyright (C) 2011 Intel Corporation
//
// This program is free software; you can redistribute it and/or
// modify it under the terms of the GNU General Public License
// as published by the Free Software Foundation; either version 2
// of the License, or (at your option) any later version.
//
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.
//
// You should have received a copy of the GNU General Public License
// along with this program; if not, write to the Free Software
// Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.
//

`include "awb/provides/soft_connections_common.bsh"

// Backwards compatability

// This file contains MOST of the code needed for backwards compatability.
// Some code, particularly relating to connection chains, lives in other 
// files because other things need to invoke it.

// This file mostly deals with backwards compatability functions and 
// interfaces seen by the user.


// Legacy typdefs
typedef CONNECTED_MODULE Connected_Module;
typedef CONNECTED_MODULE ConnectedModule;

//The data type that is sent in connections
typedef `CON_CWIDTH PHYSICAL_CONNECTION_SIZE;
typedef Bit#(PHYSICAL_CONNECTION_SIZE) CON_Data;

typedef `CON_CHAIN_CWIDTH CON_CHAIN_DATA_SZ;
typedef Bit#(CON_CHAIN_DATA_SZ) CON_CHAIN_Data;

// Legacy naming conventions

typedef CONNECTION_SEND#(t) Connection_Send#(type t);
typedef CONNECTION_RECV#(t) Connection_Receive#(type t);

module [ConnectedModule] mkConnection_Send#(String name) (Connection_Send#(t_MSG))
    provisos
        (Bits#(t_MSG, t_MSG_SIZE));

   let m <- mkConnectionSend(name);
   return m;

endmodule

module [ConnectedModule] mkConnection_Receive#(String name) (Connection_Receive#(t_MSG))
    provisos
        (Bits#(t_MSG, t_MSG_SIZE));

   let m <- mkConnectionRecv(name);
   return m;

endmodule


interface Connection_Server#(type req_T, type resp_T);

  method Bool   reqNotEmpty(); 
  method req_T  getReq();
  method Action deq();
  method Action makeResp(resp_T data);
  method Bool   respNotFull();
  
endinterface


module [ConnectedModule] mkConnection_Server#(String server_name)
    //interface:
                (Connection_Server#(t_REQ, t_RSP))
    provisos
            (Bits#(t_REQ, t_REQ_SIZE),
	     Bits#(t_RSP, t_RSP_SIZE));

  CONNECTION_SERVER#(t_REQ, t_RSP) s <- mkConnectionServer(server_name);

  method Bool   reqNotEmpty() = s.reqNotEmpty();
  method t_REQ  getReq() = s.getReq();
  method Action deq() = s.deq();
  method Action makeResp(t_RSP data) = s.makeRsp(data);
  method Bool   respNotFull() = s.rspNotFull();

endmodule

interface Connection_Client#(type req_T, type resp_T);

  method Action makeReq(req_T data);
  method Bool   reqNotFull();
  method Bool   respNotEmpty(); 
  method resp_T getResp();
  method Action deq();
  
endinterface

module [ConnectedModule] mkConnection_Client#(String client_name)
    //interface:
                (Connection_Client#(t_REQ, t_RSP))
    provisos
            (Bits#(t_REQ, t_REQ_SIZE),
	     Bits#(t_RSP, t_RSP_SIZE));

  CONNECTION_CLIENT#(t_REQ, t_RSP) c <- mkConnectionClient(client_name);

  method Action makeReq(t_REQ data) = c.makeReq(data);
  method Bool   respNotEmpty() = c.rspNotEmpty();
  method t_RSP  getResp() = c.getRsp();
  method Action deq() = c.deq();
  method Bool   reqNotFull() = c.reqNotFull();

endmodule


interface Connection_Chain#(type msg_T);

  method ActionValue#(msg_T) recvFromPrev();
  method msg_T               peekFromPrev();
  method Bool                recvNotEmpty();

  method Action              sendToNext(msg_T data);
  method Bool                sendNotFull();
  
endinterface


module [ConnectedModule] mkConnection_Chain#(Integer chain_id)
    //interface:
		(Connection_Chain#(msg_T))
    provisos
	    (Bits#(msg_T, msg_SZ));
  CONNECTION_CHAIN#(msg_T) c <- mkConnectionChain("OldSchoolChain" + integerToString(chain_id));

  method recvFromPrev = c.recvFromPrev;
  method peekFromPrev = c.peekFromPrev;
  method recvNotEmpty = c.recvNotEmpty;

  method sendToNext = c.sendToNext;
  method sendNotFull = c.sendNotFull;

endmodule
