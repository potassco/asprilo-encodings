# asprilo

Encodings for asprilo environments

## Conventions

  * letters **M**, **P**, **P**, and **D** stand for actions *move*, *pickup*, *putdown*, and *deliver*
  * letter **Q** indicates a treatment of quantities
  * digits **2** and **3** indicated the arity of actions *pickup*, *putdown*, and *deliver*
  * file extensions *lp*, *ilp*, *clp*, and *iclp* stand for regular, incremental, constraint, and incremental constraint logic programs
  * omissions of such indicators are treated like wild-cards

## Compatibility

  * compatibility is achieved by combing files with same (or similar) attributes

## Action theories

  * Keyword **action** precedes files containing action theories
  * *Example* **action-M.lp**, **action-MPPD-2.ilp**, **action-MPPD-2.lp**, **action-MPPD-3.lp**,

## Interface to *asprilo*

  * Keywords **input** and **output** precede files converting 
      * *asprilo* instances to the format used in action theories and 
      * the resulting plan into the format of *asprilo*
  * *Example* **input.lp**, **output-M.lp**, **output-MPPD-2.ilp**, **output-MPPD-2.lp**, **output-MPPD-3.lp**
  
## Goals

   * Keyword **goal** precedes files specifying goal conditions
   * Goals counting quantities are indicated with letter **Q** and include the corresponding encoding for quantities
   * Goals with ending **0** and **r** indicate whether all products belonging to an order are processed simultaneously (**0**) or at rate **r**
     (default is **1**)
   * *Example* **goal-Q.clp**, **goal-MPPD.ilp**, **goal-M.lp**, **goal-MPPD.lp**

## Quantities

   * Keyword **quantities** precedes files dealing with amounts of products
   * Similarly letter **Q** indicates quantities; now used with goals
   * **Attention** This needs a constraint ASP solver like **clingcon**
   * *Example* **quantities.lp**,  **quantities.clp**,  **quantities.ilp**,  **quantities.iclp**

## Strategies

   * Keyword **strategy** precedes files specifying strategies
   * *Example* **strategy-MPPD-2.lp**, **strategy-MPPD-3.lp**
   * _Some strategies may not work with all layouts!_
   
## Highways

  * Keyword **highways** precedes files specifying conditions for places belonging to highways
  * *Example* **highways.ilp**, **highways.lp**,

## Optimization

   * Keyword **optimization** precedes files specifying objective functions
   * *Example* **optimization-2.ilp**, **optimization-2.lp**,  **optimization-3.ilp**,  **optimization-3.lp**
   * **experimental feature**

## Heuristics

   * Keyword **heuristic** precedes files specifying heuristics with **clingo**'s `#heuristic` directive
   * *Example* **heuristic.ilp**, **heuristic.lp**
   * **experimental feature**

## Auxiliaries

  * files preceded with **show** provide `#show` statements for use with terminal output

## Examples

  * Some warehouse layouts merged with orders can be found in the directory `examples`
    Some of them contain (uncommented) calls in their header
  * Here are some exemplary calls
	* `clingo action-MPPD-2.lp strategy-MPPD-2.lp goal-MPPD.lp show-2.lp examples/x4_y4_n16_r2_s3_ps1_pr2_u4_o2_N1.lp -c horizon=9`
	* ~~`clingo  action-3.lp  strategy-MPP-3.lp  goal-MPP.lp show-3.lp examples/x4_y4_n16_r2_s3_ps1_pr2_u4_o2_N1.lp -c horizon=9`~~
  * These examples produce plans ready for _asprilo_:
      * `clingo action-MPPD-2.lp strategy-MPPD-2.lp goal-MPPD.lp output-MPPD-2.lp examples/x4_y4_n16_r2_s3_ps1_pr2_u4_o2_N1.lp -c horizon=9 --outf=0 -V0 --out-atomf=%s.`
      * `clingo action-MPPD-2.lp strategy-MPPD-2.lp goal-MPPD.lp output-MPPD-2.lp examples/x4_y4_n16_r2_s3_ps1_pr2_u4_o2_N1.lp -c horizon=9 --outf=0 -V0 --out-atomf=%s. --out-ifs='\n'`
      * ~~`clingo  action-MPP-3.lp  strategy-MPP-3.lp  goal-MPP.lp  output-MPP-3.lp examples/x4_y4_n16_r2_s3_ps1_pr2_u4_o2_N1.lp -c horizon=9 --outf=0 -V0 --out-atomf=%s.` (this simulates a delivery action by including `compatibility-MPP+D-3.lp`)~~
   
   
## _asprilo_ connectivity

  * ~~The bash script **myasprilo** aims at~~
    * ~~combining compatible files in a systematic way~~
	  * ~~interface with **asprilo**'s visualizer~~
	  * **broken**
  * *Examples* connecting to _asprilo_ on the commandline
	* `clingo action-MPPD-2.lp strategy-MPPD-2.lp goal-MPPD.lp output-MPPD-2.lp examples/x4_y4_n16_r2_s3_ps1_pr2_u4_o2_N1.lp -c horizon=9 --outf=0 -V0 --out-atomf=%s. | head -n1 | visualizer -l examples/x4_y4_n16_r2_s3_ps1_pr2_u4_o2_N1.lp`
  * **asprilo** is available at [github](https://github.com/potassco/asprilo)
