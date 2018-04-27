# asprilo

Encodings for asprilo environments

## Conventions

The encodings are grouped in two directories

  * **mppd** contains fine-grained encodings dealing with *move*, *pickup*, *putdown*, and *deliver*
    actions and distinguish *robots*, *shelves*, *stations*, etc and take robots carrying shelves into account for collision protection
	
  * **xapf** contains encodings addressing more abstract problems, like MAPF, TAPF, GTAPF, etc

We adopt the following conventions:

  * letters **M**, **P**, **P**, and **D** stand for actions *move*, *pickup*, *putdown*, and *deliver*
  * ~~digits **2** and **3** indicated the arity of actions *pickup* and *putdown*~~
	* ~~**2** without shelf representation~~
	* ~~**3** with    shelf representation~~
  * letters **0**, **r**, and **q** indicate the treatment of order lines during delivery
	* This applies to all files preceded with **goal-** in the **mppd** setting
  * file extensions *lp*, *ilp*, *clp*, and *iclp* stand for regular, incremental, constraint, and incremental constraint logic programs
	* since integer variables are uses for *product quantities* and *robot and shelf positions*, I sometimes need auxiliary letters to disambiguate,
	  eg a capital **C** stands for both usages, a mere **b** is like a **c** but applied to *positions*
  * omissions of such indicators are treated like wild-cards

## Compatibility

  * compatibility is achieved by combing files with same (or similar) attributes

## Action theories

  * Keyword **action** precedes files containing action theories
  * *Example* **action-M.lp**, **action-MPP.lp**, **action-MPP.iclp**, etc.

## Goal conditions

  * Keyword **goal** precedes files fixing goal conditions and in particular what constitutes a delivery
  * as mentioned above, letters **0**, **r**, and **q** indicate the treatment of order lines during delivery

## Interface to *asprilo*

  * Keywords **input** and **output** precede files converting 
      * *asprilo* instances to the format used in action theories and 
      * the resulting plan into the format of *asprilo*
  * *Example* **input.lp**, **output-M.lp**, **output-MPPD.lp**
  
## Goals

   * Keyword **goal** precedes files specifying goal conditions
   * Goals counting quantities are indicated with letter **Q** and include the corresponding encoding for quantities
   * Goals with ending **0** and **r** indicate whether all products belonging to an order are processed simultaneously (**0**) or at rate **r**
     (default is **1**)
   * *Example* **goal-D-c.clp**, **goal-D-b.ilp**, **goal-M.lp**, **goal-D-a.lp**

## Quantities

   * Keyword **quantities** precedes files dealing with amounts of products
   * Similarly letter **q** indicates quantities; now used with goals
   * **Attention** This needs a constraint ASP solver like **clingcon**
   * *Example* **quantities.lp**,  **quantities.clp**,  **quantities.ilp**,  **quantities.iclp**

## Strategies

   * Keyword **strategy** precedes files specifying strategies
   * *Example* **strategy-MPPD.lp**
   * _Some strategies may not work with all layouts!_
   
## Highways

  * Keyword **highways** precedes files specifying conditions for places belonging to highways
  * *Example* **highways.ilp**, **highways.lp**,

## Optimization

   * Keyword **optimization** precedes files specifying objective functions
   * *Example* **optimization.ilp**,  **optimization.lp**
   * **experimental feature**

## Heuristics

   * Keyword **heuristic** precedes files specifying heuristics with **clingo**'s `#heuristic` directive
   * *Example* **heuristic.ilp**, **heuristic.lp**
   * **experimental feature**

## Auxiliaries

  * files preceded with **show** provide `#show` statements for use with terminal output

## Examples

  * Some warehouse layouts merged with orders can be found in the directory [`examples`](https://github.com/tortinator/asprilo/tree/master/examples)
    Many of them contain (uncommented) calls in their header
  * Here are some exemplary calls
	* `clingo action-MPP.lp strategy-MPP.lp goal-D-c.lp show.lp examples/x4_y4_n16_r2_s3_ps1_pr2_u4_o2_N1.lp -c horizon=8`
  * To produce plans ready for _asprilo_ use *clingo* option 
      * `--outf=0 -V0 --out-atomf=%s.` together with UNIX command `head -n1` to strip off the trailing (UN)SATISFIABLE
      * or the included script `clingo1facts` (all facts in one line)
  * Sometimes it is also nice to see an answer set as a single column, as done with *clingo* option `--out-ifs='\n'`
	  * This is also done with script  `clingo2facts`
   
## _asprilo_ connectivity

  * *Examples* connecting to _asprilo_ on the command-line
	* `clingo action-MPP.lp goal-D-c.lp examples/x4_y4_n16_r2_s3_ps1_pr2_u4_o2_N1.lp  -c horizon=8 output-MPPD.lp --outf=0 -V0 --out-atomf=%s. | head -n1 | asprilo-visualizer`
  * **asprilo** is available at [github](https://github.com/potassco/asprilo)
