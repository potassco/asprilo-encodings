# asprilo

Encodings for asprilo environments

## Conventions

  * letters **M**, **P**, **P**, and **D** stand for actions *move*, *pickup*, *putdown*, and *deliver*
  * digits **2** and **3** indicated the arity of actions *pickup*, *putdown*, and *deliver*

  * file extensions *lp*, *ilp*, and *clp* stand for regular, incremental, and constraint logic programs

## Action theories

  * Keyword **action** precedes files containing action theories
  * *Example* **action-MPPD-3.lp**

## Interface to *asprilo*

  * Keywords **input** and **output** precede files converting 
      * *asprilo* instances to the format used in action theories and 
      * the resulting plan into the format of *asprilo*
  * *Example* **output-MPPD-3.lp**
