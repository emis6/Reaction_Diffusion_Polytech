# Reaction_Diffusion_Polytech
A school group project concerning reaction diffusion systems and creation of patterns. The work is done by Paola Allegrini, Claire Froessel and Mahshid Khezri Nejad. The guiding professor is Chiara Nardoni. Licensed under Beerware.

This repository consists of matlab codes that are to study reaction-only systems, systems with diffusion and Gierer-Meinhardt model which is a reaction-diffusion system.

The 'reac_dif.m' file is to show a Gierer-Meinhardt model.

There are two directories: Reaction , Diffusion.
In 'Reaction' reaction-only systems are studied and 'Diffusion' diffusion only systems are studied.

Reaction directory:

The script 'script_ch_vp_A.m' and 'valpropres.m' are to study a system with matrix A = [a, b; c, d]. There are different steady and unsteady cases in the script that are put as comment. You can decomment them and see the changes.
The 'champ_matrice.m' file is to showing the system graphically.
The 'valpropres.m' file calculates eigen values of a given matrix and determines if the corresponding system is steady or not.

Diffusion directory:
The 'diffusion3.m' corresponds to diffusion of heat using an explicit method.
The 'script_cran_nic_figures.m' is also to show diffusion of heat but with crank-nicholson method which is an implicit method. The two methods are compared using 'figure 1'. The pink points are the exact solution. In figure 2 and 3 the diffusion in a pipe is visible using colors and in 2d and 3d.

