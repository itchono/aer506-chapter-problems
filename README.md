# Chapter Problems for AER506 2023F
This repo contains MATLAB code I use to solve the recommended problems in AER506.

For numerical computations, I run computations directly. 

For algebraic manipulations, I use MATLAB symbolic algebra.

## Dependencies
* A recent version of MATLAB
* Symbolic Math Toolbox

## Install
1. Clone the repo.
2. Open MATLAB to any of the `CH*` folders.
3. Run `q*.m` to run a question. The final answers are printed out to console.

## Progress
* All of CH2 done; all validated
    * Later problems in CH2 (Q13 onwards) are done a lot better, use those for reference (I lay out frames properly)
    * Comes with bundled library functions for rotation matrices and skew symmetic matrix operators 
* All of CH3 done; all validated except Q10, which still needs some work
    * Comes with the same utility functions as CH2
* All of CH4 done; all validated
    * I may follow up CH4 with some utilities for orbit determination
* All of CH5 done; all validated, Q8 is a bit off, but I think my solution should be correct
    * I may follow up CH5 with a set of utilities for finding parameters
* All of CH6 done and validated, Q15 is a bit off, but my method is definitely correct, solutions are fishy with rounding
* CH7: 2/10 done
* CH8: 4/25 done

## General Notation
There are a LOT of pre-superscripts, etc. in this course. 

My notation of variables in code is equally confusing, but I try my best to be consistent.

For clarity, I have some examples:

* `I_R_B`: (Pre-superscript I, post-subscript B) - Rotation matrix R_{IB}; represents basis vectors of frame B in frame I
* `B_omega_IB`: (Pre-superscript B, post-subscript IB) - Angular velocity from B to I, expressed in frame B
* `R_dR_omega_IG`: (Pre-superscript R, derivative wrt R, post-subscript IG) - Derivative of angular velocity from G to I wrt frame R, expressed in frame R
* `P_C_I`: (Pre-superscript P, pre-subscript C) - Inertia matrix about point C, represented in frame P

## If you spot something wrong
Please [open an issue](https://github.com/itchono/aer506-chapter-problems/issues)! The goal is to crowdsource improvements.
