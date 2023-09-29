# Chapter Problems for AER506 2023F
This repo contains MATLAB code I use to solve the recommended problems in AER506.

For numerical computations, I run computations directly. 

For algebraic manipulations, I use MATLAB symbolic algebra.

## Progress
* All of CH2 done (except Q17 which I don't do, and Q15 which has a discrepancy)
    * Later problems in CH2 (Q13 onwards) are done a lot better, use those for reference (I lay out frames properly)
    * Solutions validated for all Q's except 15 and 17.
* SOME of CH3 done


## General Notation
There are a LOT of pre-superscripts, etc. in this course. 

My notation of variables in code is equally confusing, but I try my best to be consistent.

For clarity, I have some examples:

`I_R_B`: (Pre-superscript I, post-subscript B) - Rotation matrix R_{IB}; represents basis vectors of frame B in frame I
`B_omega_IB`: (Pre-superscript B, post-subscript IB) - Angular velocity from B to I, expressed in frame B
`R_dR_omega_IG`: (Pre-superscript R, derivative wrt R, post-subscript IG) - Derivative of angular velocity from G to I wrt frame R, expressed in frame R
`P_C_I`: (Pre-superscript P, pre-subscript C) - Inertia matrix about point C, represented in frame P