////////////////////////////////////////////////////////////////////////////////////////////////////
// Filename: LE_A Logic Gate with CMOS
// Author: SunLee(SeonminLee)
// Created: Feb 4th 2020
// Version: 1 (Date Last Modified: Feb 5th 2020)
// Description: This file contains the transistor-Level Modelling of Logic Gates and Logic Circuits
//
//
////////////////////////////////////////////////////////////////////////////////////////////////////

module not_t(out, in);

// Use PWR and GND to represent the logic-1 and logic-0 sources in your CMOS gate.
   supply1 PWR;
   supply0 GND;

   input  in;
   output out;

// Declare any wires that you need in your model here.
   

// Write your model using CMOS transistors in the space below.
   pmos pmos1(out, PWR, in);
   nmos nmos1(out, GND, in);




endmodule

module nand_t(out, a, b);

// Use PWR and GND to represent the logic-1 and logic-0 sources in your CMOS gate.
   supply1 PWR;
   supply0 GND;

   input  a, b;
   output out;

// Declare any wires that you need in your model here.
   wire drain2;

// Write your model using CMOS transistors in the space below.
   pmos pmos1(out, PWR, a);
   pmos pmos2(out, PWR, b);

   nmos nmos1(out, drain2, a); 
   nmos nmos2(drain2, GND, b);




endmodule

module nor_t(out, a, b);

// Use PWR and GND to represent the logic-1 and logic-0 sources in your CMOS gate.
   supply1 PWR;
   supply0 GND;

   input  a, b;
   output out;

// Declare any wires that you need in your model here.
   wire drain1;


// Write your model using CMOS transistors in the space below.
   pmos pmos1(drain1, PWR, a);
   pmos pmos2(out, drain1, b);

   nmos nmos1(out, GND, a);
   nmos nmos2(out, GND, b);


endmodule

module and_t(out, a, b);

// Use PWR and GND to represent the logic-1 and logic-0 sources in your CMOS gate.
   supply1 PWR;
   supply0 GND;

   input  a, b;
   output out;

// Declare any wires that you need in your model here.
   wire p, q;


// Write your model using CMOS transistors in the space below.

   pmos pmos1(p, PWR, b);
   pmos pmos2(p, PWR, a);
   pmos pmos3(out, PWR, p);

   nmos nmos1(q, GND, a);
   nmos nmos2(p, q, b);
   nmos nmos3(out, GND, p);



endmodule

module or_t(out, a, b);

// Use PWR and GND to represent the logic-1 and logic-0 sources in your CMOS gate.
   supply1 PWR;
   supply0 GND;

   input  a, b;
   output out;

// Declare any wires that you need in your model here.
   wire p, q;



// Write your model using CMOS transistors in the space below.
   pmos pmos1(q, PWR, a);
   pmos pmos2(p, q, b);
   pmos pmos3(out, PWR, p);

   nmos nmos1(p, GND, a);
   nmos nmos2(p, GND, b);
   nmos nmos3(out, GND, p);



endmodule

module xnor_t(out, a, b);

// Use PWR and GND to represent the logic-1 and logic-0 sources in your CMOS gate.
   supply1 PWR;
   supply0 GND;

   input  a, b;
   output out;

// Declare any wires that you need in your model here.

   wire p,q,r,s;
// Write your model using CMOS transistors in the space below.
   pmos pmos1(p, PWR, a);
   pmos pmos2(p, PWR, b);
   pmos pmos3(s, GND, b);
   pmos pmos4(q, s, a);
   pmos pmos5(out, PWR, q);

   nmos nmos1(q, p, a);
   nmos nmos2(q, p, b);
   nmos nmos3(r, GND, b);
   nmos nmos4(q, r, a);
   nmos nmos5(out, GND, q);

endmodule

module sop_t(out, a, b, c);

// Use PWR and GND to represent the logic-1 and logic-0 sources in your CMOS gate.
   supply1 PWR;
   supply0 GND;

   input  a, b, c;
   output out;

// Declare any wires that you need in your model here.
   wire p,q,r,s,t,u,v,x;


// Write your model using CMOS transistors in the space below.
   pmos pmos1(p, PWR, a);
   pmos pmos2(p, PWR, b);
   nmos nmos1(q, GND, b);
   nmos nmos2(p, q, a);
   
   pmos pmos3(r, PWR, p);
   pmos pmos4(r, PWR, c);
   nmos nmos3(s, GND, c);
   nmos nmos4(r, s, p);

   pmos pmos5(t, PWR, a);
   pmos pmos6(u, t, b);
   nmos nmos5(u, GND, a);
   nmos nmos6(u, GND, b);

   pmos pmos7(v, PWR, u);
   nmos nmos7(v, GND, u);
   
   pmos pmos8(out, PWR, v);
   pmos pmos9(out, PWR, r);
   nmos nmos8(x, GND, r);
   nmos nmos9(out, x, v);



endmodule
