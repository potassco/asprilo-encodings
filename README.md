# asprilo

Encodings for asprilo environments

## Conventions

  * letters **M**, **P**, **P**, and **D** stand for actions *move*, *pickup*, *putdown*, and *deliver*
  * digits **2** and **3** indicated the arity of actions *pickup*, *putdown*, and *deliver*
  * file extensions *lp*, *ilp*, and *clp* stand for regular, incremental, and constraint logic programs
  * omissions of such indicators ae treated liek wildcards

## Compatibility

  * compatibility is achieved by combing files with same (or similar) attributes

## Action theories

  * Keyword **action** precedes files containing action theories
  * *Example* **action-M.lp**, **action-MPP-3.lp**, **action-MPPD-2.ilp**, **action-MPPD-2.lp**, **action-MPPD-3.lp**,

## Interface to *asprilo*

  * Keywords **input** and **output** precede files converting 
      * *asprilo* instances to the format used in action theories and 
      * the resulting plan into the format of *asprilo*
  * *Example* **input.lp**, **outputM.lp**, **output-MPPD-2.ilp**, **output-MPPD-2.lp**, **output-MPPD-3.lp**
  
## Highways

  * Keyword **highways** precedes files specifying conditions for places belonging to highways
  * *Example* **highways.ilp**, **highways.lp**,

## Goals

   * Keyword **goal** precedes files specifying goal conditions
   * **Example** **goal.clp**, **goal.ilp**, **goal-M.lp**, **goal-MPPD.lp**, **goal-MPP.lp**

## Quantities

   * Keyword **quantities** precedes files dealing with amounts of products
   * **Attention** This needs a constraint ASP solver like **clingcon**
   * **Example** **quantities.clp**

## Strategies

   * Keyword **strategy** precedes files specifying strategies
   * **Example** **strategy.ilp**, **strategy-MPP-3.lp**, **strategy-MPPD-2.lp**, **strategy-MPPD-3.lp**
   * _Some stretegies may not work with all layouts!_
   
## Optimization

   * Keyword **optimization** precedes files specifying objective functions
   * *Example* **optimization.lp**
   * **experimental feature**

## Heuristics

   * Keyword **heuristic** precedes files specifying heuristics with **cling**'s `#heuristic` directive
   * *Example* **heuristic.ilp**, **heuristic.lp**
   * **experimental feature**

## Auxiliaries

  * files preceded with **show** provide `#show` statements for use with terminal output

## Examples

   * Some warehouse layouts merged with orders can be found in the directory `examples`
   * Here are some exemplary calls
	 * `clingo action-MPPD-2.lp strategy-MPPD-2.lp goal-MPPD.lp show-2.lp examples/x4_y4_n16_r2_s3_ps1_pr2_u4_o2_N1.lp -c horizon=9`

## _asprilo_ connectivity

* The bash script **myasprilo** aims at
    * combining compatible files in a systematic way
    * interface with **asprilo**'s visualizer
* **asprilo** is available at [github](https://github.com/potassco/asprilo)
